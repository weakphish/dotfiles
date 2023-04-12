function conv-opus-to-mp3 -a file out; ffmpeg -i $file -vn -ar 44100 -ac 2 -b:a 192k $out; end
