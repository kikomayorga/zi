-- path = "/etc/"
path = "/etc/"
-- debugging in windows
-- path = "/home/qeakous/Documents/"

dofile(""..path.."zi/zi_functions.lua")  -- custom functions by zi

phrases = lines_from("/etc/zi/phrases/phrases.txt")      -- main menu
phrases_a = lines_from("/etc/zi/phrases/phrases_a.txt")  -- admin phrases
phrases_a1 = lines_from("/etc/zi/phrases/phrases_a1.txt")  -- admin phrases
phrases_a7 = lines_from("/etc/zi/phrases/phrases_a7.txt")  -- admin phrases
phrases_a6 = lines_from("/etc/zi/phrases/phrases_a6.txt")  -- admin phrases
phrases_a0 = lines_from("/etc/zi/phrases/phrases_a0.txt")  -- admin phrases

phrases_u = lines_from("/etc/zi/phrases/phrases_u.txt")  -- usuario
phrases_u1 = lines_from("/etc/zi/phrases/phrases_u.txt")  -- usuario

phrases_i = lines_from("/etc/zi/phrases/phrases_i.txt")  -- inicialización
phrases_i2 = lines_from("/etc/zi/phrases/phrases_i2.txt")  -- inicialización

vol_pitch = "<volume level=\'30\'><pitch level=\'120\'><speed level=\'80\'>"
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
  'pico2wave -w /tmp/zi/a1_1.wav -l es-ES "'..vol_pitch..' '..phrases_a1[1]..'" ')

os.execute('sleep 10')

-- a7
os.execute(
  'pico2wave -w /tmp/zi/a7_1.wav -l es-ES "'..vol_pitch..' '..phrases_a7[1]..'" ')

os.execute('sleep 10')

-- a6
os.execute(
  'pico2wave -w /tmp/zi/a6_1.wav -l es-ES "'..vol_pitch..' '..phrases_a6[1]..'" ')

os.execute('sleep 10')

-- a4
os.execute(
  'pico2wave -w /tmp/zi/a0_1.wav -l es-ES "'..vol_pitch..' '..phrases_a0[1]..'" ')
os.execute('sleep 10')


