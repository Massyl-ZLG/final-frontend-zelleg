FROM node:lts-fermium as build 

WORKDIR /front_app

COPY package*.json ./

RUN yarn install

COPY . .

RUN yarn run build

FROM node:lts-alpine as run

COPY . .

COPY --from=build /front_app/dist ./dist

CMD ["yarn", "dev"]




