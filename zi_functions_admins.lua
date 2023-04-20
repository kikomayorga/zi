-- ADMIN DB FUNCTIONS

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