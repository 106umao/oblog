package dao;

import org.apache.ibatis.annotations.*;
import pojo.dbtable.Comment;
import pojo.interacion.CommentEntity;

import java.util.List;

public interface CommentMapper {
    @Select("select count(comment_id) from blog_comment where article_id = '${articleId}' and is_delete=0")
    int queryCommentCount(@Param("articleId") int articleId);

    @Select("select * from blog_comment where article_id = '${articleId}' and is_delete=0")
    List<CommentEntity> queryAllCommentEntityByArticleId(@Param("articleId") int articleId);

    @Insert("insert into blog_comment (article_id, user_id, reply_msg, create_date, zan_count, is_delete)\n" +
            "values(${articleId},${userId},'${replyMsg}',now(),0,0);")
    int createComment(Comment comment);

    @Update("update blog_comment set is_delete = 1 where comment_id=${commentId}  and is_delete=0")
    int deleteComment(@Param("commentId") Integer commentId);

    @Select("select zan_count from blog_comment where comment_id = ${commentId} and is_delete=0")
    int getStarCount(@Param("commentId") Integer commentId);

    @Update("update blog_comment set zan_count=${star} where comment_id = ${commentId}")
    int setStarCount(@Param("commentId") Integer commentId,@Param("star") Integer star);

    @Update("update blog_comment set is_delete=1 where article_id = ${articleId}")
    int deleteCommentByArticleId(@Param("articleId") Integer articleId);

    @Update("update blog_comment set is_delete=1 where user_id = ${uid}")
    int deleteCommentByUserId(@Param("uid") Integer userId);

    @Select("select * from blog_comment where is_delete=0")
    List<Comment> findAllComment();

    @Update("update blog_comment set is_delete=1 where comment_id = ${cid}")
    int deleteReplyByCommentId(@Param("cid") Integer commentId);
}
