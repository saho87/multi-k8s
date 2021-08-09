FROM node:14.14.0-alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
#erstellt einen Ordner in /app namens build
RUN npm run build

FROM nginx 
EXPOSE 3000
COPY ./ngnix/default.conf /etc/nginx/conf.de/default.conf
# kopiert alle Dateien im build Ordner in nginx
COPY --from=builder /app/build /usr/share/ngnix/html