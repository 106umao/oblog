package dao;

import org.apache.ibatis.annotations.Insert;
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

    @Insert("insert into blog_reply " +
            "(comment_id,to_user_id,from_user_id,reply_msg) " +
            "values(${commentId},${toUserId},${fromUserId},'${replyMsg}')")
    int insertReply(Reply reply);

    @Update("update blog_reply set is_delete=1 where comment_id in (select comment_id from blog_comment where article_id = ${articleId})")
    int deleteReplyByArticleId(@Param("articleId") Integer articleId);

    @Update("update blog_reply set is_delete=1 where from_user_id  = ${uid}")
    int deleteReplyByUserId(@Param("uid") Integer userId);

    @Select("select * from blog_Reply where is_delete=0")
    List<Reply> findAllReply();

    @Update("update blog_reply set is_delete =1 where reply_id = ${rid}")
    int deleteReplyById(@Param("rid") Integer replyId);

    @Update("update blog_reply set is_delete =1 where comment_id =${cid}")
    int deleteReplyByCommentId(@Param("cid") Integer commentId);
}
