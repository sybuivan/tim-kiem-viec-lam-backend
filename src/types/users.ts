export interface IPayloadFollow {
  id_user: string;
  id_company: string;
  created_at?: Date;
}

export interface IPayloadSaveJob {
  id_user: string;
  id_job: string;
  created_at?: Date;
}
