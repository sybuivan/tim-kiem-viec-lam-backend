export const messageRequired = (key: string) => {
  return `${key} không được bỏ trống`;
};

export const messageApplied = (name_job: string, status: number) => {
  switch (status) {
    case 1:
      return `Trạng thái hồ sơ ứng tuyển vị trí ${name_job} đã xem hồ sơ`;
      break;
    case 2:
      return `Trạng thái hồ sơ ứng tuyển vị trí ${name_job} đã liên hệ`;
      break;
    case 3:
      return `Trạng thái hồ sơ ứng tuyển vị trí ${name_job} đã test`;
      break;
    case 4:
      return `Trạng thái hồ sơ ứng tuyển vị trí ${name_job} đã từ chối`;
      break;
    default:
      break;
  }
};
