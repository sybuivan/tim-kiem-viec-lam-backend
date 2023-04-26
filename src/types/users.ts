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

export interface IPayLoadCV {
  id_user: string;
  id_type_current: string;
  id_type_desired: string;
  career_goals: string;
  desired_salary: number;
  id_experience: string;
  id_city: string;
  is_public: number;
  id_working_form: string;
  id_company_field: string;
  file_name: string;
  created_at: Date | string;
  id_profile?: string;
}
