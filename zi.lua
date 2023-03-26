path = "/etc/"

require "tablesaveload" -- for persistance
require "zi_functions"  -- custom functions by zi
require "states_machine" -- states need some persistance 
require "animals_table"  -- animals_table.lua
require "vehicles_table"  -- vehicles_table.lua

users_db = "users_table.db"
admins_db = "admins_table.db"
devices_db = "devices_table.db"
states_db = "states_table.db"

phrases = lines_from("phrases.txt")      -- admin main menu
phrases_a = lines_from("phrases_a.txt")  -- admin phrases
phrases_a1 = lines_from("phrases_a1.txt")  -- admin phrases
phrases_a7 = lines_from("phrases_a7.txt")  -- admin phrases
phrases_a6 = lines_from("phrases_a6.txt")  -- admin phrases
phrases_a0 = lines_from("phrases_a0.txt")  -- admin phrases

phrases_u = lines_from("phrases_u.txt")  -- usuario
phrases_u1 = lines_from("phrases_u1.txt")  -- usuario
phrases_i = lines_from("phrases_i.txt")  -- inicialización
phrases_i1 = lines_from("phrases_i1.txt")  -- inicialización

continue =" && "  -- connects lines of voice
vol_pitch = "<volume level=\'30\'><pitch level=\'60\'>"

-- usage:
-- cd /etc/zi/ && lua zi.lua arg1 arg2 arg3
-- examples:
-- lua zi.lua key 1 1234   <  reading keysn
-- lua zi.lua users reset
-- lua zi.lua admins reset
-- lua zi.lua devices reset
-- lua zi.lua states reset
-- lua zi.lua hostapd connect macaddresse

-- command calls
if (arg[1] == "users" and arg[2] == "reset") then users_db_reset(users_db) end
if (arg[1] == "admins" and arg[2] == "reset") then admins_db_reset(admins_db) end
if (arg[1] == "devices" and arg[2] == "reset") then devices_db_reset(devices_db) end
if (arg[1] == "states" and arg[2] == "reset") then states_reset(states_db) end

if (arg[1] == "test")
then
  -- os.excecute("echo hello world")
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
    if last4keys == get_admin_password(admins_db, i)
    then 
      logged_admin = i 
      os.execute("mpg123 "..path.."zi/sounds/success.mp3")
      os.execute("aplay /tmp/zi/a_1.wav")  -- "Bienvenido Administrador"
      break
    end
    os.execute("echo 0 > /tmp/zi/busyflag")
  end

  -- test for user passwords
  for i=1, 6 do 
    if last4keys == get_password(users_db, i)
    then 
      os.execute("echo 1 > /tmp/zi/busyflag")
      logged_user = i 
      os.execute("mpg123 "..path.."zi/sounds/success.mp3")
      os.execute('pico2wave -w /tmp/welcome.wav -l es-ES "'..vol_pitch..'"Bienvenido Usuario'..logged_user..' "')
      os.execute("sleep 5")
      os.execute("aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/welcome.wav &" )
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
    set_state(states_db, "a")              -- sets statesmachine:
    -- set_logged_user(states_db, logged_admin)        -- TODO:  is this needed?
    os.execute("echo 1 > /tmp/zi/busyflag  &&  echo 1 > /tmp/zi/skippableflag  &&  echo 0000 > /tmp/zi/last4keys  ")
    os.execute(
    'aplay /tmp/zi/a_2.wav'..continue..'aplay /tmp/zi/a_3.wav'..continue..
    'aplay /tmp/zi/a_4.wav'..continue..'aplay /tmp/zi/a_5.wav'..continue..
    'aplay /tmp/zi/a_6.wav')
    os.execute("echo 0 > /tmp/zi/busyflag && echo 0 > /tmp/zi/skippableflag")
  end

  -- if user password
  -- states: iddle > u
  -- TODO: CHECK flags
  if logged_user ~= 0 then
    running = get_running_status(users_db, logged_user)
    os.execute("echo 0000 > /tmp/zi/last4keys")
    if running == 0 then
      os.execute("aplay /tmp/zi/u_1.wav"..continue..
        "pico2wave -w /tmp/zi/wav.wav -l es-ES \"<volume level='50'><pitch level=\'130\'>"..get_time_left_today(users_db, logged_user).." "..continue..
        "aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/wav.wav"..continue..
        "aplay /tmp/zi/u_2.wav")
    end
    if running == 1 then
      os.execute("aplay /tmp/zi/u_3.wav"..continue..
        "pico2wave -w /tmp/zi/wav.wav -l es-ES \"<volume level='50'><pitch level=\'130\'>"..get_time_left_today(users_db, logged_user).." "..continue..
        "aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/wav.wav"..continue..
        "aplay /tmp/zi/u_3.wav")
    end  
    set_state(states_db, "user_menu")  -- sets statesmachine:
    set_logged_user(states_db, logged_user)        -- TODO:  is this needed?
  end
  os.execute("echo 0 > /tmp/zi/busyflag")
  os.exit()
end

if (get_state(states_db) == "user_menu" and arg[1] == "key") then
  logged_user = get_logged_user(states_db)
  lastkey = arg[2]
  if lastkey == "1" then
    -- TODO: la jugada en safedns
    set_running_status(users_db, logged_user, 1)

    os.execute('pico2wave -w /tmp/welcome.wav -l es-ES "'..vol_pitch..'Navega!" ')
    os.execute("aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/welcome.wav &" )
    os.execute("sleep 3")
    os.execute("mpg123 "..path.."zi/sounds/ticktack.mp3")
  end
  if lastkey == "0" then
    -- TODO: la jugada en safedns
    set_running_status(users_db, logged_user, 0)
    
    os.execute('pico2wave -w /tmp/welcome.wav -l es-ES "'..vol_pitch..'Pausa de internet! " ')
    os.execute("aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/welcome.wav &" )
    os.execute("sleep 3")
    os.execute("mpg123 "..path.."zi/sounds/aplausos.mp3")
  end
        
  -- sets statesmachine:
  set_state(states_db, "iddle")
  -- enables triggerhappy
  os.execute("echo 0 > /tmp/zi/busyflag")

