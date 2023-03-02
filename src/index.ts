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

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto(
    'https://vieclam24h.vn/tu-van/nhan-vien-kinh-doanh-khong-yeu-cau-kinh-nghiem-ha-dong-c178p73id200170661.html?box=jobemployer&svs=max_box'
  );
  await page.setViewport({ width: 1080, height: 1024 });

  const textSelector = await page.waitForSelector(
    '.flex.items-center.w-full img'
  );
  const name_company = await page.waitForSelector('.ml-5 h3');
  const totalEl = await page.waitForSelector('.ml-5 p');
  const addressEl = await page.waitForSelector(
    '.text-12.text-se-neutral-100-n.py-1'
  );

  const image = await textSelector.evaluate((el: any) => el.src);
  const name = await name_company.evaluate((el: any) => el.textContent);
  const totalValue = await totalEl.evaluate((el: any) => el.textContent);
  const addressValue = await addressEl.evaluate((el: any) => el.textContent);

  console.log({ image, name, totalValue, addressValue });
  await browser.close();
})();
