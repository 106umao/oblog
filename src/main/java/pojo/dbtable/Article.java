package pojo.dbtable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Article {
    private int articleId;
    private int categoryId;
    private int userId;
    private int star;
    private String title;
    private String content;
    private Date releaseTime;
    private Date lastModified;
    private String cover;
    private int isDelete;
}
