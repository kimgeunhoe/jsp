create table board(
bno bigint not null auto_increment,
title varchar(100) not null,
price int not null,
made_by varchar(100) not null,
reg_at datetime default current_timestamp,
writer varchar(100) default "removed user",
category varchar(100) default null,
description text,
mod_at datetime default current_timestamp,
read_count int default '0',
image_file text,
primary key(bno)
)default charset=utf8mb4 collate=utf8mb4_general_ci;

create table member(
email varchar(100) not null,
pwd varchar(100) not null,
nick_name varchar(100) not null,
reg_at datetime default current_timestamp,
last_login datetime default null,
grade tinyint default '10',
primary key(email)
)default charset=utf8mb4 collate=utf8mb4_general_ci;

create table comment(
cno bigint not null auto_increment,
bno bigint default -1,
writer varchar(100) default "remove user",
content varchar(1000) not null,
reg_at datetime default current_timestamp,
mod_at datetime default current_timestamp,
primary key(cno)
)default charset=utf8mb4 collate=utf8mb4_general_ci;

create table product (
pno int primary key auto_increment,
pname varchar(100) not null,
price double not null,
regdate datetime default now(),
madeby varchar(100) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

create table replies (
rno bigint not null auto_increment,
pno int default -1,
replier varchar(100) default "remove user",
reply varchar(1000) not null,
reg_at datetime default current_timestamp,
mod_at datetime default current_timestamp,
primary key(rno)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- 개발전에 pk - fk관계를 설정하면 개발할 때 수정, 삭제 테스트에 제한이 있으므로 개발 후 테스트를 한 후 수정 및 삭제기능이 이상이 없을 경우 관계설정을 추가하여 다시 테스트하여 완료하는 것이 효율적

alter table board
add constraint fk_board_writer
foreign key(writer) references member(email)
on update cascade
on delete no action;

alter table comment
add constraint fk_comment_writer
foreign key(writer) references member(email)
on update cascade
on delete no action;

alter table comment
add constraint fk_comment_bno
foreign key(bno) references board(bno)
on update cascade
on delete no action;