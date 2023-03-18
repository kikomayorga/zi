-- path = "/etc/"

require "zi_functions"  -- custom functions by zi

phrases = lines_from("phrases.txt")      -- iddle
phrases_a = lines_from("phrases_a.txt")  -- administrador
phrases_a1 = lines_from("phrases_a1.txt")-- administrador / extender tiempo a un usuario
phrases_u = lines_from("phrases_u.txt")  -- usuario
phrases_u1 = lines_from("phrases_u.txt")  -- usuario
phrases_i = lines_from("phrases_i.txt")  -- inicialización
phrases_i2 = lines_from("phrases_i2.txt")  -- inicialización

vol_pitch = "<volume level=\'70\'><pitch level=\'140\'>"
continue = " && " 

-- phrases to talk to initial user while setup
os.execute(
  'pico2wave -w /tmp/zi/u_1.wav -l es-ES "'..vol_pitch..' '..phrases_u[1]..'" '..continue..
  'pico2wave -w /tmp/zi/u_2.wav -l es-ES "'..vol_pitch..' '..phrases_u[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/u_3.wav -l es-ES "'..vol_pitch..' '..phrases_u[3]..'" '..continue..
  'pico2wave -w /tmp/zi/u_4.wav -l es-ES "'..vol_pitch..' '..phrases_u[4]..'" '..continue..
  'pico2wave -w /tmp/zi/u_5.wav -l es-ES "'..vol_pitch..' '..phrases_u[5]..'." ')

os.execute('sleep 10')

os.execute(
  'pico2wave -w /tmp/zi/u1_1.wav -l es-ES "'..vol_pitch..' '..phrases_u[1]..'" '..continue..
  'pico2wave -w /tmp/zi/u1_2.wav -l es-ES "'..vol_pitch..' '..phrases_u[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/u1_3.wav -l es-ES "'..vol_pitch..' '..phrases_u[3]..'" '..continue..
  'pico2wave -w /tmp/zi/u1_4.wav -l es-ES "'..vol_pitch..' '..phrases_u[4]..'" '..continue..
  'pico2wave -w /tmp/zi/u1_5.wav -l es-ES "'..vol_pitch..' '..phrases_u[5]..'." ')

os.execute('sleep 10')
-- voices to talk to admins
os.execute(
  'pico2wave -w /tmp/zi/a_1.wav -l es-ES "'..vol_pitch..' '..phrases_a[1]..'" '..continue..
  'pico2wave -w /tmp/zi/a_2.wav -l es-ES "'..vol_pitch..' '..phrases_a[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/a_3.wav -l es-ES "'..vol_pitch..' '..phrases_a[3]..'" '..continue..
  'pico2wave -w /tmp/zi/a_4.wav -l es-ES "'..vol_pitch..' '..phrases_a[4]..'" '..continue..
  'pico2wave -w /tmp/zi/a_5.wav -l es-ES "'..vol_pitch..' '..phrases_a[5]..'" '..continue..
  'pico2wave -w /tmp/zi/a_6.wav -l es-ES "'..vol_pitch..' '..phrases_a[6]..'." ')

os.execute('sleep 10')

os.execute(
  'pico2wave -w /tmp/zi/a1_1.wav -l es-ES "'..vol_pitch..' '..phrases_a1[1]..'" '..continue..
  'pico2wave -w /tmp/zi/a1_2.wav -l es-ES "'..vol_pitch..' '..phrases_a1[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/a1_3.wav -l es-ES "'..vol_pitch..' '..phrases_a1[3]..'" '..continue..
  'pico2wave -w /tmp/zi/a1_4.wav -l es-ES "'..vol_pitch..' '..phrases_a1[4]..'" '..continue..
  'pico2wave -w /tmp/zi/a1_5.wav -l es-ES "'..vol_pitch..' '..phrases_a1[5]..'" '..continue..
  'pico2wave -w /tmp/zi/a1_6.wav -l es-ES "'..vol_pitch..' '..phrases_a1[6]..'." ')

os.execute('sleep 10')

--[[
os.execute(
  'pico2wave -w /tmp/zi/a2_1.wav -l es-ES "'..vol_pitch..' '..phrases_a2[1]..'" '..continue..
  'pico2wave -w /tmp/zi/a2_2.wav -l es-ES "'..vol_pitch..' '..phrases_a2[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/a2_3.wav -l es-ES "'..vol_pitch..' '..phrases_a2[3]..'" '..continue..
  'pico2wave -w /tmp/zi/a2_4.wav -l es-ES "'..vol_pitch..' '..phrases_a2[4]..'" '..continue..
  'pico2wave -w /tmp/zi/a2_5.wav -l es-ES "'..vol_pitch..' '..phrases_a2[5]..'" '..continue..
  'pico2wave -w /tmp/zi/a2_6.wav -l es-ES "'..vol_pitch..' '..phrases_a2[6]..'." ')
os.execute('sleep 10')
]]

-- phrases to talk to users
os.execute(
  'pico2wave -w /tmp/zi/u_1.wav -l es-ES "'..vol_pitch..' '..phrases_u[1]..'" '..continue..
  'pico2wave -w /tmp/zi/u_2.wav -l es-ES "'..vol_pitch..' '..phrases_u[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/u_3.wav -l es-ES "'..vol_pitch..' '..phrases_u[3]..'" '..continue..
  'pico2wave -w /tmp/zi/u_4.wav -l es-ES "'..vol_pitch..' '..phrases_u[4]..'" '..continue..
  'pico2wave -w /tmp/zi/u_5.wav -l es-ES "'..vol_pitch..' '..phrases_u[5]..'." ')

os.execute('sleep 10')

os.execute(
  'pico2wave -w /tmp/zi/u1_1.wav -l es-ES "'..vol_pitch..' '..phrases_u[1]..'" '..continue..
  'pico2wave -w /tmp/zi/u1_2.wav -l es-ES "'..vol_pitch..' '..phrases_u[2]..'" '..continue.. 
  'pico2wave -w /tmp/zi/u1_3.wav -l es-ES "'..vol_pitch..' '..phrases_u[3]..'" '..continue..
  'pico2wave -w /tmp/zi/u1_4.wav -l es-ES "'..vol_pitch..' '..phrases_u[4]..'" '..continue..
  'pico2wave -w /tmp/zi/u1_5.wav -l es-ES "'..vol_pitch..' '..phrases_u[5]..'." ')

os.execute('sleep 10')

