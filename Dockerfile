FROM node:12
LABEL author="daniel geller"
WORKDIR /javascript
RUN apt update -y
RUN apt install apache2 -y
COPY package.json .
COPY . .
RUN npm install 
RUN npm run ng build -- --output-path=dist
RUN mv /javascript/dist/* /var/www/html
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]