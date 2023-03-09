path = "/etc/"
-- os.execute("echo 1 > /tmp/zi/busyflag")  --prevents doubled triggering 
-- os.execute("sleep 1 && echo 0 > /tmp/zi/busyflag")

require "tablesaveload" -- for persistance
require "zi_functions"  -- custom functions by zi
require "states_machine" -- states need some persistance 
require "animals_table"  -- animals_table.lua
require "vehicles_table"  -- vehicles_table.lua

users_db = "users_table.db"
devices_db = "devices_table.db"
states_db = "states_table.db"


-- os.execute("sleep 2 && echo 0 > /tmp/zi/busyflag")          
-- os.execute("echo 0 > /tmp/zi/busyflag")

os.execute("mpg123 "..path.."zi/sounds/keypress.mp3")

if (arg[1] == "states" and arg[2] == "reset") then states_reset(states_db) end

if arg[1] == "key"
then
  if get_state(states_db) == "iddle" then
    logged_user = 0
    lastkey = arg[2]
    last4keys = arg[3]
    for i=1, 6 do 
      if last4keys == get_password(users_db, i)
      then 
        os.execute("echo 1 > /tmp/zi/busyflag")
        logged_user = i 
        os.execute("mpg123 "..path.."zi/sounds/success.mp3")
        os.execute('pico2wave -w /tmp/welcome.wav -l es-ES "Bienvenido Usuario'..logged_user..' "')
        os.execute("sleep 5")
        os.execute("aplay -q -f S16_LE -D plughw:0,0 /tmp/welcome.wav &" )
        break
      end
      os.execute("echo 0 > /tmp/zi/busyflag")
    end

    if logged_user == 0 then
      set_state(sates_db, "iddle")
      set_logged_user(sates_db, 0)
      -- enables triggerhappy
      os.execute("echo 0 > /tmp/zi/busyflag")
    end

    if logged_user ~= 0 then
      -- menú de usuario:
      running = get_running_status(users_db, logged_user)
      if running == 0 then
        os.execute('pico2wave -w /tmp/menuusuario.wav -l es-ES "Estás en pausa. Te quedan '..get_time_left_today(users_db, logged_user)..' minutos hoy. Para navegar, presiona 1. Para seguir en pausa, presiona 0." &')
        os.execute("sleep 5")
        os.execute("aplay -q -f S16_LE -D plughw:0,0 /tmp/menuusuario.wav")
      end
      if running == 1 then
        os.execute('pico2wave -w /tmp/menuusuario.wav -l es-ES "Estás en pausa. Te quedan '..get_time_left_today(users_db, logged_user)..' minutos hoy. Para pausar, presiona 0. Para seguir navegando, presiona 1." &')
        os.execute("sleep 5")
        os.execute("aplay -q -f S16_LE -D plughw:0,0 /tmp/menuusuario.wav &" )
      end 
       
      -- sets statesmachine:
      set_state(states_db, "connect_or_disconnect")
      set_logged_user(states_db, logged_user)
      -- enables triggerhappy
      os.execute("echo 0 > /tmp/zi/busyflag")
    end

  os.exit()
  end

  if get_state(states_db) == "connect_or_disconnect" then
    logged_user = get_logged_user(states_db)
    lastkey = arg[2]
    if lastkey == "1" then
      -- TODO: la jugada en safedns
      set_running_status(users_db, logged_user, 1)

      os.execute('pico2wave -w /tmp/welcome.wav -l es-ES "Navega!" ')
      os.execute("aplay -q -f S16_LE -D plughw:0,0 /tmp/welcome.wav &" )
      os.execute("sleep 3")
      os.execute("mpg123 "..path.."zi/sounds/ticktack.mp3")
    end
    if lastkey == "0" then
      -- TODO: la jugada en safedns
      set_running_status(users_db, logged_user, 0)
      
      os.execute('pico2wave -w /tmp/welcome.wav -l es-ES "Pausa de internet! " ')
      os.execute("aplay -q -f S16_LE -D plughw:0,0 /tmp/welcome.wav &" )
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
