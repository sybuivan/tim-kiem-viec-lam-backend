import { Request } from 'express';

const multer = require('multer');
const typeImage = require('../constants/typeFile');

const storage = multer.diskStorage({
  destination: (_req: Request, file: any, callBack: any) => {
    callBack(null, 'public/');
  },
  filename: (_req: Request, file: any, callBack: any) => {
    const uniqueSuffix = `${Date.now() + file.originalname}`;
    callBack(null, uniqueSuffix);
  },
});

const upload = multer({
  storage,
  fileFilter: (_req: Request, file: any, callBack: any) => {
    if (
      file.mimetype === typeImage.PNG ||
      file.mimetype === typeImage.JPG ||
      file.mimetype === typeImage.JPEG
    )
      callBack(null, true);
    else {
      callBack(null, false);
      return callBack(new Error('Only .png, .jpg and .jpeg format allowed!'));
    }
  },
});

module.exports = upload;
