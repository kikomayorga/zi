
-- iddle and any key
if (get_state(states_db) == "iddle" and arg[1] == "key") then
  set_busy()
  play_click()
  logged_user = 0
  logged_admin = 0
  lastkey = arg[2]
  last4keys = arg[3]
    
    -- test for admin passwords
  for i=1, 6 do 
    if last4keys == admins_db_get_value(admins_db, i, "password")
    then 
      clear_last4keys()
      logged_admin = i 
      play_success()
      os.execute("aplay /tmp/zi/a_1.wav")  -- "Bienvenido Administrador"
      break
    end
    clear_busy()
  end

  -- test for user passwords
  for i=1, 6 do 
    if last4keys == users_db_get_value(users_db, i, "password")
    then 
      logged_user = i 
      clear_last4keys()
      set_busy()
      play_success()
      say('bienvenido Usuario '..logged_user)
      break
    end
    clear_busy()
  end

  -- if no found password
  if (logged_user == 0 and logged_admin == 0) then
    set_state(sates_db, "iddle")
    set_logged_user(sates_db, 0)
    -- enables triggerhappy
    clear_busy()
  end

  -- if admin password
  -- states: iddle > a
  if logged_admin ~= 0 then
    clear_last4keys()
    set_state(states_db, "a")              -- sets statesmachine:
    -- set_logged_user(states_db, logged_admin)        -- TODO:  is this needed?
    set_busy()
    set_skippable()
    clear_last4keys()
    os.execute(
    'aplay /tmp/zi/a_2.wav'..'aplay /tmp/zi/a_3.wav'..
    'aplay /tmp/zi/a_4.wav'..'aplay /tmp/zi/a_5.wav'..
    'aplay /tmp/zi/a_6.wav')
    clear_busy()
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
    set_state(states_db, "user_menu")  -- sets statesmachine:
    set_logged_user(states_db, logged_user)        -- TODO:  is this needed?
  end
  clear_busy()
  os.exit()
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

  -- sets statesmachine:
  set_state(states_db, "iddle")
  -- enables triggerhappy
  clear_busy()

os.exit() 
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