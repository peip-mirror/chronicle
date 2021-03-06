CREATE TABLE chronicle_xsign_targets (
  id INTEGER PRIMARY KEY ASC,
  name TEXT,
  url TEXT,
  clientid TEXT,
  publickey TEXT,
  policy TEXT,
  lastrun TEXT
);

CREATE TABLE chronicle_replication_sources (
  id INTEGER PRIMARY KEY ASC,
  uniqueid TEXT,
  name TEXT,
  url TEXT,
  publickey TEXT
);

CREATE TABLE chronicle_replication_chain (
  id INTEGER PRIMARY KEY ASC,
  source INTEGER,
  data TEXT,
  prevhash TEXT NULL,
  currhash TEXT,
  hashstate TEXT,
  summaryhash TEXT,
  publickey TEXT,
  signature TEXT,
  created TEXT,
  replicated TEXT,
  FOREIGN KEY (currhash) REFERENCES chronicle_replication_chain(prevhash),
  UNIQUE(source, prevhash)
);

CREATE INDEX chronicle_replication_chain_prevhash_idx ON chronicle_replication_chain(source, prevhash);
CREATE INDEX chronicle_replication_chain_currhash_idx ON chronicle_replication_chain(source, currhash);
CREATE INDEX chronicle_replication_chain_summaryhash_idx ON chronicle_replication_chain(source, summaryhash);
