FROM golang:1.27.1-alpine AS build_base

RUN apk add --no-cache git gcc ca-certificates libc-dev
WORKDIR /build
COPY go.mod go.sum ./
RUN go mod download
COPY ./ ./

ENV CGO_ENABLED=0
ARG TARGETOS TARGETARCH
ENV GOFLAGS="-trimpath -buildvcs=false"
RUN GOGC=75 \
    GOOS=$TARGETOS GOARCH=$TARGETARCH \
    go build \
      -ldflags="-s -w" \
      -o speedtest \
      .
RUN rm -rf /tmp/*

FROM scratch
WORKDIR /app
COPY --from=build_base /build/speedtest ./

EXPOSE 8989

CMD ["./speedtest"]
