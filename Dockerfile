FROM alpine:edge
MAINTAINER gjchen <freak@funp.com>

RUN apk --no-cache --no-progress upgrade -f
RUN apk --no-cache --no-progress add ca-certificates bash
RUN apk --no-cache --no-progress add --virtual build-deps git mercurial go gcc musl-dev

ENV GOPATH /
RUN go get -u github.com/odeke-em/drive/cmd/drive

RUN apk --no-progress del build-deps

RUN mkdir -p /opt/drive

VOLUME ["/opt/drive"]
WORKDIR /opt/drive

CMD [ /bin/drive --help ]
