CREATE TABLE `activity` (
  `id`    varchar(36) NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '活动名称',
  `time`  datetime NOT NULL COMMENT '活动时间',
  `address` varchar(100)  NOT NULL COMMENT '活动地点',
  `max_num` int(3) default NULL COMMENT '限制人数',
  `min_num` int(3) default NULL COMMENT '最少人数',
  `sign_num` int(3) default NULL COMMENT '已报名人数',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `create_time` datetime default NULL COMMENT '创建时间',
  `modify_time` datetime default NULL COMMENT '最后修改时间',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

CREATE TABLE `user_activity` (
  `id`    varchar(36) NOT NULL,
  `activity_id` varchar(36) NOT NULL COMMENT '活动ID',
  `use_id`  varchar(36) NOT NULL COMMENT '用户ID',
  PRIMARY KEY  (`ID`),
  FOREIGN KEY (`activity_id`) REFERENCES `activity` (`ID`),
  FOREIGN KEY (`use_id`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户活动表';


CREATE TABLE `group` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `desc` varchar(100) NOT NULL COMMENT '简介',
  `create_time` datetime default NULL COMMENT '创建时间',
  `modify_time` datetime default NULL COMMENT '最后修改时间',
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
  `create_time` datetime default NULL COMMENT '创建时间',
  `modify_time` datetime default NULL COMMENT '最后修改时间',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';





