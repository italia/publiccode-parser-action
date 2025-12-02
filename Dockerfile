FROM italia/publiccode-parser-go:v5.2.3

ARG REVIEWDOG_FILE=reviewdog_0.21.0_Linux_x86_64.tar.gz
ARG REVIEWDOG_SHA256=ad5ce7d5ffa52aaa7ec8710a8fa764181b6cecaab843cc791e1cce1680381569

RUN set -eux; \
    wget -q "https://github.com/reviewdog/reviewdog/releases/download/v0.21.0/${REVIEWDOG_FILE}" \
    && echo "${REVIEWDOG_SHA256}  ${REVIEWDOG_FILE}" | sha256sum -c \
    && tar -xzf ${REVIEWDOG_FILE} -C /usr/local/bin reviewdog

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
