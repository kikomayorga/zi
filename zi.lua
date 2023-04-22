--[[ 
* DOING >>>  connect and disconnects
  - -- TODO: lua zi.lua hostapd connect macaddresse
  - -- TODO: lua zi.lua hostapd dis-connect macaddresse

TO DO !
* CRON 2359
* populate mac2policy in lua version (?) or maybe just a setup flag (?)
* test devices in users_db: own and leased 
* use animals
* use vehicles
* admin menus:
  - add and assign user's shared and own devices
  - add and assign admins devices 
  - 
* user menu:
  - add external credit (x ej trotadora o smartwatch)
  - select device to be leased
]] 


-- usage:
-- cd /etc/zi/ && lua zi.lua arg1 arg2 arg3
-- examples:
-- lua zi.lua key 1 1234
-- lua zi.lua states reset

-- lua zi.lua users reset
-- lua zi.lua admins reset
-- lua zi.lua devices reset

-- lua zi.lua cron eachminute
-- lua zi.lua cron midnight

-- TODO: lua zi.lua hostapd connect macaddresse
-- TODO: lua zi.lua hostapd dis-connect macaddresse

-- globals:
-- safedns variables:

-- debugging in router
path = "/etc/"
-- debugging in windows


-- path = "/home/qeakous/Documents/"

safedns_rule_offset = "cfg038c89"
safedns_policy_0 = "1922033194"
safedns_policy_1 = "176489346"
safedns_policy_2 = "1388236232"

-- very basic functions
dofile(""..path.."zi/tables/tablesaveload.lua") -- for persistance
dofile(""..path.."zi/tables/animals_table.lua")
dofile(""..path.."zi/tables/vehicles_table.lua")
dofile(""..path.."zi/zi_functions.lua")  -- custom functions by zi

-- single concern function files
dofile(""..path.."zi/zi_functions_states.lua") 
dofile(""..path.."zi/zi_functions_users.lua") 
dofile(""..path.."zi/zi_functions_admins.lua") 
dofile(""..path.."zi/zi_functions_devices.lua") 
dofile(""..path.."zi/zi_functions_vehicles.lua") 
dofile(""..path.."zi/zi_functions_sound.lua") 

states_db   = "/tmp/zi/states_table.db"
admins_db   = ""..path.."zi/tables/admins_table.db"
users_db    = ""..path.."zi/tables/users_table.db"
devices_db  = ""..path.."zi/tables/devices_table.db"
vehicles_db = ""..path.."zi/tables/vehicles_table.db"

phrases_a  = lines_from(""..path.."zi/phrases/phrases_a.txt")  -- admin phrases
phrases_a1 = lines_from(""..path.."zi/phrases/phrases_a1.txt")  -- admin phrases
phrases_a7 = lines_from(""..path.."zi/phrases/phrases_a7.txt")  -- admin phrases
phrases_a6 = lines_from(""..path.."zi/phrases/phrases_a6.txt")  -- admin phrases
phrases_a0 = lines_from(""..path.."zi/phrases/phrases_a0.txt")  -- admin phrases

phrases_u  = lines_from(""..path.."zi/phrases/phrases_u.txt")  -- usuario
phrases_u1 = lines_from(""..path.."zi/phrases/phrases_u1.txt")  -- usuario
phrases_i  = lines_from(""..path.."zi/phrases/phrases_i.txt")  -- inicialización
phrases_i1 = lines_from(""..path.."zi/phrases/phrases_i1.txt")  -- inicialización

vol_pitch = "<volume level=\'30\'><pitch level=\'110\'><speed level=\'100\'>"

-- command calls
if (arg[1] == "users"    and arg[2] == "reset") then    users_db_reset(users_db)    end
if (arg[1] == "admins"   and arg[2] == "reset") then   admins_db_reset(admins_db)   end
if (arg[1] == "devices"  and arg[2] == "reset") then  devices_db_reset(devices_db)  end
if (arg[1] == "states"   and arg[2] == "reset") then   states_db_reset(states_db)   end 
if (arg[1] == "vehicles" and arg[2] == "reset") then vehicles_db_reset(vehicles_db) end 


