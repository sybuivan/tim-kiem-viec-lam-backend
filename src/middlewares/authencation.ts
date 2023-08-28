import { NextFunction, Response } from 'express';
import httpStatus from 'http-status';
import ApiError from '../utils/ApiError';
import { validateToken } from './JWT';

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
