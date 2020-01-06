package dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pojo.dbtable.Category;
import pojo.interacion.CategoryEntity;

import java.util.List;

public interface CategoryMapper {
    @Select("select * from blog_category where is_delete=0")
    List<Category> findAllCategory();

    @Select("select * from blog_category where is_delete=0")
    List<CategoryEntity> findAllCategoryEntity();

    @Update("update blog_category set is_delete =1 where category_id=${cid}")
    int deleteUserById(@Param("cid") Integer categoryId);

    @Select("select * from blog_category where category_name='${categoryName}' and is_delete=0")
    Category findCategoryByName(Category category);

    @Update("update blog_category set is_delete =0 where category_name='${categoryName}'")
    int recoverCategory(Category category);

    @Insert("insert into blog_category (category_name) values ('${categoryName}')")
    int insertCategory(Category category);
}
