export interface ICompany {
  id_company?: string;
  id_role?: string;
  name_company: string;
  address: string;
  total_people: number;
  introduce: string;
  logo: string;
  link_website: string;
  lat: number;
  lng: number;
  cover_image: string;
  active_status: number;
  email: string;
  fullName: string;
  phone: number;
  city: string;
  faxCode?: string;
  password?: string;
  idCompanyField?: string;
}
export interface IPayloadRegisterCompany {
  email: string;
  password: string;
  fullName: string;
  phone: number;
  nameCompany: string;
  faxCode?: string;
  totalPeople: string;
  city: string;
  address: string;
  fieldOfActivity?: string;
}
export type TActiveStatues = 0 | 1;
