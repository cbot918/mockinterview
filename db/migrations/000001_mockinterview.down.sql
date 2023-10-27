-- Drop foreign keys in the "match" table
ALTER TABLE "match" DROP CONSTRAINT "match_viewer_id_fkey";
ALTER TABLE "match" DROP CONSTRAINT "match_viewee_id_fkey";
ALTER TABLE "match" DROP CONSTRAINT "match_week_id_fkey";

-- Drop foreign keys in the "skill" table
ALTER TABLE "skill" DROP CONSTRAINT "skill_user_id_fkey";

-- Drop foreign keys in the "viewer" table
ALTER TABLE "viewer" DROP CONSTRAINT "viewer_user_id_fkey";

-- Drop foreign keys in the "viewee" table
ALTER TABLE "viewee" DROP CONSTRAINT "viewee_user_id_fkey";

-- Drop the "match" table
DROP TABLE IF EXISTS "match";

-- Drop the "skill" table
DROP TABLE IF EXISTS "skill";

-- Drop the "viewer" table
DROP TABLE IF EXISTS "viewer";

-- Drop the "viewee" table
DROP TABLE IF EXISTS "viewee";

-- Drop the "users" table
DROP TABLE IF EXISTS "users";

-- Drop the "week" table
DROP TABLE IF EXISTS "week";
