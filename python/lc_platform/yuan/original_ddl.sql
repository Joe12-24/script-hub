create table if not exists `otc`.`GJ_G2010_ITEM_MARKET_INFO` (
	`ID` NUMERIC(19, 0) not null,
	`ITEM_CODE` VARCHAR(8) binary,
	`MARKET_NAME` VARCHAR(30) binary,
	`PRIORITY` NUMERIC(8, 0),
	`AUDIT_STATUS` CHAR(1) binary,
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`CREATE_TIME` DATETIME,
	`UPD_TIME` DATETIME,
	`UPD_PERSONNEL` VARCHAR(20) binary,
	`WEEKS` VARCHAR(200) binary,
	`TICKET_NUM` VARCHAR(50) binary,
	`NOLOGIN_IS_DISPLAY` VARCHAR(2) binary,
	`MALL_URL` VARCHAR(500) binary,
	`USER_RULE_ID` VARCHAR(500) binary,
	`PC_LINK` VARCHAR(500) binary,
	`BLACK_IMAGE_URL` VARCHAR(500) binary,
	`BLACK_IMAGE_ID` VARCHAR(100) binary,
	`BLACK_IMAGE_NAME` VARCHAR(100) binary,
	`AUDIT_STATUS_SH` VARCHAR(2) binary,
	`YD_URL_NAME` VARCHAR(200) binary,
	`PC_URL_NAME` VARCHAR(200) binary,
	`JH_URL_NAME` VARCHAR(200) binary,
	`MARKETING_TAG` VARCHAR(12) binary,
	`XIAODIAN_LINK` VARCHAR(500) binary,
	`XIAODIAN_URL_NAME` VARCHAR(256) binary,
	`MARKET_IMG_URL` VARCHAR(500) binary,
	`MARKET_TYPE` CHAR(1) binary,
	`MARKET_START_TIME` DATETIME,
	`MARKET_END_TIME` DATETIME,
	`MARKET_IMG_NAME` VARCHAR(200) binary,
	`MARKET_IMG_ID` VARCHAR(200) binary,
	`PC_MARKET_URL` VARCHAR(500) binary,
	`PC_MARKET_ID` VARCHAR(100) binary,
	`PC_MARKET_NAME` VARCHAR(100) binary,
	`MARKET_REMARK` VARCHAR(500) binary,
	`OBJECT_TYPE` CHAR(1) binary,
	`IS_DISPLAY_OBJECT_NAME` CHAR(1) binary,
	`OBJECT_CODE` VARCHAR(50) binary,
	`BENCHMARK_TYPE` CHAR(1) binary,
	`IS_DISPLAY_BENCHMARK_NAME` CHAR(1) binary,
	`BENCHMARK_CODE` VARCHAR(50) binary,
	`PERIOD_TYPE` CHAR(1) binary,
	`MARKET_URL` VARCHAR(500) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_G2010_API_LOG_LS` (
	`SERIALNO` VARCHAR(50) binary,
	`CLIENTID` VARCHAR(50) binary,
	`BUSINACCOUNT` VARCHAR(50) binary,
	`FUNCTIONID` VARCHAR(50) binary,
	`BIZDATE` DATETIME,
	`KBN` CHAR(1) binary,
	`CIFACCOUNT` VARCHAR(50) binary,
	`SOURCE` CHAR(1) binary,
	`CALLTIME` NUMERIC(19, 0),
	`REC_GEN_TIME` DATETIME(6),
	`REC_UPD_TIME` DATETIME(6),
	`RESULT` LONGTEXT,
	`PARAMETER` LONGTEXT,
	`ID` NUMERIC(19, 0) not null,
	constraint `BIN$JRvB0lU90lrgYAB/AQBj0w==$0` primary key (`ID`)
);

create index `BIN$JRvB0lU+0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2010_API_LOG_LS` (`BIZDATE` ASC);

create index `BIN$JRvB0lU/0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2010_API_LOG_LS` (`BIZDATE` ASC, `FUNCTIONID` ASC);

create UNIQUE index `BIN$JRvB0lVA0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2010_API_LOG_LS` (`ID` ASC);


create table if not exists `otc`.`YHZX_OFUND_PLAN` (
	`SERIAL_ID` VARCHAR(32) binary,
	`USER_CODE` NUMERIC(19, 0),
	`CIF_ACCOUNT` VARCHAR(32) binary,
	`CUST_CODE` VARCHAR(32) binary,
	`CUACCT_CODE` VARCHAR(32) binary,
	`MARKET` VARCHAR(32) binary,
	`TRADE_ACCOUNT` VARCHAR(32) binary,
	`BUSIN_TYPE` VARCHAR(32) binary,
	`BENCHMARK` VARCHAR(64) binary,
	`BENCH_DATA` VARCHAR(512) binary,
	`BALANCE` NUMERIC(19, 6),
	`PROD_TYPE` VARCHAR(12) binary,
	`PROD_CODE` VARCHAR(12) binary,
	`PROD_NAME` VARCHAR(256) binary,
	`BANK_NO` VARCHAR(12) binary,
	`BANK_ACCOUNT` VARCHAR(64) binary,
	`TERMINAL_SOURCE` VARCHAR(32) binary,
	`BUSIN_FLAG` VARCHAR(32) binary,
	`DEAL_FLAG` VARCHAR(2) binary,
	`DEAL_DATE` NUMERIC(8, 0),
	`DEAL_LOG` VARCHAR(256) binary,
	`DEBIT_WAY` VARCHAR(32) binary,
	`PLAN_CYCLE` NUMERIC(19, 0),
	`PLAN_UNIT` VARCHAR(32) binary,
	`PLAN_BEGIN_DATE` NUMERIC(8, 0),
	`PLAN_END_DATE` NUMERIC(8, 0),
	`UPDATE_TIME` NUMERIC(8, 0),
	`UPDATE_DATE` NUMERIC(8, 0),
	`ORDER_DATE` NUMERIC(8, 0),
	`TOKEN_SERIAL_NO` VARCHAR(256) binary,
	`USER_TOKEN` VARCHAR(512) binary,
	`OP_SITE` VARCHAR(128) binary,
	`BRANCH_NO` VARCHAR(10) binary,
	`OP_WAY` VARCHAR(2) binary,
	`PASSWORD` VARCHAR(32) binary,
	`REMARK` VARCHAR(128) binary
);


create table if not exists `otc`.`GJ_OTC_REPORT_XK_DAY_CNT` (
	`YMD` VARCHAR(8) binary not null,
	`PRO_TYPE` CHAR(1) binary not null,
	`CNT1` NUMERIC(19, 0),
	`CNT2` NUMERIC(19, 0),
	`CNT3` NUMERIC(19, 0),
	`CNT4` NUMERIC(19, 0),
	`CNT5` NUMERIC(19, 0),
	`CNT6` NUMERIC(19, 0),
	`SOURCE` CHAR(1) binary not null,
	`CNT11` NUMERIC(19, 0),
	`CNT22` NUMERIC(19, 0),
	`CNT33` NUMERIC(19, 0),
	`CNT44` NUMERIC(19, 0),
	`CNT55` NUMERIC(19, 0),
	`CNT66` NUMERIC(19, 0),
	constraint `BIN$JRvB0ljn0lrgYAB/AQBj0w==$0` primary key (`YMD`, `PRO_TYPE`, `SOURCE`)
)
comment='新客用户开户日期分布';

create UNIQUE index `BIN$JRvB0ljo0lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_REPORT_XK_DAY_CNT` (`YMD` ASC, `PRO_TYPE` ASC, `SOURCE` ASC);


create table if not exists `otc`.`INTERFACE_GATE` (
	`ENV` VARCHAR(10) binary not null comment '环境： local、200、sit、uat',
	`STATUS` CHAR(1) binary not null comment '是否生效：0不生效，1生效',
	`FUNCTION_ID` VARCHAR(20) binary not null comment '功能号',
	`CLIENT_ID` VARCHAR(20) binary comment '客户代码',
	`ID` VARCHAR(500) binary comment 'ID唯一标识',
	`RESULT` LONGTEXT not null comment '响应结果集，必需为json数组',
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);

create index `BIN$JRvB0luF0lrgYAB/AQBj0w==$0` on `otc`.`INTERFACE_GATE` (`FUNCTION_ID` ASC);


create table if not exists `otc`.`GJ_G2010_SHELF_SHOW_TYPE` (
	`SHELF_TYPE` VARCHAR(2) binary comment '货架类型("1.产品类货架
2.图片类货架
3.资讯类货架（默认1）")',
	`SHELF_BROWSE_WAY` VARCHAR(2) binary comment '货架阅读方式("1.横向阅读1列       2.横向阅读2列      3.横向阅读3列
4.纵向阅读1列（仅支持配1个产品）
5.纵向阅读2列
6.纵向阅读3列
7.纵向阅读动态不含轮播点1列（可配置多个产品）
8.纵向阅读动态含轮播点1列 9.纵向阅读1列特点标签增强
10.横向两列多行
11.纵向一列文字堆砌式
12.横向一列文字平铺式
13.主推方式展示
14.四列两行
17. 理财任务（仅支持图片类货架）")',
	`PROD_WITH_ENHANCED` VARCHAR(2) binary
);


create table if not exists `otc`.`GJ_G2010_SIMU_SERIAL_DATA` (
	`ID` NUMERIC(20, 0) not null comment '主键ID',
	`INIT_DATE` DATETIME not null comment '申请日期',
	`ORDER_NO` VARCHAR(50) binary comment '申请编号',
	`CUST_NUM` VARCHAR(50) binary comment '客户编号',
	`BUSIN_ACCOUNT` VARCHAR(50) binary comment '资金账户',
	`CIF_ACCOUNT` VARCHAR(50) binary comment '一户通账户',
	`PROD_CODE` VARCHAR(50) binary comment '产品代码',
	`ENTRUST_BALANCE` NUMERIC(19, 2) comment '申请金额',
	`COUNTER_SOURCE` VARCHAR(4) binary comment '产品中心产品编号("1":集中交易柜台 "2":OTC柜台)',
	`ORDER_STATUS` VARCHAR(4) binary,
	`CID_SOURCE` VARCHAR(10) binary comment '订单来源(默认：NEWMALL；PC端：PC)',
	`TRADE_TYPE` VARCHAR(10) binary,
	`OP_REMARK` VARCHAR(24) binary comment '操作备注',
	`TGLJ_INFO` VARCHAR(2000) binary comment '要素',
	`REGTEL` VARCHAR(13) binary comment '注册手机号',
	`ALLOT_NO` VARCHAR(200) binary comment '申请编号',
	`SUB_BUSIN_ACCOUNT` VARCHAR(100) binary comment '子账号，只有在投顾otc下单的会有值',
	`PRO_NAME` VARCHAR(200) binary comment '产品名称',
	`UP_REMARK` VARCHAR(50) binary comment '更新备注',
	`MATCHAMT` NUMERIC(65, 30) comment '（不知含义）',
	`MATCHQTY` NUMERIC(65, 30) comment '（不知含义）',
	`UPDATE_TIME` DATETIME comment '更新时间',
	constraint `BIN$JRvB0lZ70lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='私募流水数据';

create UNIQUE index `BIN$JRvB0lZ80lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2010_SIMU_SERIAL_DATA` (`ID` ASC);


create table if not exists `otc`.`GJ_G2050_PRO_ORDER` (
	`ID` NUMERIC(20, 0) not null,
	`CUST_NUM` VARCHAR(50) binary,
	`FUND_ACCOUNT` VARCHAR(50) binary,
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`SECUM_ACCOUNT` VARCHAR(50) binary,
	`ORGID` NUMERIC(20, 0),
	`PROD_NAME` VARCHAR(50) binary,
	`PROD_CODE` VARCHAR(50) binary,
	`ENTRUST_BALANCE` NUMERIC(20, 0),
	`ALLOT_NO` VARCHAR(50) binary,
	`ENTRUST_TIME` DATETIME(6),
	`CUST_NAME` VARCHAR(50) binary,
	`INIT_DATE` VARCHAR(20) binary,
	`SERIAL_NO` NUMERIC(20, 0),
	`REC_GEN_TIME` DATETIME(6),
	`REC_UPD_TIME` DATETIME(6),
	`ENTRUST_TYPE` VARCHAR(50) binary,
	`CLIENT_GENDER` VARCHAR(2) binary,
	`PROD_TA_NO` VARCHAR(10) binary,
	`SOURCE` VARCHAR(2) binary,
	`REMARK` VARCHAR(100) binary,
	`CID` VARCHAR(20) binary,
	`PROD_TYPE_CHILD` VARCHAR(10) binary,
	`UPDATE_TIME` DATETIME,
	`MATCHAMT` NUMERIC(22, 4),
	`UP_REMARK` VARCHAR(50) binary,
	`MATCHQTY` NUMERIC(22, 0),
	constraint `BIN$JRvB0lcD0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='预下单流水表';

create UNIQUE index `BIN$JRvB0lcE0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2050_PRO_ORDER` (`ID` ASC);


create table if not exists `otc`.`GJ_BUY_ORDER` (
	`REC_GEN_TIME` DATETIME(6) comment '记录生成时间',
	`REC_UPD_TIME` DATETIME(6) comment '记录更新时间',
	`ID` NUMERIC(19, 0) not null comment '主键ID',
	`CUST_NUM` VARCHAR(50) binary not null comment '客户编号',
	`FUND_ACCOUNT` VARCHAR(50) binary not null comment '资金账户',
	`CIF_ACCOUNT` VARCHAR(50) binary comment '一户通账户',
	`ORGID` NUMERIC(19, 0) comment '营业部代码',
	`BUY_TIME` DATETIME comment '购买时间',
	`TRANSFER_ORDER_NUM` VARCHAR(50) binary comment '转让订单编号',
	`PRO_NAME` VARCHAR(50) binary comment '产品名称',
	`PRO_CODE` VARCHAR(50) binary comment '产品代码',
	`PRO_NUM` VARCHAR(50) binary comment '产品编号',
	`BUY_QTY` NUMERIC(23, 4) comment '购买数量',
	`BUY_PRICE` NUMERIC(19, 4) comment '购买价格',
	`ORDER_STATUS` VARCHAR(2) binary comment '订单状态',
	`ORDER_NUM` VARCHAR(50) binary comment '订单编号',
	`SOURCE` VARCHAR(1) binary comment '来源',
	`CID` VARCHAR(100) binary comment '来源。PC表示“金融商城”',
	`TGLJ_INFO` VARCHAR(255) binary comment '推广链接',
	constraint `BIN$JRvB0lTZ0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='买家订单表';

create UNIQUE index `BIN$JRvB0lTd0lrgYAB/AQBj0w==$0` on `otc`.`GJ_BUY_ORDER` (`ID` ASC);


create table if not exists `otc`.`GJ_OTC_REPORT_SIGN_CNT` (
	`CUST_NUM` VARCHAR(50) binary not null,
	`CNT1` NUMERIC(19, 0),
	`CNT2` NUMERIC(19, 0),
	`FIRST_SIGN_DATE` VARCHAR(8) binary
)
comment='客户签到统计表';


create table if not exists `otc`.`GJ_G3020_PROD_TARGET_INFO` (
	`ID` VARCHAR(19) binary comment 'ID',
	`TARGET_ID` VARCHAR(20) binary comment '标的ID',
	`TARGET_CONTEXT` VARCHAR(50) binary comment '标的内容',
	`CREATE_DATE` DATETIME,
	`UPDATE_PERSONNEL` VARCHAR(20) binary,
	`UPDATE_DATE` DATETIME,
	`TYPE` VARCHAR(2) binary comment '类型',
	`SUPER_ID` VARCHAR(20) binary comment '上一级ID',
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
)
comment='标的类型配置';


create table if not exists `otc`.`GJ_FNDCN_FUND_MNG` (
	`SEX` VARCHAR(4) binary,
	`POST` VARCHAR(160) binary,
	`DEGREE` VARCHAR(80) binary,
	`REASON` VARCHAR(200) binary,
	`REMARK` LONGTEXT,
	`RESUME` LONGTEXT,
	`ENDDATE` VARCHAR(27) binary,
	`JOBTITLE` VARCHAR(120) binary,
	`BIRTHDATE` VARCHAR(27) binary,
	`PATICTERM` NUMERIC(38, 18),
	`CHANGEDATE` VARCHAR(27) binary,
	`DATASOURCE` VARCHAR(100) binary,
	`ISPOSITION` NUMERIC(20, 8),
	`NOTICEDATE` VARCHAR(27) binary,
	`PERSONCODE` VARCHAR(16) binary,
	`PERSONNAME` VARCHAR(200) binary,
	`SECINNERCODE` VARCHAR(200) binary,
	`TRD_CODE` VARCHAR(12) binary,
	`IS_MASTERPIEC` VARCHAR(2) binary
);


create table if not exists `otc`.`GJ_G2020_FUNCTION_DETAIL` (
	`FUNCTION_ID` VARCHAR(11) binary comment '功能号',
	`FUNCTION_NAME` VARCHAR(50) binary comment '功能名称',
	`PARAMETER_CODE` VARCHAR(50) binary comment '参数英文',
	`PARAMETER_NAME` VARCHAR(2000) binary comment '参数中文',
	`PARAMETER_TYPE` VARCHAR(20) binary comment '字段类型',
	`IS_MUST` VARCHAR(7) binary comment '是否必须',
	`SAMPLE_VALUE` VARCHAR(200) binary comment '示例值',
	`REMARK` VARCHAR(2000) binary comment '备注',
	`TYPE` VARCHAR(4) binary comment '出入参类型',
	`SORT` NUMERIC(8, 0) comment '排序',
	`PARAMETER_CODE_OUT` VARCHAR(50) binary comment '出参'
)
comment='总线接口信息';


create table if not exists `otc`.`GJ_G9010_BUG_IMG_INFO` (
	`BUG_NUM` VARCHAR(100) binary not null,
	`IMG_ID` VARCHAR(200) binary,
	`IMG_NAME` VARCHAR(200) binary,
	`CREATE_TIME` DATETIME,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_G9010_PRO_QUESTION_LST` (
	`REC_GEN_TIME` DATETIME(6),
	`REC_UPD_TIME` DATETIME(6),
	`TROUBLE_NUM` NUMERIC(19, 0) not null,
	`PROJECT_NUM` VARCHAR(100) binary,
	`TROUBLE_DATE` DATETIME,
	`TROUBLE_TITLE` VARCHAR(50) binary,
	`TROUBLE_DESCRIBE` VARCHAR(2000) binary,
	`TROUBLE_RESOLVENT` VARCHAR(4000) binary,
	`IDENTIFY_ID` VARCHAR(100) binary,
	`PROJECT_NUM_CH` VARCHAR(500) binary,
	`AUTHOR` VARCHAR(20) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	constraint `BIN$JRvB0leG0lrgYAB/AQBj0w==$0` primary key (`TROUBLE_NUM`)
);

create UNIQUE index `BIN$JRvB0leH0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G9010_PRO_QUESTION_LST` (`TROUBLE_NUM` ASC);


create table if not exists `otc`.`GJ_G2020_FUNCTION_DAMPER_DATA` (
	`FUNCTION_ID` VARCHAR(8) binary,
	`DATA` LONGTEXT,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_G2010_MARKET_PERIOD_INFO` (
	`ID` NUMERIC(19, 0) not null,
	`ITEM_CODE` VARCHAR(8) binary,
	`MARKET_ID` VARCHAR(8) binary,
	`RATE_TYPE` CHAR(2) binary,
	`PERIOD_REMARK` VARCHAR(100) binary,
	`OBJECT_CODE` VARCHAR(100) binary,
	`BENCHMARK_CODE` VARCHAR(100) binary,
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`CREATE_TIME` DATETIME,
	`UPD_TIME` DATETIME,
	`UPD_PERSONNEL` VARCHAR(20) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_OTC_REPORT_XK_CNT` (
	`YMD` VARCHAR(8) binary not null,
	`CNT1` NUMERIC(19, 0),
	`CNT2` NUMERIC(19, 0),
	`CNT3` NUMERIC(19, 0),
	`CNT4` NUMERIC(19, 0),
	`CNT5` NUMERIC(19, 0),
	`CNT6` NUMERIC(19, 0),
	`SOURCE` CHAR(1) binary not null,
	`CNT11` NUMERIC(19, 0),
	`CNT22` NUMERIC(19, 0),
	`CNT33` NUMERIC(19, 0),
	`CNT44` NUMERIC(19, 0),
	`CNT55` NUMERIC(19, 0),
	`CNT66` NUMERIC(19, 0),
	`CNTH2` NUMERIC(19, 0),
	`CNTH3` NUMERIC(19, 0),
	`CNTH22` NUMERIC(19, 0),
	`CNTH33` NUMERIC(19, 0),
	constraint `BIN$JRvB0ljX0lrgYAB/AQBj0w==$0` primary key (`YMD`, `SOURCE`)
)
comment='新客产品券种占比';

create UNIQUE index `BIN$JRvB0ljY0lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_REPORT_XK_CNT` (`YMD` ASC, `SOURCE` ASC);


create table if not exists `otc`.`GJ_OTC_API_LOG_LS` (
	`REC_GEN_TIME` DATETIME(6),
	`REC_UPD_TIME` DATETIME(6),
	`LSH` NUMERIC(19, 0) not null,
	`CUST_NUM` VARCHAR(50) binary,
	`FUND_ACCOUNT` VARCHAR(50) binary,
	`FUNCTION_ID` VARCHAR(20) binary,
	`BIZ_DATE` DATETIME,
	`KBN` CHAR(1) binary,
	`RESULT` LONGTEXT,
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`PARAMETER` LONGTEXT,
	`SOURCE` CHAR(1) binary,
	`CALL_TIME` NUMERIC(19, 0),
	constraint `BIN$JRvB0lhY0lrgYAB/AQBj0w==$0` primary key (`LSH`)
);

create UNIQUE index `BIN$JRvB0lhZ0lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_API_LOG_LS` (`LSH` ASC);


create table if not exists `otc`.`GJ_INDEX_FLUCTUATE_INFO` (
	`INDEX_CHANCE` VARCHAR(2) binary comment '指数机会',
	`INDEX_NUMBER` VARCHAR(16) binary comment '指数期数',
	`ID` VARCHAR(20) binary not null comment '主键',
	`UPLOAD_TIME` VARCHAR(24) binary comment '上线时间',
	`INDEX_NAME` VARCHAR(255) binary comment '指数名称',
	`INDEX_CODE` VARCHAR(120) binary comment '指数代码',
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP comment '创建时间',
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP comment '更新时间',
	`AUDIT_STATUS` VARCHAR(12) binary comment '审核状态 1审核通过  2 待审核  3审核未通过 5删除待审核',
	`CREATE_PERSONNEL` VARCHAR(36) binary comment '创建人',
	`UPD_PERSONNEL` VARCHAR(36) binary comment '更新人',
	`ORDER_ID` NUMERIC(16, 0) comment '期数+机会（用来排序）',
	`INDEX_SUFFIX` VARCHAR(100) binary comment '指数代码后缀',
	`COPYWRITING` VARCHAR(255) binary comment '运营文案',
	`COPYWRITING_URL` VARCHAR(255) binary comment '运营文案链接',
	constraint `BIN$JRvB0let0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='指数挺举指数波动';

create UNIQUE index `BIN$JRvB0leu0lrgYAB/AQBj0w==$0` on `otc`.`GJ_INDEX_FLUCTUATE_INFO` (`ID` ASC);


create table if not exists `otc`.`GJ_G2019_RULES_ITEM` (
	`ID` VARCHAR(16) binary,
	`ITEM_CODE` VARCHAR(16) binary,
	`MARKETING_RULE_ID` VARCHAR(16) binary comment '营销规则栏目代码',
	`ITEM_NAME` VARCHAR(128) binary,
	`MARKETING_RULE_NAME` VARCHAR(128) binary,
	`SHELF_TYPE` VARCHAR(2) binary comment '货架类型',
	`SHELF_BROWSE_WAY` VARCHAR(2) binary comment '货架阅读方式',
	`PROD_WITH_ENHANCED` VARCHAR(2) binary comment '伴随式增强',
	`ITEM_TYPE` VARCHAR(2) binary comment '栏目类型',
	`ITEM_CODE_SUPER` VARCHAR(8) binary comment '上级栏目代码',
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`OFTIMERCONFIG` (
	`SERVERID` VARCHAR(50) binary not null,
	`ORDERDATE` VARCHAR(50) binary not null,
	`SNO` VARCHAR(50) binary not null,
	`SENDSN` VARCHAR(50) binary,
	`ORGID` NUMERIC(19, 0),
	`CUSTID` NUMERIC(19, 0),
	`FUNDID` NUMERIC(19, 0),
	`TACODE` NUMERIC(19, 0),
	`TAACC` VARCHAR(50) binary,
	`TRANSACC` VARCHAR(50) binary,
	`OFCODE` VARCHAR(50) binary,
	`TRDID` NUMERIC(19, 0),
	`ORDERAMT` NUMERIC(19, 2),
	`ORDERQTY` NUMERIC(19, 2),
	`REDEEMTYPE` VARCHAR(50) binary,
	`DEALDATE` VARCHAR(50) binary,
	`FAULTTIMES` NUMERIC(19, 0),
	`BEGINDATE` VARCHAR(50) binary,
	`ENDDATE` VARCHAR(50) binary,
	`DISCRATIO` NUMERIC(19, 8),
	`ACTIONMODE` VARCHAR(50) binary,
	`SENDDAY` NUMERIC(19, 0),
	`LASTACTIONDATE` VARCHAR(50) binary,
	`DEALFLAG` VARCHAR(5) binary,
	`DEALCODE` VARCHAR(5) binary,
	`SHARECLASS` VARCHAR(5) binary,
	`REMARK` VARCHAR(200) binary,
	`OPERWAY` VARCHAR(5) binary,
	`MONEYTYPE` VARCHAR(5) binary,
	`CANCELDATE` VARCHAR(50) binary,
	`ERRMSG` VARCHAR(500) binary,
	`RELATIVEDATE` VARCHAR(50) binary,
	`RELATIVESNO` VARCHAR(50) binary,
	`BANKID` VARCHAR(50) binary,
	`SOURCEFLAG` VARCHAR(5) binary,
	`STATUS` VARCHAR(5) binary,
	`TOTALCNT` NUMERIC(19, 0),
	`TOTALAMT` NUMERIC(19, 2),
	`TOTALQTY` NUMERIC(19, 2),
	`CUST_NUM` VARCHAR(14) binary,
	`OFNAME` VARCHAR(50) binary,
	`CUST_MANAGER` VARCHAR(100) binary,
	`CUST_MANAGER_MOBILE` VARCHAR(100) binary,
	constraint `BIN$JRvB0l+C0lrgYAB/AQBj0w==$0` primary key (`ORDERDATE`, `SNO`, `SERVERID`)
)
comment='定投明细表';

create UNIQUE index `BIN$JRvB0l+D0lrgYAB/AQBj0w==$0` on `otc`.`OFTIMERCONFIG` (`ORDERDATE` ASC, `SNO` ASC, `SERVERID` ASC);


create table if not exists `otc`.`YHZX_ENTRUST` (
	`SERIAL_ID` VARCHAR(32) binary,
	`ENTRUST_ID` VARCHAR(32) binary,
	`BATCH_NO` VARCHAR(32) binary,
	`XH` NUMERIC(65, 30),
	`BUSIN_TYPE` VARCHAR(32) binary,
	`USER_CODE` NUMERIC(65, 30),
	`CUST_CODE` VARCHAR(32) binary,
	`MONEY_TYPE` VARCHAR(12) binary,
	`TERMINAL_SOURCE` VARCHAR(32) binary,
	`ENTRUST_AMOUNT` NUMERIC(19, 6),
	`ENTRUST_PRICE` NUMERIC(19, 6),
	`ENTRUST_BS` VARCHAR(10) binary,
	`ENTRUST_PROP` VARCHAR(10) binary,
	`PROD_CODE` VARCHAR(12) binary,
	`TA_CODE` VARCHAR(32) binary,
	`PROD_NAME` VARCHAR(256) binary,
	`REMARK` VARCHAR(1024) binary,
	`PROD_TYPE` VARCHAR(12) binary,
	`BUSIN_FLAG` VARCHAR(32) binary,
	`MARKET` VARCHAR(32) binary,
	`TRADE_ACCOUNT` VARCHAR(32) binary,
	`PAY_KIND` VARCHAR(32) binary,
	`PAY_ACCOUNT` VARCHAR(32) binary,
	`REBUY_AMOUNT` NUMERIC(19, 6),
	`REBUY_PERIODS` NUMERIC(19, 6),
	`CUACCT_CODE` VARCHAR(32) binary,
	`ENTRUST_DATE` NUMERIC(65, 30),
	`ENTRUST_TIME` NUMERIC(65, 30),
	`ENTRUST_SHARE` NUMERIC(19, 6),
	`ENTRUST_STATUS` VARCHAR(2) binary,
	`DEAL_FLAG` VARCHAR(2) binary,
	`DEAL_DATE` NUMERIC(65, 30),
	`DEAL_TIME` NUMERIC(65, 30),
	`CANCEL_DATE` NUMERIC(65, 30),
	`CANCEL_TIME` NUMERIC(65, 30),
	`OUT_SERIAL_NO` VARCHAR(32) binary,
	`OUT_SERIAL_NO2` VARCHAR(32) binary,
	`DEAL_LOG` VARCHAR(1024) binary,
	`SEND_MSG_FLAG` VARCHAR(2) binary,
	`GT_PASSFLAG` VARCHAR(2) binary,
	`GT_CTRLKINDS` VARCHAR(20) binary,
	`OUT_ENTRUST_ID` VARCHAR(32) binary,
	`GT_OUTBIZSNO` VARCHAR(32) binary,
	`GT_PROTOCLVER` VARCHAR(32) binary,
	`GT_PROTOCOLNO1` VARCHAR(32) binary,
	`GT_PROTOCOLNO2` VARCHAR(32) binary,
	`GT_DOUBLEVIDEO` VARCHAR(32) binary,
	`BANK_NO` VARCHAR(12) binary,
	`BIZ_SYS` NUMERIC(65, 30),
	`OP_CODE` VARCHAR(32) binary,
	`OP_BRANCH_NO` VARCHAR(32) binary,
	`OP_SITE` VARCHAR(256) binary,
	`OP_WAY` VARCHAR(32) binary,
	`OP_PROGRAM` VARCHAR(64) binary,
	`BRANCH_NO` VARCHAR(32) binary,
	`TERMINAL_INFO` VARCHAR(256) binary,
	`CIF_ACCOUNT` VARCHAR(32) binary,
	`DEVELOPER` VARCHAR(32) binary,
	`ELIG_CONFIRM_TYPE` VARCHAR(32) binary,
	`OUT_SERIAL_ID` VARCHAR(64) binary
);


create table if not exists `otc`.`GJ_G2010_PROD_SET_ASSET_TEMP` (
	`ASSET_ID` NUMERIC(65, 30),
	`SET_CODE` VARCHAR(6) binary,
	`ASSET_TYPE` VARCHAR(20) binary,
	`ASSET_RATE` VARCHAR(50) binary,
	`UPD_TIME` VARCHAR(50) binary,
	`PRIORITY` NUMERIC(3, 0),
	`UPD_PERSONNEL` VARCHAR(20) binary,
	`CREATE_TIME` VARCHAR(50) binary,
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`TRANSFERWH_ID` NUMERIC(65, 30),
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_OTC_SEEK_ORDER` (
	`REC_GEN_TIME` DATETIME(6),
	`REC_UPD_TIME` DATETIME(6),
	`ID` NUMERIC(19, 0) not null,
	`CUST_NUM` VARCHAR(50) binary not null,
	`FUND_ACCOUNT` VARCHAR(50) binary not null,
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`ORGID` NUMERIC(19, 0),
	`TRANSFER_TIME` DATETIME,
	`PRO_NAME` VARCHAR(50) binary,
	`PRO_CODE` VARCHAR(50) binary,
	`PRO_NUM` VARCHAR(50) binary,
	`ORDER_QTY` NUMERIC(19, 0),
	`ORDER_PRICE` NUMERIC(19, 4),
	`BUY_RATE` NUMERIC(19, 5),
	`ORDER_STATUS` VARCHAR(2) binary,
	`TRANSFER_ORDER_NUM` VARCHAR(50) binary,
	`SOURCE` VARCHAR(1) binary,
	`CID` VARCHAR(10) binary,
	`CUST_NAME` VARCHAR(50) binary,
	`CUST_ADDRESS` VARCHAR(50) binary,
	`TGLJ_INFO` VARCHAR(255) binary,
	constraint `BIN$JRvB0lkX0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='求购订单 意向买单';

create UNIQUE index `BIN$JRvB0lkb0lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_SEEK_ORDER` (`ID` ASC);


create table if not exists `otc`.`GJ_G3020_CUSTOMER_VOTING_INFO` (
	`ID` NUMERIC(19, 0) not null,
	`CYCLE_CODE` VARCHAR(8) binary not null,
	`PROD_CODE` VARCHAR(20) binary not null,
	`CUST_NUM` VARCHAR(20) binary not null,
	`RD_DIRECTION` VARCHAR(2) binary not null,
	`VOTE_DATE` DATETIME,
	`EXPECT_RATE` VARCHAR(20) binary,
	`TARGET_TYPE` VARCHAR(2) binary not null,
	`JYB_FLAG` VARCHAR(1) binary,
	`MOBILE` VARCHAR(20) binary,
	`PROD_TARGET_ID` VARCHAR(20) binary,
	constraint `BIN$JRvB0ldS0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='客户投票信息';

create UNIQUE index `BIN$JRvB0ldY0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G3020_CUSTOMER_VOTING_INFO` (`ID` ASC);


create table if not exists `otc`.`G2021_INVEST_PROD_FEATURE` (
	`ID` VARCHAR(32) binary not null,
	`PROD_ID` VARCHAR(32) binary,
	`TID` VARCHAR(32) binary,
	`FEATURE` VARCHAR(255) binary,
	`PRIORITY` NUMERIC(38, 0),
	constraint `BIN$JRvB0lSE0lrgYAB/AQBj0w==$0` primary key (`ID`)
);

create UNIQUE index `BIN$JRvB0lSF0lrgYAB/AQBj0w==$0` on `otc`.`G2021_INVEST_PROD_FEATURE` (`ID` ASC);


create table if not exists `otc`.`GJ_G2010_PROD_INFO_BASE_DUIB` (
	`PROD_CODE` VARCHAR(30) binary not null,
	`PROD_NAME` VARCHAR(100) binary,
	`SHT_NAME` VARCHAR(100) binary,
	`PROD_TYPE` VARCHAR(2) binary,
	`RATE` NUMERIC(19, 6),
	`PROD_LABEL` VARCHAR(30) binary,
	`PROD_DAY` VARCHAR(30) binary,
	`RISK_TYPE` VARCHAR(30) binary,
	`INVEST_TYPE` VARCHAR(30) binary,
	`DAY_ADD` NUMERIC(19, 6),
	`NEW_NAV` NUMERIC(19, 6),
	`ONE_NAV` NUMERIC(19, 6),
	`ACC_NET` NUMERIC(19, 6),
	`UNIT_YLD_RMB` NUMERIC(19, 6),
	`RATE_1Y` NUMERIC(19, 6),
	`EXP_RATE_PER_SEVENDAY` NUMERIC(19, 6),
	`FUND_RANK_1Y` VARCHAR(30) binary,
	`REF_START_DATE` VARCHAR(8) binary,
	`REF_END_DATE` VARCHAR(8) binary,
	`MOST_ORIGIN_MONEY` NUMERIC(19, 2),
	`ORIGIN_MONEY` NUMERIC(19, 2),
	`ADD_MONEY` NUMERIC(19, 2),
	`PRODPRE_RATIO` NUMERIC(19, 6),
	`LEAVE_MONEY` VARCHAR(30) binary,
	`PROD_DETAIL` VARCHAR(30) binary,
	`PROD_DETAIL_MORE` VARCHAR(30) binary,
	`SELL_1W` NUMERIC(19, 0),
	`SELL_15D` NUMERIC(19, 0),
	`SELL_1M` NUMERIC(19, 0),
	`SELL_3M` NUMERIC(19, 0),
	`SELL_6M` NUMERIC(19, 0),
	`SELL_1Y` NUMERIC(19, 0),
	`COMM_1W` NUMERIC(19, 6),
	`COMM_15D` NUMERIC(19, 6),
	`COMM_1M` NUMERIC(19, 6),
	`COMM_3M` NUMERIC(19, 6),
	`COMM_6M` NUMERIC(19, 6),
	`COMM_1Y` NUMERIC(19, 6),
	`KEY` VARCHAR(2) binary,
	`SUB_STA` VARCHAR(3) binary,
	`REF_STA` VARCHAR(3) binary,
	`SELL_STA` VARCHAR(3) binary,
	`RED_STA` VARCHAR(3) binary,
	`TRANS_STA` VARCHAR(3) binary,
	`FIX_BUY_STA` VARCHAR(3) binary,
	`CANCEL_TRANS_STA` VARCHAR(3) binary,
	`ID` NUMERIC(19, 0),
	`NO_OPEN_KEY` VARCHAR(2) binary,
	`PROD_ID` VARCHAR(50) binary,
	`COMM_3Y` NUMERIC(19, 6),
	`BUY_STATUS` VARCHAR(2) binary,
	`COMM` NUMERIC(19, 6),
	`COMM_YEAR` NUMERIC(19, 6),
	`PRO_PROVIDER` VARCHAR(50) binary,
	`SUP_NAME` VARCHAR(100) binary,
	`G_BEGIN_DATE` NUMERIC(8, 0),
	`G_END_DATE` NUMERIC(8, 0),
	`NET_VALUE_TYPE` NUMERIC(19, 0),
	`PROD_BEGIN_DATE` VARCHAR(10) binary,
	`STOCK_CODE` VARCHAR(100) binary,
	`INV_OBJ` VARCHAR(1800) binary,
	`INV_RAN` VARCHAR(2000) binary,
	`BIZDATE` VARCHAR(8) binary,
	`FOUND_DATE` VARCHAR(10) binary,
	`MANAGE_FEE` NUMERIC(19, 6),
	`FUND_TRU_FEE` NUMERIC(19, 6),
	`INCOME_TYPE` VARCHAR(1) binary,
	`TRUSTEE_BANK` VARCHAR(100) binary,
	`DATA_SOURCE` VARCHAR(2) binary,
	`NAV_DATE` VARCHAR(8) binary,
	`COMM_2Y` NUMERIC(18, 9),
	`NEXT_OPEN_DAY` DATETIME,
	`OPEN_DAY` DATETIME,
	`PRO_EXP` VARCHAR(1000) binary,
	`INV_MNG` VARCHAR(1000) binary,
	`PY_NAME` VARCHAR(50) binary,
	`ACT_MAX_SCALE` NUMERIC(19, 6),
	`AUTOBUYFLAG` VARCHAR(2) binary,
	`PRODPRE_RATIO1` VARCHAR(50) binary,
	`MAX_SUBSCRIBE_NUM` NUMERIC(19, 0),
	`NEXT_PRODPRE_RATIO` NUMERIC(19, 6),
	`PHASE` VARCHAR(20) binary,
	`DT_COMM_1Y` NUMERIC(19, 6),
	`DT_COMM_2Y` NUMERIC(19, 6),
	`DT_COMM_3Y` NUMERIC(19, 6),
	`DT_COMM_5Y` NUMERIC(19, 6),
	`XS_STATUS` VARCHAR(1) binary,
	`STL_RISK_TYPE` VARCHAR(10) binary,
	`PRO_KIND` VARCHAR(2) binary,
	`PRO_TERM` VARCHAR(2) binary,
	`PRO_VIDEO` VARCHAR(2) binary,
	`RISK_APPETITE` VARCHAR(2) binary,
	`PRO_CTRLKIND` VARCHAR(10) binary,
	`PRO_PCTRLKINDS` VARCHAR(20) binary,
	`PPROFEINVEST` VARCHAR(20) binary,
	`PMINLEVEL` VARCHAR(2) binary,
	`PRO_BUYFLOW` VARCHAR(2) binary,
	`CALMHOURS` VARCHAR(5) binary,
	`EXTQTY1` NUMERIC(19, 0),
	`PROD_MAX_BALA` NUMERIC(19, 2),
	`ASSESS_LEVEL` VARCHAR(30) binary,
	`PROD_SPONSOR` VARCHAR(100) binary,
	`IPO_BEGIN_DATE` VARCHAR(10) binary,
	`IPO_END_DATE` VARCHAR(10) binary,
	`INCOME_TYPE_OTC` VARCHAR(1) binary,
	`INST_ID` VARCHAR(30) binary,
	`EXP_RETURNRATE` VARCHAR(500) binary,
	`RISK_LVL_OTC` VARCHAR(2) binary,
	`MINSIZE` NUMERIC(19, 2),
	`PRODSUB_RATE` NUMERIC(19, 8),
	`MIN_SHARE` NUMERIC(19, 2),
	`ORG_LOWLIMIT_BALANCE` NUMERIC(19, 2),
	`MIN_SHARE2` NUMERIC(19, 2),
	`ORG_LOWLIMIT_BALANCE2` NUMERIC(19, 2),
	`ORG_APPEND_BALANCE2` NUMERIC(19, 2),
	`ALLOT_LIMITSHARE2` NUMERIC(19, 2),
	`ECONTRACT_TYPE` VARCHAR(2) binary,
	`PROD_STAT` VARCHAR(10) binary default 1,
	`PRODTA_NO` VARCHAR(10) binary,
	`ORG_APPEND_BALANCE` NUMERIC(19, 2),
	`PROD_MANAGER` VARCHAR(100) binary,
	`PROD_TRUSTEE` VARCHAR(100) binary,
	`TOSOURCE` VARCHAR(1) binary,
	`HQB_STATUS` VARCHAR(1) binary default 2,
	`TBLX` VARCHAR(100) binary
);


create table if not exists `otc`.`GJ_G2010_ITEM_INFO1` (
	`ID` NUMERIC(20, 0) not null,
	`ITEM_CODE` VARCHAR(8) binary not null,
	`ITEM_NAME` VARCHAR(100) binary,
	`ITEM_REMARK` VARCHAR(200) binary,
	`ITEM_URL` VARCHAR(1000) binary,
	`ITEM_TYPE` CHAR(1) binary,
	`AUDIT_STATUS` CHAR(1) binary,
	`PRIORITY` NUMERIC(8, 0),
	`ITEM_CODE_SUPER` VARCHAR(8) binary,
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`CREATE_TIME` DATETIME,
	`UPD_TIME` DATETIME,
	`UPD_PERSONNEL` VARCHAR(20) binary,
	`ITEM_STATUS` CHAR(1) binary,
	`TOP_ADVERTISE_NAME` VARCHAR(20) binary,
	`TOP_ADVERTISE_TIME` VARCHAR(10) binary,
	`TOP_ADVERTISE_DISPLAY_TYPE` CHAR(1) binary,
	`NOTICE_DISPLAY_TIME` VARCHAR(10) binary,
	`SECOND_ITEM_STYLE` CHAR(1) binary,
	`SELL_REMIND` CHAR(1) binary,
	`LOGO_URL` VARCHAR(500) binary,
	`NOTICE_DISPLAY_TYPE` CHAR(1) binary,
	`LOGO_IMG_NAME` VARCHAR(200) binary,
	`LOGO_IMG_ID` VARCHAR(200) binary,
	`LOGO_IMG_SOURCE_NAME` VARCHAR(50) binary,
	`MORE_TYPE` CHAR(1) binary,
	`OPER_ID` VARCHAR(50) binary,
	`UPD_RECORD` VARCHAR(1000) binary,
	`MORE_TYPE_ID` VARCHAR(8) binary,
	`NOLOGIN_IS_DISPLAY` VARCHAR(2) binary,
	`TICKET_NUM` VARCHAR(50) binary,
	`MORE_WORD` VARCHAR(50) binary,
	`CUSTOMIZATION` VARCHAR(20) binary,
	`DEPT_NUM` NUMERIC(19, 0),
	`ORG_NUM` NUMERIC(19, 0),
	`ITEM_URL_OLD` VARCHAR(1000) binary,
	`MALL_URL` VARCHAR(1000) binary,
	`ITEM_PURPOSE` VARCHAR(20) binary,
	`POSITION_IS_DISPLAY` VARCHAR(2) binary,
	`EXPIRATION_IS_DISPLAY` VARCHAR(2) binary,
	`ITEM_PURPOSE_SHOW` VARCHAR(100) binary,
	`LOGIN_TO_JUMP` VARCHAR(2) binary default 2,
	`QUALIF_INVESTOR_JUMP` VARCHAR(2) binary default 0,
	`SHELF_TYPE` VARCHAR(2) binary,
	`ITEM_NS_IS_DISPLAY` VARCHAR(2) binary,
	`SHELF_BROWSE_WAY` VARCHAR(2) binary,
	`SHELF_IS_CARIYSEL` VARCHAR(2) binary,
	`SHELF_CARIYSEL_TIME` VARCHAR(2) binary,
	`PROD_WITH_ENHANCED` VARCHAR(2) binary,
	`NAME_DESCRI_DISPLACE` VARCHAR(2) binary,
	`LIMIT_SHOW_BAR` VARCHAR(2) binary,
	`BUY_BUTTON_SHOW` VARCHAR(2) binary,
	`MOULD_CODE` VARCHAR(20) binary,
	`SPARE_MOULD_CODE` VARCHAR(20) binary,
	`MOULD_CALCULATE_DATE` DATETIME,
	`ITEM_SUPER_PURPOSE` VARCHAR(2) binary,
	`ANOTHER_BATCH` VARCHAR(2) binary,
	`BUY_BUTTON_URL` VARCHAR(500) binary,
	`ICON_AFTER_URL` VARCHAR(500) binary,
	`ICON_AFTER_ID` VARCHAR(100) binary,
	`ICON_AFTER_NAME` VARCHAR(100) binary,
	`ANOTHER_BATCH_WORD` VARCHAR(20) binary,
	`USER_RULE_ID` VARCHAR(20) binary,
	`BLACK_ICON_URL` VARCHAR(500) binary,
	`BLACK_ICON_ID` VARCHAR(100) binary,
	`BLACK_ICON_NAME` VARCHAR(100) binary,
	`BLACK_ICON_AFTER_URL` VARCHAR(500) binary,
	`BLACK_ICON_AFTER_ID` VARCHAR(100) binary,
	`BLACK_ICON_AFTER_NAME` VARCHAR(100) binary,
	`USER_RULE_ID_SPARE` VARCHAR(20) binary,
	`ITEM_UUID` VARCHAR(50) binary,
	`PC_LOGO_URL` VARCHAR(500) binary,
	`PC_LOGO_ID` VARCHAR(100) binary,
	`PC_LOGO_NAME` VARCHAR(100) binary,
	`PC_ITEM_URL` VARCHAR(1000) binary,
	`THIRD_ITEM_TYPE` VARCHAR(2) binary,
	`RED_POINT_DISPLAY` VARCHAR(2) binary,
	`AUTO_SORT_IDENTIF` VARCHAR(2) binary,
	`RATE_TYPE` VARCHAR(50) binary,
	`VERSION_NUM` VARCHAR(100) binary,
	`VERSION_NUM_SHOW` VARCHAR(100) binary,
	`BOTTEM_FLOAT_STYLE` VARCHAR(2) binary,
	`FLOAT_WORD` VARCHAR(60) binary,
	`APP_FLOAT_URL` VARCHAR(500) binary,
	`JHW_FLOAT_URL` VARCHAR(500) binary,
	`PC_FLOAT_URL` VARCHAR(500) binary,
	`IS_ENABLE` VARCHAR(2) binary,
	`AGGREG_NAME` VARCHAR(20) binary,
	`AGGREG_REMARK` VARCHAR(200) binary,
	`SHARE_PIC_ON_MOBILE_ID` VARCHAR(200) binary,
	`SHARE_PIC_ON_MOBILE_SOURCE` VARCHAR(200) binary,
	`SHARE_PIC_ON_MOBILE_URL` VARCHAR(500) binary,
	`AUDIT_STATUS_SH` VARCHAR(2) binary
);


create table if not exists `otc`.`FUND_MANAGE_OPINION_SH` (
	`PERSONCODE` VARCHAR(255) binary comment '基金经理代码',
	`CREATE_DATE` DATETIME comment '创建日期',
	`UPDATE_DATE` DATETIME comment '更新日期',
	`CREATE_PERSONNEL` VARCHAR(50) binary comment '创建人',
	`UPDATE_PERSONNEL` VARCHAR(50) binary comment '更新人',
	`TITLE` VARCHAR(255) binary comment '标题',
	`EXCERPT` VARCHAR(1000) binary comment '文章摘要',
	`LINK` VARCHAR(500) binary comment '链接',
	`TIME` DATETIME comment '发布时间',
	`SOURCE` VARCHAR(100) binary comment '来源',
	`AUDIT_STATUS` VARCHAR(2) binary comment '审核状态(1：审核通过，2：待审核，3：审核不通过，4,新增待审核，5：删除待审核)',
	`TEXT` LONGTEXT comment '正文',
	`ID` VARCHAR(255) binary,
	`AUDIT_STATUS_SH` VARCHAR(2) binary comment '审核状态(1：审核通过，2：待审核，3：审核不通过，4,新增待审核，5：删除待审核)',
	`STATUS` VARCHAR(2) binary comment '状态：（0：无效，1：有效）',
	`TEXT_STRUCTURE` VARCHAR(2) binary comment '文本结构: (1：评论（默认），2：回复)',
	`CONTENT_TYPE` VARCHAR(2) binary comment '内容类型:(1：图文（默认），2：短视频)',
	`LINK_TEXT` VARCHAR(255) binary comment '跳连文字',
	`IMAGE_NAME1` VARCHAR(50) binary comment '配图1名字',
	`IMAGE_URL1` VARCHAR(200) binary comment '配图1地址',
	`IMAGE_ID1` VARCHAR(100) binary comment '配图1ID',
	`IMAGE_NAME2` VARCHAR(50) binary comment '配图2名字',
	`IMAGE_URL2` VARCHAR(200) binary comment '配图2地址',
	`IMAGE_ID2` VARCHAR(100) binary comment '配图2ID',
	`IMAGE_NAME3` VARCHAR(50) binary comment '配图3名字',
	`IMAGE_URL3` VARCHAR(200) binary comment '配图3地址',
	`IMAGE_ID3` VARCHAR(100) binary comment '配图3ID',
	`IMAGE_NAME4` VARCHAR(50) binary comment '配图4名字',
	`IMAGE_URL4` VARCHAR(200) binary comment '配图4地址',
	`IMAGE_ID4` VARCHAR(100) binary comment '配图4ID',
	`IMAGE_NAME5` VARCHAR(50) binary comment '配图5名字',
	`IMAGE_URL5` VARCHAR(200) binary comment '配图5地址',
	`IMAGE_ID5` VARCHAR(100) binary comment '配图5ID',
	`TRD_CODE` VARCHAR(1000) binary comment '在管产品',
	`OPEN_CIRCLE_REVIEW` VARCHAR(2) binary comment '开放圈子评论：（1：开放（默认），0：不开放）',
	`TOP_VIEW` VARCHAR(2) binary comment '置顶观点：（1：置顶，0：不置顶（默认））',
	`SEND_STATUS` VARCHAR(2) binary default 0 comment '推送状态：（0：未推送，1：已推送，2：删除）',
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_G2010_HOME_PAGE_SVCINFO` (
	`ID` NUMERIC(65, 30),
	`BIG_INFO_TYPE` VARCHAR(50) binary,
	`BIG_PRIORITY` VARCHAR(8) binary,
	`SMALL_INFO_TYPE` VARCHAR(50) binary,
	`SMALL_PRIORITY` VARCHAR(8) binary,
	`USER_RULE` VARCHAR(100) binary,
	`IS_AUTO_GENERATE` VARCHAR(2) binary,
	`IS_REGULAR_PUSH` VARCHAR(2) binary,
	`BEGIN_DATE` VARCHAR(50) binary,
	`BEGIN_TIME` VARCHAR(50) binary,
	`END_DATE` VARCHAR(50) binary,
	`END_TIME` VARCHAR(50) binary,
	`INFO_CONTENT` VARCHAR(1024) binary,
	`APP_URL` VARCHAR(300) binary,
	`CREATE_TIME` VARCHAR(50) binary,
	`CREATE_PERSONNEL` VARCHAR(50) binary,
	`UPDATE_TIME` VARCHAR(50) binary,
	`UPDATE_PERSONNEL` VARCHAR(50) binary,
	`START_SHOW_TIME` DATETIME,
	`END_SHOW_TIME` DATETIME,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_OTC_MALLTRADE_STOCKCAN_LS` (
	`ID` NUMERIC(19, 0) not null,
	`CUST_NUM` VARCHAR(20) binary not null,
	`USER_CODE` VARCHAR(18) binary,
	`CIF_ACCOUNT` VARCHAR(20) binary,
	`FUND_ACCOUNT` VARCHAR(20) binary,
	`ENTRUST_NO` VARCHAR(20) binary,
	`INIT_DATE` VARCHAR(8) binary,
	`ENTRUST_INFO` VARCHAR(20) binary,
	`STOCK_NAME` VARCHAR(20) binary,
	`STOCK_CODE` VARCHAR(20) binary,
	`CANCEL_TIME` VARCHAR(20) binary
)
comment='股票/ETF基金撤单流水';


create table if not exists `otc`.`GJ_G2050_CANCEL_ORDER` (
	`ID` NUMERIC(20, 0),
	`ALLOT_NO` VARCHAR(50) binary,
	`ENTRUST_DATE` VARCHAR(20) binary,
	`CUST_NUM` VARCHAR(50) binary,
	`FUND_ACCOUNT` VARCHAR(50) binary,
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`BUSIN_ACCOUNT` VARCHAR(50) binary,
	`SECUM_ACCOUNT` VARCHAR(50) binary,
	`ORGID` NUMERIC(20, 0),
	`PRO_NAME` VARCHAR(50) binary,
	`PROD_CODE` VARCHAR(50) binary,
	`CANCEL_TIME` DATETIME(6),
	`ENTRUST_BALANCE` NUMERIC(20, 0),
	`SERIAL_NO` NUMERIC(20, 0),
	`PROD_TYPE_CHILD` VARCHAR(10) binary
)
comment='私募基金订单取消';


create table if not exists `otc`.`GJ_G9010_PRO_LST` (
	`REC_GEN_TIME` DATETIME(6),
	`REC_UPD_TIME` DATETIME(6),
	`PROJECT_NUM` VARCHAR(30) binary not null,
	`PROJECT_NAME` VARCHAR(50) binary,
	`PROJECT_URL` VARCHAR(200) binary,
	`PROJECT_REMARK` VARCHAR(2000) binary,
	`PROJECT_STATUS` VARCHAR(2) binary,
	`EXP_BEGIN_DATE` DATETIME,
	`EXP_END_DATE` DATETIME,
	`ACT_BEGIN_DATE` DATETIME,
	`ACT_END_DATE` DATETIME,
	`PROJECT_LEADER` VARCHAR(30) binary,
	`OTHER_PERSON` VARCHAR(30) binary,
	`VERSION` VARCHAR(30) binary,
	constraint `BIN$JRvB0leC0lrgYAB/AQBj0w==$0` primary key (`PROJECT_NUM`)
);

create UNIQUE index `BIN$JRvB0leD0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G9010_PRO_LST` (`PROJECT_NUM` ASC);


create table if not exists `otc`.`GJ_OTC_REPORT_XK_TIME_CNT` (
	`YMD` VARCHAR(8) binary not null comment '日期',
	`PRO_TYPE` CHAR(1) binary not null comment '产品种类(1:新客产品A  2：新客产品B  3：新客产品C)',
	`SOURCE` CHAR(1) binary not null comment '来源',
	`CNT1` NUMERIC(19, 0) comment '9:00-9:15',
	`CNT2` NUMERIC(19, 0) comment '9:15-9:30',
	`CNT3` NUMERIC(19, 0) comment '9:30-9:45',
	`CNT4` NUMERIC(19, 0) comment '9:45-10:00',
	`CNT5` NUMERIC(19, 0) comment '10:00-10:15',
	`CNT6` NUMERIC(19, 0) comment '10:15-10:30',
	`CNT7` NUMERIC(19, 0) comment '10:30-10:45',
	`CNT8` NUMERIC(19, 0) comment '10:45-11:00',
	`CNT9` NUMERIC(19, 0) comment '11:00-11:15',
	`CNT10` NUMERIC(19, 0) comment '11:15-11:30',
	`CNT11` NUMERIC(19, 0) comment '11:30-11:45',
	`CNT12` NUMERIC(19, 0) comment '11:45-12:00',
	`CNT13` NUMERIC(19, 0) comment '12:00-12:15',
	`CNT14` NUMERIC(19, 0) comment '12:15-12:30',
	`CNT15` NUMERIC(19, 0) comment '12:30-12:45',
	`CNT16` NUMERIC(19, 0) comment '12:45-13:00',
	`CNT17` NUMERIC(19, 0) comment '13:00-13:15',
	`CNT18` NUMERIC(19, 0) comment '13:15-13:30',
	`CNT19` NUMERIC(19, 0) comment '13:30-13:45',
	`CNT20` NUMERIC(19, 0) comment '13:45-14:00',
	`CNT21` NUMERIC(19, 0) comment '14:00-14:15',
	`CNT22` NUMERIC(19, 0) comment '14:15-14:30',
	`CNT23` NUMERIC(19, 0) comment '14:30-14:45',
	`CNT24` NUMERIC(19, 0) comment '14:45-15:00',
	constraint `BIN$JRvB0lkD0lrgYAB/AQBj0w==$0` primary key (`YMD`, `PRO_TYPE`, `SOURCE`)
)
comment='新客产品认购时间分布新增';

create UNIQUE index `BIN$JRvB0lkE0lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_REPORT_XK_TIME_CNT` (`YMD` ASC, `PRO_TYPE` ASC, `SOURCE` ASC);


create table if not exists `otc`.`GJ_G2020_FUNCTION_DAMPER_LIST` (
	`FUNCTION_ID` VARCHAR(8) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_G2010_TOPIC_STATISTICS` (
	`ID` VARCHAR(20) binary,
	`TOPIC_CODE` VARCHAR(50) binary,
	`TOPIC_NAME` VARCHAR(100) binary,
	`CUST_TELNUM` VARCHAR(2000) binary,
	`TOPIC_CASE` VARCHAR(20) binary,
	`VOTE_TIME` DATETIME
)
comment='话题投票';


create table if not exists `otc`.`GJ_G2010_ITEM_INFO_MB_PUB_SH` (
	`ID` NUMERIC(20, 0),
	`ITEM_CODE` VARCHAR(8) binary,
	`ITEM_NAME` VARCHAR(80) binary,
	`ITEM_REMARK` VARCHAR(200) binary,
	`ITEM_URL` VARCHAR(500) binary,
	`ITEM_TYPE` CHAR(1) binary,
	`AUDIT_STATUS` CHAR(1) binary,
	`PRIORITY` NUMERIC(8, 0),
	`ITEM_CODE_SUPER` NUMERIC(20, 0),
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`CREATE_TIME` DATETIME,
	`UPD_TIME` DATETIME,
	`UPD_PERSONNEL` VARCHAR(20) binary,
	`ITEM_STATUS` CHAR(1) binary,
	`TOP_ADVERTISE_NAME` VARCHAR(20) binary,
	`TOP_ADVERTISE_TIME` VARCHAR(10) binary,
	`TOP_ADVERTISE_DISPLAY_TYPE` CHAR(1) binary,
	`NOTICE_DISPLAY_TIME` VARCHAR(10) binary,
	`SECOND_ITEM_STYLE` CHAR(1) binary,
	`SELL_REMIND` CHAR(1) binary,
	`LOGO_URL` VARCHAR(500) binary,
	`NOTICE_DISPLAY_TYPE` CHAR(1) binary,
	`LOGO_IMG_NAME` VARCHAR(200) binary,
	`LOGO_IMG_ID` VARCHAR(200) binary,
	`LOGO_IMG_SOURCE_NAME` VARCHAR(50) binary,
	`MORE_TYPE` CHAR(1) binary,
	`OPER_ID` VARCHAR(50) binary,
	`UPD_RECORD` VARCHAR(1000) binary,
	`MORE_TYPE_ID` VARCHAR(8) binary,
	`MORE_WORD` VARCHAR(50) binary,
	`CUSTOMIZATION` VARCHAR(20) binary,
	`NOLOGIN_IS_DISPLAY` VARCHAR(2) binary,
	`TICKET_NUM` VARCHAR(50) binary,
	`ORG_NUM` NUMERIC(19, 0),
	`DEPT_NUM` NUMERIC(19, 0),
	`ITEM_URL_OLD` VARCHAR(1000) binary,
	`ITEM_PURPOSE` VARCHAR(20) binary,
	`MALL_URL` VARCHAR(500) binary,
	`POSITION_IS_DISPLAY` VARCHAR(2) binary,
	`ITEM_PURPOSE_SHOW` VARCHAR(100) binary,
	`EXPIRATION_IS_DISPLAY` VARCHAR(2) binary,
	`NEW_ORG_NUM` VARCHAR(1000) binary,
	`LOGIN_TO_JUMP` VARCHAR(2) binary,
	`QUALIF_INVESTOR_JUMP` VARCHAR(2) binary,
	`SHELF_TYPE` VARCHAR(2) binary,
	`ITEM_NS_IS_DISPLAY` VARCHAR(2) binary,
	`SHELF_BROWSE_WAY` VARCHAR(2) binary,
	`SHELF_IS_CARIYSEL` VARCHAR(2) binary,
	`SHELF_CARIYSEL_TIME` VARCHAR(2) binary,
	`PROD_WITH_ENHANCED` VARCHAR(2) binary,
	`NAME_DESCRI_DISPLACE` VARCHAR(2) binary,
	`LIMIT_SHOW_BAR` VARCHAR(2) binary,
	`BUY_BUTTON_SHOW` VARCHAR(2) binary,
	`MOULD_CODE` VARCHAR(20) binary,
	`SPARE_MOULD_CODE` VARCHAR(20) binary,
	`MOULD_CALCULATE_DATE` DATETIME,
	`ITEM_SUPER_PURPOSE` VARCHAR(2) binary,
	`ANOTHER_BATCH` VARCHAR(2) binary,
	`BUY_BUTTON_URL` VARCHAR(500) binary,
	`ICON_AFTER_URL` VARCHAR(500) binary,
	`ICON_AFTER_ID` VARCHAR(100) binary,
	`ICON_AFTER_NAME` VARCHAR(100) binary,
	`ANOTHER_BATCH_WORD` VARCHAR(20) binary,
	`USER_RULE_ID` VARCHAR(500) binary,
	`BLACK_ICON_URL` VARCHAR(500) binary,
	`BLACK_ICON_ID` VARCHAR(100) binary,
	`BLACK_ICON_NAME` VARCHAR(100) binary,
	`BLACK_ICON_AFTER_URL` VARCHAR(500) binary,
	`BLACK_ICON_AFTER_ID` VARCHAR(100) binary,
	`BLACK_ICON_AFTER_NAME` VARCHAR(100) binary,
	`USER_RULE_ID_SPARE` VARCHAR(500) binary,
	`ITEM_UUID` VARCHAR(50) binary,
	`PC_LOGO_URL` VARCHAR(500) binary,
	`PC_LOGO_ID` VARCHAR(100) binary,
	`PC_LOGO_NAME` VARCHAR(100) binary,
	`PC_ITEM_URL` VARCHAR(500) binary,
	`SUP_NAME` VARCHAR(50) binary,
	`PROD_FEATURE_LABEL_ENHANCED` VARCHAR(200) binary,
	`RED_POINT_DISPLAY` VARCHAR(2) binary,
	`THIRD_ITEM_TYPE` VARCHAR(2) binary,
	`AUTO_SORT_IDENTIF` VARCHAR(2) binary,
	`RATE_TYPE` VARCHAR(40) binary,
	`VERSION_NUM` VARCHAR(100) binary,
	`VERSION_NUM_SHOW` VARCHAR(100) binary,
	`BOTTEM_FLOAT_STYLE` VARCHAR(2) binary,
	`FLOAT_WORD` VARCHAR(60) binary,
	`APP_FLOAT_URL` VARCHAR(500) binary,
	`JHW_FLOAT_URL` VARCHAR(500) binary,
	`PC_FLOAT_URL` VARCHAR(500) binary,
	`IS_ENABLE` VARCHAR(2) binary,
	`AGGREG_NAME` VARCHAR(20) binary,
	`AGGREG_REMARK` VARCHAR(200) binary,
	`SHARE_PIC_ON_MOBILE_ID` VARCHAR(200) binary,
	`SHARE_PIC_ON_MOBILE_SOURCE` VARCHAR(200) binary,
	`SHARE_PIC_ON_MOBILE_URL` VARCHAR(500) binary,
	`AUDIT_STATUS_SH` VARCHAR(2) binary,
	`YD_URL_NAME` VARCHAR(100) binary,
	`PC_URL_NAME` VARCHAR(100) binary,
	`JH_URL_NAME` VARCHAR(100) binary,
	`IS_FUNCTION` VARCHAR(2) binary,
	`FUNCTION_NAME` VARCHAR(100) binary,
	`SHARE_CODE` VARCHAR(16) binary,
	`SHARE_MINI_PROGRAM_WHETHER` VARCHAR(2) binary,
	`TEMPLATE_TYPE` VARCHAR(2) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`OUT_G2021_VIDEO_DOWNLOAD` (
	`VIDEO_ID` VARCHAR(255) binary comment ' 视频id ',
	`DATA_TIME` VARCHAR(20) binary comment ' 数据时间 ',
	`URL` VARCHAR(512) binary comment ' 视频url ',
	`TITLE` VARCHAR(255) binary comment ' 视频标题 ',
	`VIDEO_CODE` VARCHAR(255) binary comment ' 视频代码 ',
	`CREATE_TIME` VARCHAR(50) binary comment ' 创建时间 ',
	`STATUS` VARCHAR(2) binary comment '状态，0未下载，1下载成功',
	`SAVE_ADDRESS` VARCHAR(255) binary comment ' 保存地址  ',
	`FUND_CODE` VARCHAR(255) binary comment ' 产品代码 ',
	`TYPE` VARCHAR(2) binary comment '1:每季度同步的数据，2：每周同步的数据',
	`COVER_URL` VARCHAR(512) binary,
	`SHU_URL` VARCHAR(512) binary comment ' 竖版封面链接 ',
	`HENG_URL` VARCHAR(512) binary comment '横板封面',
	`SOURCE` VARCHAR(8) binary comment '来源'
);


create table if not exists `otc`.`GJ_G2020_FUND_CONVER_ORDER` (
	`BRANCH_NO` NUMERIC(5, 0) comment '分支机构',
	`CIF_ACCOUNT` VARCHAR(18) binary comment '一户通账户',
	`BUSIN_ACCOUNT` VARCHAR(18) binary comment '资金账户',
	`CLIENT_ID` VARCHAR(18) binary comment '应用系统客户编号',
	`FUND_CODE` VARCHAR(6) binary comment '转出基金',
	`FUND_COMPANY` VARCHAR(100) binary comment '基金公司代码',
	`TRANS_AMOUNT` VARCHAR(16) binary comment '转出份额',
	`TRANS_CODE` VARCHAR(6) binary comment '转入基金',
	`EXCEEDFLAG` VARCHAR(1) binary comment '巨额赎回标志',
	`REMARK` VARCHAR(255) binary comment '备注',
	`TGLJ_INFO` VARCHAR(255) binary comment '推广信息',
	`ENTRUST_NO` VARCHAR(8) binary comment '委托编号',
	`BUY_TIME` DATETIME comment '购买时间',
	`OP_REMARK` VARCHAR(2000) binary comment '业务状态',
	`BUSINESS_STATUS` VARCHAR(1) binary comment '成交编号',
	`BUSINESS_NO` VARCHAR(10) binary comment '成交编号',
	`INIT_DATE` NUMERIC(10, 0) comment '交易日期',
	`ENTRUST_BALANCE` NUMERIC(19, 2) comment '委托金额',
	`TSBZTYPE` VARCHAR(255) binary comment 'TSBZTYPE',
	`TSBZ` VARCHAR(255) binary comment 'TSBZ'
)
comment='基金转换订单';


create table if not exists `otc`.`GJ_OTC_CANCELL` (
	`ID` NUMERIC(20, 0) not null comment '主键ID',
	`INIT_DATE` NUMERIC(8, 0) not null comment '交易日期',
	`SERIAL_NO` NUMERIC(8, 0) not null comment '流水序号',
	`ALLOT_NO` VARCHAR(24) binary not null comment '申请编号',
	`CUST_NUM` VARCHAR(50) binary comment '客户编号',
	`FUND_ACCOUNT` VARCHAR(50) binary comment '资金账户',
	`CIF_ACCOUNT` VARCHAR(50) binary comment '一户通账户',
	`ORGID` NUMERIC(19, 0) comment '营业部代码',
	`CANCELL_TIME` DATETIME comment '撤单时间',
	`PRO_NAME` VARCHAR(50) binary comment '产品名称',
	`PRO_CODE` VARCHAR(50) binary comment '产品代码',
	`PRO_NUM` VARCHAR(50) binary comment '产品编号',
	`ENTRUST_BALANCE` NUMERIC(19, 2) comment '撤单金额',
	`ORDER_STATUS` VARCHAR(2) binary comment '订单状态',
	`CANCELL_SOURCE` CHAR(1) binary comment '撤单来源(1：转让市场  2：收益凭证)',
	`OTC_ACCOUNT` VARCHAR(50) binary comment '撤单数量',
	`BS_FLAG` VARCHAR(5) binary comment '买卖方向("买卖方向  HB0 意向买    HS0 意向卖 1B0 买成确认  1S0 卖成确认 OB0 定价买    OS0 定价卖 G10 报价回购  G11 报价续做  G30 提前购回  支持复选")',
	`SUB_BUSIN_ACCOUNT` VARCHAR(100) binary comment '子账号，只有在投顾otc下单的会有值',
	constraint `BIN$JRvB0lhz0lrgYAB/AQBj0w==$0` primary key (`ID`, `INIT_DATE`, `SERIAL_NO`, `ALLOT_NO`)
)
comment='买家撤单表';

create UNIQUE index `BIN$JRvB0lh80lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_CANCELL` (`ID` ASC, `INIT_DATE` ASC, `SERIAL_NO` ASC, `ALLOT_NO` ASC);


create table if not exists `otc`.`TABLE_MANAGE` (
	`TABLE_CHINESE_NAME` VARCHAR(255) binary comment ' 表中文名 ',
	`TABLE_ENGLISH_NAME` VARCHAR(255) binary not null comment ' 英文名 ',
	`LEAD_CADRE` VARCHAR(500) binary comment ' 负责人 ',
	`GENRE` VARCHAR(500) binary comment ' 分类 ',
	`DESCRIBE` VARCHAR(2000) binary comment ' 描述 ',
	`CREATE_TIME` DATETIME comment ' 创建时间 ',
	`UPD_TIME` DATETIME comment ' 更新时间 ',
	`SOURCE` VARCHAR(255) binary comment ' 来源 ',
	`USER_ID` VARCHAR(255) binary comment ' 数据库用户 ',
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	constraint `BIN$JRvB0mBr0lrgYAB/AQBj0w==$0` primary key (`TABLE_ENGLISH_NAME`)
);

create UNIQUE index `BIN$JRvB0mBs0lrgYAB/AQBj0w==$0` on `otc`.`TABLE_MANAGE` (`TABLE_ENGLISH_NAME` ASC);


create table if not exists `otc`.`GJ_OTC_SIGN_LS` (
	`ID` NUMERIC(19, 0) not null,
	`CUST_NUM` VARCHAR(50) binary,
	`SIGN_TYPE` CHAR(1) binary,
	`CONTENT` VARCHAR(50) binary,
	`CODE` VARCHAR(50) binary,
	`STATUS` CHAR(1) binary,
	`SIGN_DATE` NUMERIC(8, 0),
	`USER_CODE` VARCHAR(18) binary,
	`CID` VARCHAR(20) binary,
	`TEL_NUM` VARCHAR(20) binary,
	constraint `BIN$JRvB0llP0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='签到流水表';

create UNIQUE index `BIN$JRvB0llS0lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_SIGN_LS` (`ID` ASC);

create index `BIN$JRvB0llR0lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_SIGN_LS` (`CID` ASC);


create table if not exists `otc`.`GJ_G9010_PRO_CHANGE_LST` (
	`REC_GEN_TIME` DATETIME(6),
	`REC_UPD_TIME` DATETIME(6),
	`DEMAND_NUM` NUMERIC(19, 0) not null,
	`PROJECT_NUM` VARCHAR(30) binary,
	`DEMAND_TITLE` VARCHAR(100) binary,
	`DEMAND_TYPE` VARCHAR(1) binary,
	`DEMAND_DESCRIBE1` VARCHAR(4000) binary,
	`DEMAND_REMARK` VARCHAR(2000) binary,
	`DEMAND_STATUS` VARCHAR(1) binary,
	`EXP_BEGIN_DATE` DATETIME,
	`EXP_END_DATE` DATETIME,
	`ACT_BEGIN_DATE` DATETIME,
	`ACT_END_DATE` DATETIME,
	`DEMAND_LEADER` VARCHAR(30) binary,
	`DEMAND_DESCRIBE` LONGTEXT,
	`IDENTIFY_ID` VARCHAR(100) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	constraint `BIN$JRvB0ld60lrgYAB/AQBj0w==$0` primary key (`DEMAND_NUM`)
);

create UNIQUE index `BIN$JRvB0ld70lrgYAB/AQBj0w==$0` on `otc`.`GJ_G9010_PRO_CHANGE_LST` (`DEMAND_NUM` ASC);


create table if not exists `otc`.`GJ_LOTTERY_LS_OLD` (
	`CUST_NUM` VARCHAR(20) binary comment '客户代码',
	`USER_CODE` VARCHAR(18) binary comment '用户代码',
	`CIF_ACCOUNT` VARCHAR(20) binary comment '一户通账号',
	`PROJECT_ID` VARCHAR(20) binary comment '项目ID',
	`PRIZE_NAME` VARCHAR(50) binary comment '奖品',
	`AWARD_FLAG` NUMERIC(1, 0) comment '奖品标识',
	`LOTTERY_AMOUNT` NUMERIC(8, 0) comment '中奖数量',
	`LOTTERY_TIME` DATETIME comment '抽奖日期',
	`PHONE_NUM` VARCHAR(20) binary comment '手机号码',
	`BIZ_TIME` DATETIME comment '业务日期',
	`SHARE_FLAG` VARCHAR(10) binary comment '共享区分'
)
comment='抽奖流水表';


create table if not exists `otc`.`GJ_G2010_NEWMALL_ORDERS` (
	`ID` NUMERIC(19, 0) not null,
	`INIT_DATE` NUMERIC(10, 0),
	`SERIAL_NO` NUMERIC(12, 0),
	`ALLOT_NO` VARCHAR(50) binary,
	`CUST_NUM` VARCHAR(50) binary,
	`FUND_ACCOUNT` VARCHAR(50) binary,
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`ORGID` NUMERIC(19, 0),
	`BUY_TIME` DATETIME,
	`PRO_NAME` VARCHAR(100) binary,
	`PRO_CODE` VARCHAR(50) binary,
	`PRO_NUM` VARCHAR(50) binary,
	`ENTRUST_BALANCE` NUMERIC(19, 2),
	`ORDER_STATUS` VARCHAR(2) binary,
	`CID_SOURCE` VARCHAR(24) binary,
	`TYPE` CHAR(1) binary,
	`RESERVED` CHAR(1) binary,
	`REMARK` VARCHAR(500) binary,
	`BATCH_NO` VARCHAR(100) binary,
	`TGLJ_INFO` VARCHAR(2000) binary,
	`REGTEL` VARCHAR(13) binary,
	`UPDATE_TIME` DATETIME,
	`MATCHAMT` NUMERIC(22, 4),
	`UP_REMARK` VARCHAR(50) binary,
	`NAV` NUMERIC(22, 4),
	`MATCHQTY` NUMERIC(22, 4),
	`OUTBIZSNO` VARCHAR(512) binary,
	`TRADE_TYPE` VARCHAR(2) binary,
	`TSBZTYPE` VARCHAR(255) binary,
	`TSBZ` VARCHAR(255) binary,
	`QW_SRCNO` VARCHAR(100) binary default '',
	constraint `BIN$JRvB0lXo0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='基金订单表';

create UNIQUE index `BIN$JRvB0lXp0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2010_NEWMALL_ORDERS` (`ID` ASC);


create table if not exists `otc`.`GJ_G2010_PROD_SELL_VOLUME_INFO` (
	`SELL_YEAR` VARCHAR(10) binary not null,
	`SELL_MONTH` VARCHAR(10) binary not null,
	`GMJJ_SELL` NUMERIC(19, 0),
	`ZG_SELL` NUMERIC(19, 0),
	`THB1_SELL` NUMERIC(19, 0),
	`THB2_SELL` NUMERIC(19, 0),
	`NJYH_SELL` NUMERIC(19, 0),
	`XYYH_SELL` NUMERIC(19, 0),
	`XK_SELL` NUMERIC(19, 0)
)
comment='理财频道产品销量统计表';


create table if not exists `otc`.`GJ_MON_PRO_NAV` (
	`PROD_CODE` VARCHAR(30) binary not null,
	`PROD_NAME` VARCHAR(100) binary,
	`NAV_DATE` VARCHAR(8) binary,
	`NEW_NAV` NUMERIC(19, 6),
	`BUY_STATUS` VARCHAR(2) binary,
	`INVEST_TYPE` VARCHAR(30) binary,
	`MON_DATE` DATETIME
);


create table if not exists `otc`.`GJ_G2010_DT_SERIAL_DATA` (
	`ID` NUMERIC(19, 0) not null comment '主键ID',
	`SERIAL_NO` VARCHAR(50) binary comment '流水序号',
	`BUSINESS_STATUS` VARCHAR(1) binary comment '订单状态("0"未处理 "1"处理中 "2"成功 "3"失败)',
	`BUSINESS_NO` VARCHAR(50) binary comment '委托编号',
	`ENTRUST_DATE` VARCHAR(10) binary comment '处理日期',
	`BUSIN_ACCOUNT` VARCHAR(18) binary comment '资金账户',
	`FUND_CODE` VARCHAR(6) binary comment '基金代码',
	`FUND_DATE` VARCHAR(10) binary comment '资金返还日(每月扣款日)',
	`BEGIN_DATE` VARCHAR(10) binary comment '起始日期',
	`END_DATE` VARCHAR(10) binary comment '到期日期',
	`BALANCE` VARCHAR(16) binary comment '发生金额',
	`ACTION_MODE` VARCHAR(1) binary comment '动作类型',
	`RATION_KIND` VARCHAR(1) binary comment '定投类型',
	`ORDER_STATUS` VARCHAR(1) binary not null comment '操作状态("1"下单 "2"销户)',
	`CUST_NUM` VARCHAR(50) binary comment '客户编号',
	`CIF_ACCOUNT` VARCHAR(50) binary comment '一户通账户',
	`ORGID` VARCHAR(19) binary comment '营业部代码',
	`REC_GEN_TIME` DATETIME(6) comment '记录生成时间',
	`OP_REMARK` VARCHAR(500) binary comment '操作备注',
	`PAYORGAN_ID` VARCHAR(20) binary comment '支付机构编号',
	`BANK_NO` VARCHAR(20) binary comment '银行代码',
	`BANK_ACCOUNT` VARCHAR(50) binary comment '银行账号',
	`FIXED_TYPE` VARCHAR(1) binary comment '定投类型( 1：普通定投 2：跨行定投 3:策略定 4：预约入金 5：工资理财)',
	`BANK_NAME` VARCHAR(100) binary comment '银行名称',
	`TGLJ_INFO` VARCHAR(2000) binary comment '推广信息',
	`REGTEL` VARCHAR(13) binary comment '注册手机号码',
	`MATCH_AMT` NUMERIC(22, 7) comment '成交金额',
	`ORDER_AMT` NUMERIC(22, 0) comment '委托金额',
	`MOBILE` VARCHAR(255) binary comment '手机号',
	`NAME` VARCHAR(255) binary comment '姓名',
	`CUST_MANAGER` VARCHAR(255) binary comment 'CUST_MANAGER',
	`OPEN_TIME` NUMERIC(16, 0) comment 'OPEN_TIME',
	`DEP_NAME` VARCHAR(255) binary comment '分公司',
	`ORG_NAME` VARCHAR(255) binary comment '机构名称',
	`BUY_TIME` NUMERIC(16, 0) comment '购买时间',
	`BUY_DATE` NUMERIC(16, 0) comment '购买日期',
	`ORDER_CNT` NUMERIC(16, 0) comment '委托次数',
	`UPDATE_TIME` DATETIME,
	`TGLJ_USERCODE` VARCHAR(100) binary comment '推广usercode',
	`TGLJ_ACTIVITYCODE` VARCHAR(100) binary comment '活动码',
	`TGLJ_CHANNEL` VARCHAR(100) binary comment '渠道码类型',
	`TGLJ_CHANNELID` VARCHAR(100) binary comment '渠道码',
	`TGLJ_FUNCTYPE` VARCHAR(100) binary comment '功能吗类型',
	`TGLJ_FUNCID` VARCHAR(100) binary comment '功能码',
	`TGLJ_MATTYPE` VARCHAR(100) binary comment '素材码类型',
	`TGLJ_MATID` VARCHAR(100) binary comment '素材码',
	`TGLJ_CODE` VARCHAR(100) binary comment '推广人工号',
	`TGLJ_WORKID` VARCHAR(100) binary comment '手输工号',
	`TGLJ_UPDATE_TIME` DATETIME comment '推广码更新时间',
	`TGLJ_UPDATE_STATUS` VARCHAR(2) binary comment '推广信息更新状态',
	constraint `BIN$JRvB0lVV0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='理财频道定投流水表';

create UNIQUE index `BIN$JRvB0lVW0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2010_DT_SERIAL_DATA` (`ID` ASC);


create table if not exists `otc`.`GJ_G1080_NUMBER_GIFT_DATA` (
	`ID` NUMERIC(19, 0) not null comment '主键ID',
	`ORDER_NO` VARCHAR(32) binary comment '订单编号',
	`CUST_CODE` VARCHAR(50) binary comment '客户代码',
	`TEL` VARCHAR(32) binary comment '手机号',
	`CIFT_NUMBER` NUMERIC(19, 0) comment '君元宝数量',
	`GIFT_TIME` DATETIME comment '日期',
	`ORDER_AMOUNT` VARCHAR(19) binary comment '订单金额',
	`MESSAGE` VARCHAR(500) binary comment '错误信息',
	constraint `BIN$JRvB0lUd0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='评价有礼积分 ';

create UNIQUE index `BIN$JRvB0lUe0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G1080_NUMBER_GIFT_DATA` (`ID` ASC);


create table if not exists `otc`.`GJ_G2019_MARKETING_RULES` (
	`ID` VARCHAR(8) binary,
	`MARKETING_RULE_ID` VARCHAR(16) binary,
	`MARKETING_RULE_NAME` VARCHAR(16) binary,
	`MARKETING_RULE_REMARK` VARCHAR(16) binary,
	`CREATE_TIME` VARCHAR(8) binary,
	`CREATE_PERSONNEL` VARCHAR(16) binary,
	`EFFECT_SCENE_TYPE` VARCHAR(2) binary,
	`UPD_TIME` VARCHAR(16) binary,
	`UPD_PERSONNEL` VARCHAR(16) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_G2050_FUNCTION_LIST` (
	`TYPE` VARCHAR(100) binary not null,
	`FUNCTION_ID` VARCHAR(100) binary not null,
	`FUNCTION_NAME` VARCHAR(100) binary,
	`T2_FUNCTION_REMARK` VARCHAR(200) binary,
	`REMARK` VARCHAR(2000) binary,
	`FUNCTION_TYPE` VARCHAR(100) binary,
	`REC_GEN_TIME` DATETIME(0),
	`REC_UPD_TIME` DATETIME(0),
	`VERSION_REMARK` VARCHAR(2) binary
)
comment='接口一览';


create table if not exists `otc`.`GJ_G1080_COMMENT_GIFT_DATA` (
	`ID` NUMERIC(19, 0) not null comment '主键ID',
	`PROD_NAME` VARCHAR(32) binary comment '产品名称',
	`ORDER_NO` VARCHAR(32) binary comment '订单编号',
	`ORDER_ACCOUNT` VARCHAR(18) binary comment '订单额度',
	`ORDER_DATE` DATETIME comment '订单日期',
	`COMMENT_STARS` VARCHAR(50) binary default NULL comment '评价星级(1~5)',
	`IMPRESS_LABEL` VARCHAR(100) binary comment '印象标签',
	`COMMENT_CONTENT` VARCHAR(500) binary comment '评价内容',
	`COMMENT_DATE` DATETIME comment '评价日期',
	`CID` VARCHAR(33) binary comment '评价来源',
	`COMMENT_STATUS` VARCHAR(34) binary default NULL comment '评价状态(‘1’:添加 ‘2’：撤单)',
	`ORDER_TYPE` VARCHAR(32) binary comment '订单类型',
	constraint `BIN$JRvB0lUZ0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='评价有礼流水数据 ';

create UNIQUE index `BIN$JRvB0lUa0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G1080_COMMENT_GIFT_DATA` (`ID` ASC);


create table if not exists `otc`.`FUND_MNG_INFO_SH` (
	`PERSONNAME` VARCHAR(100) binary,
	`PERSONNAME_PY` VARCHAR(100) binary,
	`PERSONCODE` VARCHAR(50) binary,
	`SEX` VARCHAR(4) binary,
	`DEGREE` VARCHAR(80) binary,
	`IMAGE_NAME` VARCHAR(50) binary,
	`IMAGE_URL` VARCHAR(200) binary,
	`IMAGE_EDIT_ID` VARCHAR(100) binary,
	`IMAGE_EDIT_NAME` VARCHAR(100) binary,
	`IMAGE_EDIT_URL` VARCHAR(200) binary,
	`PERSONAL_IMAGE_ID` VARCHAR(100) binary,
	`PERSONAL_IMAGE_NAME` VARCHAR(100) binary,
	`PERSONAL_IMAGE_URL` VARCHAR(200) binary,
	`BIRTHDATE` VARCHAR(50) binary,
	`DK_CERTIFICATION` VARCHAR(255) binary,
	`PERSON_LABEL` VARCHAR(255) binary,
	`MNG_TITLE` VARCHAR(100) binary,
	`COMPANYNAME` VARCHAR(200) binary,
	`COMPANYCODE` VARCHAR(50) binary,
	`SUP_NAME` VARCHAR(255) binary,
	`PRO_PROVIDER` VARCHAR(50) binary,
	`RESUME` LONGTEXT,
	`RESUME_EDIT` LONGTEXT,
	`INVEST_STRATEGY` LONGTEXT,
	`MANAGE_SCALE` VARCHAR(50) binary,
	`NATUREPOSTYEAR` VARCHAR(20) binary,
	`YIELDSINCES` VARCHAR(20) binary,
	`CIRCLE_COMPETENCY` VARCHAR(1000) binary,
	`UPDATE_DATE` DATETIME,
	`UPDATE_PERSONNEL` VARCHAR(50) binary,
	`AUDIT_STATUS` VARCHAR(10) binary comment '审核状态审核状态(1、审核通过 2、待审核  3、审核不通过)',
	`AWARD_INF` VARCHAR(500) binary,
	`TRD_CODE` VARCHAR(20) binary,
	`SELL_FLAG` VARCHAR(10) binary,
	`RECOMMEND_FLAG` VARCHAR(10) binary,
	`RECOMMEND_PRIORITY` NUMERIC(65, 30),
	`VIDEO_URL` VARCHAR(200) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`CUST_INFO_BASE` (
	`CUST_ID` VARCHAR(20) binary,
	`REAL_NAME` VARCHAR(100) binary,
	`BIRTHDAY` NUMERIC(65, 30),
	`SEX` CHAR(1) binary,
	`ASSET` NUMERIC(65, 30),
	`MOBILE` VARCHAR(200) binary,
	`BRHID` CHAR(4) binary,
	`CARD_NUM` VARCHAR(50) binary,
	`EMAIL` VARCHAR(50) binary,
	`FUND_ID` VARCHAR(100) binary,
	`OPEN_TIME` NUMERIC(20, 0),
	`ADDRESS` VARCHAR(500) binary
);


create table if not exists `otc`.`GJ_OTC_SIGN_SECOND_LS` (
	`ID` NUMERIC(19, 0) not null,
	`USER_CODE` VARCHAR(18) binary,
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`FUND_ACCOUNT` VARCHAR(50) binary,
	`SIGN_TYPE` VARCHAR(10) binary,
	`CONTENT` VARCHAR(10) binary,
	`SIGN_DATE` NUMERIC(8, 0),
	`SIGN_MONTH` VARCHAR(10) binary,
	`CID` VARCHAR(50) binary,
	`CUST_NUM` VARCHAR(50) binary
)
comment='签到二期流水表';


create table if not exists `otc`.`GJ_G2010_PROD_SET_WHINFO_TEMP` (
	`WHINFO_ID` NUMERIC(65, 30),
	`PROD_CODE` VARCHAR(10) binary,
	`PROD_NAME` VARCHAR(50) binary,
	`ASSET_ID` NUMERIC(65, 30),
	`VIEWPOINT` VARCHAR(2000) binary,
	`PROD_RATE` VARCHAR(5) binary,
	`PRIORITY` NUMERIC(3, 0),
	`UPD_TIME` VARCHAR(50) binary,
	`UPD_PERSONNEL` VARCHAR(20) binary,
	`SET_CODE` VARCHAR(10) binary,
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`CREATE_TIME` VARCHAR(50) binary,
	`TRANSFERWH_ID` NUMERIC(65, 30),
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_INDEX_FLUCTUATE_MANAGER` (
	`NAME` VARCHAR(64) binary comment '基金经理名称',
	`INDEX_DES` VARCHAR(500) binary comment '指数介绍',
	`UPLOAD_TIME` VARCHAR(16) binary comment '更新时间',
	`IMG_URL` VARCHAR(512) binary comment '基金经理头像url地址',
	`IMG_NAME` VARCHAR(255) binary comment '基金经理头像名称',
	`IMG_ID` VARCHAR(128) binary comment '基金经理头像id',
	`CREATE_PERSONNEL` VARCHAR(36) binary comment '创建人',
	`UPD_PERSONNEL` VARCHAR(36) binary comment '更新人',
	`ID` VARCHAR(20) binary not null comment '主键id',
	`MNG_TITLE` VARCHAR(255) binary comment '基金经理头衔',
	`TITLE` VARCHAR(512) binary comment '观点标题',
	`DESCRIBE` VARCHAR(1000) binary comment '观点描述',
	`INDEX_ID` VARCHAR(20) binary comment '指数挺举id',
	`PSN_ID` VARCHAR(20) binary comment '基金经理id',
	`MANUAL_TYPE` VARCHAR(2) binary comment '自定义头像 1:是，2：否',
	`OCCUPATION_NO` VARCHAR(64) binary comment '执业编号',
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP comment '创建时间',
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP comment '更新时间',
	constraint `BIN$JRvB0le10lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='指数挺举指数投教';

create UNIQUE index `BIN$JRvB0le20lrgYAB/AQBj0w==$0` on `otc`.`GJ_INDEX_FLUCTUATE_MANAGER` (`ID` ASC);


create table if not exists `otc`.`GJ_WORK_PERSON_INFO` (
	`STAFF_NAME` VARCHAR(20) binary comment '1:人力  2:项目',
	`TYPE` VARCHAR(2) binary
);


create table if not exists `otc`.`GJ_OTC_MALLTRADE_STOCKTRADE_LS` (
	`ID` NUMERIC(19, 0) not null,
	`CUST_NUM` VARCHAR(20) binary not null,
	`USER_CODE` VARCHAR(18) binary,
	`CIF_ACCOUNT` VARCHAR(20) binary,
	`FUND_ACCOUNT` VARCHAR(20) binary,
	`ENTRUST_BS` VARCHAR(10) binary,
	`STOCK_NAME` VARCHAR(20) binary,
	`STOCK_CODE` VARCHAR(20) binary,
	`STOCK_AMOUNT` VARCHAR(20) binary,
	`PRICE` VARCHAR(10) binary,
	`AMOUNT` VARCHAR(50) binary,
	`TRADE_DATE` VARCHAR(8) binary,
	`TRADE_TIME` VARCHAR(8) binary,
	`ENTRUST_NO` VARCHAR(20) binary,
	`ENTRUST_STATUS` VARCHAR(10) binary default 2,
	`ENTRUST_PROP` VARCHAR(10) binary default NULL
)
comment='股票/ETF/分级基金委托流水';


create table if not exists `otc`.`GJ_G2020_REDEEM_ORDERS` (
	`PROD_CODE` VARCHAR(20) binary comment '产品代码',
	`CUST_NUM` VARCHAR(40) binary comment '客户代码',
	`FUND_ACCOUNT` VARCHAR(40) binary comment '资金账号',
	`CIF_ACCOUNT` VARCHAR(40) binary comment '一户通账户',
	`DEP_NAME` VARCHAR(40) binary comment '分公司',
	`ORG_NAME` VARCHAR(40) binary comment '营业部代码',
	`REDEEM_BALANCE` NUMERIC(65, 30) comment '赎回份额',
	`REDEEM_FLAG` VARCHAR(2) binary comment '巨额赎回标志',
	`SERIAL_NO` VARCHAR(40) binary comment '流水号',
	`ENTRUST_NO` VARCHAR(40) binary comment '委托编号',
	`ENTRUST_DATE` VARCHAR(40) binary comment '委托日期',
	`BUSS_STATUS` VARCHAR(2) binary comment '业务状态 0未处理 1处理中 2成功 3失败',
	`OPER_TYPE` VARCHAR(2) binary comment '操作类型  1.赎回2.预约赎回',
	`BRANCH_NO` NUMERIC(5, 0) comment '分支机构',
	`PROD_NAME` VARCHAR(40) binary comment '产品名称',
	`PROD_TYPE` VARCHAR(40) binary comment '产品类型',
	`PROD_CHILD_TYPE` VARCHAR(10) binary comment '产品子类型',
	`TSBZTYPE` VARCHAR(255) binary comment 'TSBZTYPE',
	`TSBZ` VARCHAR(255) binary comment 'TSBZ',
	`SERIALNO` NUMERIC(65, 30) comment '自增序列，只用作同步ob'
)
comment='赎回订单信息';


create table if not exists `otc`.`GJ_G2019_RULES_PROD` (
	`ID` VARCHAR(16) binary,
	`PROD_CODE` VARCHAR(64) binary comment '产品代码',
	`PROD_NAME` VARCHAR(64) binary comment '产品名称',
	`MARKETING_RULE_ID` VARCHAR(16) binary,
	`MARKETING_RULE_NAME` VARCHAR(128) binary,
	`PROD_TYPE` VARCHAR(2) binary comment '产品类型代码',
	`PROD_TYPE_CHILD` VARCHAR(16) binary comment '产品子类代码',
	`PROD_TYPE_CHILD_NAME` VARCHAR(128) binary comment '产品子类名称',
	`PROD_TYPE_NAME` VARCHAR(128) binary comment '产品类型名称',
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`PROD_INVEST_MODULE_CODE_MIDDLE` (
	`TRADEDATE` NUMERIC(19, 0),
	`MODULE_CODE` VARCHAR(20) binary not null,
	`MODULE_NAME` VARCHAR(20) binary not null,
	`ITEM_CODE` VARCHAR(20) binary,
	`UPDATE_PERSONNEL` VARCHAR(20) binary,
	`UPDATE_DATE` DATETIME,
	`ADD_STATUS` VARCHAR(2) binary,
	`IMAGE_URL` VARCHAR(500) binary,
	`IMAGE_ID` VARCHAR(100) binary,
	`IMAGE_NAME` VARCHAR(100) binary,
	`MODULE_EXPLAIN` VARCHAR(1000) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`CUSTPROD_RECOMMEND_ALG` (
	`CONT_REC_ALG_NO` VARCHAR(50) binary,
	`CONT_REC_ALG_NAME` VARCHAR(255) binary
);


create table if not exists `otc`.`OFORDER_240039` (
	`SERVERID` VARCHAR(20) binary not null,
	`OPERDATE` VARCHAR(20) binary,
	`OPERTIME` VARCHAR(20) binary,
	`ORDERDATE` VARCHAR(20) binary not null,
	`SNO` VARCHAR(20) binary not null,
	`CUSTID` NUMERIC(19, 0),
	`ORGID` NUMERIC(19, 0),
	`FUNDID` NUMERIC(19, 0),
	`BRHID` NUMERIC(19, 0),
	`TRANSACC` VARCHAR(20) binary,
	`OFCODE` VARCHAR(20) binary,
	`OFNAME` VARCHAR(20) binary,
	`TAACC` VARCHAR(200) binary,
	`TACODE` NUMERIC(19, 0),
	`TRDID` NUMERIC(19, 0),
	`CANCELFLAG` VARCHAR(2) binary,
	`STATUS` VARCHAR(2) binary,
	`DEALFLAG` VARCHAR(2) binary,
	`ERRINFO` VARCHAR(20) binary,
	`NAME` VARCHAR(20) binary,
	`ACCTYPE` VARCHAR(2) binary,
	`CUSTKIND` VARCHAR(2) binary,
	`CUSTGROUP` VARCHAR(2) binary,
	`FUNDKIND` VARCHAR(2) binary,
	`FUNDLEVEL` VARCHAR(2) binary,
	`FUNDGROUP` VARCHAR(2) binary,
	`BANKCODE` VARCHAR(20) binary,
	`MONEYTYPE` VARCHAR(2) binary,
	`ORDERQTY` NUMERIC(19, 2),
	`ORDERAMT` NUMERIC(19, 2),
	`ORDERPRICE` NUMERIC(19, 4),
	`REDEEMTYPE` VARCHAR(2) binary,
	`PREDATE` VARCHAR(20) binary,
	`HAVEMATCHQTY` NUMERIC(19, 2),
	`FRONTFEE` NUMERIC(19, 2),
	`BACKFEE` NUMERIC(19, 2),
	`CONFIRMEDAMT` NUMERIC(19, 2),
	`OTHEROFCODE` VARCHAR(200) binary,
	`OTHERTAACC` VARCHAR(200) binary,
	`OTHERTRANSACC` VARCHAR(200) binary,
	`OTHERORGID` VARCHAR(20) binary,
	`OTHERDBTID` VARCHAR(20) binary,
	`DIVIDMETHOD` VARCHAR(20) binary,
	`DIVIDRATIO` NUMERIC(19, 6),
	`DISCRATIO` NUMERIC(19, 8),
	`OLDSN` VARCHAR(200) binary,
	`OLDOPERDATE` VARCHAR(20) binary,
	`SHARECLASS` VARCHAR(2) binary,
	`TAVOUCHER` VARCHAR(200) binary,
	`FRZREASON` VARCHAR(2) binary,
	`FRZPERIOD` VARCHAR(20) binary,
	`OTHERSN` VARCHAR(200) binary,
	`VALIDDAYS` NUMERIC(19, 0),
	`AGENTID` VARCHAR(20) binary,
	`OPERID` VARCHAR(20) binary,
	`OPERWAY` VARCHAR(2) binary,
	`OPERORG` VARCHAR(20) binary,
	`OPERLEVEL` VARCHAR(2) binary,
	`NETADDR` VARCHAR(300) binary,
	`CHKOPER` VARCHAR(20) binary,
	`AGENTOPER` VARCHAR(20) binary,
	`REMARK` VARCHAR(200) binary,
	`DEALFLAG_OWN` VARCHAR(2) binary,
	constraint `BIN$JRvB0l980lrgYAB/AQBj0w==$0` primary key (`ORDERDATE`, `SNO`, `SERVERID`)
);

create UNIQUE index `BIN$JRvB0l990lrgYAB/AQBj0w==$0` on `otc`.`OFORDER_240039` (`ORDERDATE` ASC, `SNO` ASC, `SERVERID` ASC);


create table if not exists `otc`.`G_P_USER_JZJY_OFORDER` (
	`OPENTIME` VARCHAR(12) binary comment '发生时间',
	`ORDERDATE` VARCHAR(12) binary comment '委托交易日期',
	`CUSTID` VARCHAR(100) binary comment '客户代码',
	`FUNDID` VARCHAR(100) binary comment '资金帐号',
	`ORGID` VARCHAR(100) binary comment '机构编码',
	`BRHID` VARCHAR(100) binary comment '机构分支',
	`OFCODE` VARCHAR(100) binary comment '基金代码',
	`OFNAME` VARCHAR(100) binary comment '基金名称',
	`ORDERAMT` VARCHAR(100) binary comment '委托金额',
	`ORDERQTY` VARCHAR(100) binary comment '委托数量',
	`TRDID` VARCHAR(100) binary comment 'TRDID',
	`OPERWAY` VARCHAR(255) binary comment '操作方式',
	`SNO` VARCHAR(255) binary comment '交易请求流水号',
	`UPDATETIME` DATETIME comment '更新时间',
	`SENDDATE` VARCHAR(32) binary comment '消费发送日期',
	`SENDTIME` VARCHAR(32) binary comment '消息发送时间',
	`MSG_ID` VARCHAR(255) binary comment '消息ID',
	`DATAID` VARCHAR(20) binary comment 'DATAID'
)
comment='用户集中交易订单';


create table if not exists `otc`.`GJ_2019_MALL_WORK_STATISTICS` (
	`ID` NUMERIC(65, 30) not null,
	`FUNC_TYP` VARCHAR(30) binary,
	`FUNCTION` VARCHAR(200) binary,
	`STATUS` VARCHAR(10) binary,
	`WORKLOAD` NUMERIC(65, 30),
	`PV` NUMERIC(65, 30),
	`UV` NUMERIC(65, 30),
	`PERMEABILITY` VARCHAR(8) binary,
	`RETENTION_RATE` VARCHAR(8) binary,
	`ORDER_CNT` NUMERIC(65, 30),
	`ORDER_AMT` NUMERIC(65, 30),
	`PARTIC_CNT` NUMERIC(65, 30),
	`REMARK` VARCHAR(4000) binary,
	`WORK_TIME` VARCHAR(20) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	constraint `BIN$JRvB0lS/0lrgYAB/AQBj0w==$0` primary key (`ID`)
);

create UNIQUE index `BIN$JRvB0lTA0lrgYAB/AQBj0w==$0` on `otc`.`GJ_2019_MALL_WORK_STATISTICS` (`ID` ASC);


create table if not exists `otc`.`GJ_G2010_KNOWLEDGE_BASE` (
	`ID` VARCHAR(8) binary,
	`KNOWLEDGE_NAME` VARCHAR(50) binary,
	`KNOWLEDGE_CONTENT` VARCHAR(500) binary,
	`KNOWLEDGE_DESCRIBE` VARCHAR(200) binary,
	`ABOUT_MODULE` VARCHAR(200) binary,
	`UPDATE_TIME` DATETIME,
	`UPDATE_PERSON` VARCHAR(20) binary,
	`CREATE_TIME` DATETIME,
	`CREATE_PERSON` VARCHAR(20) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_OTC_REPORT_XK_TRADE_CNT` (
	`YMD` VARCHAR(8) binary not null comment '日期',
	`CNT1` NUMERIC(19, 0),
	`CNT2` NUMERIC(19, 0),
	`CNT3` NUMERIC(19, 0),
	`CNT4` NUMERIC(19, 0),
	`CNT5` NUMERIC(19, 0),
	`CNT6` NUMERIC(19, 0),
	`CNT7` NUMERIC(19, 0),
	`CNT8` NUMERIC(19, 0),
	`CNT9` NUMERIC(19, 0),
	`CNT10` NUMERIC(19, 0),
	`CNT11` NUMERIC(19, 0),
	`CNT12` NUMERIC(19, 0),
	`CNT13` NUMERIC(19, 2),
	`CNT14` NUMERIC(19, 2),
	`CNT15` NUMERIC(19, 2),
	`CNT16` NUMERIC(19, 2),
	`CNT17` NUMERIC(19, 2),
	`CNT18` NUMERIC(19, 2),
	`CNT19` NUMERIC(19, 2),
	`CNT20` NUMERIC(19, 2),
	`CNT21` NUMERIC(19, 2),
	`CNT22` NUMERIC(19, 2),
	`CNT23` NUMERIC(19, 2),
	`CNT24` NUMERIC(19, 2)
)
comment='新客各产品销量统计';


create table if not exists `otc`.`GJ_G2010_PROD_TYPE_CHILD_INFO` (
	`PROD_TYPE` VARCHAR(2) binary,
	`PROD_TYPE_CHILD` VARCHAR(10) binary,
	`PROD_TYPE_CHILD_NAME` VARCHAR(255) binary,
	`PRIORITY` VARCHAR(10) binary
);


create table if not exists `otc`.`GJ_PROD_JH_PAGE_STAT_ALL` (
	`TRADEDATE` NUMERIC(65, 30) not null,
	`ITEM_NAME` VARCHAR(128) binary,
	`ITEM_CODE` VARCHAR(128) binary,
	`ITEM_TYPE` VARCHAR(128) binary,
	`PROVINCES` VARCHAR(128) binary,
	`SEX` VARCHAR(128) binary,
	`AGE_SEGMENT` VARCHAR(128) binary,
	`QTY` NUMERIC(65, 30),
	`QTY_ALL` NUMERIC(65, 30),
	`ANT_ALL` NUMERIC(65, 30),
	`ITEM_TYPE_SUPER` VARCHAR(128) binary,
	`ITEM_CODE_SUPER` VARCHAR(128) binary,
	`CNT` NUMERIC(65, 30)
);


create table if not exists `otc`.`JY_FUND_MANAGER_RULE` (
	`ID` NUMERIC(20, 0) not null,
	`JYFM_CODE` VARCHAR(20) binary,
	`RULE_CODE` VARCHAR(20) binary,
	`DESC_START` NUMERIC(8, 0),
	`BOLT_NUM` NUMERIC(8, 0),
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`CREATE_TIME` DATETIME,
	`UPDATE_TIME` DATETIME,
	`UPDATE_PERSONNEL` VARCHAR(20) binary
);


create table if not exists `otc`.`GJ_G2060_CUST_INFO` (
	`USERABLE_MONEY` VARCHAR(2) binary,
	`RISK_TYPE` VARCHAR(2) binary comment '1.0~1000 2.1000~50000  3.50000'
);


create table if not exists `otc`.`LCODER_TABLES_RECORD_SQL` (
	`ID` VARCHAR(255) binary not null,
	`TABLE_NAME` VARCHAR(64) binary,
	`OWNER` VARCHAR(16) binary,
	`INDEX_ID` VARCHAR(255) binary,
	`EXECUTE_SQL` VARCHAR(512) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`OPERATOR_PERSON` VARCHAR(16) binary,
	`OPERATOR_TYPE` VARCHAR(2) binary,
	`EXCUTE_STATUS` VARCHAR(2) binary comment '审核表删除标志位: 删除标志设1, 删除审核执行删除: 标志1+表名',
	`IS_DELETED` VARCHAR(2) binary default 0,
	constraint `BIN$JRvB0lx40lrgYAB/AQBj0w==$0` primary key (`ID`)
);

create UNIQUE index `BIN$JRvB0lx50lrgYAB/AQBj0w==$0` on `otc`.`LCODER_TABLES_RECORD_SQL` (`ID` ASC);


create table if not exists `otc`.`GJ_OTC_REPORT_XK_AMOUNT_CNT` (
	`YMD` VARCHAR(8) binary not null,
	`PRO_TYPE` CHAR(1) binary not null,
	`SOURCE` CHAR(1) binary not null,
	`CNT1` NUMERIC(19, 0),
	`CNT2` NUMERIC(19, 0),
	`CNT3` NUMERIC(19, 0),
	`CNT4` NUMERIC(19, 0),
	`CNT11` NUMERIC(19, 0),
	`CNT22` NUMERIC(19, 0),
	`CNT33` NUMERIC(19, 0),
	`CNT44` NUMERIC(19, 0),
	constraint `BIN$JRvB0ljQ0lrgYAB/AQBj0w==$0` primary key (`YMD`, `PRO_TYPE`, `SOURCE`)
)
comment='新客产品客户认购金额分布';

create UNIQUE index `BIN$JRvB0ljR0lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_REPORT_XK_AMOUNT_CNT` (`YMD` ASC, `PRO_TYPE` ASC, `SOURCE` ASC);


create table if not exists `otc`.`GJ_OTC_TRADE_REDEEM` (
	`INIT_DATE` NUMERIC(8, 0) not null,
	`SERIAL_NO` NUMERIC(8, 0) not null,
	`ALLOT_NO` VARCHAR(24) binary,
	`CLIENT_ID` VARCHAR(50) binary,
	`FUND_ACCOUNT` VARCHAR(50) binary,
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`SECUM_ACCOUNT` VARCHAR(50) binary,
	`ORGID` NUMERIC(19, 0),
	`REDEEM_TIME` DATETIME,
	`REDEEM_BALANCE` NUMERIC(19, 2),
	`REDEEM_INFO` VARCHAR(255) binary,
	`BEGIN_DATE` NUMERIC(8, 0),
	`PRO_NAME` VARCHAR(100) binary,
	`PRO_CODE` VARCHAR(50) binary,
	`PRO_VALUE` NUMERIC(10, 2),
	`PRODTA_NO` VARCHAR(10) binary,
	`BUSINESS_STATUS` VARCHAR(2) binary,
	`SOURCE` CHAR(1) binary,
	constraint `BIN$JRvB0llz0lrgYAB/AQBj0w==$0` primary key (`INIT_DATE`, `SERIAL_NO`)
)
comment='客户赎回订单表';

create UNIQUE index `BIN$JRvB0ll20lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_TRADE_REDEEM` (`INIT_DATE` ASC, `SERIAL_NO` ASC);


create table if not exists `otc`.`GJ_OTC_TRANSFER_ORDER` (
	`REC_GEN_TIME` DATETIME(6) comment '创建日期',
	`REC_UPD_TIME` DATETIME(6) comment '更新日期',
	`ID` NUMERIC(19, 0) not null comment '主键id',
	`CUST_NUM` VARCHAR(50) binary not null comment '客户编号',
	`FUND_ACCOUNT` VARCHAR(50) binary not null comment '资金账户',
	`CIF_ACCOUNT` VARCHAR(50) binary comment '一户通账户',
	`ORGID` NUMERIC(19, 0) comment '营业部代码',
	`BUY_TIME` DATETIME comment '入库时间',
	`TRANSFER_ORDER_NUM` VARCHAR(50) binary comment '转产品订单编号',
	`PRO_NAME` VARCHAR(50) binary comment '产品名称',
	`PRO_CODE` VARCHAR(50) binary comment '产品代码',
	`PRO_NUM` VARCHAR(50) binary comment '产品编号',
	`BUY_QTY` NUMERIC(19, 0) comment '转产品数量',
	`BUY_PRICE` NUMERIC(19, 4) comment '转产品价格',
	`ORDER_STATUS` VARCHAR(2) binary comment '订单状态',
	`ORDER_NUM` VARCHAR(50) binary comment '订单编号',
	`SOURCE` VARCHAR(1) binary comment '来源     1:PC端  2：移动端',
	`CID` VARCHAR(10) binary comment '订单来源渠道',
	`CUST_NAME` VARCHAR(50) binary comment '客户姓名',
	`CUST_ADDRESS` VARCHAR(50) binary comment '客户地址',
	`SERIAO_NO` VARCHAR(50) binary comment '流水号',
	`TGLJ_INFO` VARCHAR(255) binary comment '推广信息',
	constraint `BIN$JRvB0lmH0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='求购订单 确认卖单';

create UNIQUE index `BIN$JRvB0lmL0lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_TRANSFER_ORDER` (`ID` ASC);


create table if not exists `otc`.`GJ_G2010_ITEM_MARKET_INFO_SH` (
	`ID` NUMERIC(19, 0) not null,
	`ITEM_CODE` VARCHAR(8) binary,
	`MARKET_NAME` VARCHAR(30) binary,
	`PRIORITY` NUMERIC(8, 0),
	`AUDIT_STATUS` CHAR(1) binary,
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`CREATE_TIME` DATETIME,
	`UPD_TIME` DATETIME,
	`UPD_PERSONNEL` VARCHAR(20) binary,
	`WEEKS` VARCHAR(200) binary,
	`TICKET_NUM` VARCHAR(50) binary,
	`NOLOGIN_IS_DISPLAY` VARCHAR(2) binary,
	`MALL_URL` VARCHAR(500) binary,
	`USER_RULE_ID` VARCHAR(500) binary,
	`PC_LINK` VARCHAR(500) binary,
	`BLACK_IMAGE_URL` VARCHAR(500) binary,
	`BLACK_IMAGE_ID` VARCHAR(100) binary,
	`BLACK_IMAGE_NAME` VARCHAR(100) binary,
	`AUDIT_STATUS_SH` VARCHAR(2) binary,
	`YD_URL_NAME` VARCHAR(200) binary,
	`PC_URL_NAME` VARCHAR(200) binary,
	`JH_URL_NAME` VARCHAR(200) binary,
	`MARKETING_TAG` VARCHAR(12) binary,
	`XIAODIAN_LINK` VARCHAR(500) binary,
	`XIAODIAN_URL_NAME` VARCHAR(256) binary,
	`MARKET_IMG_URL` VARCHAR(500) binary,
	`MARKET_TYPE` CHAR(1) binary,
	`MARKET_START_TIME` DATETIME,
	`MARKET_END_TIME` DATETIME,
	`MARKET_IMG_NAME` VARCHAR(200) binary,
	`MARKET_IMG_ID` VARCHAR(200) binary,
	`PC_MARKET_URL` VARCHAR(500) binary,
	`PC_MARKET_ID` VARCHAR(100) binary,
	`PC_MARKET_NAME` VARCHAR(100) binary,
	`MARKET_REMARK` VARCHAR(500) binary,
	`OBJECT_TYPE` CHAR(1) binary,
	`IS_DISPLAY_OBJECT_NAME` CHAR(1) binary,
	`OBJECT_CODE` VARCHAR(50) binary,
	`BENCHMARK_TYPE` CHAR(1) binary,
	`IS_DISPLAY_BENCHMARK_NAME` CHAR(1) binary,
	`BENCHMARK_CODE` VARCHAR(50) binary,
	`PERIOD_TYPE` CHAR(1) binary,
	`MARKET_URL` VARCHAR(500) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_OTC_REPORT_XK_ROSE_CNT` (
	`YMD` VARCHAR(8) binary not null,
	`AMOUNT1` NUMERIC(19, 0),
	`AMOUNT2` NUMERIC(19, 0),
	`AMOUNT3` NUMERIC(19, 0),
	`AMOUNT4` NUMERIC(19, 0),
	`AMOUNT5` NUMERIC(19, 0),
	`AMOUNT6` NUMERIC(19, 0),
	`AMOUNT7` NUMERIC(19, 0),
	`AMOUNT8` NUMERIC(19, 0),
	`AMOUNT9` NUMERIC(19, 0),
	`SOURCE` CHAR(1) binary not null,
	`CNT1` VARCHAR(20) binary,
	`CNT2` VARCHAR(20) binary,
	`CNT3` VARCHAR(20) binary,
	`CNT4` VARCHAR(20) binary,
	`CNT5` VARCHAR(20) binary,
	`CNT6` VARCHAR(20) binary,
	constraint `BIN$JRvB0lju0lrgYAB/AQBj0w==$0` primary key (`YMD`, `SOURCE`)
)
comment='新客产品前日上周涨幅';

create UNIQUE index `BIN$JRvB0ljv0lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_REPORT_XK_ROSE_CNT` (`YMD` ASC, `SOURCE` ASC);


create table if not exists `otc`.`GJ_WORK_ATTENDENCE` (
	`NAME` VARCHAR(10) binary not null,
	`WORK_UID` VARCHAR(30) binary not null,
	`CARD_NO` VARCHAR(10) binary not null,
	`WORK_DAY` VARCHAR(100) binary not null,
	`ON_DUTY_TIME` VARCHAR(100) binary,
	`OFF_DUTY_TIME` VARCHAR(100) binary,
	`WORK_HOURS` VARCHAR(5) binary,
	`WORK_STATE` VARCHAR(8) binary
);


create table if not exists `otc`.`MNG_PFMANCE_LATEST_D` (
	`TRD_COE_D` VARCHAR(3000) binary comment '交易code',
	`EID` VARCHAR(60) binary comment '  编号',
	`MANAGER` VARCHAR(100) binary comment '基金经理',
	`PERSONCODE` VARCHAR(100) binary comment '人物代码',
	`TRD_CODE` VARCHAR(1500) binary comment '  在管基金代码',
	`UPDATEDATE` DATETIME comment '  更新日期',
	`YIELDSINCES` NUMERIC(20, 8) comment '  任职总回报',
	`RANKSINCE3Y` VARCHAR(100) binary comment '最近三年同类排名',
	`SECURITYTYPE` VARCHAR(100) binary comment '  在管基金类型',
	`YIELDSINCE3Y` NUMERIC(20, 8) comment '最近三年回报',
	`RANKSINCE2Y` VARCHAR(100) binary comment '最近两年同类排名',
	`YIELDSINCET` NUMERIC(20, 8) comment '  今年以来回报',
	`REMARK` VARCHAR(100) binary comment '  备注',
	`YIELDSINCEL1M` NUMERIC(20, 8) comment '  最近一月回报',
	`YIELDSINCEL3M` NUMERIC(20, 8) comment '  最近三月回报',
	`NATUREPOSTYEAR` NUMERIC(20, 8) comment '  自然任职年限',
	`RANKSINCET` VARCHAR(100) binary comment '今年以来同类排名',
	`YIELDSINCE1Y` NUMERIC(20, 8) comment '最近一年回报',
	`YIELDSINCE6M` NUMERIC(20, 8) comment '  最近六月回报',
	`RANKSINCE1Y` VARCHAR(100) binary comment '  最近一年同类排名',
	`YIELDSINCE2Y` NUMERIC(20, 8) comment '最近两年回报',
	`GEOYIELDA` NUMERIC(20, 8) comment '  几何任职年化总回报',
	`ACCUPOSTYEAR` NUMERIC(20, 8) comment '累计任职年限',
	`ESOURCEMEMO` VARCHAR(100) binary comment '来源',
	`EUTIME` DATETIME comment '资讯中心更新时间',
	`NUM` NUMERIC(1, 0) comment '数量',
	`YIELDSINCE1W` NUMERIC(65, 30) comment '最近一周回报',
	`SIMILAR_RANK_1W` NUMERIC(65, 30) comment '最近一周同类排名',
	`SIMILAR_RANK_3M` VARCHAR(50) binary comment '最近三月同类排名',
	`SIMILAR_RANK_1M` VARCHAR(50) binary comment '最近一月同类排名',
	`SIMILAR_RANK_6M` VARCHAR(50) binary comment '最近六月同类排名'
)
comment='基金经理';


create table if not exists `otc`.`GJ_G2050_RETURN_VISIT` (
	`ID` NUMERIC(20, 0) not null,
	`CUST_NUM` VARCHAR(50) binary,
	`FUND_ACCOUNT` VARCHAR(50) binary,
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`BUSIN_ACCOUNT` VARCHAR(50) binary,
	`SECUM_ACCOUNT` VARCHAR(50) binary,
	`ORGID` NUMERIC(20, 0),
	`PRO_NAME` VARCHAR(50) binary,
	`PROD_CODE` VARCHAR(50) binary,
	`PRO_NUM` VARCHAR(50) binary,
	`ENTRUST_DATE` VARCHAR(20) binary,
	`ORDER_QTY` NUMERIC(20, 0),
	`ORDER_PRICE` NUMERIC(20, 0),
	`ENTRUST_BALANCE` NUMERIC(20, 0),
	`ALLOT_NO` VARCHAR(50) binary,
	`REQUESTION_TIME` DATETIME(6),
	`BUY_RATE` NUMERIC(20, 0),
	`CUST_NAME` VARCHAR(50) binary comment '客户姓名',
	`CUST_ADDRESS` VARCHAR(50) binary comment '客户地址',
	`SERIAL_NO` NUMERIC(20, 0) comment '流水序号',
	`PROD_TYPE_CHILD` VARCHAR(10) binary,
	constraint `BIN$JRvB0lcL0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='私募基金回访表';

create UNIQUE index `BIN$JRvB0lcM0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2050_RETURN_VISIT` (`ID` ASC);


create table if not exists `otc`.`GJ_G2010_PROD_SELL_PUSH` (
	`TRADEDATE` NUMERIC(65, 30),
	`PROD_CODE` VARCHAR(100) binary comment '产品代码',
	`PROD_NAME` VARCHAR(100) binary,
	`SELL_AMT_MONTH_WEEK` NUMERIC(22, 4),
	`SELL_QTY_MONTH_WEEK` NUMERIC(22, 4),
	`SELL_AMT_MONTH_MONTH` NUMERIC(22, 4),
	`SELL_QTY_MONTH_MONTH` NUMERIC(22, 4),
	`WEEK_BEGIN_DATE` NUMERIC(19, 0),
	`MONTH_BEGIN_DATE` NUMERIC(19, 0),
	`END_DATE` NUMERIC(19, 0),
	`SELL_AMT_HALFMONTH` NUMERIC(22, 4),
	`SELL_QTY_HALFMONTH` NUMERIC(22, 4),
	`SELL_AMT_QUARTER` NUMERIC(22, 4),
	`SELL_QTY_QUARTER` NUMERIC(22, 4),
	`SELL_AMT_HALFYEAR` NUMERIC(22, 4),
	`SELL_QTY_HALFYEAR` NUMERIC(22, 4),
	`SELL_AMT_YEAR` NUMERIC(22, 4),
	`SELL_QTY_YEAR` NUMERIC(22, 4),
	`HALFMONTH_BEGIN_DATE` NUMERIC(19, 0),
	`QUARTER_BEGIN_DATE` NUMERIC(19, 0),
	`HALFYEAR_BEGIN_DATE` NUMERIC(19, 0),
	`YEAR_BEGIN_DATE` NUMERIC(19, 0),
	`PROD_TYPE` VARCHAR(2) binary,
	`PUSH_DATE` VARCHAR(8) binary
)
comment='销量排行';


create table if not exists `otc`.`GJ_OPEN_QUAL` (
	`REC_GEN_TIME` DATETIME(6) comment '记录生成时间',
	`REC_UPD_TIME` DATETIME(6) comment '记录更新时间',
	`ID` NUMERIC(19, 0) not null comment '主键id',
	`CUST_NUM` VARCHAR(50) binary not null comment '客户编号',
	`FUND_ACCOUNT` VARCHAR(50) binary not null comment '资金账户',
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`ORGID` NUMERIC(19, 0),
	`OPEN_TIME` DATETIME,
	`OPEN_STATUS` VARCHAR(2) binary,
	constraint `BIN$JRvB0lhM0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='OTC交易权限开通表';

create UNIQUE index `BIN$JRvB0lhN0lrgYAB/AQBj0w==$0` on `otc`.`GJ_OPEN_QUAL` (`ID` ASC);


create table if not exists `otc`.`GJ_G2010_THB_SERIAL_DATA` (
	`ID` NUMERIC(19, 0) not null comment '主键ID',
	`CUST_NUM` VARCHAR(50) binary comment '客户编号',
	`FUND_ACCOUNT` VARCHAR(50) binary comment '资金账户',
	`CIF_ACCOUNT` VARCHAR(50) binary comment '一户通账户',
	`ORGID` VARCHAR(19) binary comment '营业部代码',
	`EXCHANGE_TYPE` VARCHAR(4) binary comment '交易类别(1：天汇宝一号，2：天汇宝二号)',
	`STOCK_ACCOUNT` VARCHAR(30) binary comment '证券账号',
	`STOCK_CODE` VARCHAR(30) binary comment '证券代码',
	`PROD_CODE` VARCHAR(20) binary comment '产品代码',
	`EXPIRE_YEAR_RATE` VARCHAR(16) binary comment '到期年收益率',
	`ENTRUST_AMOUNT` VARCHAR(16) binary comment '委托数量',
	`ENTRUST_PROP` VARCHAR(3) binary comment '委托属性(QNE)',
	`ENTRUST_BS` VARCHAR(2) binary comment '买卖方向("天汇宝一号：1买入、2卖出天汇宝二号：报价回购")',
	`GT_BJHG_AUTOFLAG` VARCHAR(1) binary comment '报价回购是否自动续作("天汇宝一号：报价回购是否自动续作  ""0"":续作原期限 ""1"":不续作 ""2"":续作1天期 天汇宝二号：报价回购是否自动续作  ""1"":续作 ""0"":不续作")',
	`ENTRUST_NO` VARCHAR(30) binary comment '委托编号',
	`REPORT_NO` VARCHAR(30) binary comment '申请编号',
	`BATCH_NO` VARCHAR(30) binary comment '委托批号',
	`ORDER_STATUS` VARCHAR(1) binary not null comment '订单状态("1"下单 "0"提前赎回)',
	`REC_GEN_TIME` DATETIME(6) comment '（不知含义）',
	`ENTRUST_BALANCE` VARCHAR(16) binary comment '成交金额',
	`MOBILE` VARCHAR(20) binary comment '手机号',
	`OUT_WALLET_CODE` VARCHAR(50) binary comment '外部卡券',
	`PROD_NAME` VARCHAR(80) binary comment '产品名称',
	`CID_SOURCE` VARCHAR(20) binary comment '订单渠道 ',
	`TGLJ_INFO` VARCHAR(2000) binary comment '推广链接',
	`REGTEL` VARCHAR(13) binary comment '手机号',
	`KBN` VARCHAR(1) binary
)
comment='天汇宝二号表';


create table if not exists `otc`.`PROD_INVEST_MODULE_ZX_CODE` (
	`TRADEDATE` NUMERIC(19, 0),
	`MODULE_CODE` VARCHAR(20) binary,
	`MODULE_NAME` VARCHAR(20) binary
);


create table if not exists `otc`.`FUND_MANAGE_LABEL_SH` (
	`ID` VARCHAR(255) binary,
	`PERSONCODE` VARCHAR(50) binary,
	`LABEL` VARCHAR(50) binary,
	`PRIORITY` NUMERIC(65, 30),
	`UPDATE_DATE` DATETIME,
	`UPDATE_PERSONNEL` VARCHAR(50) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`G2010_NEWMALL_ORDERS_OTC_ALL` (
	`ID` NUMERIC(65, 30) not null,
	`PRO_CODE` VARCHAR(50) binary not null,
	`PRO_NAME` VARCHAR(128) binary,
	`TYPE` CHAR(1) binary not null,
	`BUY_TIME` DATETIME(6),
	`ORDER_STATUS` VARCHAR(50) binary,
	`ALLOT_NO` VARCHAR(50) binary,
	`SERIAL_NO` VARCHAR(40) binary,
	`ENTRUST_BALANCE` NUMERIC(65, 30),
	`MATCHAMT` NUMERIC(65, 30),
	`REGTEL` VARCHAR(13) binary,
	`TGLJ_INFO` VARCHAR(2000) binary,
	`CUST_NUM` VARCHAR(50) binary,
	`FUND_ACCOUNT` VARCHAR(50) binary,
	`UPDATE_TIME` DATETIME,
	`UP_REMARK` VARCHAR(50) binary,
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`ORGID` NUMERIC(65, 30),
	`PRO_NUM` VARCHAR(50) binary,
	`CID_SOURCE` VARCHAR(24) binary,
	`REMARK` VARCHAR(2000) binary,
	`RESERVED` VARCHAR(1) binary,
	`INIT_DATE` NUMERIC(65, 30),
	`TGLJ_WORKID` VARCHAR(12) binary,
	`WORKID` VARCHAR(12) binary,
	`CODE` VARCHAR(12) binary,
	`STATUS` VARCHAR(2) binary,
	`CHANNEL` VARCHAR(128) binary,
	`TGLJ_CODE` VARCHAR(128) binary,
	`TGLJ_MATTYPE` VARCHAR(128) binary,
	`TGLJ_MATID` VARCHAR(128) binary,
	`TGLJ_CHANNELID` VARCHAR(128) binary,
	`TGLJ_FUNCTYPE` VARCHAR(128) binary,
	`TGLJ_TIMESTAMP` VARCHAR(128) binary,
	`TGLJ_FUNCID` VARCHAR(128) binary,
	`CAIJI_TYPE` VARCHAR(128) binary,
	`PUT_PEOPLE` VARCHAR(128) binary,
	`TGRWORKDEPNAME` VARCHAR(128) binary,
	`TGRWORKORGNAME` VARCHAR(128) binary,
	`TGRNAME` VARCHAR(128) binary,
	`PROD_TYPE_CHILD` VARCHAR(32) binary,
	`PROD_TYPE` VARCHAR(32) binary,
	`CUST_MANAGER` VARCHAR(128) binary,
	`DEP_NUM` VARCHAR(128) binary,
	`DEP_NAME` VARCHAR(128) binary,
	`ORG_NAME` VARCHAR(255) binary,
	`ORG_NUM` VARCHAR(128) binary,
	`MOBILE` VARCHAR(255) binary,
	`OPEN_TIME` VARCHAR(128) binary,
	`NAME` VARCHAR(64) binary,
	`TGRWORKDEPID` VARCHAR(32) binary,
	`TGRWORKORGID` VARCHAR(32) binary,
	constraint `BIN$JRvB0lRI0lrgYAB/AQBj0w==$0` primary key (`ID`, `PRO_CODE`, `TYPE`)
);

create UNIQUE index `BIN$JRvB0lRL0lrgYAB/AQBj0w==$0` on `otc`.`G2010_NEWMALL_ORDERS_OTC_ALL` (`ID` ASC, `PRO_CODE` ASC, `TYPE` ASC);

create index `BIN$JRvB0lRJ0lrgYAB/AQBj0w==$0` on `otc`.`G2010_NEWMALL_ORDERS_OTC_ALL` (`STATUS` ASC);

create index `BIN$JRvB0lRK0lrgYAB/AQBj0w==$0` on `otc`.`G2010_NEWMALL_ORDERS_OTC_ALL` (`BUY_TIME` ASC);


create table if not exists `otc`.`GJ_OTC_REPORT_XK_TIMET_CNT` (
	`YMD` VARCHAR(8) binary not null,
	`PRO_TYPE` CHAR(1) binary not null,
	`SOURCE` CHAR(1) binary not null,
	`CNTH1` NUMERIC(19, 0),
	`CNTH2` NUMERIC(19, 0),
	`CNTH3` NUMERIC(19, 0),
	`CNTH4` NUMERIC(19, 0),
	`CNTH5` NUMERIC(19, 0),
	`CNTH6` NUMERIC(19, 0),
	`CNTH7` NUMERIC(19, 0),
	`CNTH8` NUMERIC(19, 0),
	`CNTH9` NUMERIC(19, 0),
	`CNTH10` NUMERIC(19, 0),
	`CNTH11` NUMERIC(19, 0),
	`CNTH12` NUMERIC(19, 0),
	`CNTH13` NUMERIC(19, 0),
	`CNTH14` NUMERIC(19, 0),
	`CNTH15` NUMERIC(19, 0),
	`CNTH16` NUMERIC(19, 0),
	`CNTH17` NUMERIC(19, 0),
	`CNTH18` NUMERIC(19, 0),
	`CNTH19` NUMERIC(19, 0),
	`CNTH20` NUMERIC(19, 0),
	`CNTH21` NUMERIC(19, 0),
	`CNTH22` NUMERIC(19, 0),
	`CNTH23` NUMERIC(19, 0),
	`CNTH24` NUMERIC(19, 0),
	constraint `BIN$JRvB0lj60lrgYAB/AQBj0w==$0` primary key (`YMD`, `PRO_TYPE`, `SOURCE`)
);

create UNIQUE index `BIN$JRvB0lj70lrgYAB/AQBj0w==$0` on `otc`.`GJ_OTC_REPORT_XK_TIMET_CNT` (`YMD` ASC, `PRO_TYPE` ASC, `SOURCE` ASC);


create table if not exists `otc`.`INTERFACE_GATE_STATUS` (
	`ENV` VARCHAR(10) binary comment '环境： local、200、sit、uat',
	`STATUS` CHAR(1) binary comment '全局开关，0代表关闭，1代表打开',
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_OTC_MALLTRADE_FUND_LS` (
	`ID` NUMERIC(19, 0) not null,
	`CUST_NUM` VARCHAR(20) binary not null,
	`USER_CODE` VARCHAR(18) binary,
	`CIF_ACCOUNT` VARCHAR(20) binary,
	`FUND_ACCOUNT` VARCHAR(20) binary,
	`ENTRUST_NO` VARCHAR(20) binary,
	`TRADE_DATE` VARCHAR(8) binary,
	`TRADE_TIME` VARCHAR(8) binary,
	`FUND_COMPANY` VARCHAR(50) binary,
	`FUND_CODE` VARCHAR(50) binary,
	`FUND_NAME` VARCHAR(50) binary,
	`ENTRUST_FLAG` VARCHAR(10) binary,
	`BALANCE` VARCHAR(20) binary,
	`AMOUNT` VARCHAR(20) binary,
	`SERIAL_NO` VARCHAR(15) binary
)
comment='场内基金交易流水';


create table if not exists `otc`.`GJ_G9010_PRO_TEST_INFO` (
	`BUG_NUM` NUMERIC(8, 0) not null,
	`PROJECT_NUM` VARCHAR(5) binary,
	`BUG_TITLE` VARCHAR(200) binary,
	`BUG_TIME` DATETIME,
	`TEST_PERSONNEL` VARCHAR(20) binary,
	`REPAIR_PERSONNEL` VARCHAR(20) binary,
	`REPAIR_STATUS` VARCHAR(1) binary,
	`BUG_DESCRIBE` VARCHAR(2000) binary,
	`REPAIR_WAY` VARCHAR(2000) binary,
	`IDENTIFY_ID` VARCHAR(100) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_OTC_TRADE_BUY` (
	`INIT_DATE` NUMERIC(8, 0) not null comment '交易日期',
	`SERIAL_NO` NUMERIC(38, 0) not null comment '流水序号',
	`ALLOT_NO` VARCHAR(50) binary not null comment '申请编号',
	`CUST_NUM` VARCHAR(50) binary comment '客户编号',
	`FUND_ACCOUNT` VARCHAR(50) binary comment '资金账户',
	`CIF_ACCOUNT` VARCHAR(50) binary comment '一户通账户',
	`ORGID` NUMERIC(19, 0) comment '营业部代码',
	`BUY_TIME` DATETIME comment '购买时间',
	`PRO_NAME` VARCHAR(50) binary comment '产品名称',
	`PRO_CODE` VARCHAR(50) binary comment '产品代码',
	`PRO_NUM` VARCHAR(50) binary comment '产品编号',
	`ENTRUST_BALANCE` NUMERIC(19, 2) comment '委托金额',
	`ORDER_STATUS` VARCHAR(2) binary comment '订单状态',
	`ID` NUMERIC(20, 0) not null comment '主键ID',
	`OTC_ACCOUNT` VARCHAR(18) binary comment '一户通号',
	`SOURCE` CHAR(1) binary comment '来源',
	`EMP_ID` VARCHAR(20) binary comment '员工id',
	`CID` VARCHAR(100) binary comment '订单来源渠道',
	`REMARK` VARCHAR(2000) binary comment '备注',
	`TYPE` CHAR(1) binary comment '类型(1:收益凭证 2：专享客户)',
	`ORDER_TYPE` VARCHAR(2) binary comment '下单类型',
	`REGTEL` VARCHAR(13) binary comment '注册手机号码',
	`TGLJ_INFO` VARCHAR(2000) binary comment '推广信息',
	`UPDATE_TIME` DATETIME comment '更新日期',
	`MATCHAMT` NUMERIC(22, 4) comment '成交金额',
	`UP_REMARK` VARCHAR(50) binary comment '更新备注',
	`MATCHQTY` NUMERIC(22, 0) comment '成交数量',
	`OUTBIZSNO` VARCHAR(512) binary comment '外部号',
	`SUB_BUSIN_ACCOUNT` VARCHAR(100) binary comment '子账号，只有在投顾otc下单的会有值'
)
comment='买家订单表';


create table if not exists `otc`.`GJ_G2019_DATADICT_PROD` (
	`ID` VARCHAR(16) binary comment '主键ID',
	`PROD_TYPE` VARCHAR(16) binary comment '产品类型',
	`PROD_TYPE_NAME` VARCHAR(32) binary comment '产品类型名称',
	`PROD_TYPE_CHILD` VARCHAR(16) binary comment '产品子类型',
	`PROD_TYPE_CHILD_NAME` VARCHAR(32) binary comment '产品子类型名称'
)
comment='数据字典(产品类型-产品子类)(用于二级下拉框)';


create table if not exists `otc`.`G_P_USER_JZJY_OFCASHACCHA` (
	`SERVERID` VARCHAR(16) binary comment '服务ID',
	`SERIALNO` VARCHAR(16) binary comment '序列号',
	`CUSTID` VARCHAR(16) binary comment '客户代码',
	`ORGID` VARCHAR(8) binary comment '分公司(机构编码)',
	`BRHID` VARCHAR(8) binary comment '营业部(机构分支)',
	`FUNDID` VARCHAR(16) binary comment '资金账号',
	`TAACC` VARCHAR(32) binary comment '基金账号',
	`TRANSACC` VARCHAR(32) binary comment '交易账号',
	`ACCTYPE` VARCHAR(2) binary comment '账户类别',
	`TACODE` VARCHAR(2) binary comment 'ta编号',
	`OFCODE` VARCHAR(16) binary comment '基金代码',
	`SIGNSTATUS` VARCHAR(4) binary comment '签约状态',
	`FIRSTFLAG` VARCHAR(4) binary comment '是否完成是否扫单',
	`DEALDATE` VARCHAR(16) binary comment '处理日期',
	`SIGNDATE` VARCHAR(255) binary comment '签约日期',
	`NETADDR` VARCHAR(16) binary comment '网络地址',
	`REMARK` VARCHAR(1024) binary comment '备注',
	`THLJ_CHANNEL` VARCHAR(32) binary comment '推广渠道',
	`EMAIL` VARCHAR(32) binary comment '电子邮箱',
	`OPERID` VARCHAR(32) binary comment '签约柜员',
	`LOWAMT` VARCHAR(32) binary comment '客户保留最低金额',
	`CODERATIO` VARCHAR(32) binary comment '代码比例',
	`CANCELDATE` VARCHAR(16) binary comment '解约日期',
	`CANCELTIME` VARCHAR(16) binary comment '解约时间',
	`OPERWAY` VARCHAR(32) binary comment '操作方式',
	`OPERORG` VARCHAR(32) binary comment '开户机构',
	`FIRSTDATE` VARCHAR(16) binary comment '首次扫单日期',
	`DEALFLAG` VARCHAR(16) binary comment '处理状态',
	`SIGNTIME` VARCHAR(32) binary comment '签约时间',
	`SENDDATE` VARCHAR(32) binary comment '发送日期',
	`SENDTIME` VARCHAR(32) binary comment '发送时间',
	`tglj_channel` VARCHAR(128) binary,
	`DATAID` ROWID comment '数据ID',
	`UPDATETIME` DATETIME comment '更新时间',
	`CUST_NUM` VARCHAR(16) binary comment '客户代码',
	`MSG_ID` VARCHAR(255) binary comment '信息ID ',
	`TGLJ_CHANNEL` VARCHAR(128) binary comment 'tglj_channel'
)
comment='现金宝签约流水表';

create index `BIN$JRvB0ltL0lrgYAB/AQBj0w==$0` on `otc`.`G_P_USER_JZJY_OFCASHACCHA` (`CUST_NUM` ASC);

create index `BIN$JRvB0ltM0lrgYAB/AQBj0w==$0` on `otc`.`G_P_USER_JZJY_OFCASHACCHA` (`SIGNDATE` ASC, `SIGNTIME` ASC);


create table if not exists `otc`.`CFH_JJGS_ITEM` (
	`NAME` VARCHAR(64) binary comment '基金公司名称2',
	`ITEM_CODE` VARCHAR(20) binary comment '栏目代码'
)
comment='栏目基金关系';


create table if not exists `otc`.`LCODER_TABLES_RECORD_SQL_MYSQL` (
	`ID` VARCHAR(255) binary not null,
	`FROM_TABLE_NAME` VARCHAR(255) binary,
	`TO_TABLE_NAME` VARCHAR(255) binary,
	`INDEX_ID` VARCHAR(255) binary,
	`EXECUTE_SQL` VARCHAR(4000) binary,
	`SQL_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`JOB_EXCUTE_TIME` DATETIME default NULL,
	`EXCUTE_STATUS` VARCHAR(2) binary comment '0:未执行
1:成功
2:失败',
	`MSG` VARCHAR(4000) binary,
	constraint `SYS_C00145788` primary key (`ID`)
);


create table if not exists `otc`.`GJ_G2010_SECOND_ITEM_PRO_LS` (
	`ITEM_CODE` VARCHAR(8) binary not null,
	`PROD_CODE` VARCHAR(32) binary not null,
	`PROD_NAME` VARCHAR(60) binary,
	`AUDIT_STATUS` VARCHAR(2) binary,
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`CREATE_TIME` DATETIME,
	`STATUS` VARCHAR(2) binary not null,
	`UPD_TIME` DATETIME not null,
	`UPD_PERSONNEL` VARCHAR(20) binary,
	`OPER_ID` VARCHAR(50) binary,
	`PRIORITY` NUMERIC(8, 0) not null,
	`SOURCE` VARCHAR(10) binary not null,
	`PROD_STATUS` VARCHAR(1) binary comment '1:新增 2移除',
	constraint `BIN$JRvB0lZ10lrgYAB/AQBj0w==$0` primary key (`ITEM_CODE`, `SOURCE`, `STATUS`, `PRIORITY`, `PROD_CODE`, `UPD_TIME`)
);

create UNIQUE index `BIN$JRvB0lZ20lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2010_SECOND_ITEM_PRO_LS` (`ITEM_CODE` ASC, `SOURCE` ASC, `STATUS` ASC, `PRIORITY` ASC, `PROD_CODE` ASC, `UPD_TIME` ASC);


create table if not exists `otc`.`GJ_G9010_PERSON_INFO` (
	`PERSON_ID` NUMERIC(2, 0) not null,
	`PERSON_NAME` VARCHAR(10) binary not null,
	constraint `BIN$JRvB0ld20lrgYAB/AQBj0w==$0` primary key (`PERSON_ID`)
);

create UNIQUE index `BIN$JRvB0ld30lrgYAB/AQBj0w==$0` on `otc`.`GJ_G9010_PERSON_INFO` (`PERSON_ID` ASC);


create table if not exists `otc`.`GJ_PRO_PUBLICITY_MATERIALS` (
	`PRO_CODE` VARCHAR(64) binary comment '产品代码',
	`PRO_NAME` VARCHAR(256) binary comment '产品名称',
	`TYPE` VARCHAR(50) binary comment '宣传材料类型',
	`FILENAME` VARCHAR(255) binary comment '宣传材料名称',
	`FILEPATH` VARCHAR(512) binary comment '宣传材料地址',
	`CREATEDATE` DATETIME comment '创建日期'
)
comment='宣传材料';


create table if not exists `otc`.`GJ_G2010_PROD_SET_FEATURE_TEMP` (
	`PROD_FEATURE_LABEL` VARCHAR(100) binary,
	`CREATE_TIME` VARCHAR(50) binary,
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`FIRST_DETAIL_DISPLAY_CH` VARCHAR(100) binary,
	`SECOND_DETAIL_DISPLAY_CH` VARCHAR(100) binary,
	`FIRST_DETAIL_DISPLAY` VARCHAR(50) binary,
	`SECOND_DETAIL_DISPLAY` VARCHAR(50) binary,
	`TYPE` VARCHAR(2) binary,
	`INCOME_DESCRIBE` VARCHAR(500) binary
);


create table if not exists `otc`.`L_ORGANIZATION_SON_REL` (
	`ORG_ID` NUMERIC(19, 0) not null comment '营业部id',
	`ORG_SON` NUMERIC(19, 0) not null comment '子营业部id',
	`REC_GEN_TIME` DATETIME(6) comment '记录生成时间',
	`REC_UPD_TIME` DATETIME(6) comment '记录更新时间',
	constraint `BIN$JRvB0l4K0lrgYAB/AQBj0w==$0` primary key (`ORG_ID`, `ORG_SON`)
)
comment='营业部子营业对应关系';

create UNIQUE index `BIN$JRvB0l4L0lrgYAB/AQBj0w==$0` on `otc`.`L_ORGANIZATION_SON_REL` (`ORG_ID` ASC, `ORG_SON` ASC);


create table if not exists `otc`.`GJ_G9010_WEEKLY_REPORT_DETAIL` (
	`REC_GEN_TIME` DATETIME(6),
	`REC_UPD_TIME` DATETIME(6),
	`ID` NUMERIC(19, 0) not null,
	`TASK_NAME` VARCHAR(1000) binary,
	`TASK_DUTY_PERSON` VARCHAR(20) binary,
	`TASK_IS_PERIOD` VARCHAR(2) binary,
	`TASK_QUANTITY` VARCHAR(10) binary,
	`DELIVERABLE` VARCHAR(100) binary,
	`SCHEDULE_STATUS` VARCHAR(200) binary,
	`FINISH_RATIO` VARCHAR(10) binary,
	`REMARK` VARCHAR(2000) binary,
	`REPORT_TYPE` VARCHAR(2) binary,
	`WEEKLY_LIST_ID` NUMERIC(19, 0),
	constraint `BIN$JRvB0led0lrgYAB/AQBj0w==$0` primary key (`ID`)
);

create UNIQUE index `BIN$JRvB0lee0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G9010_WEEKLY_REPORT_DETAIL` (`ID` ASC);


create table if not exists `otc`.`GJ_G2010_YHLC_SERIAL_DATA` (
	`APPLY_NO` VARCHAR(50) binary comment '申请编号',
	`APPLY_DATE` VARCHAR(20) binary comment '申请日期',
	`OP_REMARK` VARCHAR(255) binary comment '操作备注',
	`BUSIN_ACCOUNT` VARCHAR(50) binary comment '资金账户',
	`PROD_CODE` VARCHAR(10) binary comment '产品代码',
	`ENTRUST_BALANCE` VARCHAR(10) binary comment '申请金额',
	`ORDER_STATUS` VARCHAR(1) binary comment '操作状态("1"下单 "2"撤单)',
	`CUST_NUM` VARCHAR(50) binary comment '客户编号',
	`CIF_ACCOUNT` VARCHAR(50) binary comment '一户通账户',
	`ORGID` VARCHAR(10) binary comment '营业部代码',
	`REC_GEN_TIME` DATETIME(6) comment '购买日期',
	`TRADE_TYPE` VARCHAR(10) binary comment '交易类别',
	`PROD_ID` VARCHAR(10) binary comment '多金产品编号',
	`GT_PRODUCTID` VARCHAR(10) binary comment '产品中心产品编号',
	`PROD_NAME` VARCHAR(50) binary comment '产品名称',
	`CID_SOURCE` VARCHAR(18) binary comment '订单来源(NEWMALL:理财频道)'
)
comment='银行理财多金流水数据';


create table if not exists `otc`.`GJ_G2010_IDX_MAKT_QUOT` (
	`PROD_CD` VARCHAR(20) binary,
	`CN_NAME` VARCHAR(200) binary
);


create table if not exists `otc`.`GJ_G2010_ITEM_RULE_INFO_SH` (
	`ID` NUMERIC(20, 0) not null,
	`ITEM_CODE` VARCHAR(8) binary,
	`RULE_CODE` VARCHAR(8) binary,
	`DESC_START` NUMERIC(8, 0),
	`BOLT_NUM` NUMERIC(8, 0),
	`OPER_ID` VARCHAR(50) binary,
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`CREATE_TIME` DATETIME,
	`UPD_TIME` DATETIME,
	`UPD_PERSONNEL` VARCHAR(20) binary,
	`AUDIT_STATUS` VARCHAR(2) binary,
	`USER_RULE_ID` VARCHAR(500) binary,
	`USER_RULE_ID_SPARE` VARCHAR(500) binary,
	`RULE_UUID` VARCHAR(50) binary,
	`BUTTON_IS_DISPLAY` VARCHAR(2) binary,
	`BUTTON_WORD_SHOW` VARCHAR(20) binary,
	`PC_BUTTON_LINK` VARCHAR(1000) binary,
	`BUTTON_LINK` VARCHAR(1000) binary,
	`BUTTON_LINK_TYPE` VARCHAR(10) binary,
	`PROD_DESCRIBE` VARCHAR(100) binary,
	`AUTO_REPALCE_DESCRIBE` VARCHAR(2) binary,
	`AUTO_REPLACE_DESCRIBE` VARCHAR(2) binary,
	`AUDIT_STATUS_SH` VARCHAR(2) binary,
	`IS_FIVE_PART` VARCHAR(2) binary,
	`URL` VARCHAR(1000) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`IS_SUPPORT_RED_DOT` VARCHAR(2) binary
);


create table if not exists `otc`.`GJ_SZ_V_QUESTIONNAIRE` (
	`VERSION_ID` VARCHAR(64) binary not null comment ' 问卷版本号 ',
	`ID` VARCHAR(64) binary not null comment ' 问题ID ',
	`QUESTION_NAME` VARCHAR(255) binary comment ' 问题标题 ',
	`QUESTION_DESC` VARCHAR(255) binary comment ' 问题描述 ',
	`QT_SORT` VARCHAR(22) binary comment ' 问题序号 ',
	`CHOOSE_NAME` VARCHAR(1000) binary comment ' 选项内容 ',
	`NEXT_QUESTION` VARCHAR(255) binary comment ' 选项对应下个问题ID ',
	`OPTION_RESULT` VARCHAR(255) binary comment ' 选项对应的策略ID ',
	`OPTION_TYPE` VARCHAR(64) binary comment ' （无用） ',
	`CE_SORT` VARCHAR(22) binary comment ' 选项序号 ',
	`RESULT_ID` VARCHAR(64) binary not null comment ' （无用） ',
	`RESULT_TITLE` VARCHAR(510) binary comment '  选项标题 ',
	`TAG1` VARCHAR(510) binary comment ' 风险描述 ',
	`TAG2` VARCHAR(510) binary comment ' 投资期限描述 ',
	`TAG3` VARCHAR(510) binary comment ' 投资目标描述 ',
	`OPTION_RESULT_DESC` VARCHAR(255) binary comment ' （无用） ',
	`RISK_CODE` VARCHAR(2) binary comment ' 产品风险等级 ',
	`PERSON_RISK_CODE` VARCHAR(2) binary comment ' 匹配的客户风险等级 ',
	`QUESTIONNARIE_TYPE` VARCHAR(255) binary comment ' 问卷类型，S-建议型，M-管理型 ',
	`EXTERNAL_CODE` VARCHAR(20) binary comment ' 问卷外部代码 ',
	`SOURCE_CODE` VARCHAR(20) binary comment ' 机构代码 ',
	`CUS_CODE` VARCHAR(100) binary comment '长客户代码'
)
comment='商智策略问卷表';


create table if not exists `otc`.`GJ_SZ_V_PRO_ROBOTS` (
	`ROBOT_ID` VARCHAR(64) binary not null comment '策略ID',
	`ROBOT_NAME` VARCHAR(255) binary comment '策略名称',
	`RISK_CODE` VARCHAR(10) binary comment '风险等级',
	`INVESTMENT_VARIETY` VARCHAR(10) binary comment ' 投资种类 ',
	`INVESTMENT_PERIOD` VARCHAR(1) binary comment ' 投资周期 ',
	`REMARK` VARCHAR(2000) binary comment ' 风险说明 ',
	`MANAGE_RATE_FEE` NUMERIC(10, 6) comment '管理费率',
	`DISCOUNT` NUMERIC(65, 30) comment '管理费折扣率',
	`PARAM_BENCHMARK_NAME` VARCHAR(255) binary comment ' 业绩比较基准 ',
	`RISK_REMARK` VARCHAR(2000) binary comment ' 风险说明(废弃) ',
	`PUBLIC_STATUS` VARCHAR(2) binary comment '发布状态',
	`BENCHMARK` VARCHAR(4000) binary comment ' 业绩比较基准 ',
	`EQ` NUMERIC(65, 30) comment '权益类占比',
	`MM` NUMERIC(65, 30) comment '现金类占比',
	`DCM` NUMERIC(65, 30) comment '固收类占比',
	`OTH` NUMERIC(65, 30) comment '创新类占比',
	`PCTBM` NUMERIC(65, 30) comment '  比较基准成立以来涨幅  ',
	`PCTBM1M` NUMERIC(65, 30) comment '  比较基准近1月涨幅  ',
	`PCTBM3M` NUMERIC(65, 30) comment '  比较基准近3月涨幅 ',
	`PCTBM6M` NUMERIC(65, 30) comment '  比较基准近6月涨幅 ',
	`PCTBM1Y` NUMERIC(65, 30) comment '  比较基准近1年涨幅 ',
	`PCT` NUMERIC(65, 30) comment '成立以来收益率',
	`PCT1M` NUMERIC(65, 30) comment ' 近1月收益率 ',
	`PCT3M` NUMERIC(65, 30) comment '近3月收益率',
	`PCT6M` NUMERIC(65, 30) comment '近6月收益率',
	`PCT1Y` NUMERIC(65, 30) comment '近1年收益率',
	`DDR` NUMERIC(65, 30) comment ' 成立以来最大回撤 ',
	`DDR1M` NUMERIC(65, 30) comment '  近一月最大回撤  ',
	`DDR3M` NUMERIC(65, 30) comment ' 近三月最大回撤 ',
	`DDR6M` NUMERIC(65, 30) comment ' 近六月最大回撤 ',
	`DDR1Y` NUMERIC(65, 30) comment ' 近一年最大回撤 ',
	`SHP` NUMERIC(65, 30) comment ' 成立以来夏普率 ',
	`SHP1M` NUMERIC(65, 30) comment ' 近1月夏普率 ',
	`SHP3M` NUMERIC(65, 30) comment ' 近3月夏普率 ',
	`SHP6M` NUMERIC(65, 30) comment ' 近6月夏普率 ',
	`SHP1Y` NUMERIC(65, 30) comment ' 近1年夏普率 ',
	`BMPCT` NUMERIC(24, 6) comment '  比较基准成立以来涨幅  ',
	`CREATE_DT` DATETIME(6) not null comment '创建日期',
	`CREATE_BY` VARCHAR(64) binary not null,
	`MODIFY_DT` DATETIME(6) comment '修改日期',
	`MODIFY_BY` VARCHAR(64) binary comment '修改人',
	`PRODUCT_ALLOCATION` VARCHAR(255) binary comment ' （无用） ',
	`STRATEGY_LOSS_LEVEL` VARCHAR(255) binary comment ' 最大可承受损失 ',
	`PURCHASE_AMOUNT_C` NUMERIC(10, 2) comment ' 最低首次金额 ',
	`ADDITIONAL_AMOUNT_C` NUMERIC(10, 2) comment ' 最少追加金额 ',
	`DATA_DT` VARCHAR(10) binary comment ' 数据基准日期 ',
	`PF_CUSTOMIZED_TYPE` VARCHAR(10) binary comment ' （无用） ',
	`SELL_STAT` VARCHAR(2) binary comment '销售状态',
	`SHELVES_DATE` DATETIME(6) comment '上架日期',
	`DAY` NUMERIC(65, 30) comment '成立天数',
	`ADSR` NUMERIC(65, 30) comment '下行波动率',
	`PCTCY` NUMERIC(65, 30) comment '今年以来收益率',
	`OPERATING_MODE` VARCHAR(2) binary comment '操作类型 1：建议型 2：管理型',
	`QDII_FLAG` VARCHAR(2) binary comment '是否包含QDII  0:否 1：是',
	`PRIVATE_PRODUCT_FLAG` VARCHAR(2) binary comment '是否含有私募 0：否 1：是',
	`SUGGESTIVE_CHARGE_TYPE` VARCHAR(2) binary comment '建议型收费方式 1：按费率  2：一次性收费',
	`SUGGESTIVE_RATE` NUMERIC(10, 6) comment '建议型费率',
	`SINGLE_CHARGE_AMOUNT` NUMERIC(10, 6) comment '一次性收费金额',
	`CHARGE_FREQUENCY` VARCHAR(100) binary comment '收费频率 M:月 Q:季 Y:年',
	`PURCHASE_AMOUNT_B` NUMERIC(65, 30),
	`ADDITIONAL_AMOUNT_B` NUMERIC(65, 30),
	`PURCHASE_MAX_AMOUNT_C` NUMERIC(65, 30),
	`PURCHASE_MAX_AMOUNT_B` NUMERIC(65, 30),
	`ADDITIONAL_MAX_AMOUNT_C` NUMERIC(65, 30),
	`ADDITIONAL_MAX_AMOUNT_B` NUMERIC(65, 30),
	`SERVICE_CODE` VARCHAR(100) binary comment '投顾服务产品编号',
	`CERTIFICATE_CODE` VARCHAR(100) binary comment '投顾执业证书编号',
	`CREATE_BY_NAME` VARCHAR(100) binary comment '投资经理姓名'
)
comment='商智策略基础表';


create table if not exists `otc`.`GJ_G2050_REDEEM` (
	`ID` NUMERIC(20, 0) not null,
	`CUST_NUM` VARCHAR(50) binary,
	`FUND_ACCOUNT` VARCHAR(50) binary,
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`SECUM_ACCOUNT` VARCHAR(50) binary,
	`CUST_NAME` VARCHAR(50) binary,
	`CUST_ADDRESS` VARCHAR(200) binary,
	`PRO_NAME` VARCHAR(50) binary,
	`PROD_CODE` VARCHAR(50) binary,
	`EXCEEDFLAG` VARCHAR(50) binary,
	`REDEEM_AMOUNT` NUMERIC(20, 0),
	`REDEEM_INFO` VARCHAR(200) binary,
	`ALLOT_NO` VARCHAR(50) binary,
	`INIT_DATE` VARCHAR(50) binary,
	`DEAL_INFO` VARCHAR(50) binary,
	`ENTRUST_DATE` DATETIME(6),
	`DEAL_FLAG` VARCHAR(50) binary,
	`SERIAL_NO` VARCHAR(50) binary,
	`REC_GEN_TIME` DATETIME(6),
	`REC_UPD_TIME` DATETIME(6),
	`PROD_TYPE_CHILD` VARCHAR(10) binary,
	constraint `BIN$JRvB0lcH0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='私募基金赎回';

create UNIQUE index `BIN$JRvB0lcI0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2050_REDEEM` (`ID` ASC);


create table if not exists `otc`.`GJ_G2082_PROD_REL_TEMP` (
	`ID` VARCHAR(20) binary,
	`STRATEGY_CODE` VARCHAR(20) binary,
	`PROD_CODE` VARCHAR(20) binary,
	`PROD_DESCRIBE` VARCHAR(100) binary,
	`PRIORITY` NUMERIC(2, 0),
	`ROW_NUM` VARCHAR(20) binary,
	`CREATE_PERSONNEL` VARCHAR(20) binary,
	`CREATE_DATE` CHAR(10) binary,
	`INVEST_TYPE` VARCHAR(20) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
)
comment='策略基金临时表';


create table if not exists `otc`.`GJ_G2010_PROD_SET_INFO_SH` (
	`SET_CODE` VARCHAR(10) binary not null comment '产品组合代码',
	`FORCE_SHOW_KEY` VARCHAR(2) binary comment '强制展示名称和标签',
	`NO_OPEN_CONTXT` VARCHAR(50) binary comment '非公开产品展示内容',
	`SET_NAME` VARCHAR(30) binary comment '产品组合名称',
	`SHT_NAME` VARCHAR(30) binary comment '产品组合简称',
	`COMM` NUMERIC(19, 6) comment '成立来收益率',
	`COMM_1M` NUMERIC(19, 6) comment '近一个月收益率',
	`COMM_3M` NUMERIC(19, 6) comment '近一个季度收益率',
	`COMM_6M` NUMERIC(19, 6) comment '近半年收益率',
	`COMM_1Y` NUMERIC(19, 6) comment '近一年收益率',
	`COMM_DRAWDOWN` NUMERIC(19, 6) comment '历史最大回撤收益率',
	`PROD_LABEL` VARCHAR(20) binary comment '组合右上角标签',
	`PROD_RIGHT_LABEL_CTXT` VARCHAR(50) binary comment '组合右上角标签配置',
	`PROD_FEATURE_LABEL` VARCHAR(50) binary comment '组合特点标签',
	`PROD_FEATURE_DESCRIBE` VARCHAR(200) binary comment '组合特点描述',
	`SHOW_BEGIN` DATETIME comment '展示开始时间',
	`SHOW_END` DATETIME comment '展示结束时间',
	`WEEKS` VARCHAR(200) binary comment '周',
	`DAILY_BEGIN_TIME` VARCHAR(20) binary comment '每日展示开始时间',
	`DAILY_END_TIME` VARCHAR(20) binary comment '每日展示结束时间',
	`APP_DETAIL_URL` VARCHAR(500) binary comment 'APP详情URL',
	`MALL_DETAIL_URL` VARCHAR(500) binary comment '君弘网URL',
	`PC_DETAIL_URL` VARCHAR(500) binary comment 'PC详情URL',
	`FIRST_DETAIL_DISPLAY_CH` VARCHAR(200) binary comment '详情高优先字段显示',
	`SECOND_DETAIL_DISPLAY_CH` VARCHAR(200) binary comment '详情低优先字段显示',
	`LIMIT_TYPE` VARCHAR(10) binary comment '剩余额度展示类型',
	`SEARCH_IS_ALLOWED` VARCHAR(2) binary comment '是否允许被搜索',
	`NO_SELL_DISPLAY` VARCHAR(2) binary comment '不可售产品是否展示',
	`NOLOGIN_IS_DISPLAY` VARCHAR(2) binary comment '未登录是否可见',
	`TICKET_NUM` VARCHAR(2) binary comment '是否根据活动代码定向展示',
	`STL_RISK_TYPE` VARCHAR(10) binary,
	`ATTENTION_PERSON` NUMERIC(9, 0),
	`FIXED_INCREMENTAL_VALUE` NUMERIC(9, 0),
	`PERFORMANCE_BENCHMARKS` VARCHAR(100) binary,
	`SET_STRATEGY_TYPE` VARCHAR(50) binary,
	`SET_STRATEGY_INFO` VARCHAR(1000) binary,
	`STRATEGY_MODEL_NAME` VARCHAR(50) binary,
	`STRATEGY_MODEL_INFO` VARCHAR(1000) binary,
	`INCOME_INFO` VARCHAR(3000) binary,
	`TEAM_NAME` VARCHAR(50) binary,
	`TEAM_INFO` VARCHAR(500) binary,
	`CONSULTANT_NAME` VARCHAR(20) binary,
	`CONSULTANT_COMPANY` VARCHAR(30) binary,
	`CONSULTANT_JOB_ID` VARCHAR(20) binary,
	`CONSULTANT_IMAGE_ID` VARCHAR(100) binary,
	`CONSULTANT_IMAGE_NAME` VARCHAR(100) binary,
	`CONSULTANT_IMAGE_DESCRIBE` VARCHAR(50) binary,
	`CONSULTANT_IMAGE_URL` VARCHAR(500) binary,
	`DETAIL_FIELD_NAME` VARCHAR(50) binary,
	`SUPER_FIELD` VARCHAR(50) binary,
	`FIELD_SUBCLASS` VARCHAR(50) binary,
	`FIELD_INFO` VARCHAR(2000) binary,
	`AUDIT_STATUS` VARCHAR(1) binary,
	`BUY_STATUS` VARCHAR(2) binary,
	`COMM_PRIORITY` NUMERIC(9, 0),
	`COMM_1M_PRIORITY` NUMERIC(9, 0),
	`COMM_3M_PRIORITY` NUMERIC(9, 0),
	`COMM_6M_PRIORITY` NUMERIC(9, 0),
	`COMM_1Y_PRIORITY` NUMERIC(9, 0),
	`COMM_DRAWDOWN_PRIORITY` NUMERIC(9, 0),
	`SET_CREATE_TIME` DATETIME,
	`PROD_TYPE` VARCHAR(2) binary,
	`CREATE_PERSONNEL` VARCHAR(50) binary,
	`SET_UPDATE_TIME` DATETIME comment '修改时间',
	`UPDATE_PERSONNEL` VARCHAR(50) binary,
	`YD_URL_NAME` VARCHAR(100) binary comment '移动端跳转地址名称',
	`JH_URL_NAME` VARCHAR(100) binary comment '君弘网跳转地址名称',
	`PC_URL_NAME` VARCHAR(100) binary comment 'PC端跳转地址名称',
	`RATE_POSTFIX` VARCHAR(10) binary comment '收益率后缀',
	`FIRST_DETAIL_DISPLAY` VARCHAR(50) binary comment '详情高优先字段',
	`SECOND_DETAIL_DISPLAY` VARCHAR(50) binary comment '详情低优先字段',
	`BEGIN_DATE` VARCHAR(50) binary comment '开始日期',
	`BEGIN_TIME` VARCHAR(50) binary comment '开始时间',
	`END_DATE` VARCHAR(50) binary comment '结束日期',
	`END_TIME` VARCHAR(50) binary comment '结束时间',
	`OPER_ID` VARCHAR(255) binary comment '（不知含义）',
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
)
comment='产品信息设置';


create table if not exists `otc`.`FUND_INVEST_TRANSFER_SERIAL` (
	`CIF_ACCOUNT` VARCHAR(50) binary comment '一户通号',
	`BUSIN_ACCOUNT` VARCHAR(50) binary not null comment '客户资金账号',
	`BANK_NO` VARCHAR(4) binary comment '银行编号',
	`BANK_NAME` VARCHAR(50) binary comment '银行名称',
	`TRANSFER_DIRECTION` CHAR(1) binary comment '1-转入，2-转出，3-赎回',
	`MONEY_TYPE` CHAR(1) binary not null comment '币种',
	`OCCUR_BALANCE` VARCHAR(19) binary not null comment '转账金额',
	`CLEAR_BALANCE` VARCHAR(19) binary comment '账户余额',
	`EN_FUNCTION_TYPE` VARCHAR(50) binary not null comment '策略编号',
	`ENTRUST_NO` VARCHAR(50) binary not null comment '委托编号',
	`ENTRUST_DATE` VARCHAR(10) binary comment '委托日期',
	`ENTRUST_TIME` VARCHAR(10) binary comment '委托时间',
	`BKTRANS_STATUS` CHAR(1) binary comment '0-未报,1-已报,2-成功,3-失败,4-超时,5-待冲正,6-已冲正,7-调整为成功,8-调整为失败',
	`BANK_ERROR_NO` VARCHAR(10) binary comment '银行错误编号',
	`BANK_ERROR_INFO` VARCHAR(500) binary comment '银行错误信息',
	`ERROR_INFO` VARCHAR(500) binary comment '集中交易错误信息',
	`ERROR_NO` VARCHAR(10) binary comment '集中交易错误编号',
	`CHANNEL` VARCHAR(255) binary comment '发起渠道',
	`EXTRA` VARCHAR(255) binary comment '附加信息',
	`REDEEM_PERCENT` VARCHAR(7) binary comment '赎回比例',
	`MAIN_BUSIN_ACCOUNT` VARCHAR(50) binary comment '主资金账号',
	`SOURCE` VARCHAR(10) binary comment '渠道 JRSC:金融商城  XST:销售通'
)
comment='基金投顾流水表';

create index `BIN$JRvB0lQo0lrgYAB/AQBj0w==$0` on `otc`.`FUND_INVEST_TRANSFER_SERIAL` (`BUSIN_ACCOUNT` ASC, `EN_FUNCTION_TYPE` ASC);


create table if not exists `otc`.`GJ_G2010_PRODT_RATET_INFO` (
	`PROD_TYPE` VARCHAR(2) binary comment '产品类型',
	`RATE_TYPE` VARCHAR(100) binary comment '收益率类型（中文）',
	`PRIORITY` NUMERIC(19, 0) comment '收益率展示优先级',
	`COL_NAME` VARCHAR(50) binary comment '收益率字段名',
	`TYPE` VARCHAR(2) binary comment '类型(1、收益率  2、销量  3、购买人数)',
	`TYPE2` VARCHAR(2) binary comment '类型2(1.常规类型，2.限定特殊类型，3.两者共用)'
)
comment='产品类型对应收益率类型表';


create table if not exists `otc`.`GJ_INDEX_FLUCTUATE_KV` (
	`ID` VARCHAR(20) binary not null,
	`KV_URL` VARCHAR(512) binary comment 'KVurl',
	`IMG_URL` VARCHAR(512) binary,
	`IMG_NAME` VARCHAR(255) binary,
	`IMG_ID` VARCHAR(512) binary,
	`INDEX_ID` NUMERIC(20, 0) comment '指数id',
	`PRIORITY` VARCHAR(12) binary comment '优先级',
	`CREATE_PERSONNEL` VARCHAR(25) binary,
	`UPD_PERSONNEL` VARCHAR(25) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	constraint `BIN$JRvB0lex0lrgYAB/AQBj0w==$0` primary key (`ID`)
)
comment='指数投教KV';

create UNIQUE index `BIN$JRvB0ley0lrgYAB/AQBj0w==$0` on `otc`.`GJ_INDEX_FLUCTUATE_KV` (`ID` ASC);


create table if not exists `otc`.`GJ_CUST_INFO` (
	`CUST_NUM` VARCHAR(20) binary not null comment '客户编号',
	`NAME` VARCHAR(100) binary comment '姓名',
	`AGE` NUMERIC(10, 0) comment '年龄',
	`SEX` VARCHAR(1) binary comment '性别',
	`ORG_NUM` NUMERIC(19, 0) comment '所属营业部',
	`DEP_NUM` NUMERIC(19, 0) comment '所属分公司',
	`CUST_MANAGER` VARCHAR(150) binary comment '客户经理',
	`MARKET_VALUE` NUMERIC(19, 0) comment '市值',
	`MOBILE` VARCHAR(100) binary comment '手机号',
	`CUST_TYPE` VARCHAR(1) binary not null comment '客户类型',
	`REC_GEN_TIME` DATETIME(6) comment '记录生成时间',
	`REC_UPD_TIME` DATETIME(6) comment '记录更新时间',
	`CUST_MANAGER_MOBILE` VARCHAR(350) binary comment '客户经理手机号码',
	`FUND_ACCOUNT` VARCHAR(100) binary comment '资金账号',
	`CARD_NUM` VARCHAR(50) binary comment '身份证号',
	`MEMBER_FLG` VARCHAR(1) binary comment '君弘会员',
	`ASSET` NUMERIC(19, 4) comment '总资产',
	`MARRIAGE_FLG` VARCHAR(1) binary comment '婚姻状况',
	`MANAGER_FLG` VARCHAR(1) binary comment '是否董监高',
	`RISK_REMARK` VARCHAR(500) binary comment '风险自述',
	`EMAIL` VARCHAR(50) binary comment '邮箱',
	`RISK_GRADE` VARCHAR(50) binary,
	`MOBILE_UPDATE` VARCHAR(40) binary comment '号码更新',
	`ADDR_UPDATE` VARCHAR(40) binary,
	`OPEN_TIME` NUMERIC(20, 0),
	`ADDRESS` VARCHAR(500) binary,
	`MAX_HALFASSET_DATE` VARCHAR(8) binary,
	`MAX_HALFYEAR_ASSET` NUMERIC(65, 30),
	constraint `BIN$JRvB0lTu0lrgYAB/AQBj0w==$0` primary key (`CUST_NUM`)
)
comment='客户基本信息';

create UNIQUE index `BIN$JRvB0lTv0lrgYAB/AQBj0w==$0` on `otc`.`GJ_CUST_INFO` (`CUST_NUM` ASC);


create table if not exists `otc`.`GJ_G2010_T2SDK_LOG` (
	`REC_GEN_TIME` DATETIME(6),
	`REC_UPD_TIME` DATETIME(6),
	`LSH` NUMERIC(19, 0) not null,
	`CUST_NUM` VARCHAR(50) binary,
	`FUND_ACCOUNT` VARCHAR(50) binary,
	`FUNCTION_ID` VARCHAR(20) binary,
	`BIZ_DATE` DATETIME,
	`KBN` CHAR(1) binary,
	`RESULT` LONGTEXT,
	`CIF_ACCOUNT` VARCHAR(50) binary,
	`PARAMETER` LONGTEXT,
	`SERIAL_NO` VARCHAR(50) binary,
	`CALL_TIME` NUMERIC(8, 0),
	constraint `BIN$JRvB0laF0lrgYAB/AQBj0w==$0` primary key (`LSH`)
);

create index `BIN$JRvB0laG0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2010_T2SDK_LOG` (`BIZ_DATE` ASC);

create UNIQUE index `BIN$JRvB0laH0lrgYAB/AQBj0w==$0` on `otc`.`GJ_G2010_T2SDK_LOG` (`LSH` ASC);


create table if not exists `otc`.`GJ_FYCJ_CONDITION` (
	`CUST_NUM` VARCHAR(20) binary,
	`USER_CODE` VARCHAR(18) binary,
	`CIF_ACCOUNT` VARCHAR(20) binary,
	`CODE` VARCHAR(50) binary not null,
	`AWARD` VARCHAR(50) binary,
	`LOTTERY_FLAG` CHAR(1) binary,
	`FUND_ACCOUNT` VARCHAR(20) binary,
	`AWARD_FLAG` CHAR(1) binary,
	`PHONE_NUM` VARCHAR(20) binary,
	`SCRATCH_TIME` DATETIME,
	`CASH_TIME` DATETIME,
	`PHONE_NUM_GIVEN` VARCHAR(50) binary,
	`CERTIFICATE_TYPE` VARCHAR(20) binary,
	constraint `BIN$JRvB0lUS0lrgYAB/AQBj0w==$0` primary key (`CODE`)
)
comment='富易抽奖用户表';

create UNIQUE index `BIN$JRvB0lUU0lrgYAB/AQBj0w==$0` on `otc`.`GJ_FYCJ_CONDITION` (`CODE` ASC);


create table if not exists `otc`.`JG_OUT_CUST_INFO` (
	`CUST_ID` VARCHAR(40) binary,
	`CUST_MANAGER` VARCHAR(150) binary,
	`MAN_MOBILE` VARCHAR(350) binary
);


create table if not exists `otc`.`L_ORGANIZATION` (
	`ORG_ID` NUMERIC(19, 0) not null comment '部门ID',
	`ORG_NAME` VARCHAR(50) binary comment '部门名称',
	`ORG_DESC` VARCHAR(500) binary comment '部门描述',
	`SUPER_ID` NUMERIC(19, 0) comment '上级部门ID',
	`ORG_TYPE` VARCHAR(20) binary comment '部门类型',
	`DELETE_FLAG` NUMERIC(10, 0) comment '逻辑删除标示，1为删除，0为未删除',
	`ORG_NUM` VARCHAR(100) binary comment '编号',
	`REC_VERSION` NUMERIC(19, 0) comment '乐观锁',
	`REC_GEN_TIME` DATETIME(6) comment '记录生成时间',
	`REC_UPD_TIME` DATETIME(6) comment '记录更新时间',
	constraint `BIN$JRvB0l4B0lrgYAB/AQBj0w==$0` primary key (`ORG_ID`)
)
comment='部门表';

create UNIQUE index `BIN$JRvB0l4C0lrgYAB/AQBj0w==$0` on `otc`.`L_ORGANIZATION` (`ORG_ID` ASC);


create table if not exists `otc`.`GJ_WORK_ATTENDENCE_MIDDLE` (
	`NAME` VARCHAR(10) binary not null,
	`WORK_UID` VARCHAR(30) binary not null,
	`CARD_NO` VARCHAR(10) binary not null,
	`WORK_DAY` VARCHAR(100) binary not null,
	`ON_DUTY_TIME` VARCHAR(100) binary,
	`OFF_DUTY_TIME` VARCHAR(100) binary,
	`WORK_HOURS` VARCHAR(5) binary,
	`WORK_STATE` VARCHAR(8) binary,
	`LCODER_CREATE_TIME` DATETIME default CURRENT_TIMESTAMP,
	`LCODER_UPDATE_TIME` DATETIME default CURRENT_TIMESTAMP
);


create table if not exists `otc`.`GJ_LOTTERY_LS` (
	`CUST_NUM` VARCHAR(20) binary comment '客户代码',
	`USER_CODE` VARCHAR(18) binary comment '用户代码',
	`CIF_ACCOUNT` VARCHAR(20) binary comment '一户通账号',
	`PROJECT_ID` VARCHAR(20) binary comment '项目ID',
	`PRIZE_NAME` VARCHAR(50) binary comment '奖品',
	`AWARD_FLAG` NUMERIC(1, 0) comment '奖品标识',
	`LOTTERY_AMOUNT` NUMERIC(8, 0) comment '中奖数量',
	`LOTTERY_TIME` DATETIME comment '抽奖日期',
	`PHONE_NUM` VARCHAR(20) binary comment '手机号码'
)
comment='抽奖流水表';


create table if not exists `otc`.`OLD_NEW_TABLE_NAME` (
	`OLD_TABLE_NAME` VARCHAR(255) binary,
	`NEW_TABLE_NAME` VARCHAR(255) binary,
	`COMMENT_ZH` VARCHAR(255) binary,
	`IS_DONE` VARCHAR(255) binary,
	`CREATE_DATE` DATETIME
);


create table if not exists `otc`.`GJ_OTC_MALLTRADE_FUNDCAN_LS` (
	`ID` NUMERIC(19, 0) not null,
	`CUST_NUM` VARCHAR(20) binary not null,
	`USER_CODE` VARCHAR(18) binary,
	`CIF_ACCOUNT` VARCHAR(20) binary,
	`FUND_ACCOUNT` VARCHAR(20) binary,
	`ENTRUST_NO_BEFORE` VARCHAR(20) binary,
	`ALLOT_TIME` VARCHAR(8) binary,
	`TRADE_TIME` VARCHAR(20) binary,
	`FUND_COMPANY` VARCHAR(50) binary,
	`FUND_CODE` VARCHAR(50) binary,
	`FUND_NAME` VARCHAR(50) binary,
	`ENTRUST_NO_AFTER` VARCHAR(20) binary,
	`BALANCE` VARCHAR(20) binary,
	`AMOUNT` VARCHAR(20) binary,
	`SERIAL_NO` VARCHAR(15) binary
)
comment='场内基金撤单流水';


