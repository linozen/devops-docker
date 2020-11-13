FROM ubuntu:16.04

RUN apt update && apt install -y curl

WORKDIR /scripts
COPY curl.sh .
RUN chmod +x ./curl.sh

CMD ["./curl.sh"]
