FROM node:20

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# best practice is to copy your package.json and package-lock.json before you copy your code into the container
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# Bundle app
COPY . .

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Run when the container launches
ENTRYPOINT ["npm", "run", "start"]