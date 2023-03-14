-- path = "/etc/"

require "zi_functions"  -- custom functions by zi

phrases_db = "phrases.db"

phrases = lines_from(phrases_db)

os.execute(
                      'pico2wave -w /tmp/zi/menu_1.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[1]..' " && pico2wave -w /tmp/zi/menu_2.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[2]..' " && pico2wave -w /tmp/zi/menu_3.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[3]..' " && pico2wave -w /tmp/zi/menu_4.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[4]..' " && pico2wave -w /tmp/zi/menu_5.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[5]..' " && pico2wave -w /tmp/zi/menu_6.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[6]..' " && pico2wave -w /tmp/zi/menu_7.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[7]..' " && pico2wave -w /tmp/zi/menu_8.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[8]..' " && pico2wave -w /tmp/zi/menu_9.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[9]..' " && pico2wave -w /tmp/zi/menu_10.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[10]..' " && pico2wave -w /tmp/zi/menu_11.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[11]..' " && pico2wave -w /tmp/zi/menu_12.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[12]..' " && pico2wave -w /tmp/zi/menu_13.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[13]..' " && pico2wave -w /tmp/zi/menu_14.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[14]..' " && pico2wave -w /tmp/zi/menu_15.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[15]..' " && pico2wave -w /tmp/zi/menu_16.wav -l es-ES "<volume level=\'50\'><pitch level=\'130\'>'
  ..phrases[16]..' "')