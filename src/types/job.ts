export interface IJob {
  id_job?: string;
  id_history: string;
  id_company: string;
  city: number[];
  id_field: string;
  id_type: string;
  id_range: string;
  id_rank: string;
  id_experience: string;
  name_job: string;
  deadline: Date | string;
  size_number: number;
  description_job: string;
  required_job: string;
  created_at: Date | string;
  work_location: string;
  urgent_recruitment: number;
  benefits_job: string;
  id_working_form: string;
}
