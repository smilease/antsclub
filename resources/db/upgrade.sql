ALTER TABLE `user_activity` ADD COLUMN `sign_time` DATETIME NULL COMMENT '报名时间'  AFTER `user_id` ;
ALTER TABLE `user_activity` ADD COLUMN `user_name` VARCHAR(45) NULL COMMENT '用户名(昵称或登陆名)' AFTER `user_id` ;


