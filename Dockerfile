FROM golang:1.19 as build

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -o /desafiogo

#CMD ["/desafiogo"]

FROM scratch

WORKDIR /

COPY --from=build /desafiogo /desafiogo

ENTRYPOINT ["/desafiogo"]