-- 建立数据库
create database db_docms;
use db_docms;
alter database db_docms character set utf-8;

-- 初始化五张表，角色表，用户表，用户角色表，权限表，角色权限表
drop table if exists tb_role;
drop table if exists tb_user;
drop table if exists tb_user_role;
drop table if exists tb_authority;
drop table if exists tb_role_authority;

CREATE TABLE `tb_role` (
`id`  smallint(5) NOT NULL AUTO_INCREMENT ,
`name`  varchar(64) NOT NULL ,
`description`  varchar(255) NOT NULL DEFAULT '' COMMENT '权限描述' ,
`del`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识 1:删除 0:未删除' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='角色表';


CREATE TABLE `tb_user` (
`id`  smallint(5) NOT NULL AUTO_INCREMENT ,
`name`  varchar(64) NOT NULL ,
`password`  varchar(64) NOT NULL ,
`email`  varchar(64) NOT NULL ,
`phone`  varchar(21) NOT NULL ,
`status`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_time`  timestamp DEFAULT CURRENT_TIMESTAMP ,
`updated_time`  timestamp ON UPDATE CURRENT_TIMESTAMP ,
`del`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户表';


CREATE TABLE `tb_user_role` (
`user_id`  smallint(5) NOT NULL ,
`role_id`  smallint(5) NOT NULL ,
`del`  tinyint(1) NOT NULL DEFAULT 0 ,
primary key (user_id, role_id)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户角色表';


CREATE TABLE `tb_authority` (
`id`  smallint(5) NOT NULL AUTO_INCREMENT ,
`name`  varchar(64) NOT NULL DEFAULT '' ,
`url`  varchar(100) NULL DEFAULT '' ,
`description`  varchar(255) NULL DEFAULT '' ,
`parent_id`  smallint(5) NOT NULL DEFAULT 0 ,
`status`  tinyint(1) NOT NULL DEFAULT 0 ,
`type`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_time`  timestamp DEFAULT CURRENT_TIMESTAMP ,
`updated_time`  timestamp ON UPDATE CURRENT_TIMESTAMP ,
`del`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权限表';


CREATE TABLE `tb_role_authority` (
`role_id`  smallint(5) NOT NULL ,
`authority_id`  smallint(5) NOT NULL ,
`del`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`role_id`, `authority_id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='角色权限表';


