CREATE TABLE IF NOT EXISTS users (
  id          INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  nickname    VARCHAR(128) NOT NULL,
  login_name  VARCHAR(128) NOT NULL,
  password    VARCHAR(256) NOT NULL,
  pass_hash   VARCHAR(128)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
ALTER TABLE users ADD UNIQUE INDEX login_name_uniq(login_name);
ALTER TABLE users ADD INDEX idx_id_nickname(id, nickname);

CREATE TABLE IF NOT EXISTS events (
  id          INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  title       VARCHAR(128)     NOT NULL,
  public_fg   TINYINT(1)       NOT NULL,
  closed_fg   TINYINT(1)       NOT NULL,
  price       INTEGER UNSIGNED NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS sheets (
  id          INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `rank`      VARCHAR(128)     NOT NULL,
  num         INTEGER UNSIGNED NOT NULL,
  price       INTEGER UNSIGNED NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
ALTER TABLE sheets ADD UNIQUE INDEX rank_num_uniq(`rank`, num);

CREATE TABLE IF NOT EXISTS reservations (
  id          INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  event_id    INTEGER UNSIGNED NOT NULL,
  sheet_id    INTEGER UNSIGNED NOT NULL,
  user_id     INTEGER UNSIGNED NOT NULL,
  reserved_at DATETIME(6)      NOT NULL,
  canceled_at DATETIME(6)      DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
ALTER TABLE reservations ADD INDEX index_sheet_id(sheet_id);
ALTER TABLE reservations ADD INDEX idx_user_event_cancel(user_id, event_id, canceled_at);
ALTER TABLE reservations ADD INDEX idx_event_sheet_cancel(event_id, sheet_id, canceled_at);
ALTER TABLE reservations ADD INDEX idx_cancel_reserved(user_id, canceled_at, reserved_at);

CREATE TABLE IF NOT EXISTS administrators (
  id          INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  nickname    VARCHAR(128) NOT NULL,
  login_name  VARCHAR(128) NOT NULL,
  pass_hash   VARCHAR(128) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
ALTER TABLE administrators ADD UNIQUE INDEX login_name_uniq(login_name);
