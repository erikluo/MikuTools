FROM node:20.10.0-bookworm as builder

WORKDIR /app/web
COPY . .

RUN yarn install && yarn generate


# production stage
FROM nginx:1.25.2 as production

WORKDIR /app/web
COPY --from=builder /app/web/dist /usr/share/nginx/html
COPY --from=builder /app/web/nginx/default.conf /etc/nginx/conf.d/default.conf

#ENTRYPOINT ["/bin/sh", "./entrypoint.sh"]
