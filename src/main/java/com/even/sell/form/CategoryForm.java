package com.even.sell.form;

import lombok.Data;

/**
 * @author EVEN
 * 2018/4/15 1:32
 */
@Data
public class CategoryForm {

    private Integer categoryId;

    /** 类目名字. */
    private String categoryName;

    /** 类目编号. */
    private Integer categoryType;
}
