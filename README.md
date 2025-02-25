```markdown
# 🚀 Refer & Earn Backend

Welcome to the backend service for the Refer & Earn application! This service handles user referrals and notifications using a robust stack of modern technologies.

## 🛠️ Technologies Used

- **TypeScript** - For type-safe JavaScript
- **Node.js** - Runtime environment
- **Express** - Web framework
- **MySQL2** - Database driver
- **Prisma ORM** - Database ORM
- **Nodemailer** - For sending emails
- **Mailgen** - For generating email templates
- **Nodemon** - For automatic server restarts
- **Dotenv** - For managing environment variables
- **Docker** - For containerization and easy deployment

## 📦 Setup Instructions

### 1. **Clone the repository**
```bash
git clone https://github.com/Frontkick/Accredian-Backend-task
cd Accredian-Backend-task
```

### 2. **Backend Setup**
```bash
npm install
```

### 3. **Environment Variables**
- Create a `.env` file in the root directory and add the following:
```bash
DATABASE_URL="mysql://userName:password@localhost:3306/refer"
EMAIL="yourmail@gmail.com"
PASSWORD="passwor"
PORT=1234
```

### 4. **Run Prisma migrations**
```bash
npx prisma migrate dev
```

### 5. **Start the server**
```bash
npm run dev
```



## 📂 Folder Structure
```sh
.
├── src
│   ├── controllers
│   ├── middleware
│   ├── models
│   ├── routes
│   ├── services
│   └── utils
├── prisma
│   └── schema.prisma
├── .env
├── package.json
└── tsconfig.json
```

## 🐳 Docker Implementation
This project includes Docker support for easy deployment:
```bash
# Build the image
docker build -t refer .

# Run the container
docker run -p 5000:5000 refer
```