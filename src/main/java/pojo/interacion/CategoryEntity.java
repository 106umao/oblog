package pojo.interacion;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryEntity {
    private int categoryId;
    private String categoryName;
    private int articleCount;
}

