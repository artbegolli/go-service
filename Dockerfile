FROM golang
ADD . /src
RUN cd /src && go build -o goapp

FROM alpine
WORKDIR /app
COPY --from=build-env /src/goapp /app/
ENTRYPOINT ./goapp
