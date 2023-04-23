-- THIS FILE MUST BE dofile AS LAST
-- THIS bunddles other functions together

function intro_states_reset()
  --asdf
return 1
end

function outro_states_reset(states_db_file)
  set_logged_user(states_db_file, 0)
  set_logged_admin(states_db_file, 0)
  clear_busy(states_db_file)
  clear_skippable(states_db_file)
  clear_last4keys(states_db_file)
return 1
end
