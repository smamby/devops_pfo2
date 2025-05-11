FROM node:20

WORKDIR /

COPY package.json package-lock.json ./
COPY app.js db.js ./

RUN npm install
EXPOSE 3001

CMD ["npm", "run", "dev"]
