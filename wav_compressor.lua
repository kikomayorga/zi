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
link =" && "
os.execute(
  'ffmpeg -i /tmp/zi/admin_menu_wav1.wav -acodec libmp3lame -ac 1 -b:a 64k /tmp/zi/admin_mp3_01.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav2.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_02.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav3.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_03.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav4.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_04.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav5.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_05.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav6.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_06.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav7.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_07.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav8.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_08.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav9.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_09.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav10.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_10.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav11.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_11.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav12.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_12.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav13.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_13.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav14.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_14.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav15.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_15.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav16.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/admin_mp3_16.mp3 ')