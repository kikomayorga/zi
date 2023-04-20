

-- CRON EACHMINUTE:  user table actions
if (arg[1] == "cron" and arg[2] == "eachminute") then

  -- en principio no se reiniciará safedns
  restart_safedns_flag = 0
  -- leer todos los saldos
  local saldo1 = users_db_get_value(users_db, 1, "time_left_today")
  local saldo2 = users_db_get_value(users_db, 2, "time_left_today")
  local saldo3 = users_db_get_value(users_db, 3, "time_left_today")
  local saldo4 = users_db_get_value(users_db, 4, "time_left_today")
  local saldo5 = users_db_get_value(users_db, 5, "time_left_today")
  local saldo6 = users_db_get_value(users_db, 6, "time_left_today")

  local previous_saldo1 = users_db_get_value(users_db, 1, "previous_time_left_today")
  local previous_saldo2 = users_db_get_value(users_db, 2, "previous_time_left_today")
  local previous_saldo3 = users_db_get_value(users_db, 3, "previous_time_left_today")
  local previous_saldo4 = users_db_get_value(users_db, 4, "previous_time_left_today")
  local previous_saldo5 = users_db_get_value(users_db, 5, "previous_time_left_today")
  local previous_saldo6 = users_db_get_value(users_db, 6, "previous_time_left_today")
  
  -- leer todos los saldo leases
  local saldo_lease_1 = users_db_get_value(users_db, 1, "lease__minutes_left")
  local saldo_lease_2 = users_db_get_value(users_db, 2, "lease__minutes_left")
  local saldo_lease_3 = users_db_get_value(users_db, 3, "lease__minutes_left")
  local saldo_lease_4 = users_db_get_value(users_db, 4, "lease__minutes_left")
  local saldo_lease_5 = users_db_get_value(users_db, 5, "lease__minutes_left")
  local saldo_lease_6 = users_db_get_value(users_db, 6, "lease__minutes_left")

  -- leer todos los running statuses
  local running1 = users_db_get_value(users_db, 1, "running")
  local running2 = users_db_get_value(users_db, 2, "running")
  local running3 = users_db_get_value(users_db, 3, "running")
  local running4 = users_db_get_value(users_db, 4, "running")
  local running5 = users_db_get_value(users_db, 5, "running")
  local running6 = users_db_get_value(users_db, 6, "running")
  -- leer todos los previous running statuses  
  local previous_running1 = users_db_get_value(users_db, 1, "previous_running")
  local previous_running2 = users_db_get_value(users_db, 2, "previous_running")
  local previous_running3 = users_db_get_value(users_db, 3, "previous_running")
  local previous_running4 = users_db_get_value(users_db, 4, "previous_running")
  local previous_running5 = users_db_get_value(users_db, 5, "previous_running")
  local previous_running6 = users_db_get_value(users_db, 6, "previous_running")

  -- guardar antiguos running y saldos
  previous_running1 = running1
  previous_running2 = running2
  previous_running3 = running3
  previous_running4 = running4
  previous_running5 = running5
  previous_running6 = running6

  -- guardar antiguos running y saldos
  previous_saldo1 = saldo1
  previous_saldo2 = saldo2
  previous_saldo3 = saldo3
  previous_saldo4 = saldo4
  previous_saldo5 = saldo5
  previous_saldo6 = saldo6

  -- decrementar todos los saldos que estén en running
  if (running1 == 1 and saldo1 > 0) then saldo1 = saldo1 - 1 end
  if (running2 == 1 and saldo2 > 0) then saldo2 = saldo2 - 1 end
  if (running3 == 1 and saldo3 > 0) then saldo3 = saldo3 - 1 end
  if (running4 == 1 and saldo4 > 0) then saldo4 = saldo4 - 1 end
  if (running5 == 1 and saldo5 > 0) then saldo5 = saldo5 - 1 end
  if (running6 == 1 and saldo6 > 0) then saldo6 = saldo6 - 1 end

  -- iterar sobre saldos y si saldo = 0 y running entonces ponr el running a 0
  if (saldo1 == 0 and running1 == 1) then running1 = 0 end
  if (saldo2 == 0 and running2 == 1) then running2 = 0 end
  if (saldo3 == 0 and running3 == 1) then running3 = 0 end
  if (saldo4 == 0 and running4 == 1) then running4 = 0 end
  if (saldo5 == 0 and running5 == 1) then running5 = 0 end
  if (saldo6 == 0 and running6 == 1) then running6 = 0 end

  -- detectar flancos y llamar acciones sobre ... apply_safedns_policy(db_file, userID, new_running)
  if (running1 == 0 and previous_running1 == 1) then apply_safedns_policy(users_db, 1, 0) end
  if (running2 == 0 and previous_running2 == 1) then apply_safedns_policy(users_db, 2, 0) end
  if (running3 == 0 and previous_running3 == 1) then apply_safedns_policy(users_db, 3, 0) end
  if (running4 == 0 and previous_running4 == 1) then apply_safedns_policy(users_db, 4, 0) end
  if (running5 == 0 and previous_running5 == 1) then apply_safedns_policy(users_db, 5, 0) end
  if (running6 == 0 and previous_running6 == 1) then apply_safedns_policy(users_db, 6, 0) end

  if (running1 == 0 and previous_running1 == 1) then restart_safedns_flag = 1 end
  if (running2 == 0 and previous_running2 == 1) then restart_safedns_flag = 1 end
  if (running3 == 0 and previous_running3 == 1) then restart_safedns_flag = 1 end
  if (running4 == 0 and previous_running4 == 1) then restart_safedns_flag = 1 end
  if (running5 == 0 and previous_running5 == 1) then restart_safedns_flag = 1 end
  if (running6 == 0 and previous_running6 == 1) then restart_safedns_flag = 1 end

  -- guardar ultimo estado de saldo_lease
  previous_saldo_lease_1 = saldo_lease_1
  previous_saldo_lease_2 = saldo_lease_2
  previous_saldo_lease_3 = saldo_lease_3
  previous_saldo_lease_4 = saldo_lease_4
  previous_saldo_lease_5 = saldo_lease_5
  previous_saldo_lease_6 = saldo_lease_6

  -- decrementar todos los leases que no sean cero.
  if (saldo_lease_1 > 0 and running1 == 1) then saldo_lease_1 = saldo_lease_1 - 1 end
  if (saldo_lease_2 > 0 and running1 == 2) then saldo_lease_2 = saldo_lease_2 - 1 end 
  if (saldo_lease_3 > 0 and running1 == 3) then saldo_lease_3 = saldo_lease_3 - 1 end
  if (saldo_lease_4 > 0 and running1 == 4) then saldo_lease_4 = saldo_lease_4 - 1 end
  if (saldo_lease_5 > 0 and running1 == 5) then saldo_lease_5 = saldo_lease_5 - 1 end
  if (saldo_lease_6 > 0 and running1 == 6) then saldo_lease_6 = saldo_lease_6 - 1 end
  
  -- cuando se acaba el lease, se pone "running" a cero
  if (saldo_lease_1 == 0 and previous_saldo_lease_1 == 1) then running1 = 0 stop_active_lease(users_db, 1)  apply_safedns_policy(users_db, 1, 0) restart_safedns_flag = 1 end
  if (saldo_lease_2 == 0 and previous_saldo_lease_2 == 1) then running2 = 0 stop_active_lease(users_db, 2)  apply_safedns_policy(users_db, 2, 0) restart_safedns_flag = 1 end 
  if (saldo_lease_3 == 0 and previous_saldo_lease_3 == 1) then running3 = 0 stop_active_lease(users_db, 3)  apply_safedns_policy(users_db, 3, 0) restart_safedns_flag = 1 end
  if (saldo_lease_4 == 0 and previous_saldo_lease_4 == 1) then running4 = 0 stop_active_lease(users_db, 4)  apply_safedns_policy(users_db, 4, 0) restart_safedns_flag = 1 end
  if (saldo_lease_5 == 0 and previous_saldo_lease_5 == 1) then running5 = 0 stop_active_lease(users_db, 5)  apply_safedns_policy(users_db, 5, 0) restart_safedns_flag = 1 end
  if (saldo_lease_6 == 0 and previous_saldo_lease_6 == 1) then running6 = 0 stop_active_lease(users_db, 6)  apply_safedns_policy(users_db, 6, 0) restart_safedns_flag = 1 end

  if restart_safedns_flag == 1 then 
    -- 
    os.execute("uci commit")
    os.execute("/etc/init.d/safedns restart")
  end

  -- escribimos los saldos en la tabla
  users_db_set_column(users_db, "time_left_today", saldo1, saldo2, saldo3, saldo4, saldo5, saldo6)
  users_db_set_column(users_db, "previous_time_left_today", previous_saldo1, previous_saldo2, previous_saldo3, previous_saldo4, previous_saldo5, previous_saldo6)
  users_db_set_column(users_db, "lease__minutes_left", saldo_lease_1, saldo_lease_2, saldo_lease_3, saldo_lease_4, saldo_lease_5, saldo_lease_6)
  users_db_set_column(users_db, "running", running1, running2, running3, running4, running5, running6)
  users_db_set_column(users_db, "previous_running", previous_running1, previous_running2, previous_running3, previous_running4, previous_running5, previous_running6)

end

-- CRON 2359

