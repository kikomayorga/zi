-- HELPER FUNCTIONS

function deviceToRule(deviceNr)
  -- safedns first rule string: "cfg038c89"
  ruleNr = string.format("%03x", tonumber(0x038) + deviceNr - 1)
  ruleCode = "cfg"..ruleNr.."c89" 
  return ruleCode
end

function ruleToDevice(ruleCode)
  -- safedns first rule string: "cfg038c89"
  -- ruleNr = "0x"..string.sub(ruleCode,4,6)
  ruleNrHex = "0x"..string.sub(ruleCode,4,6)
  deviceNr = tonumber(ruleNrHex) - tonumber(0x038) + 1 
  return deviceNr
end


-- RESETTER FUNCTIONS

function admins_db_reset(db_file)
  t = {}
  for i = 1, 6 do
    t[i] = {
      ["password"]="7777", 
      ["own_dev_1"]=0,
      ["own_dev_2"]=0, 
      ["own_dev_3"]=0,
      }
  end
  table.save(t, db_file)
  return 1
end

function users_db_reset(db_file)
  t = {}
  for i = 1, 6 do
    t[i] = {
      ["password"]="1234", 
      ["animalID"]=0,
      ["daily_quota"]=180,
      ["running"]=0, 
      ["previous_running"]=0,
      ["time_left_today"]=180,
      ["previous_time_left_today"]=180,
      ["lease__duration"] = 45,
      ["lease__minutes_left"] = 0,
      ["lease__device_id"]  = 0,
      ["lease__origin_token"]  = safedns_policy_0,
      ["lease__destination_token"] = safedns_policy_2,    
      ["own_device_id_1"]=0,
      ["own_device_id_2"]=0, 
      ["own_device_id_3"]=0, 
      ["day_start"]=360, -- 6hrs
      ["day_end"]=1260, --21 hrs
     }
  end

 
  for i=1, 6 do t[i].user_name ="usuario "..i end
  table.save(t, db_file)
  return 1


end

function devices_db_reset(db_file)
  devices_table = {}
  for i = 1, 32 do
    devices_table[i] = {
      ["mac_adr"]="00:00:00:00:00:00",
      ["vehicleID"]=0,
      ["ownerID"]=0,   -- 0 means shared or leasable
     }
  end
  table.save(devices_table, db_file)
  return 1
end

-- USERS DB FUNCTIONS

function users_db_get_value(db_file, userID, paramNAME)
  t = table.load(db_file)
  gotten = t[userID][paramNAME]
  return gotten
end

function users_db_set_value(db_file, userID, paramNAME, newvalue)
  t = table.load(db_file)
  t[userID][paramNAME]=newvalue
  table.save(t, db_file)
  return 1
end

function users_db_set_column(db_file, paramNAME, newvalue1, newvalue2, newvalue3, newvalue4, newvalue5, newvalue6)
  t = table.load(db_file)
  t[1][paramNAME]=newvalue1
  t[2][paramNAME]=newvalue2
  t[3][paramNAME]=newvalue3
  t[4][paramNAME]=newvalue4
  t[5][paramNAME]=newvalue5
  t[6][paramNAME]=newvalue6
  table.save(t, db_file)
  return 1
end

