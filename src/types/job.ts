export interface IJob {
  id_job?: string;
  id_company: string;
  id_city: string;
  id_field: string;
  id_type: string;
  id_range: string;
  id_rank: string;
  id_experience: string;
  name_job: string;
  deadline: Date | string;
  total_number: number;
  description_job: string;
  required_job: string;
  created_at: Date | string;
  work_location: string;
  urgent_recruitment: number;
}