os.exit() 
end

-- admin menus
-- a > a7
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "7") then
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
  lastkey = arg[2]
  set_state(states_db, "a7")              -- sets statesmachine:
  os.execute("echo 1 > /tmp/zi/busyflag"..continue..
  "echo 1 > /tmp/zi/skippableflag      "..continue..
  "echo 0000 > /tmp/zi/last4keys")
  os.execute('pico2wave -w /tmp/zi/buffer.wav -l es-ES '..
  '" '..vol_pitch..' '..
  'Se agegó 60 minutos a cada usuario.')
  os.execute('sleep 5   &&   echo 0 > /tmp/zi/busyflag   &&   echo 0 > /tmp/zi/skippableflag    &&   sleep 1' )
  set_state(states_db, "iddle")
  set_logged_user(states_db, 0)
end

-- a > a1
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "1") then
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
  set_state(states_db, "a1")              -- sets statesmachine:
  os.execute("echo 1 > /tmp/zi/busyflag && echo 1 > /tmp/zi/skippableflag")
  os.execute("  echo 1 > /tmp/zi/busyflag   &&   echo 0000 > /tmp/zi/last4keys  ")
  os.execute('aplay /tmp/zi/a1_1.wav')
  os.execute('sleep 3  &&   echo 0 > /tmp/zi/busyflag  &&   sleep 1' )
end

-- a > a6
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "6") then
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
  -- lastkey = arg[2]
  -- logged_user = get_logged_user(states_db)
  set_state(states_db, "a6")              -- sets statesmachine:
  os.execute("echo 1 > /tmp/zi/busyflag     &&     echo 1 > /tmp/zi/skippableflag    &&   echo 0000 > /tmp/zi/last4keys")
  os.execute('aplay /tmp/zi/a6_1.wav')
  os.execute('sleep 5   &&   echo 0 > /tmp/zi/busyflag   &&   echo 0 > /tmp/zi/skippableflag    &&   sleep 1' )
  set_logged_user(states_db, 0)
end

-- a > a2
if (get_state(states_db) == "a" and arg[1] == "key" and arg[2] == "2") then
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
  set_state(states_db, "a3")              -- sets statesmachine:
  os.execute("echo 1 > /tmp/zi/busyflag     &&     echo 1 > /tmp/zi/skippableflag    &&   echo 0000 > /tmp/zi/last4keys")
  os.execute(
  'aplay /tmp/zi/a2_1.wav'..continue..'aplay /tmp/zi/a2_2.wav'..continue..
  'aplay /tmp/zi/a2_3.wav'..continue..'aplay /tmp/zi/a2_4.wav'..continue..
  'aplay /tmp/zi/a2_5.wav'..continue..'aplay /tmp/zi/a2_6.wav'..continue..
  'aplay /tmp/zi/a2_7.wav')
  os.execute('sleep 20   &&   echo 0 > /tmp/zi/busyflag   &&   echo 0 > /tmp/zi/skippableflag    &&   sleep 1' )
  set_state(states_db, "iddle")
  set_logged_user(states_db, 0)
end

-- a1 > # > iddle
-- "agregar 60 minutos a un usuario"
if (get_state(states_db) == "a1" and arg[1] == "key") then
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
  usuario_nro = arg[2]
  os.execute('echo 1 > /tmp/zi/busyflag  &&  echo 0000 > /tmp/zi/last4keys')
  os.execute('pico2wave -w /tmp/zi/buffer.wav -l es-ES '..
  '"'..vol_pitch..'Se agregó 60 minutos al usuario '..usuario_nro..'." && '..
  'aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/buffer.wav  &&'..
  'mpg123 /etc/zi/sounds/aplausos.mp3')
  -- os.execute("sleep 3")
  -- os.execute("mpg123 "..path.."zi/sounds/alarma.mp3")
  os.execute('echo 0 > /tmp/zi/busyflag ' )
  set_state(states_db, "iddle")
end

--[[
-- a1 > # > iddle
-- "bloquear un usuario"
if (get_state(states_db) == "a6" and arg[1] == "key") then
  local usuario_nro = arg[2]
  if (usuario_nro == "1" or usuario_nro == "2" or usuario_nro == "3" or usuario_nro == "4" or usuario_nro == "5" or usuario_nro == "6") then
    os.execute('echo 1 > /tmp/zi/busyflag  &&  echo 0000 > /tmp/zi/last4keys')
    os.execute('pico2wave -w /tmp/zi/buffer.wav -l es-ES '..continue..
    '"'..vol_pitch..'Se puso a cero los minutos de hoy para '..usuario_nro..' ." ')
    -- TODO: BLOQUEAR AL USUARIO EFECTIVAMENTE
    os.execute("aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/buffer.wav &" )
    os.execute("sleep 3")
    os.execute("mpg123 "..path.."zi/sounds/alarma.mp3")
    os.execute('echo 0 > /tmp/zi/busyflag ' )
    set_state(states_db, "iddle")
  else
    os.execute("mpg123 "..path.."zi/sounds/alarma.mp3")
  end  
end
]]

--[[
  os.execute("echo 0 > /tmp/zi/busyflag")
  os.execute("echo 0 > /tmp/zi/skippableflag")
  os.execute("sleep 1")
  set_state(states_db, "iddle")
  set_logged_user(states_db, 0)
]]

