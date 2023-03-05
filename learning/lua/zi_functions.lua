function users_db_reset(db_file)
  users_table = {}
  for i = 1, 6 do
    users_table[i] = {
      -- ["user_ID"]="u0x",
      -- ["user_name"]="user_x",
      ["password"]="1234", 
      ["running"]=0, 
      ["daily_quota"]=180,
      ["time_left_today"]=180,
      ["assigned_device"]=nil,
      ["own_devices_nr"]=0,
      ["own_dev_1"]=nil,
      ["own_dev_2"]=nil, 
      ["own_dev_3"]=nil, 
      ["morning_start"]=360, -- 6hrs
      ["day_end"]=1260, --21 hrs
     }
  end

  users_table[1].user_name ="usuario 1"
  users_table[2].user_name ="usuario 2"
  users_table[3].user_name ="usuario 3"
  users_table[4].user_name ="usuario 4"
  users_table[5].user_name ="usuario 5"
  users_table[6].user_name ="usuario 6"

  -- table.save(users_table, "users_table.db")
  table.save(users_table, db_file)
return 1
end

function devices_db_reset(o)
  devices_table = {}
  for i = 1, 32 do
    devices_table[i] = {
      ["mac_adr"]="00:00:00:00:00:00",
      ["id"]="d"..string.format("%02d",i)
     }
  end
  table.save(devices_table, o)
return 1
end

function rename_user(db_file, userID, new_name)
t = table.load("users_table.db")
t[userID]["user_name"]=new_name
table.save(t, db_file)
return 1
end 

function say_users(db_file)
return 1
end 

function append_user(db_file)
return 1
end

function change_password(db_file, userID)
-- validar password 
end

function assign_device_permanently(deviceNR, userID)
  -- db_file, 
end

function mark_device_shared(deviceNR)
  -- 
end

function free_device_permanently(deviceNR)
  -- db_file, 
end

function free_device_permanently(deviceNR)
  -- db_file?
end

function name_device(deviceNR)
  -- db_file, insects_db_file
end

function name_vehicle(db_file, insects_db_file)
end

function createDir (dirname)
  os.execute("mkdir " .. dirname)
end