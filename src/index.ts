import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import morgan from 'morgan';
import routes from './routes';

dotenv.config();

const app = express();

// config path images
app.use('/', express.static('public'));
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

// v1 api routes
app.use('/api/v1', routes);

const port = process.env.PORT;
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
