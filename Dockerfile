FROM ghcr.io/gjchentw/alpine:edge

ENV GOPATH /tmp/go

RUN apk --no-cache --no-progress upgrade -f && \
    apk --no-cache --no-progress add ca-certificates bash && \
    apk --no-cache --no-progress add --virtual build-deps git mercurial go gcc musl-dev && \
    mkdir -p /tmp/go /opt/drive && \
    go get -u github.com/odeke-em/drive/cmd/drive && \
    install /tmp/go/bin/drive /usr/bin && \
    apk --no-progress del build-deps && \
    rm -rf /tmp/go

VOLUME ["/opt/drive"]
WORKDIR /opt/drive

CMD [ "/bin/drive" ]
