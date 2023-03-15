import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import morgan from 'morgan';
import bodyParser from 'body-parser';
import routes from './routes';
import { errorConverter, errorHandler } from './middlewares/error';
const puppeteer = require('puppeteer');

dotenv.config();

const app = express();

// config path images
app.use('/', express.static('public'));
app.use(
  cors({
    origin: 'http://localhost:3000',
  })
);
app.use(morgan('dev'));
app.use(express.json());
app.use(bodyParser.json());

app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

// v1 api routes
app.use('/api/v1', routes);

const port = process.env.PORT;

// handle error
app.use(errorConverter);
app.use(errorHandler);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
