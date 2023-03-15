import { Request, Response, NextFunction } from 'express';
import httpStatus from 'http-status';
import applyService from '../services/apply.service';
import userService from '../services/user.service';
import { catchAsync } from '../utils/catchAsync';
interface MulterRequest extends Request {
  file: any;
}

const applyController = {
  createApply: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const isFile = (req as MulterRequest)?.file;
      if (!isFile) {
        const { apply_cv } = await applyService.createApply(req.body);
        if (apply_cv) {
          res.status(httpStatus.CREATED).send({
            apply_cv,
          });
        }
      } else {
        const { filename } = (req as MulterRequest)?.file;

        const { apply_cv } = await applyService.createApply(req.body, filename);
        if (apply_cv) {
          res.status(httpStatus.CREATED).send({
            apply_cv,
          });
        }
      }
    }
  ),
  getApplyJobByUser: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { data, total } = await applyService.getApplyJobByUser(
        req.params.id_user
      );
      if (data) {
        res.status(httpStatus.OK).send({
          data,
          total,
        });
      }
    }
  ),
};

export default applyController;
