CREATE DATABASE /*!32312 IF NOT EXISTS*/`cars_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cars_system`;

/*Table structure for table `bus_car` */

CREATE TABLE `bus_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆',
  `classify_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  `number` varchar(45) NOT NULL DEFAULT '' COMMENT '车牌号',
  `color` varchar(30) NOT NULL DEFAULT '' COMMENT '颜色',
  `bands` varchar(45) NOT NULL DEFAULT '' COMMENT '车品牌',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0:未选 1:已选',
  `type` varchar(45) NOT NULL DEFAULT '' COMMENT '型号 1:4座 2:7座 3:其他',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `bus_car` */

insert  into `bus_car`(`id`,`classify_id`,`number`,`color`,`bands`,`status`,`type`,`create_time`,`update_time`) values (1,5,'京A8888','黑','迈凯伦',1,'1','2020-04-01 00:29:10','2020-04-01 18:10:27');
insert  into `bus_car`(`id`,`classify_id`,`number`,`color`,`bands`,`status`,`type`,`create_time`,`update_time`) values (2,2,'京B1234','黑','大众迈腾',1,'1','2020-04-01 09:24:25','2020-04-01 09:24:25');
insert  into `bus_car`(`id`,`classify_id`,`number`,`color`,`bands`,`status`,`type`,`create_time`,`update_time`) values (3,1,'京B6666','灰','五菱宏光',1,'2','2020-04-01 09:24:47','2020-04-01 09:24:47');
insert  into `bus_car`(`id`,`classify_id`,`number`,`color`,`bands`,`status`,`type`,`create_time`,`update_time`) values (4,2,'京B5555','白','本田思域',1,'1','2020-04-01 09:28:41','2020-04-01 17:26:50');

/*Table structure for table `bus_company` */

CREATE TABLE `bus_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '公司名称',
  `email` varchar(45) NOT NULL DEFAULT '' COMMENT '邮箱',
  `leader` varchar(45) NOT NULL DEFAULT '' COMMENT '负责人姓名',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态 1:可选 2:已选 3:已注销',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `bus_complain` */

CREATE TABLE `bus_complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型 1:迟到 2:加价 3:言语不当 4:故意绕路 5:其他',
  `description` varchar(300) NOT NULL DEFAULT '' COMMENT '描述',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '扣除的积分',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0:未审核 1:已审核',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `bus_driver` */

CREATE TABLE `bus_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `car_id` int(11) NOT NULL DEFAULT '0' COMMENT '是否有车 0:没有 否则为车辆id',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '姓名',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 0：男 1：女',
  `email` varchar(45) NOT NULL DEFAULT '' COMMENT '邮箱',
  `phone` varchar(45) NOT NULL DEFAULT '' COMMENT '电话',
  `price` double NOT NULL DEFAULT '0' COMMENT '价格/分钟',
  `credit` int(11) NOT NULL DEFAULT '100' COMMENT '信用积分',
  `if_chosen` int(1) NOT NULL DEFAULT '0' COMMENT '0:未选 1:已选',
  `age` int(11) NOT NULL DEFAULT '0' COMMENT '年龄',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:待注册 1:待选车 2:待审核 3:可用 4:进行中 5:禁用',
  `dno` varchar(45) NOT NULL DEFAULT 'D-0000000000000' COMMENT '司机编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `bus_order` */

CREATE TABLE `bus_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单',
  `driver_id` int(11) NOT NULL DEFAULT '0' COMMENT '司机id',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司id',
  `ono` varchar(45) NOT NULL DEFAULT '' COMMENT '订单编号',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用车时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `review_time` timestamp NULL DEFAULT NULL COMMENT '上车时间',
  `money` double NOT NULL DEFAULT '0' COMMENT '总价',
  `place` varchar(100) NOT NULL DEFAULT '' COMMENT '用车地点',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '状态 1:待付款 2:待审核 3:审核通过 4:审核失败 5:进行中 6:已完成 7:已投诉',
  `phone` varchar(45) NOT NULL DEFAULT '' COMMENT '员工电话',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `dic_classify` */

CREATE TABLE `dic_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆分类',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(50) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dic_classify` */

