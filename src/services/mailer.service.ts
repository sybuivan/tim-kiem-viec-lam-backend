const nodemailer = require('nodemailer');

const mailerService = {
  sendSimpleEmail: async (dataSend: {
    email: string;
    messageMailer: string;
    name_job: string;
    fullName: string;
  }) => {
    const { email, messageMailer, name_job, fullName } = dataSend;
    let testAccount = await nodemailer.createTestAccount();
    let transporter = nodemailer.createTransport({
      host: 'smtp.gmail.com',
      port: 587,
      secure: false, // true for 465, false for other ports
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.PASSWORD_EMAIL,
      },
    });

    // send mail with defined transport object
    let info = await transporter.sendMail({
      from: '"Tim kiem viec lam 👻" <sybuivan1429@gmail.com>', // sender address
      to: email, // list of receivers
      subject: `Thông báo kết quả ${name_job} - ${fullName}`, // Subject line
      html: messageMailer,
    });
  },
};

export default mailerService;
