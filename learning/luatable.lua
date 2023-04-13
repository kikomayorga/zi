dofile("tables/tablesaveload.lua") 


function getDevNr(devices_db_file, MAC)
  t = table.load(devices_db_file)
  output = 0
  for i, v in ipairs(t) do
    if v["mac_adr"] == MAC then
      output = i
    end
  end
  return output
end

