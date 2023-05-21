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

export const dataJobs = (jobs: any) => {
  const data: any = jobs.reduce((values: any, current: any) => {
    const indexJob = values.findIndex(
      (item: any) => item.id_job === current.id_job
    );
    const { name_city } = current;
    if (indexJob == -1) {
      const job = { ...current, cities: [{ name_city }] };
      values.push(job);
    } else {
      const job = values[indexJob];
      job.cities.push({ name_city });
    }
    return values;
  }, []);

  return data;
};
