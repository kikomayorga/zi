-- path = "/etc/"

require "zi_functions"  -- custom functions by zi

phrases_db = "phrases.db"
phrases2_db = "phrases2.db"

phrases = lines_from(phrases_db)
phrases2 = lines_from(phrases2_db)

os.execute(
                      'pico2wave -w /tmp/zi/menu_1.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[1]..' " && pico2wave -w /tmp/zi/menu_2.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[2]..' " && pico2wave -w /tmp/zi/menu_3.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[3]..' " && pico2wave -w /tmp/zi/menu_4.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[4]..' " && pico2wave -w /tmp/zi/menu_5.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[5]..' " && pico2wave -w /tmp/zi/menu_6.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[6]..' " && pico2wave -w /tmp/zi/menu_7.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[7]..' " && pico2wave -w /tmp/zi/menu_8.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[8]..' " && pico2wave -w /tmp/zi/menu_9.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[9]..' " && pico2wave -w /tmp/zi/menu_10.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[10]..' " && pico2wave -w /tmp/zi/menu_11.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[11]..' " && pico2wave -w /tmp/zi/menu_12.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[12]..' " && pico2wave -w /tmp/zi/menu_13.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[13]..' " && pico2wave -w /tmp/zi/menu_14.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[14]..' " && pico2wave -w /tmp/zi/menu_15.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[15]..' " && pico2wave -w /tmp/zi/menu_16.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[16]..' "')

os.excecute('sleep 15')

os.execute(
                       'pico2wave -w /tmp/zi/menu2_1.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[1]..' " && pico2wave -w /tmp/zi/menu2_2.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[2]..' " && pico2wave -w /tmp/zi/menu2_3.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[3]..' " && pico2wave -w /tmp/zi/menu2_4.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[4]..' " && pico2wave -w /tmp/zi/menu2_5.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[5]..' " && pico2wave -w /tmp/zi/menu2_6.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[6]..' " && pico2wave -w /tmp/zi/menu2_7.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[7]..' " && pico2wave -w /tmp/zi/menu2_8.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[8]..' " && pico2wave -w /tmp/zi/menu2_9.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[9]..' " && pico2wave -w /tmp/zi/menu2_10.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[10]..' " && pico2wave -w /tmp/zi/menu2_11.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[11]..' " && pico2wave -w /tmp/zi/menu2_12.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[12]..' " && pico2wave -w /tmp/zi/menu2_13.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[13]..' " && pico2wave -w /tmp/zi/menu2_14.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[14]..' " && pico2wave -w /tmp/zi/menu2_15.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[15]..' " && pico2wave -w /tmp/zi/menu2_16.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases2[16]..' "')