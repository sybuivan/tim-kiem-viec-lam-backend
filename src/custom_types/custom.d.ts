declare namespace Express {
  export interface Request {
    user: {
      id_user: number;
      id_role: string;
    };
  }
}
