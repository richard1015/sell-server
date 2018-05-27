package com.even.sell.utils;

import com.even.sell.enums.CodeEnum;

/**
 * @author EVEN
 * 2018/4/14 23:36
 */
public class EnumUtil {

    public static <T extends CodeEnum> T getByCode(Integer code, Class<T> enumClass) {
        for (T each: enumClass.getEnumConstants()) {
            if (code.equals(each.getCode())) {
                return each;
            }
        }
        return null;
    }

}
