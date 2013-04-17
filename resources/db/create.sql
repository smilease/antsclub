CREATE DATABASE IF NOT EXISTS antsclub default charset utf8 COLLATE utf8_general_ci; 
use antsclub;
CREATE TABLE `activity` (
  `id`    varchar(36) NOT NULL,
  `typeCode` varchar(36)  COMMENT '活动类型代码',
  `typeName` varchar(36)  COMMENT '活动类型名称',
  `title` varchar(100) NOT NULL COMMENT '活动名称',
  `startTime`  datetime NOT NULL COMMENT '开始时间',
  `endTime`  datetime NOT NULL COMMENT '结束时间',
  `address` varchar(100)  NOT NULL COMMENT '活动地点',
  `detail` varchar(100)  COMMENT '活动详情',
  `maxNum` int(3)  COMMENT '限制人数',
  `minNum` int(3)  COMMENT '最少人数',
  `createTime`  datetime  COMMENT '创建时间',
  `createUserId` varchar(36)  COMMENT '创建者',
  `updateTime`  datetime  COMMENT '更新时间',
  `updateUserId` varchar(36)  COMMENT '创建者',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `uname` varchar(100) NOT NULL UNIQUE COMMENT '用户名',
  `pwd` varchar(100) NOT NULL COMMENT '密码',
  `email` varchar(100) UNIQUE COMMENT '注册邮箱',
  `nickname` varchar(100) UNIQUE COMMENT '昵称',
  `create_time` datetime COMMENT '创建时间',
  `modify_time` datetime COMMENT '最后修改时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

CREATE TABLE `user_activity` (
  `id`    varchar(36) NOT NULL,
  `activity_id` varchar(36) NOT NULL COMMENT '活动ID',
  `user_id`  varchar(36) NOT NULL COMMENT '用户ID',
  `sign_time` datetime COMMENT '报名时间',
  PRIMARY KEY  (`ID`),
  FOREIGN KEY (`activity_id`) REFERENCES `activity` (`ID`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户活动表';


CREATE TABLE `group` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `desc` varchar(100) NOT NULL COMMENT '简介',
  `create_time` datetime  COMMENT '创建时间',
  `modify_time` datetime  COMMENT '最后修改时间',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群组表';

CREATE TABLE `user_group` (
  `id`    varchar(36) NOT NULL,
  `group_id` varchar(36) NOT NULL COMMENT '活动ID',
  `use_id`  varchar(36) NOT NULL COMMENT '用户ID',
  PRIMARY KEY  (`ID`),
  FOREIGN KEY (`group_id`) REFERENCES `group` (`ID`),
  FOREIGN KEY (`use_id`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户群组表';

CREATE TABLE `meta` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `create_time` datetime  COMMENT '创建时间',
  `modify_time` datetime  COMMENT '最后修改时间',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';





