import jwt from 'jsonwebtoken';

const generateToken = (payload: any) => {
  const { _id, isAdmin } = payload;

  const accessToken = jwt.sign(
    { _id, isAdmin },
    process.env.ACCESS_TOKEN_SECRET + '',
    {
      expiresIn: '30s',
    }
  );

  const refreshToken = jwt.sign(
    { _id, isAdmin },
    process.env.REFRESH_TOKEN_SECRET + '',
    {
      expiresIn: '1h',
    }
  );

  return { accessToken, refreshToken };
};

const authService = {
  generateToken,
};

export default authService;
