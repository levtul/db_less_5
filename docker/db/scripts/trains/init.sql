CREATE TABLE trains
(
    train_id         int NOT NULL,
    length           int    NOT NULL,
    start_station_id uuid   NOT NULL,
    end_station_id   uuid   NOT NULL,
    CONSTRAINT trains_pk PRIMARY KEY (train_id)
);



CREATE TABLE stations
(
    station_id   uuid NOT NULL,
    tracks_count int    NOT NULL,
    city_id      uuid   NOT NULL,
    CONSTRAINT stations_pk PRIMARY KEY (station_id)
);



CREATE TABLE cities
(
    city_id uuid NOT NULL,
    region  TEXT   NOT NULL,
    name    TEXT   NOT NULL,
    CONSTRAINT cities_pk PRIMARY KEY (city_id)
);



CREATE TABLE schudule
(
    train_id        int       NOT NULL,
    station_from_id uuid      NOT NULL,
    station_to_id   uuid    NOT NULL,
    departure       TIMESTAMP NOT NULL,
    arrival         TIMESTAMP NOT NULL,
    CONSTRAINT schudule_pk PRIMARY KEY (train_id, station_from_id, station_to_id)
);



ALTER TABLE trains
    ADD CONSTRAINT trains_fk0 FOREIGN KEY (start_station_id)
        REFERENCES stations (station_id);

ALTER TABLE trains
    ADD CONSTRAINT trains_fk1 FOREIGN KEY (end_station_id)
        REFERENCES stations (station_id);

ALTER TABLE stations
    ADD CONSTRAINT stations_fk0 FOREIGN KEY (city_id) REFERENCES cities (city_id);


ALTER TABLE schudule
    ADD CONSTRAINT schudule_fk0 FOREIGN KEY (train_id) REFERENCES trains (train_id);
ALTER TABLE schudule
    ADD CONSTRAINT schudule_fk1 FOREIGN KEY (station_from_id)
        REFERENCES stations (station_id);
ALTER TABLE schudule
    ADD CONSTRAINT schudule_fk2 FOREIGN KEY (station_to_id)
        REFERENCES stations (station_id);


