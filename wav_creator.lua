-- path = "/etc/"

require "zi_functions"  -- custom functions by zi

phrases = lines_from("phrases.txt")      -- iddle
phrases_a = lines_from("phrases_a.txt")  -- administrador
phrases_u = lines_from("phrases_u.txt")  -- usuario
phrases_i = lines_from("phrases_i.txt")  -- inicialización


os.execute(
                      'pico2wave -w /tmp/zi/a1.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[1]..' " && pico2wave -w /tmp/zi/a2.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[2]..' " && pico2wave -w /tmp/zi/a3.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[3]..' " && pico2wave -w /tmp/zi/a4.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[4]..' " && pico2wave -w /tmp/zi/a5.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[5]..' " && pico2wave -w /tmp/zi/a6.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[6]..' " && pico2wave -w /tmp/zi/a7.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[7]..' " && pico2wave -w /tmp/zi/a8.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[8]..' " && pico2wave -w /tmp/zi/a9.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[9]..' " && pico2wave -w /tmp/zi/a10.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[10]..' " && pico2wave -w /tmp/zi/a11.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[11]..' " && pico2wave -w /tmp/zi/a12.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[12]..' " && pico2wave -w /tmp/zi/a13.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[13]..' " && pico2wave -w /tmp/zi/a14.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[14]..' " && pico2wave -w /tmp/zi/a15.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[15]..' " && pico2wave -w /tmp/zi/a16.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases[16]..' "')

os.execute('sleep 15')

os.execute(
                       'pico2wave -w /tmp/zi/admin_menu1_1.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[1]..' " && pico2wave -w /tmp/zi/menu2_2.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[2]..' " && pico2wave -w /tmp/zi/menu2_3.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[3]..' " && pico2wave -w /tmp/zi/menu2_4.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[4]..' " && pico2wave -w /tmp/zi/menu2_5.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[5]..' " && pico2wave -w /tmp/zi/menu2_6.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[6]..' " && pico2wave -w /tmp/zi/menu2_7.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[7]..' " && pico2wave -w /tmp/zi/menu2_8.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[8]..' " && pico2wave -w /tmp/zi/menu2_9.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[9]..' " && pico2wave -w /tmp/zi/menu2_10.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[10]..' " && pico2wave -w /tmp/zi/menu2_11.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[11]..' " && pico2wave -w /tmp/zi/menu2_12.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[12]..' " && pico2wave -w /tmp/zi/menu2_13.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[13]..' " && pico2wave -w /tmp/zi/menu2_14.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[14]..' " && pico2wave -w /tmp/zi/menu2_15.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[15]..' " && pico2wave -w /tmp/zi/menu2_16.wav -l es-ES "<volume level=\'70\'><pitch level=\'130\'>'
  ..phrases_a[16]..' "')