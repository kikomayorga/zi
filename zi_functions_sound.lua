-- SOUND FUNCTIONS
function say(string)
  os.execute('pico2wave -w /tmp/saybuffer.wav -l es-ES "'..vol_pitch..
  string..'" && aplay -q -f U8 -r8000 -D plughw:0,0 /tmp/saybuffer.wav')
end

function play_success()
  os.execute("mpg123 "..path.."zi/sounds/success.mp3")
end

function play_click()
  os.execute("mpg123 "..path.."zi/sounds/click.mp3")
end

function play_applause()
  os.execute("mpg123 "..path.."zi/sounds/aplausos.mp3")
end

function play_ticktack()
  os.execute("mpg123 "..path.."zi/sounds/ticktack.mp3")
end

function play_alarm()
  os.execute("mpg123 "..path.."zi/sounds/alarma.mp3")
end

function play_keypress()
  os.execute("mpg123 "..path.."zi/sounds/keypress.mp3")
end