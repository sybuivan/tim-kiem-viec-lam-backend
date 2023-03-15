import { Request } from 'express';
import { typeFile, typeImage } from '../constants/typeFile';

const multer = require('multer');

const storage = multer.diskStorage({
  destination: (_req: Request, file: any, callBack: any) => {
    callBack(null, 'public/');
  },
  filename: (_req: Request, file: any, callBack: any) => {
    const uniqueSuffix = `${Date.now() + file.originalname}`;
    callBack(null, uniqueSuffix);
  },
});

export const upload = multer({
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

export const uploadFile = multer({
  storage,
  fileFilter: (_req: Request, file: any, callBack: any) => {
    if (
      file.mimetype === typeFile.DOC ||
      file.mimetype === typeFile.DOCX ||
      file.mimetype === typeFile.PDF
    )
      callBack(null, true);
    else {
      callBack(null, false);
      return callBack(new Error('Only .png, .jpg and .jpeg format allowed!'));
    }
  },
});