if (arg[1] == "test")
then
  os.execute("echo hello world")
  print(animals_table[1])
  for i = 1, 10, 1 do
    print(vehicles_table[i])
  end
  break
end


-- HOSTAPD ROUTINES

-- device gets connected
if (get_state(states_db) == "iddle" and arg[1] == "hostapd" and arg[2] == "AP-STA-CONNECTED") then
  set_busy()
  set_skippable()
  play_success()
  mac_adress_detected = arg[3] 
  if(getDevIndex(devices_db, mac_adress_detected) == 0 ) then
    -- unknown device
    set_state(states_db, "h1")
    say("Nuevo dispositivo detectado. Ingresa una clave de administrador para configurarlo.")
    set_state(states_db, "check_admin_pass")
  else
    -- known device
  end
    clear_busy()
    clear_skippable()
end

-- testing for admin key
if (get_state(states_db) == "check_admin_pass" and arg[1] == "key") then
  set_busy()
  play_click()
  last4keys = arg[3]
  set_last4keys(states_db, last4keys) 
    -- test for admin passwords
  for i=1, 6 do 
    if last4keys == admins_db_get_value(admins_db, i, "password")
    then 
      clear_last4keys()
      set_state(states_db, "choose_vehicle_name")
      set_skippable()
      logged_admin = i 
      play_success()
      say("Autenticación Exitosa. Elige un nombre para el nuevo dispositivo. Los nombres disponibles son: ")
      say(available_vehicles_menu())
      arg[1]="kill"
    end
    clear_busy()
  end
  clear_busy()
end

if (get_state(states_db) == "choose_vehicle_name" and arg[1] == "key") then
  set_busy()
  play_click()
  last4keys = arg[3]
  last2keys = string.sub(last4keys, -2)
  if last2keys ~= "00" then
    vehicleID = tonumber(last2keys)
    if vehicleID <= get_vehicles_ammount(vehicles_db) then
      say("Se ha asignado el nombre "..vehicles_table[vehicleID].." al equipo recientemente conectado. ")
      set_vehicle_taken(vehicles_db, vehicleID, 1)
      set_device_db_row(db_file, get_last_device_added()+1, get_last_MAC_connected(states_db) , vehicleID)
      set_last_device_added(get_last_device_added() + 1)
      delay(5)
      say("Elija el uso del dispositivo:"..
      "Para asignar permanentemente un dispositivo marca 2."..
      "Para marcar el dispositivo como compartido marca 3"..
      "Para liberar el dispositivo permanentemente marca 1")
    end
  end
  clear_last4keys()
  set_state(states_db, "choose_vehicle_use")
  set_skippable()
  play_success()
  clear_busy()
end

if (get_state(states_db) == "choose_vehicle_use" and arg[1] == "key") then
  set_busy()
  set_state(states_db, "iddle")
  play_click()
  if (arg[2] == 2) then
    say("Presiona el número de usuario al que se asignará permanentemente el equipo. ")
    set_state(states_db, "choose_owner") 
  end
  if (arg[2] == 3) then
    -- TODO
  end
  clear_last4keys()
  play_success()
  clear_busy()
end

if (get_state(states_db) == "iddle" and arg[1] == "hostapd" and arg[2] == "AP-STA-DISCONNECTED") then
  play_success()
  mac_adress_detected = arg[3] 
  -- SI LA MAC ESTÁ REGISTRADA
  -- SI LA MAC NO ESTÁ REGISTRADA
