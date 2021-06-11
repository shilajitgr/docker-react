FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# the above phase is called "build phase"
# run phase

FROM nginx
#   nginx is the 2nd base img
# the cmd below is copying data above phase
COPY --from=0 /app/build /usr/share/nginx/html
