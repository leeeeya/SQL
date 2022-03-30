create table costs
( id bigint primary key ,
  node1 varchar not null,
  node2 varchar not null,
  cost integer not null default 10
  );

insert into costs values (1, 'A', 'B', 10);
insert into costs values (2, 'A', 'C', 15);
insert into costs values (3, 'A', 'D', 20);
insert into costs values (4, 'B', 'A', 10);
insert into costs values (5, 'B', 'C', 35);
insert into costs values (6, 'B', 'D', 25);
insert into costs values (7, 'C', 'A', 15);
insert into costs values (8, 'C', 'B', 35);
insert into costs values (9, 'C', 'D', 30);
insert into costs values (10, 'D', 'A', 20);
insert into costs values (11, 'D', 'B', 25);
insert into costs values (12, 'D', 'C', 30);