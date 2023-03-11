-- path = "/etc/"

require "tablesaveload" -- for persistance
require "zi_functions"  -- custom functions by zi
require "states_machine" -- states need some persistance 
require "animals_table"  -- animals_table.lua
require "vehicles_table"  -- vehicles_table.lua

users_db = "users_table.db"
admins_db = "admins_table.db"
devices_db = "devices_table.db"
states_db = "states_table.db"
phrases_db = "phrases.db"

phrases = lines_from(phrases_db)

--[[
os.execute(                                  'pico2wave -w /tmp/zi/wav.wav -l es-ES "<volume level=\'70\'>'..
phrases[1]..'."  && aplay'..phrases[20]..' && pico2wave -w /tmp/zi/wav.wav -l es-ES "<volume level=\'70\'>'..
phrases[2]..'."  && aplay'..phrases[20]..' && pico2wave -w /tmp/zi/wav.wav -l es-ES "<volume level=\'70\'>'..
phrases[3]..'."  && aplay'..phrases[20]..' && pico2wave -w /tmp/zi/wav.wav -l es-ES "<volume level=\'70\'>'..
phrases[4]..'."  && aplay'..phrases[20]..' && echo 1' ')
]] 

--[[
os.execute(                                   "pico2wave -w /tmp/zi/wav.wav -l es-ES \"<volume level='70'>"..
phrases[1]..".\"  && aplay"..phrases[20].." && pico2wave -w /tmp/zi/wav.wav -l es-ES \"<volume level='70'>"..
phrases[2]..".\"  && aplay"..phrases[20].." && pico2wave -w /tmp/zi/wav.wav -l es-ES \"<volume level='70'>"..
phrases[3]..".\"  && aplay"..phrases[20].." && pico2wave -w /tmp/zi/wav.wav -l es-ES \"<volume level='70'>"..
phrases[4]..".\"  && aplay"..phrases[20].." && echo 1.")
]]

os.execute(
     'pico2wave -w /tmp/zi/admin_menu_wav1.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[1]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav2.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[2]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav3.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[3]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav4.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[4]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav5.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[5]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav6.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[6]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav7.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[7]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav8.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[8]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav9.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[9]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav10.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[10]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav11.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[11]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav12.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[12]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav13.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[13]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav14.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[14]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav15.wav -l es-ES "<volume level=\'70\'>'
  ..phrases[15]..' "  && aplay '..phrases[20]..
  '&& pico2wave -w /tmp/zi/admin_menu_wav16 -l es-ES "<volume level=\'70\'>'
  ..phrases[16]..' "  && aplay '..phrases[20]..' ')