insert  into `dic_classify`(`id`,`name`,`description`,`create_time`,`update_time`) values (1,'入门级','10万以下','2020-03-31 20:39:59','2020-03-31 20:39:59');
insert  into `dic_classify`(`id`,`name`,`description`,`create_time`,`update_time`) values (2,'消费级','10万-30万','2020-03-31 20:40:11','2020-03-31 20:40:11');
insert  into `dic_classify`(`id`,`name`,`description`,`create_time`,`update_time`) values (3,'普通级','30万-50万','2020-03-31 20:55:52','2020-03-31 20:55:52');
insert  into `dic_classify`(`id`,`name`,`description`,`create_time`,`update_time`) values (4,'豪华级','50万-200万','2020-03-31 20:56:13','2020-03-31 20:56:13');
insert  into `dic_classify`(`id`,`name`,`description`,`create_time`,`update_time`) values (5,'奢华级','200万以上','2020-03-31 20:56:23','2020-03-31 20:56:23');

/*Table structure for table `sys_permission` */

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统权限',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `uri` varchar(100) NOT NULL COMMENT 'URI',
  `is_menu` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否为菜单 0:否 1:是',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (1,'主页','/main',0,0,'2020-03-31 20:33:21','2020-03-31 20:33:30');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (2,'分类管理','/classify',1,0,'2020-03-31 20:33:50','2020-04-02 23:00:29');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (3,'分类列表','/classify/list',0,2,'2020-03-31 20:34:09','2020-03-31 20:34:09');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (4,'添加分类','/classify/add',0,2,'2020-03-31 20:34:20','2020-03-31 20:34:20');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (5,'修改分类','/classify/update',0,2,'2020-03-31 20:34:30','2020-03-31 20:34:30');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (6,'删除分类','/classify/delete',0,2,'2020-03-31 20:34:41','2020-03-31 20:34:41');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (7,'公司管理','/company',1,0,'2020-03-31 23:01:43','2020-04-02 23:00:31');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (8,'单位列表','/company/list',0,7,'2020-03-31 23:01:59','2020-03-31 23:01:59');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (9,'添加单位','/company/add',0,7,'2020-03-31 23:02:09','2020-03-31 23:02:09');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (10,'修改单位','/company/update',0,7,'2020-03-31 23:02:22','2020-03-31 23:02:22');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (11,'删除单位','/company/delete',0,7,'2020-03-31 23:02:34','2020-03-31 23:02:40');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (13,'车辆管理','/car',1,0,'2020-04-01 00:11:02','2020-04-02 23:00:32');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (14,'车辆列表','/car/list',0,13,'2020-04-01 00:11:28','2020-04-01 00:11:28');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (15,'添加车辆','/car/add',0,13,'2020-04-01 00:11:36','2020-04-01 00:11:36');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (16,'修改车辆','/car/update',0,13,'2020-04-01 00:11:47','2020-04-01 00:11:47');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (17,'删除车辆','/car/delete',0,13,'2020-04-01 00:11:59','2020-04-01 00:11:59');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (18,'账号管理','/user',1,0,'2020-04-01 09:50:20','2020-04-02 23:00:34');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (19,'账号列表','/user/list',0,18,'2020-04-01 09:50:35','2020-04-01 09:50:35');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (20,'新增账号','/user/add',0,18,'2020-04-01 09:50:52','2020-04-01 09:50:52');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (21,'删除账号','/user/delete',0,18,'2020-04-01 09:51:02','2020-04-01 09:51:02');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (22,'修改账号','/user/update',0,18,'2020-04-01 09:51:13','2020-04-01 09:51:13');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (23,'司机管理','/driver',1,0,'2020-04-01 10:39:24','2020-04-02 23:00:36');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (24,'司机列表','/driver/list',0,23,'2020-04-01 10:39:39','2020-04-01 10:39:39');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (25,'添加司机','/driver/add',0,23,'2020-04-01 10:39:50','2020-04-01 10:39:50');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (26,'删除司机','/driver/delete',0,23,'2020-04-01 10:39:58','2020-04-01 10:39:58');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (27,'修改司机','/driver/update',0,23,'2020-04-01 10:40:18','2020-04-01 10:40:18');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (28,'审核司机','/driver/review',0,23,'2020-04-01 11:20:49','2020-04-01 11:20:49');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (29,'选择司机','/driver/addUser',0,23,'2020-04-01 14:19:04','2020-04-01 14:19:04');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (30,'选择公司','/company/addUser',0,7,'2020-04-01 15:15:20','2020-04-01 15:15:20');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (31,'自行完善单位信息','/company/selfAdd',0,7,'2020-04-01 15:23:48','2020-04-01 15:24:27');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (32,'自行完善个人信息','/driver/selfAdd',0,23,'2020-04-01 15:24:24','2020-04-01 15:24:24');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (33,'选择车辆','/chooseCar',1,0,'2020-04-01 16:14:33','2020-04-01 16:34:45');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (34,'选择车辆列表','/chooseCar/list',0,33,'2020-04-01 16:36:02','2020-04-01 16:36:02');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (35,'车辆信息(个人)','/car/info',0,13,'2020-04-01 17:36:54','2020-04-01 17:37:13');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (36,'订单管理','/order',1,0,'2020-04-01 20:33:26','2020-04-02 23:00:38');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (37,'订单列表','/order/list',0,36,'2020-04-01 20:33:41','2020-04-01 20:33:41');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (38,'发起订单','/order/buy',0,36,'2020-04-01 20:34:08','2020-04-01 20:34:08');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (39,'服务选择','/goods',1,0,'2020-04-01 20:47:00','2020-04-03 02:08:53');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (40,'服务列表','/goods/list',0,39,'2020-04-01 20:47:09','2020-04-01 20:47:09');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (41,'服务提交','/goods/submit',0,39,'2020-04-01 22:53:51','2020-04-01 22:53:51');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (42,'确认接客','/driver/meet',0,23,'2020-04-02 11:42:35','2020-04-02 11:42:35');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (43,'确认到达','/driver/arrive',0,23,'2020-04-02 11:42:46','2020-04-02 11:42:46');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (44,'付款','/company/pay',0,7,'2020-04-02 15:23:57','2020-04-02 15:23:57');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (45,'删除订单','/company/removeOrder',0,7,'2020-04-02 15:24:12','2020-04-02 15:24:12');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (46,'投诉管理','/complain',1,0,'2020-04-02 19:39:35','2020-04-02 23:00:46');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (47,'提交投诉','/complain/add',0,46,'2020-04-02 19:39:49','2020-04-02 19:39:49');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (48,'投诉列表','/complain/list',0,46,'2020-04-02 20:20:10','2020-04-02 20:20:10');
