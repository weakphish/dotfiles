function kalibox --wraps='docker run --rm -it --platform linux/amd64 kalilinux/kali-rolling' --description 'alias kalibox docker run --rm -it --platform linux/amd64 kalilinux/kali-rolling'
  docker run --rm -it --platform linux/amd64 kalilinux/kali-rolling $argv; 
end
