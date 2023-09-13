export interface IUser {
  id_user?: string;
  id_role?: string;
  fullName?: string;
  email: string;
  password: string;
  phone?: string;
  career?: string;
  experience?: string;
  level_english?: string;
  gender?: string;
  city?: string;
  birthDay?: string;
  address?: string;
  avatar?: string;
}

export type TRole = 'ADMIN' | 'COMPANY' | 'USER';

export interface IAuthUser {
  id_user: number;
  id_role: string;
}

export interface IGenerateToken {
  accessToken: string;
  refreshToken: string;
}