insert  into `sys_permission`(`id`,`name`,`uri`,`is_menu`,`pid`,`create_time`,`update_time`) values (49,'投诉处理','/complain/review',0,46,'2020-04-02 22:07:17','2020-04-02 22:07:17');

/*Table structure for table `sys_rel_role_permission` */

CREATE TABLE `sys_rel_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色关联表',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_rel_role_permission` */

insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (1,1,1,'2020-03-31 20:35:56','2020-03-31 20:35:56');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (2,1,2,'2020-03-31 20:35:57','2020-03-31 20:35:57');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (3,1,3,'2020-03-31 20:35:59','2020-03-31 20:35:59');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (4,1,4,'2020-03-31 20:36:01','2020-03-31 20:36:01');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (5,1,5,'2020-03-31 20:36:02','2020-04-01 09:46:10');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (6,1,6,'2020-03-31 20:36:05','2020-04-01 09:46:23');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (7,1,7,'2020-03-31 23:04:22','2020-03-31 23:04:22');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (8,1,8,'2020-03-31 23:04:24','2020-03-31 23:04:24');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (9,1,9,'2020-03-31 23:04:26','2020-03-31 23:04:26');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (10,1,10,'2020-03-31 23:04:28','2020-03-31 23:04:28');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (11,1,11,'2020-03-31 23:04:30','2020-03-31 23:04:30');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (12,1,13,'2020-03-31 23:04:33','2020-04-01 00:12:17');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (13,1,14,'2020-04-01 00:12:19','2020-04-01 00:12:19');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (14,1,15,'2020-04-01 00:12:21','2020-04-01 00:12:21');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (15,1,16,'2020-04-01 00:12:25','2020-04-01 00:12:25');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (16,1,17,'2020-04-01 00:12:32','2020-04-01 00:12:32');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (17,1,18,'2020-04-01 09:51:25','2020-04-01 09:51:25');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (18,1,19,'2020-04-01 09:51:29','2020-04-01 09:51:29');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (19,1,20,'2020-04-01 09:51:33','2020-04-01 09:51:33');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (20,1,21,'2020-04-01 09:51:36','2020-04-01 09:51:36');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (21,1,22,'2020-04-01 09:51:39','2020-04-01 09:51:39');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (22,1,23,'2020-04-01 10:40:28','2020-04-01 10:40:28');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (23,1,24,'2020-04-01 10:40:33','2020-04-01 10:40:39');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (24,1,25,'2020-04-01 10:40:37','2020-04-01 10:40:37');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (25,1,26,'2020-04-01 10:40:42','2020-04-01 10:40:42');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (26,1,27,'2020-04-01 10:40:46','2020-04-01 10:40:46');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (27,1,28,'2020-04-01 11:20:57','2020-04-01 11:20:57');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (28,2,1,'2020-04-01 11:36:09','2020-04-01 11:36:09');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (29,3,1,'2020-04-01 11:56:01','2020-04-01 11:56:01');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (30,3,29,'2020-04-01 14:19:22','2020-04-01 14:19:22');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (31,2,30,'2020-04-01 15:15:28','2020-04-01 15:15:28');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (32,2,31,'2020-04-01 15:24:37','2020-04-01 15:24:37');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (33,3,32,'2020-04-01 15:24:40','2020-04-01 15:24:40');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (34,3,33,'2020-04-01 16:14:42','2020-04-01 16:14:42');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (35,3,34,'2020-04-01 16:36:11','2020-04-01 16:36:11');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (36,3,14,'2020-04-01 16:55:47','2020-04-01 16:56:11');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (37,3,35,'2020-04-01 17:37:24','2020-04-01 17:37:24');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (38,1,36,'2020-04-01 20:34:23','2020-04-01 20:34:23');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (39,1,37,'2020-04-01 20:34:25','2020-04-01 20:34:25');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (40,2,38,'2020-04-01 20:34:28','2020-04-01 20:34:28');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (41,2,39,'2020-04-01 20:47:16','2020-04-01 20:47:16');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (42,2,40,'2020-04-01 20:47:20','2020-04-01 20:47:20');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (43,2,41,'2020-04-01 22:53:59','2020-04-01 22:53:59');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (44,3,42,'2020-04-02 11:42:56','2020-04-02 11:42:56');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (45,3,43,'2020-04-02 11:42:59','2020-04-02 11:42:59');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (46,2,44,'2020-04-02 15:27:53','2020-04-02 15:27:53');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (47,2,45,'2020-04-02 15:27:57','2020-04-02 15:27:57');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (48,1,46,'2020-04-02 19:39:59','2020-04-02 19:39:59');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (49,2,47,'2020-04-02 19:40:03','2020-04-02 19:40:03');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (50,1,48,'2020-04-02 20:20:17','2020-04-02 20:20:17');
insert  into `sys_rel_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`) values (51,1,49,'2020-04-02 22:07:23','2020-04-02 22:07:23');

