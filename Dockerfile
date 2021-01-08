FROM node:alpine
WORKDIR /usr/app
COPY package*.json /usr/app/package.json
RUN npm install
COPY . .

FROM nginx
EXPOSE 80
COPY --from=0 /usr/app/build /usr/share/nginx/html