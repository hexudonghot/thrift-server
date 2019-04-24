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
        //System.out.println(NumberUtils.isDigits("1"));
        //System.out.println(isGame(501,-1));
        System.out.println(-1 & (1 << 5)>>4);
    }

    private boolean isGame(int msgType, int settingType)
    {
        if (msgType != 501)
        {
            return false;
        }

        return settingType == Setting.GAME_MESSAGE_PUSH.getIndex();
    }

    public  int getStatus(int a, int index) {
        return (a & (1 << index)) >> index;
    }

}
