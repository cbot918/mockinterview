CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "name" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE TABLE "viewee" (
  "viewee_id" serial PRIMARY KEY,
  "user_id" integer NOT NULL,
  "level" integer NOT NULL,
  "description" text,
  "viewee_name" varchar NOT NULL
);

CREATE TABLE "viewer" (
  "viewer_id" serial PRIMARY KEY,
  "user_id" integer NOT NULL,
  "level" integer NOT NULL,
  "accept_count" integer NOT NULL,
  "description" text,
  "viewer_name" varchar NOT NULL
);

CREATE TABLE "skill" (
  "id" serial PRIMARY KEY,
  "viewer_id" integer,
  "viewee_id" integer,
  "skill" integer NOT NULL
);

CREATE TABLE "week" (
  "id" serial PRIMARY KEY,
  "time" timestamp NOT NULL,
  "title" varchar NOT NULL
);

CREATE TABLE "match" (
  "id" serial PRIMARY KEY,
  "viewer_id" integer NOT NULL,
  "viewee_id" integer NOT NULL,
  "week_id" integer NOT NULL
);

COMMENT ON COLUMN "viewee"."level" IS '1:entry 2:junior 3:mid 4:senior';

COMMENT ON COLUMN "viewer"."level" IS '1:entry 2:junior 3:mid 4:senior';

COMMENT ON COLUMN "skill"."skill" IS '1:conversation 2:react 3:vue 4:backend';

ALTER TABLE "viewee" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "viewer" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "skill" ADD FOREIGN KEY ("viewer_id") REFERENCES "viewer" ("viewer_id");

ALTER TABLE "skill" ADD FOREIGN KEY ("viewee_id") REFERENCES "viewee" ("viewee_id");

ALTER TABLE "match" ADD FOREIGN KEY ("week_id") REFERENCES "week" ("id");

ALTER TABLE "match" ADD FOREIGN KEY ("viewer_id") REFERENCES "viewer" ("viewer_id");

ALTER TABLE "match" ADD FOREIGN KEY ("viewee_id") REFERENCES "viewee" ("viewee_id");