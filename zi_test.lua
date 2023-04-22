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
-- dofile(""..path.."zi/tables/animals_table.lua")
-- dofile(""..path.."zi/tables/vehicles_table.lua")
dofile(""..path.."zi/zi_functions.lua")  -- custom functions by zi

-- single concern function files
dofile(""..path.."zi/zi_functions_states.lua") 
-- dofile(""..path.."zi/zi_functions_users.lua") 
-- dofile(""..path.."zi/zi_functions_admins.lua") 
-- dofile(""..path.."zi/zi_functions_devices.lua") 
-- dofile(""..path.."zi/zi_functions_vehicles.lua") 
-- dofile(""..path.."zi/zi_functions_sound.lua") 

states_db   = "/tmp/zi/states_table.db"
admins_db   = ""..path.."zi/tables/admins_table.db"
users_db    = ""..path.."zi/tables/users_table.db"
devices_db  = ""..path.."zi/tables/devices_table.db"
vehicles_db = ""..path.."zi/tables/vehicles_table.db"

--[[
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
]] 

-- command calls
if (arg[1] == "users" and arg[2] == "reset") then users_db_reset(users_db) end
if (arg[1] == "admins" and arg[2] == "reset") then admins_db_reset(admins_db) end
if (arg[1] == "devices" and arg[2] == "reset") then devices_db_reset(devices_db) end
if (arg[1] == "states" and arg[2] == "reset") then states_db_reset(states_db) end 
if (arg[1] == "vehicles" and arg[2] == "reset") then vehicles_db_reset(vehicles_db) end 


if (arg[1] == "test")
then
  os.execute("echo hello world")
--  print(animals_table[1])
  for i = 1, 10, 1 do
--  print(vehicles_table[i])
    print(i)
  end
  -- os.execute('killall -q lua')
end

