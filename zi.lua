--[[ 
TO DO !
* populate mac2policy in lua version (?) or maybe just a setup flag (?)
* populate 
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
* connect and disconnects
  - -- TODO: lua zi.lua hostapd connect macaddresse
  - -- TODO: lua zi.lua hostapd dis-connect macaddresse
  
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


dofile(""..path.."zi/zi_functions.lua")  -- custom functions by zi
dofile(""..path.."zi/states_machine.lua") -- states need some persistance 
dofile(""..path.."zi/tables/tablesaveload.lua") -- for persistance
dofile(""..path.."zi/tables/animals_table.lua")
dofile(""..path.."zi/tables/vehicles_table.lua")


states_db  = ""..path.."zi/tables/states_table.db"
admins_db  = ""..path.."zi/tables/admins_table.db"
users_db   = ""..path.."zi/tables/users_table.db"
devices_db = ""..path.."zi/tables/devices_table.db"


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
if (arg[1] == "users" and arg[2] == "reset") then users_db_reset(users_db) end
if (arg[1] == "admins" and arg[2] == "reset") then admins_db_reset(admins_db) end
if (arg[1] == "devices" and arg[2] == "reset") then devices_db_reset(devices_db) end
if (arg[1] == "policies" and arg[2] == "reset") then policies_db_reset(states_db) end
if (arg[1] == "states" and arg[2] == "reset") then states_reset(states_db) end 

if (arg[1] == "test")
then
  os.execute("echo hello world")
  print(animals_table[1])
  for i = 1, 10, 1 do
    print(vehicles_table[i])
  end
end

-- iddle and any key
if (get_state(states_db) == "iddle" and arg[1] == "key") then
  os.execute("echo 1 > /tmp/zi/busyflag")
  os.execute("mpg123 "..path.."zi/sounds/click.mp3 &")
  logged_user = 0
  logged_admin = 0
  lastkey = arg[2]
  last4keys = arg[3]
    
    -- test for admin passwords
  for i=1, 6 do 
    if last4keys == admins_db_get_value(admins_db, i, "password")
    then 
      os.execute("echo 0000 > /tmp/zi/last4keys")
      logged_admin = i 
      os.execute("mpg123 "..path.."zi/sounds/success.mp3")
      os.execute("aplay /tmp/zi/a_1.wav")  -- "Bienvenido Administrador"
      break
    end
    os.execute("echo 0 > /tmp/zi/busyflag")
  end

  -- test for user passwords
  for i=1, 6 do 
    if last4keys == users_db_get_value(users_db, i, "password")
    then 
      logged_user = i 
      os.execute("echo 0000 > /tmp/zi/last4keys")
      os.execute("echo 1 > /tmp/zi/busyflag")
      os.execute("mpg123 "..path.."zi/sounds/success.mp3")
      os.execute('pico2wave -w /tmp/bienvenido_u_n.wav -l es-ES "'..vol_pitch..
      ' bienvenido Usuario '..logged_user..
      ' ." && aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/bienvenido_u_n.wav ')
      break
    end
    os.execute("echo 0 > /tmp/zi/busyflag")
  end

  -- if no found password
  if (logged_user == 0 and logged_admin == 0) then
    set_state(sates_db, "iddle")
    set_logged_user(sates_db, 0)
    -- enables triggerhappy
    os.execute("echo 0 > /tmp/zi/busyflag")
  end

  -- if admin password
  -- states: iddle > a
  if logged_admin ~= 0 then
    os.execute("echo 0000 > /tmp/zi/last4keys")
    set_state(states_db, "a")              -- sets statesmachine:
    -- set_logged_user(states_db, logged_admin)        -- TODO:  is this needed?
    os.execute("echo 1 > /tmp/zi/busyflag  &&  echo 1 > /tmp/zi/skippableflag  &&  echo 0000 > /tmp/zi/last4keys  ")
    os.execute(
    'aplay /tmp/zi/a_2.wav'..'aplay /tmp/zi/a_3.wav'..
    'aplay /tmp/zi/a_4.wav'..'aplay /tmp/zi/a_5.wav'..
    'aplay /tmp/zi/a_6.wav')
    os.execute("echo 0 > /tmp/zi/busyflag && echo 0 > /tmp/zi/skippableflag")
  end

  -- USER MENU:
  -- if user password
  -- states: iddle > u
  if logged_user ~= 0 then
    os.execute("echo 0000 > /tmp/zi/last4keys")
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
    set_state(states_db, "user_menu")  -- sets statesmachine:
    set_logged_user(states_db, logged_user)        -- TODO:  is this needed?
  end
  os.execute("echo 0 > /tmp/zi/busyflag")
  os.exit()
end

if (get_state(states_db) == "user_menu" and arg[1] == "key") then
  os.execute("echo 0000 > /tmp/zi/last4keys")
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
  logged_user = get_logged_user(states_db)
  lastkey = arg[2]

  -- TOGGLED
  if lastkey == "1" then
    users_db_set_value(users_db, logged_user, "running", 1)
    apply_safedns_policy(users_db, logged_user, 1)
    os.execute('pico2wave -w /tmp/welcome.wav -l es-ES "'..
    vol_pitch..'Navega!" '..
    '&& aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/welcome.wav && mpg123 '..path..
    'zi/sounds/ticktack.mp3')
    set_state(states_db, "iddle")
  end

  if lastkey == "0" then
    users_db_set_value(users_db, logged_user, "running", 0)
    apply_safedns_policy(users_db, logged_user, 0)
    os.execute('pico2wave -w /tmp/pausa_de_i.wav -l es-ES "'..
    vol_pitch..'Pausa de internet! " '..
    '&& aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/pausa_de_i.wav && mpg123 '..path..
    'zi/sounds/aplausos.mp3')
    set_state(states_db, "iddle")
  end
  
  os.execute("uci commit")
  os.execute("/etc/init.d/safedns restart")

  -- sets statesmachine:
  set_state(states_db, "iddle")
  -- enables triggerhappy
  os.execute("echo 0 > /tmp/zi/busyflag")

os.exit() 
end


-- ADMIN MENUS
-- a > a7
os.execute("echo 0000 > /tmp/zi/last4keys")
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "7") then
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
  set_state(states_db, "iddle")              -- sets statesmachine:
  os.execute("echo 1 > /tmp/zi/busyflag  && "..
  "echo 0 > /tmp/zi/skippableflag && "..
  "echo 0000 > /tmp/zi/last4keys" )
  os.execute('pico2wave -w /tmp/zi/buffer.wav -l es-ES '..
  '" '..vol_pitch..'Se agregó 60 minutos a cada usuario. Un Exito." '..
  '&& aplay /tmp/zi/buffer.wav &&  echo 0 > /tmp/zi/busyflag   '..
  '&&   echo 0 > /tmp/zi/skippableflag &&  mpg123 /etc/zi/sounds/success.mp3')
  set_logged_user(states_db, 0)
  os.execute('killall -q lua')
end

-- a > a1
os.execute("echo 0000 > /tmp/zi/last4keys")
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "1") then
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
  set_state(states_db, "a1")              -- sets statesmachine:
  os.execute("echo 1 > /tmp/zi/busyflag && echo 1 > /tmp/zi/skippableflag")
  os.execute("  echo 1 > /tmp/zi/busyflag   &&   echo 0000 > /tmp/zi/last4keys  ")
  os.execute('aplay /tmp/zi/a1_1.wav')
  os.execute('sleep 3  &&   echo 0 > /tmp/zi/busyflag  &&   sleep 1' )
  os.execute('killall -q lua')
