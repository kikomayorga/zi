-- DEVICES FUNCTIONS

function devices_db_reset(db_file)
  devices_table = {}
  for i = 1, 32 do
    devices_table[i] = {
      ["mac_adr"]="00:00:00:00:00:00",
      ["vehicleName"]="dispositivo "..i,
      ["use"]="blocked",                     -- blocked, free, exclusive, shared
      ["leased"]="false",
      ["vehicleID"]=0   --indice del nombre del dispositivo.
     }
  end
  table.save(devices_table, db_file)
  return 1
end

function devices_db_get_value(devices_db_file, index, field)
  t = table.load(devices_db_file)
  value = t[index][field]
  table.save(t, devices_db_file)
  return value
end

function devices_db_set_value(devices_db_file, index, field, value)
  t = table.load(devices_db_file)
  t[index][field]= value
  table.save(t, devices_db_file)
end

function getDevIndex(devices_db_file, MAC)
  t = table.load(devices_db_file)
  output = 0   -- case not found
  for i, v in ipairs(t) do
    if v["mac_adr"] == MAC then
      output = i
    end
  end
  return output
end

function getDevUse(devices_db_file, MAC)
  t = table.load(devices_db_file)
  output = "blocked"   -- blocked, liberated, exclusive, shared
  for i, v in ipairs(t) do
    if v["mac_adr"] == MAC then
      output = v["use"]
    end
  end
  return output
end

function setDevUse(devices_db_file, index, use)
  t = table.load(devices_db_file)
  t[index]["use"]= use
  table.save(t, devices_db_file)
end

function getDevLeased(devices_db_file, MAC)
  t = table.load(devices_db_file)
  output = 0   -- case not found
  for i, v in ipairs(t) do
    if v["mac_adr"] == MAC then
      output = v["leased"]
    end
  end
  return output
end

function setDevLeased(devices_db_file, index, leased)
  t = table.load(devices_db_file)
  t[index]["leased"]= leased
  table.save(t, devices_db_file)
end

function deviceToRule(deviceNr)
  -- safedns first rule string: "cfg038c89"
  ruleNr = string.format("%03x", tonumber(0x038) + deviceNr - 1)
  ruleCode = "cfg"..ruleNr.."c89" 
  return ruleCode
end

function ruleToDevice(ruleCode)
  -- safedns first rule string: "cfg038c89"
  -- ruleNr = "0x"..string.sub(ruleCode,4,6)
  ruleNrHex = "0x"..string.sub(ruleCode,4,6)
  deviceNr = tonumber(ruleNrHex) - tonumber(0x038) + 1 
  return deviceNr
end

-- 
function set_device_db_row(db_file, deviceID, MAC, vehicleID)
  t = table.load(db_file)
  t[deviceID]["mac_adr"]=MAC
  t[deviceID]["leased"]="false"
  t[deviceID]["use"]="blocked"
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



