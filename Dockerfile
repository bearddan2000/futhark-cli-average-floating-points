FROM futhark:base

WORKDIR /workspace

COPY bin .

RUN futhark c main.fut

CMD ["./main"]