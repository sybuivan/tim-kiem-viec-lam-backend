export interface IPayloadLogin {
  email: string;
  password: string;
}

export interface MulterRequest extends Request {
  file: any;
}
