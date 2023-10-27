DROP TABLE IF EXISTS "users";



CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "name" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE TABLE "viewee" (
  "id" serial PRIMARY KEY,
  "user_id" integer NOT NULL,
  "level" integer NOT NULL,
  "skill" varchar NOT NULL,
  "qualification" varchar NOT NULL
);
ALTER TABLE "viewee" DROP COLUMN "qualification";
ALTER TABLE "viewee" ADD COLUMN "description" text NOT NULL DEFAULT 'Default Description';
ALTER TABLE "viewee" DROP COLUMN "skill";
ALTER TABLE "viewee" ADD COLUMN "name" text NOT NULL DEFAULT 'Default Name';
ALTER TABLE "viewee" RENAME COLUMN "id" TO "viewee_id";
ALTER TABLE "viewee" RENAME COLUMN "name" TO "viewee_name";

CREATE TABLE "viewer" (
  "id" serial PRIMARY KEY,
  "user_id" integer NOT NULL,
  "level" integer NOT NULL,
  "accept_skill" integer NOT NULL,
  "accept_count" integer NOT NULL,
  "userid" integer NOT NULL
);
ALTER TABLE "viewer" DROP COLUMN "accept_skill";
ALTER TABLE "viewer" ADD COLUMN "description" text NOT NULL DEFAULT 'Default Description';
ALTER TABLE "viewer" ADD COLUMN "name" text NOT NULL DEFAULT 'Default Name';
ALTER TABLE "viewer" RENAME COLUMN "id" TO "viewer_id";
ALTER TABLE "viewer" RENAME COLUMN "name" TO "viewer_name";


DROP TABLE skill;
CREATE TABLE "skill" (
  "id" serial PRIMARY KEY,
  "viewer_id" integer NOT NULL,
  "viewee_id" integer NOT NULL,
  "skill" integer NOT NULL
);
ALTER TABLE "skill" ADD FOREIGN KEY ("viewer_id") REFERENCES "viewer" ("id");
ALTER TABLE "skill" ADD FOREIGN KEY ("viewee_id") REFERENCES "viewee" ("id");
ALTER TABLE "skill" ALTER COLUMN "viewee_id" DROP NOT NULL;

CREATE TABLE "week" (
  "id" serial PRIMARY KEY
	
  
);



CREATE TABLE "match" (
  "id" serial PRIMARY KEY,
  "viewer_id" integer NOT NULL,
  "viewee_id" integer NOT NULL,
  "week_id" integer NOT NULL,
  "view_time" timestamp NOT NULL
);
ALTER TABLE "match" DROP CONSTRAINT "match_week_id_fkey";


CREATE TABLE "accepts"(
  "id" serial PRIMARY KEY,
 	"viewer_id" integer NOT NULL,
  "skill" integer NOT NULL
);
ALTER TABLE "accepts" ADD FOREIGN KEY ("viewer_id") REFERENCES "viewer" ("id");

COMMENT ON COLUMN "viewee"."level" IS '1:entry 2:junior 3:mid 4:senior';

COMMENT ON COLUMN "viewer"."level" IS '1:entry 2:junior 3:mid 4:senior';

COMMENT ON COLUMN "skill"."skill" IS '1:conversation 2:react 3:vue 4:backend';

ALTER TABLE "viewee" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "viewer" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "skill" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "match" ADD FOREIGN KEY ("week_id") REFERENCES "week" ("id");

ALTER TABLE "match" ADD FOREIGN KEY ("viewer_id") REFERENCES "viewer" ("id");

ALTER TABLE "match" ADD FOREIGN KEY ("viewee_id") REFERENCES "viewee" ("id");



select * from viewee;

-- viewer
insert into users (email, password, name) values ('yale918@gmail.com','12345','yale');
select * from users;

insert into viewer (user_id, level, accept_count) values (1, 2, 0);
select * from viewer;
UPDATE "viewer" SET "description" = 'this is yale' WHERE "id" = 1;
update viewer set name = 'yale' where id = 1;

-- viewee
insert into users (email, password, name) values ('node@gmail.com', '12345', 'node');
select * from viewee;
update viewee set name = 'node' where id =1; 
insert into viewee (user_id, level, description) values (2, 1, 'this is viewee node');

insert into users (email, password, name) values ('olive@gmail.com', '12345', 'olive');

-- skill
select * from skill;
insert into skill (viewer_id, skill) values (1,4);
insert into skill (viewer_id, skill) values (1,1);
insert into skill (viewee_id, skill) values (1,4);

-- match
-- viewer skill
select viewer.viewer_id, name, skill from viewer 
  inner join skill 
  	on viewer.viewer_id = skill.viewer_id
  where name='yale'


-- viewee skill
select viewee.viewee_id, name, skill from viewee
	inner join skill
  	on viewee.viewee_id = skill.viewee_id
  where name='node'

-- match insert
insert into match (viewer_id, viewee_id, week_id, view_time) values (1,1,1,'2023-10-24 15:30:00');
select * from match;

select id,viewer.viewer_name, viewee.viewee_name, view_time

	from match
    inner join viewer 
      on match.viewer_id = viewer.viewer_id
    inner join viewee
      on match.viewee_id = viewee.viewee_id
  
  where viewer.viewer_name = 'yale';
  
  
-- week
insert into week(title) values ('mock week');
select * from week;
drop table week;


select * from week