"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const multer = require('multer');
const typeImage = require('../constants/typeFile');
const storage = multer.diskStorage({
    destination: (_req, file, callBack) => {
        callBack(null, 'public/');
    },
    filename: (_req, file, callBack) => {
        const uniqueSuffix = `${Date.now() + file.originalname}`;
        callBack(null, uniqueSuffix);
    },
});
const upload = multer({
    storage,
    fileFilter: (_req, file, callBack) => {
        if (file.mimetype === typeImage.PNG ||
            file.mimetype === typeImage.JPG ||
            file.mimetype === typeImage.JPEG)
            callBack(null, true);
        else {
            callBack(null, false);
            return callBack(new Error('Only .png, .jpg and .jpeg format allowed!'));
        }
    },
});
module.exports = upload;
