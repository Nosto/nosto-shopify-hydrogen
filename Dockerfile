FROM public.ecr.aws/docker/library/node:16.15.1-alpine3.16

MAINTAINER Cid Lopes "cid.lopes@nosto.com"

RUN apk update && apk add curl

COPY . /app
WORKDIR /app

RUN yarn
RUN yarn build

ENV PORT 9999

HEALTHCHECK --start-period=30s --interval=30s --timeout=3s --retries=3 CMD curl --fail http://localhost:9999 || exit 1
EXPOSE 9999
CMD yarn serve