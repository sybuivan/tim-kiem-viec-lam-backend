import { NextFunction, Request, Response } from 'express';
import httpStatus from 'http-status';
import jwt from 'jsonwebtoken';
import ApiError from '../utils/ApiError';
import { validateRefreshToken, validateToken } from './JWT';
import freeze from '../configs/freeze';
import { IAuthUser } from '../types/auth';

export const isAuth = async (req: any, res: Response, next: NextFunction) => {
  try {
    const accessTokenFromHeader = req.headers.authorization;
    const accessToken = accessTokenFromHeader?.split(' ')[1];
    const validToken: any = validateToken(accessToken);

    console.log({ validToken, accessToken });
    if (!validToken) {
      next(new ApiError(httpStatus.UNAUTHORIZED, 'Authentication failed'));
    }

    req.user = {
      id_role: validToken.id_role,
      id_user: validToken.id_user,
    };
    next();
  } catch (error) {
    next(
      new ApiError(
        httpStatus.UNAUTHORIZED,
        'Login timeout. Please login again !'
      )
    );
  }
};

export const isAdmin = (req: any, res: Response, next: NextFunction) => {
  if (req.user && req.user.id_role === 'admin') {
    next();
  } else {
    res.status(403).json({ error: 'Not have access admin' });
  }
};

export const isUser = (req: any, res: Response, next: NextFunction) => {
  console.log({ req: req.user });
  if (req.user && req.user.id_role === 'user') {
    next();
  } else {
    res.status(403).json({ error: 'Not have access user' });
  }
};
