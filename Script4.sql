CREATE TABLE "sensors" (
  "sensor_id" integer PRIMARY KEY,
  "sensor_name" varchar(31)
);

CREATE TABLE "measurements_type" (
  "type_id" integer PRIMARY KEY,
  "type_name" varchar(31),
  "type_units" char(4)
);

CREATE TABLE "sensors_measurements" (
  "sensor_id" integer,
  "type_id" integer,
  "measurment_formula" varchar(255)
);

CREATE TABLE "meteostations" (
  "station_id" integer PRIMARY KEY,
  "station_name" varchar(127),
  "station_longitude" numeric(5,2),
  "station_latitude" numeric(5,2)
);

CREATE TABLE "meteostations_sensors" (
  "sensor_inventory_number" char(15) PRIMARY KEY,
  "station_id" integer,
  "sensor_id" integer,
  "added_ts" timestamp,
  "removed_ts" timestamp
);

CREATE TABLE "measurements" (
  "sensor_inventory_number" char(15),
  "measurement_value" numeric(17,2),
  "measurement_ts" timestamp,
  "measuremnet_type" integer
);