/*Table structure for table `sys_role` */

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统角色',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `description` varchar(50) NOT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`description`,`create_time`,`update_time`) values (1,'admin','超级管理员','2020-03-31 16:04:22','2020-03-31 16:04:22');
insert  into `sys_role`(`id`,`name`,`description`,`create_time`,`update_time`) values (2,'company','用车公司','2020-04-01 09:52:26','2020-04-01 09:52:26');
insert  into `sys_role`(`id`,`name`,`description`,`create_time`,`update_time`) values (3,'driver','司机','2020-04-01 09:52:43','2020-04-01 09:52:43');

/*Table structure for table `sys_user` */

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统用户',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(6) NOT NULL COMMENT '盐',
  `icon` varchar(1000) NOT NULL DEFAULT 'http://www.jfshare.xyz:9090/default_icon.jpg' COMMENT '头像',
  `role_id` int(11) NOT NULL DEFAULT '2' COMMENT '角色id',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0：正常 1：注销',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`nickname`,`username`,`password`,`salt`,`icon`,`role_id`,`status`,`create_time`,`update_time`) values (1,'超级管理员','admin','ed52bfda75df28ab99ecbb8cd32f3fa3','xers5g','http://www.jfshare.xyz:9090/default_icon.jpg',1,0,'2020-03-31 17:23:01','2020-03-31 17:23:01');
