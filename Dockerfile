# build stage
FROM golang:1.22 AS builder

WORKDIR /go/src/app

RUN --mount=type=cache,target=/go/pkg/mod/ \
    --mount=type=bind,source=go.sum,target=go.sum \
    --mount=type=bind,source=go.mod,target=go.mod \
    go mod download

ENV CGO_ENABLED=0
RUN --mount=type=cache,target=/root/.cache/go-build \
    --mount=type=bind,target=. \
    go build -o /go/bin/myapp /go/src/app/cmd/myapp
# RUN --mount=type=cache,target=/root/.cache/go-build \
#     go test -v
# RUN --mount=type=cache,target=/root/.cache/go-build \
#     go vet -v

FROM gcr.io/distroless/static-debian12:nonroot
WORKDIR /
COPY --from=builder --chown=nonroot --chmod=500 /go/bin/myapp .
COPY --chown=nonroot --chmod=600 configs .
CMD [ "/myapp", "-p", "8000" ]
