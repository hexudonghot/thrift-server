/**
  * The first thing to know about are types. The available types in Thrift are:
  *
  *  bool        Boolean, one byte
  *  byte        Signed byte
  *  i16         Signed 16-bit integer
  *  i32         Signed 32-bit integer
  *  i64         Signed 64-bit integer
  *  double      64-bit floating point value
  *  string      string
  *  binary      Blob (byte array)
  *  map<t1,t2>  map from one type to another
  *  list<t1>    Ordered list of one type
  *  set<t1>     set of unique elements of one type
  *
  */

 /**
  *
  * @author: mingyu.zhao
  * @date: 2014年12月01日
  */

namespace java com.asiainno.uplive.thrift.service
namespace php com.asiainno.uplive.thrift.service

service ProfileTService {

//======================游客模式[begin]=========================//

    //1、1当前所有国家的游客模式开关
    string allCountryVisitorSettings();

    //1、2设置国家游客开关  1、countryCode 国家码  2、flag  true or false  3、second 秒
    bool setCountryVisitor(1:string countryCode,2:bool flag ,3:i32 second);

    //1、3 删除一个国家游客模式开关
    bool delCountryVisitor(1:string countryCode);

    //2、1 所有语言或者国家对应关系
    string allLanguageCountries();

    //2、2 设置或者新增一条国家语言对应关系
    bool setLanguageCountries(1:string countryCode,2:string language);

     //2、3 删除一条记录
    bool delLanguageCountries(1:string countryCode,2:string language);

//======================游客模式[end]=========================//
    //把IP添加黑名单
    bool addForbidenIp(1:string ip);
    //把IP移除黑名单
    bool removeIpfrombidenIpist(1:string ip);
    //获取黑名单列表
    string getForbidenIpist(1:string ip,2:i32 page,3:i32 pageSize);
    //添加IP到白名单
    bool addWhiteIp(1:string ip);
    //把IP移除白名单
    bool removeIpfromWhiteIpist(1:string ip);
    //获取百名单列表
    string getWhiteIpist(1:string ip,2:i32 page,3:i32 pageSize);
    //获取IP对应的uids
    string getRegisterUidByIp(1:string ip);

//======================芝麻信息用的php后台认证相关[begin]=========================//
    /**
    *name:用户真实姓名，certNo:证件号码，mobilNo:手机号码
    **/
    bool zmxy(1:string name,2:string certNo,3:string mobilNo,4:i64 uid);

    /**
    * 根据uid查询这个用户实名认证信息
    **/
    string getZmxyInfoByUid(1:i64 uid);
//======================芝麻信息用的php后台认证相关[end]=========================//


//======================设备封禁php后台认证相关[begin]=========================//
    bool addNotSafeDeviceByUid(1:i64 uid);

    bool removeNotSafeDeviceByUid(1:i64 uid);

    list<StringPair> getAllNotSafeDevice(1:i64 uid,2:i32 page,3:i32 pageSize);

    /**
    *  添加封禁设备
    *  @param devicetype : 设备类型，3：idfv，4：smd
    *  @param idfv idfv
    *  @param smd：数美deviceId
    **/
    bool addNotSafeDevice(1:i32 deviceType,2:string idfv,3:string smd);

    /**
    *  解除封禁设备
    *  @param devicetype : 设备类型，3：idfv，4：smd
    *  @param idfv idfv
    *  @param smd：数美deviceId
    **/
    bool removeNotSafeDevice(1:i32 deviceType,2:string idfv,3:string smd);
//======================设备封禁php后台认证相关[end]=========================//

//======================游客白名单相关[begin]=========================//
    /**
    *添加到游客白名单中
    **/
    //bool addSmWhiteList(1:string localSmId);

    /**
    *从游客白名单中移除掉
    **/
    //bool delSmWhiteList(1:string localSmId);

    /**
    *如果传递了数美串，就是查询，否则就是查询所有
    **/
    //string getAllSmWhiteList(1:string localSmId);
//======================游客白名单相关[end]=========================//


//======================h5分享活动使用，根据本地数美串查询server数美串[begin]=========================//
   string getServerSmIdByLocalSmId(1:string localSmId);
//======================h5分享活动使用，根据本地数美串查询server数美串[end]=========================//


//=====================邮箱注册白名单[begin]=====================

    // 查询某邮箱后缀是否在白名单中
    bool isContainEmailRegisterWhiteItem(1:string emailSuffix);

    /**
      * 分页获取白名单列表
      * @param page ： 第几页；page 从 1开始，为0是获取所有（注：尽量不使用获取所有）
      * @param pageSize ： 每页size
    **/
    EmailRegisterWhiteList getEmailRegisterWhiteList(1:i32 page,2:i32 pageSize);

    // 添加新的邮箱白名单item
    bool addNewEmailRegisterWhiteItem(1:string emailSuffix);

    // 删除某邮箱白名单item
    bool removeEmailRegisterWhiteItem(1:string emailSuffix);

//=====================邮箱注册白名单[end]=====================

    //注册用户
    //@param feature: 保持一致
    //@param bindType: 保护一致
    //@param registerInfo: 注册信息JSON串，示例:
    // mobilePhone: {"id": "00861800138000",countryCode": "CN","password": "123456"}
    // email: {"id": "username@example.com",countryCode": "CN","password": "123456"}
    //return {"code": 1, "msg":"","data":{"uid":0}}, code=1时表示成功
    string registerUser(1:i32 feature,2:i32 bindType,3:string registerInfo);
    string registerMultipleUser(1:i32 feature,2:i32 bindType,3:list<string> registerInfoList);

    /**
    * 根据uid获取其userToken
    * @param uid: 用户uid
    * @return json string，例如：{"code":1, "msg":"", "userToken":""} --code:1 成功，其他失败 ,msg:说明, userToken:成功后返回
    **/
    string getUserTokenByUid(1:i64 uid);

    /**
     * 添加号码
     * country 国家编码
     * phoneNum 号码段
     */
    bool addPhoneNum(1:string country,2:string phoneNum);

    /**
     * 删除号码
     * country 国家编码
     * phoneNum 号码段
     */
    bool delPhoneNum(1:string country,2:string phoneNum);

    /**
     * 查询号码
     *
     *
     */
    set<string> findPhoneNum(1:string country);
}

struct StringPair {
1:string param1;
2:string param2;
}

// 邮箱注册白名单Item
struct EmailRegisterWhiteItem {
    1:string suffix;        //邮箱后缀
    2:i64 addTime;          //添加时间，时间戳（1970到现在的秒数）
}

//邮箱注册白名单列表
struct EmailRegisterWhiteList {
    1:i32 allSize;                              //总大小
    2:list<EmailRegisterWhiteItem> itemList;    //名单列表
}