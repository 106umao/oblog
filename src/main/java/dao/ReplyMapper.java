package dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pojo.dbtable.Reply;
import pojo.interacion.ReplyEntity;

import java.util.List;

public interface ReplyMapper {
    @Select("select count(reply_id)\n" +
            "from blog_reply\n" +
            "where\n" +
            "      comment_id = ${commentId} and is_delete=0")
    int queryReplyCount(@Param("commentId")int articleId);

    @Select("select * from blog_reply where comment_id = ${cid} and is_delete=0")
    List<ReplyEntity> queryReplyByCommentId(@Param("cid") int commentId);

    @Select("select * from blog_comment where article_id = ${articleId} and is_delete=0")
    List<Integer> queryCommentId(@Param("articleId") int articleId);

    @Update("update blog_reply set is_delete = 1 where comment_id = ${commentId} and is_delete=0")
    int deleteReferenceComment(@Param("commentId") Integer commentId);
}
