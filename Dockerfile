FROM golang:stretch

WORKDIR /go/src/github.com/PolarGeospatialCenter/pgcboot

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

COPY Gopkg.toml Gopkg.lock Makefile ./
RUN make deps

COPY plugin ./plugin
RUN go build -o /bin/pgc-ptp ./plugin/pgc-ptp/

FROM scratch

COPY --from=0 /bin/pgc-ptp /install/
