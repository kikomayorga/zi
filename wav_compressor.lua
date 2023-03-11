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
  'ffmpeg -i /tmp/zi/admin_menu_wav1.wav -acodec libmp3lame /tmp/zi/admin_menu_01.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav2.wav -acodec libmp3lame /tmp/zi/admin_menu_02.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav3.wav -acodec libmp3lame /tmp/zi/admin_menu_03.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav4.wav -acodec libmp3lame /tmp/zi/admin_menu_04.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav5.wav -acodec libmp3lame /tmp/zi/admin_menu_05.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav6.wav -acodec libmp3lame /tmp/zi/admin_menu_06.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav7.wav -acodec libmp3lame /tmp/zi/admin_menu_07.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav8.wav -acodec libmp3lame /tmp/zi/admin_menu_08.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav9.wav -acodec libmp3lame /tmp/zi/admin_menu_09.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav10.wav -acodec libmp3lame /tmp/zi/admin_menu_10.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav11.wav -acodec libmp3lame /tmp/zi/admin_menu_11.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav12.wav -acodec libmp3lame /tmp/zi/admin_menu_12.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav13.wav -acodec libmp3lame /tmp/zi/admin_menu_13.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav14.wav -acodec libmp3lame /tmp/zi/admin_menu_14.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav15.wav -acodec libmp3lame /tmp/zi/admin_menu_15.mp3 '..link..
  'ffmpeg -i /tmp/zi/admin_menu_wav16.wav -acodec libmp3lame /tmp/zi/admin_menu_16.mp3 ')