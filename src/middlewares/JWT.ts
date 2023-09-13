import { sign, verify } from 'jsonwebtoken';
import freeze from '../configs/freeze';
import { IGenerateToken } from '../types/auth';

const generateToken = (payload: any): IGenerateToken => {
  const { id_user, fullName, id_role } = payload;

  const accessToken = sign({ id_user, fullName, id_role }, freeze.JWT_SECRET, {
    expiresIn: freeze.tokenLife,
  });

  const refreshToken = sign(
    { id_user, fullName, id_role },
    freeze.SECRET_REFRESH,
    {
      expiresIn: freeze.refreshTokenLife,
    }
  );

  return { accessToken, refreshToken };
};

const validateToken = (accessToken: any) => {
  const key = freeze.JWT_SECRET;
  try {
    const decodedToken = verify(accessToken, key);
    if (isTokenExpired(decodedToken)) {
      return false;
    } else {
      return decodedToken;
    }
  } catch (error) {
    return false;
  }
};

const isTokenExpired = (decodedToken: any): boolean => {
  const expirationTime = decodedToken.exp;
  const currentTime = Math.floor(Date.now() / 1000);

  if (expirationTime < currentTime) {
    return true;
  } else {
    return false;
  }
};

const validateRefreshToken = (refreshToken: any) => {
  const key = freeze.SECRET_REFRESH;
  const validToken = verify(refreshToken, key);
  return validToken;
};

export { generateToken, validateToken, validateRefreshToken };
