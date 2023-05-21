export interface IGroup {
  id_user: string;
  id_company: string;
  id_job: string;
}

export interface IMessage {
  id_user: string;
  id_job: string;
  id_company: string;
  message: string;
  id_room: string;
  sender: 'user' | 'company';
}
