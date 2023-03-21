-- path = "/etc/"

require "zi_functions"  -- custom functions by zi

phrases = lines_from("phrases.txt")      -- iddle
phrases_a = lines_from("phrases_a.txt")  -- main admin menu
phrases_a1 = lines_from("phrases_a1.txt")-- admin prases
phrases_a7 = lines_from("phrases_a1.txt")-- admin prases
phrases_a6 = lines_from("phrases_a1.txt")-- 

phrases_u = lines_from("phrases_u.txt")  -- usuario
phrases_u1 = lines_from("phrases_u.txt")  -- usuario

phrases_i = lines_from("phrases_i.txt")  -- inicialización
phrases_i2 = lines_from("phrases_i2.txt")  -- inicialización

vol_pitch = "<volume level=\'70\'><pitch level=\'140\'>"
continue = " && " 

-- u
os.execute(
  'pico2wave -w /tmp/zi/u_1.wav -l es-ES "'..vol_pitch..' '..phrases_u[1]..'" '..continue..
  'pico2wave -w /tmp/zi/u_2.wav -l es-ES "'..vol_pitch..' '..phrases_u[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/u_3.wav -l es-ES "'..vol_pitch..' '..phrases_u[3]..'" '..continue..
  'pico2wave -w /tmp/zi/u_4.wav -l es-ES "'..vol_pitch..' '..phrases_u[4]..'" '..continue..
  'pico2wave -w /tmp/zi/u_5.wav -l es-ES "'..vol_pitch..' '..phrases_u[5]..'." ')

os.execute('sleep 10')

-- u1
os.execute(
  'pico2wave -w /tmp/zi/u1_1.wav -l es-ES "'..vol_pitch..' '..phrases_u[1]..'" '..continue..
  'pico2wave -w /tmp/zi/u1_2.wav -l es-ES "'..vol_pitch..' '..phrases_u[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/u1_3.wav -l es-ES "'..vol_pitch..' '..phrases_u[3]..'" '..continue..
  'pico2wave -w /tmp/zi/u1_4.wav -l es-ES "'..vol_pitch..' '..phrases_u[4]..'" '..continue..
  'pico2wave -w /tmp/zi/u1_5.wav -l es-ES "'..vol_pitch..' '..phrases_u[5]..'." ')

os.execute('sleep 10')

-- a
os.execute(
  'pico2wave -w /tmp/zi/a_1.wav -l es-ES "'..vol_pitch..' '..phrases_a[1]..'" '..continue..
  'pico2wave -w /tmp/zi/a_2.wav -l es-ES "'..vol_pitch..' '..phrases_a[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/a_3.wav -l es-ES "'..vol_pitch..' '..phrases_a[3]..'" '..continue..
  'pico2wave -w /tmp/zi/a_4.wav -l es-ES "'..vol_pitch..' '..phrases_a[4]..'" '..continue..
  'pico2wave -w /tmp/zi/a_5.wav -l es-ES "'..vol_pitch..' '..phrases_a[5]..'" '..continue..
  'pico2wave -w /tmp/zi/a_6.wav -l es-ES "'..vol_pitch..' '..phrases_a[6]..'." ')

os.execute('sleep 10')

-- a1
os.execute(
  'pico2wave -w /tmp/zi/a1_1.wav -l es-ES "'..vol_pitch..' '..phrases_a1[1]..'" '..continue..
  'pico2wave -w /tmp/zi/a1_2.wav -l es-ES "'..vol_pitch..' '..phrases_a1[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/a1_3.wav -l es-ES "'..vol_pitch..' '..phrases_a1[3]..'" '..continue..
  'pico2wave -w /tmp/zi/a1_4.wav -l es-ES "'..vol_pitch..' '..phrases_a1[4]..'" '..continue..
  'pico2wave -w /tmp/zi/a1_5.wav -l es-ES "'..vol_pitch..' '..phrases_a1[5]..'" '..continue..
  'pico2wave -w /tmp/zi/a1_6.wav -l es-ES "'..vol_pitch..' '..phrases_a1[6]..'." ')

os.execute('sleep 10')

-- a7
os.execute(
  'pico2wave -w /tmp/zi/a1_1.wav -l es-ES "'..vol_pitch..' '..phrases_a7[1]..'" ')

os.execute('sleep 10')

-- a6
os.execute(
  'pico2wave -w /tmp/zi/a6_1.wav -l es-ES "'..vol_pitch..' '..phrases_a6[1]..'" '..continue..
  'pico2wave -w /tmp/zi/a6_2.wav -l es-ES "'..vol_pitch..' '..phrases_a6[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/a6_3.wav -l es-ES "'..vol_pitch..' '..phrases_a6[3]..'" '..continue..
  'pico2wave -w /tmp/zi/a6_4.wav -l es-ES "'..vol_pitch..' '..phrases_a6[4]..'" '..continue..
  'pico2wave -w /tmp/zi/a6_5.wav -l es-ES "'..vol_pitch..' '..phrases_a6[5]..'" '..continue..
  'pico2wave -w /tmp/zi/a6_6.wav -l es-ES "'..vol_pitch..' '..phrases_a6[6]..'." ')

os.execute('sleep 10')

-- a4
os.execute(
  'pico2wave -w /tmp/zi/a4_1.wav -l es-ES "'..vol_pitch..' '..phrases_a4[1]..'" ')
os.execute('sleep 10')


