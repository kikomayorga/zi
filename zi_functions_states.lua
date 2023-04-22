-- STATES MACHINE FUNCTIONS

function states_db_reset(db_file)
  t = {}
  t = {
    ["state"]="iddle",    -- anonymous or logged
    ["logged_user"]=0,        -- 0: no user selected
    ["logged_admin"]=0,
    ["device_count"]=0,
    ["user_count"]=0,
    ['last_state']="iddle",
    ["last_MAC_connected"]="00:00:00:00:00:00",
    ["last4keys"]="0000",
    ["busyflag"]=0,
    ["skippableflag"]=0
    }
  table.save(t, db_file)
  return 1
end

function get_state(db_file)
  t = table.load(db_file)
  state = t["state"]
return state
end 

function get_last_state(db_file)
  t = table.load(db_file)
  state = t["last_state"]
return state
end 

function set_state(db_file, state)
  t = table.load(db_file)
  t["last_state"]=t["state"]
  t["state"]=state
  table.save(t, db_file)
return 1
end 

function get_user_count(db_file)
  t = table.load(db_file)
  user_count = t["user_count"]
return logged_user
end 

function set_user_count(db_file, user_count)
  t = table.load(db_file)
  t["user_count"]=user_count
  table.save(t, db_file)
return 1
end 


function get_logged_user(db_file)
  t = table.load(db_file)
  logged_user = t["logged_user"]
return logged_user
end 

function set_logged_user(db_file, user)
  t = table.load(db_file)
  t["logged_user"]=user
  table.save(t, db_file)
return 1
end 

function get_logged_admin(db_file)
  t = table.load(db_file)
  logged_admin = t["logged_admin"]
return logged_admin
end 

function set_logged_admin(db_file, admin_id)
  t = table.load(db_file)
  t["logged_admin"]=admin_id
  table.save(t, db_file)
return 1
end 

function set_last_device_added(db_file, last_index)
  t = table.load(db_file)
  t["last_device_added"]=last_index
  table.save(t, db_file)
  return 1
end

function get_last_device_added(db_file)
  t = table.load(db_file)
  output = t["last_device_added"]
  return output
end

function get_last_MAC_connected(db_file)
  t = table.load(db_file)
  output = t["last_MAC_connected"]
  return output
end

function set_busy(db_file)
  os.execute("echo 1 > /tmp/zi/busyflag")
  t = table.load(db_file)
  t["busyflag"] = 1
  table.save(t,db_file)
end

function set_skippable(db_file)
  os.execute("echo 1 > /tmp/zi/skippableflag")
  t = table.load(db_file)
  t["skippableflag"] = 1
  table.save(t,db_file)
end

function clear_busy()
  os.execute("echo 0 > /tmp/zi/busyflag")
  t = table.load(db_file)
  t["busyflag"] = 0
  table.save(t,db_file)
end

function clear_skippable(db_file)
  os.execute("echo 0 > /tmp/zi/skippableflag")
  t = table.load(db_file)
  t["skippableflag"] = 0
  table.save(t,db_file)
end

function clear_last4keys(db_file)
  os.execute("echo 0000 > /tmp/zi/last4keys")
  t = table.load(db_file)
  t["last4keys"] = "0000"
  table.save(t,db_file)
end

function set_last4keys(db_file, string)
  t = table.load(db_file)
  t["last4keys"] = string
  table.save(t,db_file)
end

