function states_reset(db_file)
  t = {}
  t = {
    ["state"]="anonymous",    -- anonymous or logged
    ["logged_user"]=0,        -- 0: no user selected
    -- ["menu"]="user_menu"      -- 
    }
  table.save(t, db_file)
  return 1
end

function get_state(db_file)
  t = table.load(db_file)
  state = t["state"]
return state
end 

function set_state(db_file, state)
  t = table.load(db_file)
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