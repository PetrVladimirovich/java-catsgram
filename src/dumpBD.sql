create table cat_user
(
    id varchar(64) not null,
    username varchar(255) default 'noname cat',
    nickname varchar(255)
);

create unique index user_id_uindex
    on cat_user (id);


INSERT INTO cat_user (id, username, nickname) VALUES ('tom', 'Thomas C. Andersun', 'neoc@t');
INSERT INTO cat_user (id, username, nickname) VALUES ('grumpy', 'Альфред Хичкот', 'sca_a_a_ry');
INSERT INTO cat_user (id, username, nickname) VALUES ('puss_in_boots', 'Basileus Felis F.', 'under_wood');

create table cat_post
(
    id int generated by default as identity primary key,
    author_id     varchar(64) not null,
    description   varchar(500),
    photo_url     varchar(1000),
    creation_date timestamp,
    CONSTRAINT fk_post_author
      FOREIGN KEY(author_id)
      REFERENCES cat_user(id)
);

INSERT INTO cat_post (author_id, description, photo_url, creation_date) VALUES ('tom', 'я и мой кот Том', 'file:///storage/catsgram/tom/1/image.png', '2022-03-28 19:22:29.000000');
INSERT INTO cat_post (author_id, description, photo_url, creation_date) VALUES ('tom', 'первый пост)', 'file:///storage/catsgram/tom/2/image.png', '2022-03-13 15:32:54.000000');
INSERT INTO cat_post (author_id, description, photo_url, creation_date) VALUES ('grumpy', 'ВсЕм ПрИвЕт!!!111', 'file:///storage/catsgram/grumpy/1/image.png', '2022-02-28 15:24:03.000000');
INSERT INTO cat_post (author_id, description, photo_url, creation_date) VALUES ('grumpy', 'ykykykky', 'none', '2023-01-02 15:24:03.000000');
INSERT INTO cat_post (author_id, description, photo_url, creation_date) VALUES ('tom', 'как дела?', 'file:///storage/catsgram/tom/2/image.png', '2022-03-13 15:32:54.000000');
INSERT INTO cat_post (author_id, description, photo_url, creation_date) VALUES ('grumpy', 'нормально, а у тебя?', 'none', '2023-01-02 15:24:03.000000');
INSERT INTO cat_post (author_id, description, photo_url, creation_date) VALUES ('puss_in_boots', 'hey!!! Всем привет!', 'file:///storage/catsgram/tom/2/image.png', '2022-03-13 15:32:54.000000');
INSERT INTO cat_post (author_id, description, photo_url, creation_date) VALUES ('tom', 'С прибытием!!', 'none', '2023-01-02 15:24:03.000000');
INSERT INTO cat_post (author_id, description, photo_url, creation_date) VALUES ('grumpy', 'Привет!', 'none', '2023-01-02 15:24:03.000000');

select * from cat_post;

create table cat_chat
(
    id        int generated by default as identity primary key,
    user_from varchar(64),
    user_to   varchar(64),
    send_date timestamp,
    message   varchar(1024),
    user_read boolean
);

create table cat_follow
(
    id          int generated by default as identity primary key,
    author_id   varchar(64) REFERENCES cat_user(id),
    follower_id varchar(64) REFERENCES cat_user(id)
);

INSERT INTO cat_follow (author_id, follower_id) VALUES('grumpy', 'tom');

INSERT INTO public.cat_post (author_id, description, photo_url, creation_date) VALUES ('grumpy', 'Мой новый пост!!111', 'file:///storage/catsgram/grumpy/2/image.png', '2022-03-08 15:24:03.000000');