package com.even.sell.dataobject;

import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import java.util.List;

@Data
public class ProductToji {
    List<String> names;
    List<String> rows;
}
