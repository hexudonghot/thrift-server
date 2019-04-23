package com.example.service;

import com.asiainno.uplive.thrift.service.ProfileTService;
import com.example.AbstractTest;
import lombok.extern.slf4j.Slf4j;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TMultiplexedProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.junit.Test;
/**
 * Created by henry on 2018/7/23.
 */
@Slf4j
public class HelloServiceTest extends AbstractTest
{
//    @Autowired
//    private HelloService.Iface helloService;
//    @Test
//    public void testLocal()
//    {
//        try
//        {
//            log.info("本地调用服务...{}", helloService.greet("Local"));
//        } catch (TException e)
//        {
//            log.error("本地调用异常.", e);
//        }
//    }

    @Test
    public void testRemote() throws TException
    {
        TTransport transport = new TSocket("52.74.130.30", 9080,30000);
        TProtocol protocol = new TBinaryProtocol(transport);
        TMultiplexedProtocol mp1 = new TMultiplexedProtocol(protocol, "ProfileTService");
        ProfileTService.Client client = new ProfileTService.Client(mp1);
        transport.open();
        System.out.println(client.isContainEmailRegisterWhiteItem("qq.com"));
    }

}
