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
phrases_db = "phrases.db"

phrases = lines_from(phrases_db)
link =" && "
-- usage:
-- cd /etc/zi/ && lua zi.lua arg1 arg2 arg3
-- examples:
-- lua zi.lua key 1 1234   <  reading keys
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

-- keypad based calls
if arg[1] == "key" then
  os.execute("echo 1 > /tmp/zi/busyflag")
  os.execute("mpg123 "..path.."zi/sounds/keypress.mp3")
  if get_state(states_db) == "iddle" then
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
        os.execute("aplay /tmp/zi/admin_menu_wav1.wav")  -- "Bienvenido Administrador"
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
        os.execute('pico2wave -w /tmp/welcome.wav -l es-ES "<volume level=\'70\'> Bienvenido Usuario'..logged_user..' "')
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

    -- if admin passord
    if logged_admin ~= 0 then
      set_state(states_db, "admin_menu")              -- sets statesmachine:
      set_logged_user(states_db, logged_admin)        -- TODO:  is this needed?
      os.execute("echo 1 > /tmp/zi/busyflag")
      os.execute("echo 1 > /tmp/zi/skippableflag")
      os.execute("echo aaaa > /tmp/zi/last4keys")
      os.execute(
      'aplay /tmp/zi/menu_2.wav'..link..
      'aplay /tmp/zi/menu_3.wav'..link..
      'aplay /tmp/zi/menu_4.wav'..link..
      'aplay /tmp/zi/menu_5.wav'..link..
      'aplay /tmp/zi/menu_6.wav'..link..
      'aplay /tmp/zi/menu_7.wav'..link..
      'aplay /tmp/zi/menu_8.wav'..link..
      'aplay /tmp/zi/menu_9.wav')
      os.execute("echo 0 > /tmp/zi/busyflag")        -- enables triggerhappy
      os.execute("echo 0 > /tmp/zi/skippableflag")   -- no need to skipanymore
    end

    -- if user password
    if logged_user ~= 0 then
      -- menú de usuario:
      running = get_running_status(users_db, logged_user)
      os.execute("echo aaaa > /tmp/zi/last4keys")
      if running == 0 then
        os.execute("aplay /tmp/zi/menu_11.wav"..link..
          "pico2wave -w /tmp/zi/wav.wav -l es-ES \"<volume level='50'><pitch level=\'130\'>"..get_time_left_today(users_db, logged_user).." "..link..
          "aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/wav.wav"..link..
          "aplay /tmp/zi/menu_12.wav")
      end
      if running == 1 then
        os.execute("aplay /tmp/zi/menu_13.wav"..link..
          "pico2wave -w /tmp/zi/wav.wav -l es-ES \"<volume level='50'><pitch level=\'130\'>"..get_time_left_today(users_db, logged_user).." "..link..
          "aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/zi/wav.wav"..link..
          "aplay /tmp/zi/menu_13.wav")
      end  
      set_state(states_db, "connect_or_disconnect")  -- sets statesmachine:
      set_logged_user(states_db, logged_user)        -- TODO:  is this needed?
    end
  os.execute("echo 0 > /tmp/zi/busyflag")
  os.exit()
  end

  if get_state(states_db) == "connect_or_disconnect" then
    logged_user = get_logged_user(states_db)
    lastkey = arg[2]
    if lastkey == "1" then
      -- TODO: la jugada en safedns
      set_running_status(users_db, logged_user, 1)

      os.execute('pico2wave -w /tmp/welcome.wav -l es-ES "<volume level=\'70\'>Navega!" ')
      os.execute("aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/welcome.wav &" )
      os.execute("sleep 3")
      os.execute("mpg123 "..path.."zi/sounds/ticktack.mp3")
    end
    if lastkey == "0" then
      -- TODO: la jugada en safedns
      set_running_status(users_db, logged_user, 0)
      
      os.execute('pico2wave -w /tmp/welcome.wav -l es-ES "<volume level=\'70\'>Pausa de internet! " ')
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
end
