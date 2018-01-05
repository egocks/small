FROM golang as compiler 
RUN CGO_ENABLED=0 go get -a -ldflags '-s' \ 
github.com/adriaandejonge/helloworld  
FROM scratch 
COPY --from=compiler /go/bin/helloworld . 
EXPOSE 8080
CMD ["./helloworld"]
