-- 생성
create user 'webdb'@'%' identified by '1234';

-- 비번 변경
alter user 'webdb'@'%' identified by 'webdb';

-- 권한 부여
grant all privileges on web_db.* to 'webdb'@'%' ;

-- 삭제
drop user 'webdb'@'%';

-- 즉시 내용 변경 반영
flush privileges;

create database web_db
    default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n';
    
show databases;

create user 'book_db'@'%' identified by '1234';
grant all privileges on book_db.* to 'book_db'@'%' ;
drop user 'book_db'@'%';

-- -----------------------------------------------------@@

-- --------------------------------------------------------
# book_db 데이터베이스, book계정, book계정 권한 초기화 세팅 스트립트
#
# root로 접속해야함
-- --------------------------------------------------------

-- 계정이 있다면 삭제
drop user if exists 'book'@'%';


-- 계정만들기(book/book/모든곳)
create user 'book'@'%' identified by 'book';

-- 권한부여(book계정, book_db데이터베이스에 모든권한 부여)
grant all privileges on book_db.* to 'book'@'%' ;


-- 데이타 베이스가 있다면 삭제
drop database if exists book_db;

-- 데이터 베이스 생성(book_db)
create database book_db
    default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n';

-- 즉시 변경 내용 반영
flush privileges;


