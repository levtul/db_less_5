CREATE TABLE doctors
(
    person_id uuid NOT NULL,
    area      TEXT   NOT NULL,
    rank      TEXT   NOT NULL,
    CONSTRAINT doctors_pk PRIMARY KEY (person_id)
);



CREATE TABLE stations
(
    station_id int NOT NULL,
    name       TEXT   NOT NULL UNIQUE,
    CONSTRAINT stations_pk PRIMARY KEY (station_id)
);



CREATE TABLE rooms
(
    room_id    int NOT NULL,
    beds_count int    NOT NULL,
    station_id int    NOT NULL,
    CONSTRAINT rooms_pk PRIMARY KEY (room_id)
);



CREATE TABLE patients
(
    patient_id uuid    NOT NULL,
    name       TEXT      NOT NULL,
    disease    TEXT      NOT NULL,
    room_id    int       NOT NULL,
    "from"     TIMESTAMP NOT NULL,
    "to"       TIMESTAMP NOT NULL,
    doctor     uuid      NOT NULL,
    CONSTRAINT patients_pk PRIMARY KEY (patient_id)
);



CREATE TABLE station_personnel
(
    person_id  uuid NOT NULL,
    name       TEXT   NOT NULL,
    station_id int    NOT NULL,
    CONSTRAINT station_personnel_pk PRIMARY KEY (person_id)
);



CREATE TABLE caregivers
(
    person_id     uuid NOT NULL,
    qualification TEXT   NOT NULL,
    CONSTRAINT caregivers_pk PRIMARY KEY (person_id)
);



ALTER TABLE doctors
    ADD CONSTRAINT doctors_fk0 FOREIGN KEY (person_id) REFERENCES station_personnel (person_id);


ALTER TABLE rooms
    ADD CONSTRAINT rooms_fk0 FOREIGN KEY (station_id) REFERENCES stations (station_id);

ALTER TABLE patients
    ADD CONSTRAINT patients_fk0 FOREIGN KEY (room_id) REFERENCES rooms (room_id);
ALTER TABLE patients
    ADD CONSTRAINT patients_fk1 FOREIGN KEY (doctor) REFERENCES doctors (person_id);

ALTER TABLE station_personnel
    ADD CONSTRAINT station_personnel_fk0 FOREIGN KEY (station_id) REFERENCES stations (station_id);

ALTER TABLE caregivers
    ADD CONSTRAINT caregivers_fk0 FOREIGN KEY (person_id) REFERENCES station_personnel (person_id);






