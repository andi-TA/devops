FROM node:25-bookworm-slim AS builder

WORKDIR /app

COPY	tools/react/package*.json ./

RUN	npm install

COPY    tools/react/ .

RUN npm run build

# ------------> in prod
# EXPOSE 5173
# ENTRYPOINT [ "npm", "run", "dev", "--", "--host" ]
# ------------> in prod

# ------------> in deploy
FROM debian:bookworm-slim

RUN	apt-get -y update && apt-get -y upgrade \
        && apt-get install -y nginx

COPY tools/nginx/default.conf /etc/nginx/conf.d
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
# ------------> in deploy