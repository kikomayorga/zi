-- MAC / HOSTAPD ROUTINES

-- device gets connected
if (get_state(states_db) == "iddle" and arg[1] == "hostapd" and arg[2] == "AP-STA-CONNECTED") then
  set_busy()
  set_skippable()
  play_success()
  mac_adress_detected = arg[3] 
  if( getDevNr(devices_db, mac_adress_detected) == 0 ) then
    -- unknown device
    set_state(states_db, "h1")
    say("Nuevo dispositivo detectado. Ingresa una clave de administrador para configurarlo.")
    set_state(states_db, "check_admin_pass")
  else
    -- known device
    clear_busy()
    clear_skippable()
  end
end

-- testing for admin key
if (get_state(states_db) == "check_admin_pass" and arg[1] == "key") then
  set_busy()
  play_click()
  last4keys = arg[3]
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
      "Para liberar el dispositivo permanentemente marca 1"..
    )
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
