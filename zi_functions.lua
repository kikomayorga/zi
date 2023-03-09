function users_db_reset(db_file)
  t = {}
  for i = 1, 6 do
    t[i] = {
      ["password"]="1234", 
      ["running"]=0, 
      ["daily_quota"]=180,
      ["time_left_today"]=180,
      ["assigned_device"]=0,
      ["own_devices_nr"]=0,
      ["own_dev_1"]=0,
      ["own_dev_2"]=0, 
      ["own_dev_3"]=0, 
      ["morning_start"]=360, -- 6hrs
      ["day_end"]=1260, --21 hrs
     }
  end

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

  for i=1, 6 do t[i].user_name ="usuario "..i end
  table.save(t, db_file)

return 1
end

function devices_db_reset(db_file)
  devices_table = {}
  for i = 1, 32 do
    devices_table[i] = {
      ["mac_adr"]="00:00:00:00:00:00",
      ["id"]="d"..string.format("%02d",i)
     }
  end
  table.save(devices_table, db_file)
return 1
end

function rename_user(db_file, userID, new_name)
  t = table.load(db_file)
  t[userID]["user_name"]=new_name
  table.save(t, db_file)
return 1
end 

function get_password(db_file, userID)
  t = table.load(db_file)
  password = t[userID]["password"]
  return password
end

function get_admin_password(db_file, adminID)
  t = table.load(db_file)
  password = t[adminID]["password"]
  return password
end

function set_password(db_file, userID, new_password)
  t = table.load(db_file)
  t[userID]["password"]=new_password
  table.save(t, db_file)
end

function get_time_left_today(db_file, userID)
  t = table.load(db_file)
  time_left = t[userID]["time_left_today"]
  return time_left
end

function set_time_left_today(db_file, userID, time_left_today)
  t = table.load(db_file)
  t[userID]["time_left_today"]= time_left_today
  table.save(t, db_file)
  return time_left
end

function get_running_status(db_file, userID)
  t = table.load(db_file)
  running_status = t[userID]["running"]
  return running_status
end

function set_running_status(db_file, userID, running)
  t = table.load(db_file)
  t[userID]["running"]=running
  table.save(t, db_file)
end

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
end

-- just and example, unused!
function createDir (dirname)
  os.execute("mkdir " .. dirname)
end

-- unused???
function append_user(db_file)
  t = {}
  t = table.load(db_file)
  t[#t +1] = {"usuario_N", "1234", "user"}
  table.save(t, "usuarios.db")
return 1
end