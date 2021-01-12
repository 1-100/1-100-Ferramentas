magick convert -delay 20 -loop 0 +dither -colors 8 10.jpg 20.jpg 30.jpg 40.jpg 50.jpg 60.jpg 70.jpg 80.jpg 90.jpg 100.jpg thumb-b.gif

gifsicle -O3 thumb-b.gif -o thumb.gif

ffmpeg -framerate 25 -i %01d.jpg -f webm -c:v libvpx -b:v 1M -acodec libvorbis video.webm

ffmpeg -framerate 25 -i %01d.jpg -crf 28 video.mp4