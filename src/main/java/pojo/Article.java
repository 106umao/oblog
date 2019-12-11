package pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Article {
    private int article;
    private int categoryId;
    private int userId;
    private String title;
    private String content;
    private Date pubdate;
    private int clicks;
    private String image;
}
