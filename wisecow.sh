#!/bin/bash
PORT=${PORT:-4499}

while true; do
  { echo -ne "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\n";
    /usr/games/fortune | /usr/games/cowsay;
  } | nc -l -p $PORT -q 1;
done
