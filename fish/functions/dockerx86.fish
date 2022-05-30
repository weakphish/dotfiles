function dockerx86 --wraps='docker run --rm -it --platform linux/amd64' --description 'alias dockerx86 docker run --rm -it --platform linux/amd64'
  docker run --rm -it --platform linux/amd64 $argv; 
end
