"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const dotenv_1 = __importDefault(require("dotenv"));
const morgan_1 = __importDefault(require("morgan"));
const body_parser_1 = __importDefault(require("body-parser"));
const routes_1 = __importDefault(require("./routes"));
const error_1 = require("./middlewares/error");
const puppeteer = require('puppeteer');
dotenv_1.default.config();
const app = (0, express_1.default)();
// config path images
app.use('/', express_1.default.static('public'));
app.use((0, cors_1.default)({
    origin: 'http://localhost:3000',
}));
app.use((0, morgan_1.default)('dev'));
app.use(express_1.default.json());
app.use(body_parser_1.default.json());
app.use(body_parser_1.default.urlencoded({
    extended: true,
}));
// v1 api routes
app.use('/api/v1', routes_1.default);
const port = process.env.PORT;
// handle error
app.use(error_1.errorConverter);
app.use(error_1.errorHandler);
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
(() => __awaiter(void 0, void 0, void 0, function* () {
    const browser = yield puppeteer.launch();
    const page = yield browser.newPage();
    yield page.goto('https://vieclam24h.vn/tu-van/nhan-vien-kinh-doanh-khong-yeu-cau-kinh-nghiem-ha-dong-c178p73id200170661.html?box=jobemployer&svs=max_box');
    yield page.setViewport({ width: 1080, height: 1024 });
    const textSelector = yield page.waitForSelector('.flex.items-center.w-full img');
    const name_company = yield page.waitForSelector('.ml-5 h3');
    const totalEl = yield page.waitForSelector('.ml-5 p');
    const addressEl = yield page.waitForSelector('.text-12.text-se-neutral-100-n.py-1');
    const image = yield textSelector.evaluate((el) => el.src);
    const name = yield name_company.evaluate((el) => el.textContent);
    const totalValue = yield totalEl.evaluate((el) => el.textContent);
    const addressValue = yield addressEl.evaluate((el) => el.textContent);
    console.log({ image, name, totalValue, addressValue });
    yield browser.close();
}))();
