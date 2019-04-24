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
  * @author:hai.li
  * @date: 2015年06月25日
  */

namespace java com.asiainno.uplive.crm.thrift.service
namespace php com.asiainno.uplive.crm.thrift.service

service CrmService {
/**
* request为json
*
* 参数同碰碰
*sid  发送者账户
 rids 接收者id
 msgType 消息类型
 content 消息内容
 deviceType 设备类型
 pushMsg push消息
 activeTime 活跃时间
 startDate 开始发送时间
 registerStartTime 注册开始时间
 registerEndTime 注册结束时间
 gender 性别
 language 语言
*
*
**/
   void sendMsg(1:string request);
   void sendMsgWithFeature(1:i32 feature, 2:string request);

   /**
   * 验证定时任务表达式是否合法
   **/
   bool validateCron(1:string cron);


  void pushAps(1:i64 sid, 2:i64 rid, 3:string pushMsg, 4:string aps);

  void pushApsWithFeature(1:i32 feature, 2:i64 sid, 3:i64 rid, 4:string pushMsg, 5:string aps);

  string removeTask(1:string timingID);


  /**
  * 市场部用来给某些大R发push消息从而来确定是否已经卸载
  **/
  void sendMarketMsg(1:string request);

}