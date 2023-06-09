import express, { Request, Response, Express } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import morgan from 'morgan';
import bodyParser from 'body-parser';
import routes from './routes';
import { errorConverter, errorHandler } from './middlewares/error';
import config from './configs/connectDb';
const puppeteer = require('puppeteer');
const path = require('path');

dotenv.config();
const isDev = process.env.NODEJS_APP_NODE_ENV === 'development' ? true : false;

const baseClient = isDev
  ? process.env.HOST_API_FRONTEND_DEV
  : process.env.HOST_API_FRONTEND_PRO;

export const sockets: any = {};

const app: Express = express();
// config path images
app.use(
  cors({
    origin: baseClient,
  })
);

app.get('/', (req, res) => {
  const filePath = path.join(
    __dirname,
    '..',
    'public',
    '1683953800058CNTT_7480201_CN19.pdf'
  );

  res.header('Access-Control-Allow-Origin', '*');
  res.sendFile(filePath);
});

app.use('/', express.static('public'));

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

const port = process.env.PORT || 5000;

app.get('/', (req: Request, res: Response) => {
  res.send('Express + TypeScript Server');
});

// handle error
app.use(errorConverter);
app.use(errorHandler);

const http = require('http').Server(app);
export const io = require('socket.io')(http, {
  cors: {
    origin: baseClient,
    methods: ['GET', 'POST'],
  },
});

io.on('connection', (socket: any) => {
  console.log('connection io');
  console.log(`⚡: ${socket.id} user just connected!`);

  socket.on('user_id', (user_id: string) => {
    sockets[user_id] = socket;
  });

  socket.on('disconnect', () => {
    console.log('🔥: A user disconnected');
    for (const [key, value] of Object.entries(sockets)) {
      if (value === socket) {
        delete sockets[key];
      }
    }
  });
});

http.listen(port, () => {
  console.log(
    `Example app listening on port ${port} ${process.env.HOST_API_FRONTEND_DEV}`
  );
});
