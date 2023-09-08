
#!/bin/bash

VARIABLE=$((RANDOM%3))
echo $VARIABLE
#base64 /dev/urandom | head -c 500 > file.txt
#
#ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" out.wav

#convert -size 100x100 xc: +noise Random noise.png
if [[ $VARIABLE == 0 ]] ; then
	base64 /dev/urandom | head -c 500 > file.txt
elif [[ $VARIABLE == 1 ]] ; then
	ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" out.wav
else
	convert -size 100x100 xc: +noise Random noise.png
fi
