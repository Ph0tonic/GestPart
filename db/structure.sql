CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "voices" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "number" integer, "order" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "publishing_houses" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "compositors" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "kinds" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "pieces" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "distribution" integer, "no" integer, "divers" text, "publishing_house_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "storage_id" integer, CONSTRAINT "fk_rails_7f88315aa4"
FOREIGN KEY ("publishing_house_id")
  REFERENCES "publishing_houses" ("id")
);
CREATE INDEX "index_pieces_on_publishing_house_id" ON "pieces" ("publishing_house_id");
CREATE TABLE "pieces_kinds" ("piece_id" integer, "kind_id" integer);
CREATE INDEX "index_pieces_kinds_on_piece_id" ON "pieces_kinds" ("piece_id");
CREATE INDEX "index_pieces_kinds_on_kind_id" ON "pieces_kinds" ("kind_id");
CREATE TABLE "pdf_files" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "attachement" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "pdf_voices" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "pdf_file_id" integer, "voice_id" integer, "start_page" integer, "nb_page" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_pdf_voices_on_pdf_file_id" ON "pdf_voices" ("pdf_file_id");
CREATE INDEX "index_pdf_voices_on_voice_id" ON "pdf_voices" ("voice_id");
CREATE TABLE "storage_types" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "icon" varchar, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "storages" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "memo" varchar, "order" integer, "storage_id" integer, "storage_type_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_64b32799da"
FOREIGN KEY ("storage_id")
  REFERENCES "storages" ("id")
, CONSTRAINT "fk_rails_828d668977"
FOREIGN KEY ("storage_type_id")
  REFERENCES "storage_types" ("id")
);
CREATE INDEX "index_storages_on_storage_id" ON "storages" ("storage_id");
CREATE INDEX "index_storages_on_storage_type_id" ON "storages" ("storage_type_id");
CREATE INDEX "index_pieces_on_storage_id" ON "pieces" ("storage_id");
INSERT INTO "schema_migrations" (version) VALUES
('20180813133027'),
('20180813133939'),
('20180813134038'),
('20180813134331'),
('20180813134916'),
('20180813195115'),
('20180814103600'),
('20180814145705'),
('20180814150036'),
('20180814151143');
