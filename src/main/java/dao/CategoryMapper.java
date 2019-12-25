package dao;

import org.apache.ibatis.annotations.Select;
import pojo.dbtable.Category;
import pojo.interacion.CategoryEntity;

import java.util.List;

public interface CategoryMapper {
    @Select("select * from blog_category where is_delete=0")
    List<CategoryEntity> findAllCategory();

}
