export interface IApply {
  id_user: string;
  id_apply: string;
  id_job: string;
  created_at: Date | string;
  cv_file?: string;
  id_profile?: string;
  introducing_letter?: string;
  status: number;
}
