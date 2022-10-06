use 表间关系;
#商品表
create table goods(
	id int primary key auto_increment,
	title varchar(100),
	price double(10,2)
);
#订单表
create table yh_order( 
	id int primary key auto_increment,
	payment double(10,2),
	payment_type tinyint,
	status tinyint
);
#订单商品中间表 
create table goods_order( 
	id int primary key auto_increment,
	order_id int,
	goods_id int,
	_count int
);
show tables;
alter table goods_order add constraint fk_order_id foreign key(order_id) references yh_order(id);
alter table goods_order add constraint fk_goods_id foreign key(goods_id) references goods(id);

insert into  goods (id,title,price) values(1,'guitar',1000),('2','clothes',200);
insert into yh_order (id,payment,payment_type,status) values(1,1000,2,1),(2,200,2,1);
insert into goods_order (id,order_id,goods_id,_count) values(1,1,1,2) ,(2,2,2,1);

select * from goods ,yh_order,goods_order where goods.id= goods_order.goods_id && yh_order.id =goods_order.order_id  ;