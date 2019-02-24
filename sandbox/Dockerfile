FROM node
ENV UNDER_DOCKER true
ADD ./sandbox-app /sandbox-app
WORKDIR /sandbox-app
RUN npm install
RUN npm run build
CMD ["npm", "run", "start_prod"]
