

FROM golang:1.27-alpine AS builder

WORKDIR /build


COPY go.mod go.sum ./
RUN go mod download


COPY . .


RUN CGO_ENABLED=0 go build -o /build/backend ./cmd/api



FROM golang:1.27-alpine AS runtime

WORKDIR /srv/backend


RUN addgroup -S sandbox-backend \
    && adduser -S -D -H -G sandbox-backend sandbox-backend

COPY --from=builder \
    --chown=sandbox-backend:sandbox-backend \
    /build/backend ./backend


USER sandbox-backend

EXPOSE 8081

CMD ["./backend"]
