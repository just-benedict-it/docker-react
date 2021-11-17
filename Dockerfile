FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install   
# similar as pip in python. npm install -> install dependencies in package.json
# devdependecies -> only for development. not for distribution.
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html