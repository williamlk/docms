--记录每次上线的修改

create database seckill;

use seckill;

CREATE TABLE seckill(
`seckill_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
`name` varchar(120) NOT NULL COMMENT '商品名称',
`number` int NOT NULL COMMENT '库存数量',
`start_time` timestamp NOT NULL COMMENT '秒杀开始时间',
`end_time` timestamp NOT NULL COMMENT '秒杀结束时间',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
primary key (seckill_id),
key idx_start_time(start_time),
key idx_end_time(end_time),
key idx_create_time(create_time)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

/*初始化数据*/
insert into 
	seckill(name,number,start_time,end_time)
values 
	('1000元秒杀iphone6s',100,'2016-09-16 00:00:00','2016-09-17 00:00:00'),
	('1元秒杀小米4',200,'2016-09-16 00:00:00','2016-09-17 00:00:00'),
	('300元秒杀ipad air2',300,'2016-09-16 00:00:00','2016-09-17 00:00:00'),
	('400元秒杀红米note',400,'2016-09-16 00:00:00','2016-09-17 00:00:00');
	
-- 秒杀成功明细表
-- 用户登录认证相关的信息
create table success_killed(
`seckill_id` bigint not null COMMENT '秒杀商品id',
`user_phone` bigint not null COMMENT '用户手机号',
`state` tinyint not null DEFAULT -1 COMMENT '状态标识 -1:无效 0:成功 1:已付款 2:已发货',
`create_time` timestamp not null COMMENT '创建时间',
PRIMARY KEY(seckill_id,user_phone),/*联合主键*/
key idx_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';
