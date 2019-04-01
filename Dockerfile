FROM alpine:3.7
MAINTAINER Teng Fu <teng.fu@teleware.com>

RUN apk update && \
    apk add py-pip && \
    pip install --upgrade pip setuptools wheel && \
    mkdir -p /private_packages

# no password support
# if you need, install passlib
RUN pip install -U pypiserver

EXPOSE 8080

# make sure the entrypoint.sh is +x
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
