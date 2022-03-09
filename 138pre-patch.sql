-- This file is automatically generated using maintenance/generateSchemaChangeSql.php.
-- Source: maintenance/abstractSchemaChanges/patch-filearchive-fa_id.json
-- Do not modify this file directly.
-- See https://www.mediawiki.org/wiki/Manual:Schema_changes
-- FROM /srv/mediawiki/w/maintenance/archives/patch-filearchive-fa_id.sql
ALTER TABLE  /*_*/filearchive
CHANGE  fa_id fa_id INT UNSIGNED AUTO_INCREMENT NOT NULL;

-- FROM /srv/mediawiki/w/maintenance/archives/patch-image-img_major_mime-default.sql
ALTER TABLE  /*_*/image
CHANGE img_major_mime img_major_mime ENUM(
    'unknown', 'application', 'audio',
    'image', 'text', 'video', 'message',
    'model', 'multipart', 'chemical'
  ) DEFAULT 'unknown' NOT NULL;

-- FROM /srv/mediawiki/w/maintenance/archives/patch-image-img_major_mime-default.sql
ALTER TABLE  /*_*/oldimage
CHANGE oi_major_mime oi_major_mime ENUM(
    'unknown', 'application', 'audio',
    'image', 'text', 'video', 'message',
    'model', 'multipart', 'chemical'
  ) DEFAULT 'unknown' NOT NULL;

-- FROM /srv/mediawiki/w/maintenance/archives/patch-image-img_major_mime-default.sql
ALTER TABLE  /*_*/filearchive
CHANGE fa_major_mime fa_major_mime ENUM(
    'unknown', 'application', 'audio',
    'image', 'text', 'video', 'message',
    'model', 'multipart', 'chemical'
  ) DEFAULT 'unknown';

-- FROM /srv/mediawiki/w/maintenance/archives/patch-linktarget.sql.sql
CREATE TABLE IF NOT EXISTS /*_*/linktarget (
  lt_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
  lt_namespace INT NOT NULL,
  lt_title VARBINARY(255) NOT NULL,
  UNIQUE INDEX lt_namespace_title (lt_namespace, lt_title),
  PRIMARY KEY(lt_id)
) /*$wgDBTableOptions*/;

-- This file is automatically generated using maintenance/generateSchemaChangeSql.php.
-- Source: maintenance/abstractSchemaChanges/patch-page_restrictions-pr_page.json
-- Do not modify this file directly.
-- See https://www.mediawiki.org/wiki/Manual:Schema_changes
-- FROM /srv/mediawiki/w/maintenance/archives/patch-page_restrictions-pr_page.sql
ALTER TABLE  /*_*/page_restrictions
CHANGE  pr_page pr_page INT UNSIGNED NOT NULL;

-- This file is automatically generated using maintenance/generateSchemaChangeSql.php.
-- Source: maintenance/abstractSchemaChanges/patch-page_props-pp_page.json
-- Do not modify this file directly.
-- See https://www.mediawiki.org/wiki/Manual:Schema_changes
-- FROM /srv/mediawiki/w/maintenance/archives/patch-page_props-pp_page.sql
ALTER TABLE  /*_*/page_props
CHANGE  pp_page pp_page INT UNSIGNED NOT NULL;

-- This file is automatically generated using maintenance/generateSchemaChangeSql.php.
-- Source: maintenance/abstractSchemaChanges/patch-ipblocks_restrictions-ir_value.json
-- Do not modify this file directly.
-- See https://www.mediawiki.org/wiki/Manual:Schema_changes
-- FROM /srv/mediawiki/w/maintenance/archives/patch-ipblocks_restrictions-ir_value.sql
ALTER TABLE  /*_*/ipblocks_restrictions
CHANGE  ir_value ir_value INT UNSIGNED NOT NULL;


-- This file is automatically generated using maintenance/generateSchemaChangeSql.php.
-- Source: maintenance/abstractSchemaChanges/patch-templatelinks-target_id.json
-- Do not modify this file directly.
-- See https://www.mediawiki.org/wiki/Manual:Schema_changes
-- FROM /srv/mediawiki/w/maintenance/archives/patch-templatelinks-target_id.sql
ALTER TABLE  /*_*/templatelinks
ADD  IF NOT EXISTS tl_target_id BIGINT UNSIGNED DEFAULT NULL;
CREATE INDEX IF NOT EXISTS tl_target_id ON  /*_*/templatelinks (tl_target_id, tl_from);
CREATE INDEX IF NOT EXISTS tl_backlinks_namespace_target_id ON  /*_*/templatelinks (    tl_from_namespace, tl_target_id,    tl_from  );