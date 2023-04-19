function states_db_reset(db_file)
  t = {}
  t = {
    ["state"]="iddle",    -- anonymous or logged
    ["logged_user"]=0,        -- 0: no user selected
    ['device_count']=0,
    ['last_state']="iddle"
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