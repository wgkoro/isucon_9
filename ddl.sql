create schema isucari collate utf8mb4_general_ci;

create table categories
(
	id int unsigned auto_increment
		primary key,
	parent_id int unsigned not null,
	category_name varchar(191) not null
);

create table configs
(
	name varchar(191) not null
		primary key,
	val varchar(255) not null
);

create table items
(
	id bigint auto_increment
		primary key,
	seller_id bigint not null,
	buyer_id bigint default 0 not null,
	status enum('on_sale', 'trading', 'sold_out', 'stop', 'cancel') not null,
	name varchar(191) not null,
	price int unsigned not null,
	description text not null,
	image_name varchar(191) not null,
	category_id int unsigned not null,
	created_at datetime default CURRENT_TIMESTAMP not null,
	updated_at datetime default CURRENT_TIMESTAMP not null
);

create index idx_category_id
	on items (category_id);

create table shippings
(
	transaction_evidence_id bigint not null
		primary key,
	status enum('initial', 'wait_pickup', 'shipping', 'done') not null,
	item_name varchar(191) not null,
	item_id bigint not null,
	reserve_id varchar(191) not null,
	reserve_time bigint not null,
	to_address varchar(191) not null,
	to_name varchar(191) not null,
	from_address varchar(191) not null,
	from_name varchar(191) not null,
	img_binary mediumblob not null,
	created_at datetime default CURRENT_TIMESTAMP not null,
	updated_at datetime default CURRENT_TIMESTAMP not null
);

create table transaction_evidences
(
	id bigint auto_increment
		primary key,
	seller_id bigint not null,
	buyer_id bigint not null,
	status enum('wait_shipping', 'wait_done', 'done') not null,
	item_id bigint not null,
	item_name varchar(191) not null,
	item_price int unsigned not null,
	item_description text not null,
	item_category_id int unsigned not null,
	item_root_category_id int unsigned not null,
	created_at datetime default CURRENT_TIMESTAMP not null,
	updated_at datetime default CURRENT_TIMESTAMP not null,
	constraint item_id
		unique (item_id)
);

create table users
(
	id bigint auto_increment
		primary key,
	account_name varchar(128) not null,
	hashed_password varbinary(191) not null,
	address varchar(191) not null,
	num_sell_items int unsigned default 0 not null,
	last_bump datetime default '2000-01-01 00:00:00' not null,
	created_at datetime default CURRENT_TIMESTAMP not null,
	constraint account_name
		unique (account_name)
);


