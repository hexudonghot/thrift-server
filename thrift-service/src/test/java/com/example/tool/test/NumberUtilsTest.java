package com.example.tool.test;

import com.example.AbstractTest;
import org.apache.commons.lang3.math.NumberUtils;
import org.junit.Test;

public class NumberUtilsTest  extends AbstractTest
{
    /**
     * 判断字符串是否是数字
     */
    @Test
    public void testLocal()
    {
        System.out.println(NumberUtils.isDigits("1"));
    }

}
