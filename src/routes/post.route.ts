import express from 'express';
import { postController } from '../controllers/post.controller';
import { upload, uploadFile } from '../middlewares/upload';
const router = express.Router();

router.post('/create-post', upload.single('image'), postController.createPost);
router.put(
  '/update-post/:id_post',
  upload.single('image'),
  postController.updatePost
);

router.get('/get-all-posts', postController.getAllPosts);
router.get('/get-post-detail/:id_post', postController.getPostDetail);

export default router;
