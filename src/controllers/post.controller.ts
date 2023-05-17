import { Request, Response, NextFunction } from 'express';
import httpStatus from 'http-status';
import adminService from '../services/admin.service';
import postService from '../services/post.service';
import userService from '../services/user.service';
import { catchAsync } from '../utils/catchAsync';

interface MulterRequest extends Request {
  file: any;
}

export const postController = {
  getAllPosts: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { post_list, total } = await postService.getAllPosts();

      return res.status(httpStatus.OK).send({
        post_list,
        total,
      });
    }
  ),
  createPost: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { filename } = (req as MulterRequest)?.file;

      await postService.createPost(req.body, filename);

      return res.status(httpStatus.OK).send('123');
    }
  ),
  updatePost: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const isFile = (req as MulterRequest)?.file;
      if (!isFile) {
        await postService.updatePost(req.body, req.params.id_post);
        res.status(httpStatus.OK).send('Thành công');
      } else {
        const { filename } = (req as MulterRequest)?.file;
        await postService.updatePost(req.body, req.params.id_post, filename);
      }
    }
  ),
  getPostDetail: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { post } = await postService.getPostDetail(req.params.id_post);

      if (post) return res.status(httpStatus.OK).send(post);
    }
  ),
};
