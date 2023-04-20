-- VEHICLES FUNCTIONS


function vehicles_db_reset(db_file)
  vt ={}
  for i= 1,47 do
    vt[i]={
      ["vehicle"]=vehicles_table[i],
      ["taken"]=0,
      ["gender"]="nil",
      ["aumentativo"]="nil"
    }
  end
  table.save(vt, db_file)
  return 1
end

function get_vehicle_taken(db_file, vehicleID)
  t = table.load(db_file)
  return t[vehicleID]["taken"]
end

function set_vehicle_taken(db_file, vehicleID, taken_state)
  t = table.load(db_file)
  t[vehicleID]["taken"]=taken_state
  table.save(t, db_file)
end

function available_vehicles_menu(db_file, vh_table)
  t = table.load(db_file)
  menustring = ""
  for i, v in ipairs(t) do
    if v["taken"] == 0 then
      menustring = menustring..", "..i.." "..vh_table[i]
    end
  end
  return menustring
end

function get_vehicles_ammount(db_file)
  t.load(db_file)
  vehicles_ammount = tableLength(t)
  return vehicles_ammount
end