end

-- a > a6
os.execute("echo 0000 > /tmp/zi/last4keys")
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "6") then
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
  -- lastkey = arg[2]
  -- logged_user = get_logged_user(states_db)
  set_state(states_db, "a6")              -- sets statesmachine:
  os.execute("echo 1 > /tmp/zi/busyflag     &&     echo 1 > /tmp/zi/skippableflag    &&   echo 0000 > /tmp/zi/last4keys")
  os.execute('aplay /tmp/zi/a6_1.wav')
  os.execute('echo 0 > /tmp/zi/busyflag   &&   echo 0 > /tmp/zi/skippableflag' )
  os.execute('killall -q lua')
end

-- a > a0
-- bloquear a todos hasta mañana
os.execute("echo 0000 > /tmp/zi/last4keys")
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "0") then
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
  set_state(states_db, "a0")              -- sets statesmachine:
  os.execute("echo 1 > /tmp/zi/busyflag  && "..
  "echo 0 > /tmp/zi/skippableflag && "..
  "echo 0000 > /tmp/zi/last4keys")
  os.execute('pico2wave -w /tmp/zi/buffer.wav -l es-ES '..
  '" '..vol_pitch..' '..'Se eliminó el saldo de todos los usuarios por hoy." '..
  '&& aplay /tmp/zi/buffer.wav &&  echo 0 > /tmp/zi/busyflag   '..
  '&&   echo 0 > /tmp/zi/skippableflag' )
  set_state(states_db, "iddle")
  set_logged_user(states_db, 0)
  os.execute('killall -q lua')
end

-- a1 > # > iddle
-- "agregar 60 minutos a un usuario"
if (get_state(states_db) == "a1" and arg[1] == "key") then
  os.execute("echo 0000 > /tmp/zi/last4keys")
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
  usuario_nro = arg[2]
  os.execute('echo 1 > /tmp/zi/busyflag  &&  echo 0000 > /tmp/zi/last4keys')
  os.execute('pico2wave -w /tmp/zi/buffer.wav -l es-ES '..
  '"'..vol_pitch..'Se agregó 60 minutos al usuario '..usuario_nro..'." && '..
  'aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/buffer.wav  &&'..
  'mpg123 /etc/zi/sounds/success.mp3')
  -- os.execute("sleep 3")
  -- os.execute("mpg123 "..path.."zi/sounds/alarma.mp3")
  os.execute('echo 0 > /tmp/zi/busyflag ' )
  set_state(states_db, "iddle")
  os.execute('killall -q lua')
end


-- a6 > # > iddle
-- "bloquear un usuario"
if (get_state(states_db) == "a6" and arg[1] == "key") then
  os.execute("mpg123 /etc/zi/sounds/click.mp3")
  os.execute('echo 1 > /tmp/zi/busyflag  &&  echo 0000 > /tmp/zi/last4keys')
  usuario_nro = arg[2]
  -- os.execute("mpg123 /etc/zi/sounds/success.mp3")
  if (usuario_nro == "1" or usuario_nro == "2" or usuario_nro == "3" or usuario_nro == "4" or usuario_nro == "5" or usuario_nro == "6") then
    os.execute('pico2wave -w /tmp/zi/buffer.wav -l es-ES '..
    '"'..vol_pitch..'Se puso a cero los minutos de hoy para usuario número '..usuario_nro..' ." '..
    '&& aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/buffer.wav'..
    '&& mpg123 '..path..'zi/sounds/success.mp3')
    os.execute('echo 0 > /tmp/zi/busyflag ' )
    set_state(states_db, "iddle")
  else
    os.execute("mpg123 "..path.."zi/sounds/alarma.mp3")
  end  
  os.execute("echo 0000 > /tmp/zi/last4keys")
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


