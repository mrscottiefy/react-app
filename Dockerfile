# pull official base image
FROM node:alpine as builder

# set working directory
WORKDIR '/app'

# install app dependencies
COPY package.json .
RUN  npm install

# add app
COPY . .

# start app
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html