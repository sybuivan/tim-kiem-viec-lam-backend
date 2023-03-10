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
