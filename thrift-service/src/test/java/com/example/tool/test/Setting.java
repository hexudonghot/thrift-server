package com.example.tool.test;

public enum Setting{
    /**
     * int push = getIndex(a, 0);
     int showLocation = getIndex(a, 1);
     int notSetDnd = getIndex(a, 2);
     int roomNotice = getIndex(a, 3);
     */
    PUSH(0,"push"),

    HIGH_LEVEL_TEXT(1,"highLevelText"),

    NOT_SET_DND(2,"notSetDND"),

    ROOM_NOTICE(3,"roomNotice"),
    //动态消息推送通知
    DYNAMIC_MESSAGE_PUSH(4,"dynamicMessagePush"),

    GAME_MESSAGE_PUSH(5,"gameMessagePush"),

    IM_MESSAGE_PUSH(6,"imMessagePush"),

    IM_GROUP_INVITATION(7, "imGroupInvitation"),

    // 陌生人聊天消息开关
    MSG_CHAT_WITH_STRANGERS(8, "msgChatWithStrangers"),

    //安卓低版本屏蔽地理位置信息
    POSITION_SWITCH(9,"positionSwitch");

    Setting(int index, String key) {
        this.index = index;
        this.key = key;
    }

    private int index;
    private String key;

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}