function apply_safedns_policy(db_file, userID, new_running)
  -- OWN DEVICES
  for own_device_iterator = 1, 3, 1 do
    t = table.load(db_file)
    deviceID = t[userID]["own_device_id_"..own_device_iterator..""]
    if deviceID ~= 0 then
      -- formateando el nro de regla, pues la funcion deviceToRule no se podia llamar?
      ruleNr = string.format("%03x", tonumber(0x038) + deviceID - 1)
      ruleCode = "cfg"..ruleNr.."c89" 
      --uci set safedns.cfg038c89.token='1922033194'
      if new_running == 1 then
        os.execute('uci set safedns.'..ruleCode..
        '.token='..users_db_get_value(users_db, userID, "lease__destination_token") )   
      end

      if new_running == 0 then
        os.execute('uci set safedns.'..ruleCode..
        '.token='..users_db_get_value(users_db, userID, "lease__origin_token") )   
      end

    end
  end

  -- LEASED DEVICE
  do
    t = table.load(db_file)
    deviceID = t[userID]["lease__device_id"]
    if deviceID ~= 0 then
      -- formateando el nro de regla, pues la funcion deviceToRule no se podia llamar?
      ruleNr = string.format("%03x", tonumber(0x038) + deviceID - 1)
      ruleCode = "cfg"..ruleNr.."c89" 
      --uci set safedns.cfg038c89.token='1922033194'
      if new_running == 1 then
        os.execute('uci set safedns.'..ruleCode..
        '.token='..users_db_get_value(users_db, userID, "lease__destination_token") )   
      end

      if new_running == 0 then
        os.execute('uci set safedns.'..ruleCode..
        '.token='..users_db_get_value(users_db, userID, "lease__origin_token") )   
      end

    end
  end




end

function stop_active_lease(db_file, userID) 
  t = table.load(db_file)
  t[userID]["lease__device_id"]=0
  table.save(t, db_file)
  return 1
end


-- ADMIN DB FUNCTIONS

function admins_db_get_value(db_file, adminID, paramNAME)
  t = table.load(db_file)
  gotten = t[adminID][paramNAME]
  return gotten
end

function admins_db_set_value(db_file, adminID, paramNAME, newvalue)
  t = table.load(db_file)
  t[adminID][paramNAME]=newvalue
  table.save(t, db_file)
  return 1
end

function admins_db_set_column(db_file, paramNAME, newvalue1, newvalue2, newvalue3, newvalue4, newvalue5, newvalue6)
  t = table.load(db_file)
  t[1][paramNAME]=newvalue1
  t[2][paramNAME]=newvalue2
  t[3][paramNAME]=newvalue3
  t[4][paramNAME]=newvalue4
  t[5][paramNAME]=newvalue5
  t[6][paramNAME]=newvalue6
  table.save(t, db_file)
  return 1
end


-- DEVICE DB FUNCTIONS
function assign_device_permanently(db_file, deviceNR, userID)
  t = table.load(db_file)

  t[userID]["own_devices_nr"]=t[userID]["own_devices_nr"] + 1
  if t[userID]["own_devices_nr"] == 1 then
    t[userID]["own_device_1"]=deviceNR
  end

  if t[userID]["own_devices_nr"] == 2 then
    t[userID]["own_device_2"]=deviceNR
  end

  if t[userID]["own_devices_nr"] == 3 then
    t[userID]["own_device_3"]=deviceNR
  end

  if t[userID]["own_devices_nr"] == 4 then
    return 0
  end
  
  table.save(t, db_file)
  return 1
end

function disassign_device_permanently(db_file, deviceNR, userID)
  t = table.load(db_file)
  if t[userID]["own_devices_nr"] == 0 then
    return 0
  end
  if t[userID]["own_devices_nr"] == 3 then
    t[userID]["own_device_3"]=0
    t[userID]["own_devices_nr"]=2
  end 

  if t[userID]["own_devices_nr"] == 2 then
    t[userID]["own_device_2"]=0
    t[userID]["own_devices_nr"]=1
  end

  if t[userID]["own_devices_nr"] == 1 then
    t[userID]["own_device_1"]=0
    t[userID]["own_devices_nr"]=0
  end

  table.save(t, db_file)
  return 1
end

function free_device_permanently(deviceNR)
  -- db_file, 
end

function mark_device_shared(deviceNR)
  -- 
end

function name_device(deviceNR)
  -- db_file, insects_db_file
end

function name_vehicle(db_file, insects_db_file)
  -- asdfasdfasdf
end

-- just and example, NOT USED YET!
function createDir (dirname)
  os.execute("mkdir " .. dirname)
end

-- NOT USED YET???
function append_user(db_file)
  t = {}
  t = table.load(db_file)
  t[#t +1] = {"usuario_N", "1234", "user"}
  table.save(t, "usuarios.db")
  return 1
end

-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

