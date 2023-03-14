-- path = "/etc/"

phrases_db = "phrases.db"

phrases = lines_from(phrases_db)
link =" && "
os.execute(
  'ffmpeg -i /tmp/zi/menu_1.wav -acodec libmp3lame -ac 1 -b:a 64k /tmp/zi/mp3_01.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_2.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_02.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_3.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_03.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_4.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_04.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_5.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_05.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_6.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_06.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_7.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_07.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_8.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_08.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_9.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_09.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_10.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_10.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_11.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_11.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_12.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_12.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_13.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_13.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_14.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_14.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_15.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_15.mp3 '..link..
  'ffmpeg -i /tmp/zi/menu_16.wav -acodec libmp3lame -ac 1 -b:a 64k  /tmp/zi/mp3_16.mp3 ')