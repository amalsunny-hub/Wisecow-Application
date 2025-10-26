FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and dos2unix
RUN apt-get update && apt-get install -y fortune-mod cowsay netcat-openbsd dos2unix

WORKDIR /app

# Copy script and fix line endings
COPY wisecow.sh /app/
RUN dos2unix /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499

# Use bash to run script (avoids CRLF issues)
CMD ["bash", "/app/wisecow.sh"]
