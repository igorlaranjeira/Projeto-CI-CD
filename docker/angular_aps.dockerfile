FROM node:13.3.0 AS node-aps
RUN npm install -g yarn
WORKDIR /app
COPY package.json ./
RUN npm install -y
ENV PATH="./node_modules/.bin:$PATH"
COPY . .
RUN ng build


FROM nginx:alpine
COPY --from=node-aps /app/dist/* /usr/share/nginx/html/