end
--[[
"SONIDO DE SUCCESS.MP3
"""SONIDO DE ""RECONOCIDO""  
""SE HA CONECTADO ____ Y PERTENECE A ____"""
"""SONIDO DE ""RECONOCIDO""  
""PARAPENTE RECONOCIDO: 
LISTO PARA NAVEGAR""
INGRESA TU CLAVE PARA ZARPAR."
]]

-- KEYPAD ROUTINES
-- iddle and any key
if (get_state(states_db) == "iddle" and arg[1] == "key") then
  set_busy()
  play_click()
  logged_user = 0
  logged_admin = 0
  lastkey = arg[2]
  last4keys = arg[3]
  set_last4keys(states_db, last4keys) 
    
    -- test for admin passwords
  for i=1, 6 do 
    if last4keys == admins_db_get_value(admins_db, i, "password")
    then 
      clear_last4keys()
      logged_admin = i 
      set_logged_admin(states_db, i)
      play_success()
      os.execute("aplay /tmp/zi/a_1.wav")  -- "Bienvenido Administrador"
      clear_busy()
    end
    
  end

  -- test for user passwords
  for i=1, 6 do 
    if last4keys == users_db_get_value(users_db, i, "password")
    then 
      logged_user = i 
      set_logged_user(states_db, logged_user)
      clear_last4keys()
      set_busy()
      play_success()
      say('bienvenido Usuario '..logged_user)
      clear_busy()
    end
  end
  
  -- if no found password
  if (get_logged_user(states_db) == 0 and get_logged_admin(states_db) == 0) then
    set_state(states_db, "iddle")
    set_logged_user(states_db, 0)
    -- enables triggerhappy
    clear_busy()
  end

  -- if admin password
  -- states: iddle > a
  if logged_admin ~= 0 then
    set_logged_admin(states_db, logged_admin)
    set_state(states_db, "a")
    set_busy()   -- filters triggerhappy
    set_skippable()
    clear_last4keys()
    os.execute(
    'aplay /tmp/zi/a_2.wav '..' && aplay /tmp/zi/a_3.wav '..
    ' && aplay /tmp/zi/a_4.wav '..' && aplay /tmp/zi/a_5.wav '..
    ' && aplay /tmp/zi/a_6.wav ')
    clear_busy() -- remove triggerhappy filters
    clear_skippable()
  end


  -- USER MENU:
  -- if user password
  -- states: iddle > u
  if logged_user ~= 0 then
    clear_last4keys()
    running = users_db_get_value(users_db, logged_user, "running")
    if running == 0 then
      os.execute('aplay /tmp/zi/u_1.wav && aplay /tmp/zi/u_2.wav'..
      '&& pico2wave -w /tmp/zi/get_time_left.wav -l es-ES " '..vol_pitch..' '..
      users_db_get_value(users_db, logged_user, "time_left_today")..
      ' ." && aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/get_time_left.wav'..
      ' && aplay /tmp/zi/u_3.wav')
    end
    if running == 1 then
      os.execute('aplay /tmp/zi/u_1.wav && aplay /tmp/zi/u_4.wav'..
      '&& pico2wave -w /tmp/zi/get_time_left.wav -l es-ES " '..vol_pitch..' '..
      users_db_get_value(users_db, logged_user, "time_left_today")..
      ' ." && aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/get_time_left.wav'..
      ' && aplay /tmp/zi/u_5.wav')
      -- uci set safedns.cfg038c89.token='1922033194'
    end  
    set_state(states_db, "user_menu")  
    set_logged_user(states_db, logged_user)   
  end

  clear_busy()
end



if (get_state(states_db) == "user_menu" and arg[1] == "key") then
  clear_last4keys()
  play_click()
  logged_user = get_logged_user(states_db)
  lastkey = arg[2]

  -- TOGGLED
  if lastkey == "1" then
    users_db_set_value(users_db, logged_user, "running", 1)
    apply_safedns_policy(users_db, logged_user, 1)
    say("Navega! ")
    os.execute('mpg123 '..path..'zi/sounds/ticktack.mp3')
    set_state(states_db, "iddle")
  end

  if lastkey == "0" then
    users_db_set_value(users_db, logged_user, "running", 0)
    apply_safedns_policy(users_db, logged_user, 0)
    say('Pausa de Internet! ')
    os.execute('mpg123 '..path..'zi/sounds/aplausos.mp3')
    set_state(states_db, "iddle")
  end
  
  os.execute("uci commit")
  os.execute("/etc/init.d/safedns restart")

  set_state(states_db, "iddle")
  clear_busy()

-- os.exit() 
end


-- ADMIN MENUS
-- a > a7
clear_last4keys()
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "7") then
  play_click()
  set_state(states_db, "iddle")              -- sets statesmachine:
  clear_busy()
  clear_skippable()
  clear_last4keys()
  say('Se agregó 60 minutos a cada usuario. Un Éxito.')
  play_success()
  clear_busy()
  clear_skippable()
  set_logged_user(states_db, 0)
  os.execute('killall -q lua')
end

-- a > a1
clear_last4keys()
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "1") then
  play_click()
  set_state(states_db, "a1")              -- sets statesmachine:
  set_busy()
  set_skippable()
  clear_last4keys()
  os.execute('aplay /tmp/zi/a1_1.wav')
  os.execute('sleep 3  &&   echo 0 > /tmp/zi/busyflag  &&   sleep 1' )
  os.execute('killall -q lua')
end

-- a > a6
clear_last4keys()
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "6") then
  play_click()
  -- lastkey = arg[2]
  -- logged_user = get_logged_user(states_db)
  set_state(states_db, "a6")              -- sets statesmachine:
  set_busy()
  set_skippable()
  clear_last4keys()
  os.execute('aplay /tmp/zi/a6_1.wav')
  clear_busy()
  clear_skippable()
  os.execute('killall -q lua')
end

-- a > a0
-- bloquear a todos hasta mañana
clear_last4keys()
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "0") then
  play_click()
  set_state(states_db, "a0")              -- sets statesmachine:
  set_busy()
  clear_skippable()
  clear_last4keys()
  say('Se eliminó el saldo de todos los usuarios por hoy.')
  clear_busy()
  clear_skippable()
  set_state(states_db, "iddle")
  set_logged_user(states_db, 0)
  os.execute('killall -q lua')
end

-- a1 > # > iddle
-- "agregar 60 minutos a un usuario"
if (get_state(states_db) == "a1" and arg[1] == "key") then
  clear_last4keys()
  play_click()
  usuario_nro = arg[2]
  set_busy()
  clear_last4keys()
  os.execute('pico2wave -w /tmp/zi/buffer.wav -l es-ES '..
  '"'..vol_pitch..'Se agregó 60 minutos al usuario '..usuario_nro..'." && '..
  'aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/buffer.wav  &&'..
  'mpg123 /etc/zi/sounds/success.mp3')
  -- os.execute("sleep 3")
  -- os.execute("mpg123 "..path.."zi/sounds/alarma.mp3")
  clear_busy()
  set_state(states_db, "iddle")
  os.execute('killall -q lua')
end


-- a6 > # > iddle
-- "bloquear un usuario"
if (get_state(states_db) == "a6" and arg[1] == "key") then
  play_click()
  set_busy()
  clear_last4keys()
  usuario_nro = arg[2]
  -- os.execute("mpg123 /etc/zi/sounds/success.mp3")
  if (usuario_nro == "1" or usuario_nro == "2" or usuario_nro == "3" or usuario_nro == "4" or usuario_nro == "5" or usuario_nro == "6") then
    os.execute('pico2wave -w /tmp/zi/buffer.wav -l es-ES '..
    '"'..vol_pitch..'Se puso a cero los minutos de hoy para usuario número '..usuario_nro..' ." '..
    '&& aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/buffer.wav'..
    '&& mpg123 '..path..'zi/sounds/success.mp3')
    set_busy()
    set_state(states_db, "iddle")
  else
    os.execute("mpg123 "..path.."zi/sounds/alarma.mp3")
  end  
  clear_last4keys()
  os.execute('killall -q lua')
end




-- CRON EACHMINUTE:  user table actions
if (arg[1] == "cron" and arg[2] == "eachminute") then

  -- en principio no se reiniciará safedns
  restart_safedns_flag = 0
  -- leer todos los saldos
  local saldo1 = users_db_get_value(users_db, 1, "time_left_today")
  local saldo2 = users_db_get_value(users_db, 2, "time_left_today")
  local saldo3 = users_db_get_value(users_db, 3, "time_left_today")
  local saldo4 = users_db_get_value(users_db, 4, "time_left_today")
  local saldo5 = users_db_get_value(users_db, 5, "time_left_today")
  local saldo6 = users_db_get_value(users_db, 6, "time_left_today")

  local previous_saldo1 = users_db_get_value(users_db, 1, "previous_time_left_today")
  local previous_saldo2 = users_db_get_value(users_db, 2, "previous_time_left_today")
  local previous_saldo3 = users_db_get_value(users_db, 3, "previous_time_left_today")
  local previous_saldo4 = users_db_get_value(users_db, 4, "previous_time_left_today")
  local previous_saldo5 = users_db_get_value(users_db, 5, "previous_time_left_today")
  local previous_saldo6 = users_db_get_value(users_db, 6, "previous_time_left_today")
  
  -- leer todos los saldo leases
  local saldo_lease_1 = users_db_get_value(users_db, 1, "lease__minutes_left")
  local saldo_lease_2 = users_db_get_value(users_db, 2, "lease__minutes_left")
  local saldo_lease_3 = users_db_get_value(users_db, 3, "lease__minutes_left")
  local saldo_lease_4 = users_db_get_value(users_db, 4, "lease__minutes_left")
  local saldo_lease_5 = users_db_get_value(users_db, 5, "lease__minutes_left")
  local saldo_lease_6 = users_db_get_value(users_db, 6, "lease__minutes_left")

  -- leer todos los running statuses
  local running1 = users_db_get_value(users_db, 1, "running")
  local running2 = users_db_get_value(users_db, 2, "running")
  local running3 = users_db_get_value(users_db, 3, "running")
  local running4 = users_db_get_value(users_db, 4, "running")
  local running5 = users_db_get_value(users_db, 5, "running")
  local running6 = users_db_get_value(users_db, 6, "running")
  -- leer todos los previous running statuses  
  local previous_running1 = users_db_get_value(users_db, 1, "previous_running")
  local previous_running2 = users_db_get_value(users_db, 2, "previous_running")
  local previous_running3 = users_db_get_value(users_db, 3, "previous_running")
  local previous_running4 = users_db_get_value(users_db, 4, "previous_running")
  local previous_running5 = users_db_get_value(users_db, 5, "previous_running")
  local previous_running6 = users_db_get_value(users_db, 6, "previous_running")

  -- guardar antiguos running y saldos
  previous_running1 = running1
  previous_running2 = running2
  previous_running3 = running3
  previous_running4 = running4
  previous_running5 = running5
  previous_running6 = running6

  -- guardar antiguos running y saldos
  previous_saldo1 = saldo1
  previous_saldo2 = saldo2
  previous_saldo3 = saldo3
  previous_saldo4 = saldo4
  previous_saldo5 = saldo5
  previous_saldo6 = saldo6

  -- decrementar todos los saldos que estén en running
  if (running1 == 1 and saldo1 > 0) then saldo1 = saldo1 - 1 end
  if (running2 == 1 and saldo2 > 0) then saldo2 = saldo2 - 1 end
  if (running3 == 1 and saldo3 > 0) then saldo3 = saldo3 - 1 end
  if (running4 == 1 and saldo4 > 0) then saldo4 = saldo4 - 1 end
  if (running5 == 1 and saldo5 > 0) then saldo5 = saldo5 - 1 end
  if (running6 == 1 and saldo6 > 0) then saldo6 = saldo6 - 1 end

  -- iterar sobre saldos y si saldo = 0 y running entonces ponr el running a 0
  if (saldo1 == 0 and running1 == 1) then running1 = 0 end
  if (saldo2 == 0 and running2 == 1) then running2 = 0 end
  if (saldo3 == 0 and running3 == 1) then running3 = 0 end
  if (saldo4 == 0 and running4 == 1) then running4 = 0 end
  if (saldo5 == 0 and running5 == 1) then running5 = 0 end
  if (saldo6 == 0 and running6 == 1) then running6 = 0 end

  -- detectar flancos y llamar acciones sobre ... apply_safedns_policy(db_file, userID, new_running)
  if (running1 == 0 and previous_running1 == 1) then apply_safedns_policy(users_db, 1, 0) end
  if (running2 == 0 and previous_running2 == 1) then apply_safedns_policy(users_db, 2, 0) end
  if (running3 == 0 and previous_running3 == 1) then apply_safedns_policy(users_db, 3, 0) end
  if (running4 == 0 and previous_running4 == 1) then apply_safedns_policy(users_db, 4, 0) end
  if (running5 == 0 and previous_running5 == 1) then apply_safedns_policy(users_db, 5, 0) end
  if (running6 == 0 and previous_running6 == 1) then apply_safedns_policy(users_db, 6, 0) end

  if (running1 == 0 and previous_running1 == 1) then restart_safedns_flag = 1 end
  if (running2 == 0 and previous_running2 == 1) then restart_safedns_flag = 1 end
  if (running3 == 0 and previous_running3 == 1) then restart_safedns_flag = 1 end
  if (running4 == 0 and previous_running4 == 1) then restart_safedns_flag = 1 end
  if (running5 == 0 and previous_running5 == 1) then restart_safedns_flag = 1 end
  if (running6 == 0 and previous_running6 == 1) then restart_safedns_flag = 1 end

  -- guardar ultimo estado de saldo_lease
  previous_saldo_lease_1 = saldo_lease_1
  previous_saldo_lease_2 = saldo_lease_2
  previous_saldo_lease_3 = saldo_lease_3
  previous_saldo_lease_4 = saldo_lease_4
  previous_saldo_lease_5 = saldo_lease_5
  previous_saldo_lease_6 = saldo_lease_6

  -- decrementar todos los leases que no sean cero.
  if (saldo_lease_1 > 0 and running1 == 1) then saldo_lease_1 = saldo_lease_1 - 1 end
  if (saldo_lease_2 > 0 and running1 == 2) then saldo_lease_2 = saldo_lease_2 - 1 end 
  if (saldo_lease_3 > 0 and running1 == 3) then saldo_lease_3 = saldo_lease_3 - 1 end
  if (saldo_lease_4 > 0 and running1 == 4) then saldo_lease_4 = saldo_lease_4 - 1 end
  if (saldo_lease_5 > 0 and running1 == 5) then saldo_lease_5 = saldo_lease_5 - 1 end
  if (saldo_lease_6 > 0 and running1 == 6) then saldo_lease_6 = saldo_lease_6 - 1 end
  
  -- cuando se acaba el lease, se pone "running" a cero
  if (saldo_lease_1 == 0 and previous_saldo_lease_1 == 1) then running1 = 0 stop_active_lease(users_db, 1)  apply_safedns_policy(users_db, 1, 0) restart_safedns_flag = 1 end
  if (saldo_lease_2 == 0 and previous_saldo_lease_2 == 1) then running2 = 0 stop_active_lease(users_db, 2)  apply_safedns_policy(users_db, 2, 0) restart_safedns_flag = 1 end 
  if (saldo_lease_3 == 0 and previous_saldo_lease_3 == 1) then running3 = 0 stop_active_lease(users_db, 3)  apply_safedns_policy(users_db, 3, 0) restart_safedns_flag = 1 end
  if (saldo_lease_4 == 0 and previous_saldo_lease_4 == 1) then running4 = 0 stop_active_lease(users_db, 4)  apply_safedns_policy(users_db, 4, 0) restart_safedns_flag = 1 end
  if (saldo_lease_5 == 0 and previous_saldo_lease_5 == 1) then running5 = 0 stop_active_lease(users_db, 5)  apply_safedns_policy(users_db, 5, 0) restart_safedns_flag = 1 end
  if (saldo_lease_6 == 0 and previous_saldo_lease_6 == 1) then running6 = 0 stop_active_lease(users_db, 6)  apply_safedns_policy(users_db, 6, 0) restart_safedns_flag = 1 end

  if restart_safedns_flag == 1 then 
    -- 
    os.execute("uci commit")
    os.execute("/etc/init.d/safedns restart")
  end

  -- escribimos los saldos en la tabla
  users_db_set_column(users_db, "time_left_today", saldo1, saldo2, saldo3, saldo4, saldo5, saldo6)
  users_db_set_column(users_db, "previous_time_left_today", previous_saldo1, previous_saldo2, previous_saldo3, previous_saldo4, previous_saldo5, previous_saldo6)
  users_db_set_column(users_db, "lease__minutes_left", saldo_lease_1, saldo_lease_2, saldo_lease_3, saldo_lease_4, saldo_lease_5, saldo_lease_6)
  users_db_set_column(users_db, "running", running1, running2, running3, running4, running5, running6)
  users_db_set_column(users_db, "previous_running", previous_running1, previous_running2, previous_running3, previous_running4, previous_running5, previous_running6)

end

-- CRON 2359

