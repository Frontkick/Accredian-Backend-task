import express, { Request, Response, NextFunction } from 'express';
import dotenv from 'dotenv';
import bodyParser from 'body-parser';
import cors from 'cors'; // Import CORS package
import referralRoutes from './routes/referral.route';

dotenv.config();

const app = express();

const PORT = process.env.PORT || 3000;

// Enable CORS for all routes
app.use(cors());


// Middleware
app.use(bodyParser.json());

// Routes
app.use('/api/referral', referralRoutes);

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

interface CustomError extends Error {
  statusCode?: number;
}

// Error-Handling Middleware
app.use((err: CustomError, req: Request, res: Response, next: NextFunction) => {
  const statusCode = err.statusCode || 500;
  const message = err.message || "Internal Server Error";
  res.status(statusCode).json({
    success: false,
    statusCode,
    message,
  });
});
