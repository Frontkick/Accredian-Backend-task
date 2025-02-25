# Step 1: Use an official Node.js image as the base image
FROM node:18-alpine

# Step 2: Install OpenSSL to prevent the warning
RUN apk add --no-cache openssl

# Step 3: Set the working directory in the container
WORKDIR /app

# Step 4: Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Step 5: Install dependencies, including Prisma and TypeScript types
RUN npm install --save && \
    npm install --save @prisma/client && \
    npm install --save @types/node

# Step 6: Copy the TypeScript source files into the container
COPY . .

# Step 7: Ensure .env file is copied for Prisma to work properly
COPY .env .env

# Step 8: Run Prisma migrations
RUN npx prisma migrate dev

# Step 9: Build the TypeScript app
RUN npm run build

# Step 10: Expose the port that the app will run on
EXPOSE 3000

# Step 11: Define the command to run the app after building
CMD ["npm", "start"]
