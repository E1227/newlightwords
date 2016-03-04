//
//  QYAPI.h
//  lightwords
//
//  Created by wangxiangyu on 16/3/2.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#ifndef QYAPI_h
#define QYAPI_h

#pragma mark 基本调用接口
#define SHOW_SEARCH_BASEURL  @"http://route.showapi.com/109-35"//新闻查询接口
#define SHOW_CHANNEL_BASEURL @"http://route.showapi.com/109-34"//新闻频道接口

#pragma mark 系统参数
#define SHOWAPI_APPID @"showapi_appid"  //应用id参数名(易源)
#define SHOWAPI_APPID_VALUE @"16332"    //应用id值参数值

#define SHOWAPI_SIGN @"showapi_sign"    //数字签名参数名
#define SHOWAPI_SIGN_VALUE @"025a4f865952403eb0c8f1aa67c3c171" //数字签名参数值

#define SHOWAPI_TIMESTAMP @"showapi_timestamp" //客户端时间参数名
#define SHOWAPI_TIMESTAMP_VALUE  [NSDate currentDateStringWithFormat:@"yyyyMMddHHmmss"]     //yyyyMMddHHmmss格式

#define SHOWAPI_SIGN_METHOD @"showapi_sign_method"//签名生成方式，默认为md5(可选)
#define SHOWAPI_SIGN_METHOD_VALUE @"md5"




#pragma mark 焦点列表

#define SHOWAPI_FOCUS_NAME_ARRAY @[@"国内",@"国际",@"军事",@"财经",@"互联网",@"房产",@"汽车",@"体育",@"娱乐",@"游戏",@"教育",@"女人",@"科技",@"社会"] //参数名"name"，需在后面拼接"焦点"
#define SHOWAPI_FOCUS_CHANNELID_ARRAY @[@"5572a108b3cdc86cf39001cd",@"5572a108b3cdc86cf39001ce",@"5572a108b3cdc86cf39001cf",@"5572a108b3cdc86cf39001d0",@"5572a108b3cdc86cf39001d1",@"5572a108b3cdc86cf39001d2",@"5572a108b3cdc86cf39001d3",@"5572a108b3cdc86cf39001d4",@"5572a108b3cdc86cf39001d5",@"5572a108b3cdc86cf39001d6",@"5572a108b3cdc86cf39001d7",@"5572a108b3cdc86cf39001d8",@"5572a108b3cdc86cf39001d9",@"5572a109b3cdc86cf39001da"] //参数名"channelId"
#define SHOWAPI_NEW_NAME_ARRAY @[@"国内",@"台湾",@"港澳",@"国际",@"军事",@"财经",@"理财",@"宏观经济",@"互联网",@"房产",@"汽车",@"体育",@"国际足球",@"国内足球",@"CBA最新",@"综合体育",@"娱乐",@"电影","电视","游戏","教育","女人","美容护肤","情感两性","健康养生","科技","数码","电脑","科普","社会"] //参数"name",需在后面拼接最新

#define SHOWAPI_NEW_CHANNELID_ARRAY @[@"5572a109b3cdc86cf39001db",@"5572a109b3cdc86cf39001dc",@"5572a109b3cdc86cf39001dd",@"5572a109b3cdc86cf39001de",@"5572a109b3cdc86cf39001df",@"5572a109b3cdc86cf39001e0",@"5572a109b3cdc86cf39001e1",@"5572a109b3cdc86cf39001e2",@"5572a109b3cdc86cf39001e3",@"5572a109b3cdc86cf39001e4",@"5572a109b3cdc86cf39001e4",@"5572a109b3cdc86cf39001e6",@"5572a10ab3cdc86cf39001e7",@"5572a10ab3cdc86cf39001e8",@"5572a10ab3cdc86cf39001e9",@"5572a10ab3cdc86cf39001ea",@"5572a10ab3cdc86cf39001eb",@"5572a10ab3cdc86cf39001ec","5572a10ab3cdc86cf39001ed","5572a10ab3cdc86cf39001ee","5572a10ab3cdc86cf39001ef","5572a10ab3cdc86cf39001f0","5572a10ab3cdc86cf39001f1","5572a10ab3cdc86cf39001f2","5572a10ab3cdc86cf39001f3","5572a10ab3cdc86cf39001f4","5572a10bb3cdc86cf39001f5","5572a10bb3cdc86cf39001f6","5572a10bb3cdc86cf39001f7","5572a10bb3cdc86cf39001f8"]

//"channelList": [
//                {
//                    "channelId": "5572a108b3cdc86cf39001cd",
//                    "name": "国内焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001ce",
//                    "name": "国际焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001cf",
//                    "name": "军事焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001d0",
//                    "name": "财经焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001d1",
//                    "name": "互联网焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001d2",
//                    "name": "房产焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001d3",
//                    "name": "汽车焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001d4",
//                    "name": "体育焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001d5",
//                    "name": "娱乐焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001d6",
//                    "name": "游戏焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001d7",
//                    "name": "教育焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001d8",
//                    "name": "女人焦点"
//                },
//                {
//                    "channelId": "5572a108b3cdc86cf39001d9",
//                    "name": "科技焦点"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001da",
//                    "name": "社会焦点"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001db",
//                    "name": "国内最新"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001dc",
//                    "name": "台湾最新"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001dd",
//                    "name": "港澳最新"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001de",
//                    "name": "国际最新"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001df",
//                    "name": "军事最新"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001e0",
//                    "name": "财经最新"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001e1",
//                    "name": "理财最新"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001e2",
//                    "name": "宏观经济最新"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001e3",
//                    "name": "互联网最新"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001e4",
//                    "name": "房产最新"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001e5",
//                    "name": "汽车最新"
//                },
//                {
//                    "channelId": "5572a109b3cdc86cf39001e6",
//                    "name": "体育最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001e7",
//                    "name": "国际足球最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001e8",
//                    "name": "国内足球最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001e9",
//                    "name": "CBA最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001ea",
//                    "name": "综合体育最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001eb",
//                    "name": "娱乐最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001ec",
//                    "name": "电影最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001ed",
//                    "name": "电视最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001ee",
//                    "name": "游戏最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001ef",
//                    "name": "教育最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001f0",
//                    "name": "女人最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001f1",
//                    "name": "美容护肤最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001f2",
//                    "name": "情感两性最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001f3",
//                    "name": "健康养生最新"
//                },
//                {
//                    "channelId": "5572a10ab3cdc86cf39001f4",
//                    "name": "科技最新"
//                },
//                {
//                    "channelId": "5572a10bb3cdc86cf39001f5",
//                    "name": "数码最新"
//                },
//                {
//                    "channelId": "5572a10bb3cdc86cf39001f6",
//                    "name": "电脑最新"
//                },
//                {
//                    "channelId": "5572a10bb3cdc86cf39001f7",
//                    "name": "科普最新"
//                },
//                {
//                    "channelId": "5572a10bb3cdc86cf39001f8",
//                    "name": "社会最新"
//                }



#endif /* QYAPI_h */
