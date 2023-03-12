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

os.execute(
                      'pico2wave -w /tmp/zi/admin_menu_wav1.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[1]..' " && pico2wave -w /tmp/zi/admin_menu_wav2.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[2]..' " && pico2wave -w /tmp/zi/admin_menu_wav3.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[3]..' " && pico2wave -w /tmp/zi/admin_menu_wav4.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[4]..' " && pico2wave -w /tmp/zi/admin_menu_wav5.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[5]..' " && pico2wave -w /tmp/zi/admin_menu_wav6.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[6]..' " && pico2wave -w /tmp/zi/admin_menu_wav7.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[7]..' " && pico2wave -w /tmp/zi/admin_menu_wav8.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[8]..' " && pico2wave -w /tmp/zi/admin_menu_wav9.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[9]..' " && pico2wave -w /tmp/zi/admin_menu_wav10.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[10]..' " && pico2wave -w /tmp/zi/admin_menu_wav11.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[11]..' " && pico2wave -w /tmp/zi/admin_menu_wav12.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[12]..' " && pico2wave -w /tmp/zi/admin_menu_wav13.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[13]..' " && pico2wave -w /tmp/zi/admin_menu_wav14.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[14]..' " && pico2wave -w /tmp/zi/admin_menu_wav15.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[15]..' " && pico2wave -w /tmp/zi/admin_menu_wav16.wav -l es-ES "<volume level=\'70\'><pitch level=\'150\'>'
  ..phrases[16]..' "')