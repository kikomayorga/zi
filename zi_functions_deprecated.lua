function get_password(db_file, userID)
  t = table.load(db_file)
  password = t[userID]["password"]
  return password
end

function set_password(db_file, userID, new_password)
  t = table.load(db_file)
  t[userID]["password"]=new_password
  table.save(t, db_file)
  return 1
end 

function get_time_left_today(db_file, userID)
  t = table.load(db_file)
  time_left = t[userID]["time_left_today"]
  return time_left
end

function get_animal(db_file, userID)
  t = table.load(db_file)
  animalID = t[userID]["animalID"]
  return animalID
end

function set_animal(db_file, userID, new_name)
  t = table.load(db_file)
  t[userID]["user_name"]=new_name
  table.save(t, db_file)
  return 1
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

function set_running_statuses(db_file, running1, running2, running3, running4, running5, running6)
  t = table.load(db_file)
  t[1]["running"]=running1
  t[2]["running"]=running2
  t[3]["running"]=running3
  t[4]["running"]=running4
  t[5]["running"]=running5
  t[6]["running"]=running6
  table.save(t, db_file)
end

function get_lease__minutes_left(db_file, userID)
  t = table.load(db_file)
  lease__minutes_left = t[userID]["lease__minutes_left"]
  return lease__minutes_left
end

function set_lease__minutes_left(db_file, lease_left1, lease_left2, lease_left3, lease_left4, lease_left5, lease_left6)
  t = table.load(db_file)
  t[1]["lease__minutes_left"]=lease_left1
  t[2]["lease__minutes_left"]=lease_left2
  t[3]["lease__minutes_left"]=lease_left3
  t[4]["lease__minutes_left"]=lease_left4
  t[5]["lease__minutes_left"]=lease_left5
  t[6]["lease__minutes_left"]=lease_left6
  table.save(t, db_file)
  return 1
end

function set_time_left_today(db_file, userID, time_left_today)
  t = table.load(db_file)
  t[userID]["time_left_today"]= time_left_today
  table.save(t, db_file)
  return time_left
end

function set_times_left_today(db_file, saldo1, saldo2, saldo3, saldo4, saldo5, saldo6)
  t = table.load(db_file)
  t[1]["saldo1"]=saldo1
  t[2]["saldo2"]=saldo2
  t[3]["saldo3"]=saldo3
  t[4]["saldo4"]=saldo4
  t[5]["saldo5"]=saldo5
  t[6]["saldo6"]=saldo6
  table.save(t, db_file)
  return 1
end