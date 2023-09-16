import { NextFunction, Response } from 'express';
import { Role } from '../constants/role';

export const isAdmin = (req: any, res: Response, next: NextFunction) => {
  if (req.user && req.user.id_role === Role.Admin) {
    next();
  } else {
    res.status(403).json({ error: 'Not have access admin' });
  }
};

export const isUser = (req: any, res: Response, next: NextFunction) => {
  if (req.user && req.user.id_role === Role.User) {
    next();
  } else {
    res.status(403).json({ error: 'Not have access user' });
  }
};

export const isCompany = (req: any, res: Response, next: NextFunction) => {
  if (req.user && req.user.id_role === Role.Company) {
    next();
  } else {
    res.status(403).json({ error: 'Not have access user' });
  }
};

export const isUserCompany = (req: any, res: Response, next: NextFunction) => {
  if (
    req.user &&
    (req.user.id_role === Role.Company || req.user.id_role === Role.User)
  ) {
    next();
  } else {
    res.status(403).json({ error: 'Not have access' });
  }
};
