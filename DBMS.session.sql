CREATE TABLE PASSENGER(
    PASSENGER_ID VARCHAR(10),
    FIRST_NAME VARCHAR(50) NOT NULL,
    LAST_NAME VARCHAR(50),
    GENDER VARCHAR(10) NOT NULL,
    DOB DATE NOT NULL,
    MOBILE_NO VARCHAR(10) NOT NULL,
    EMAIL_ID VARCHAR(75) NOT NULL,
    PASSWORD VARCHAR(50) NOT NULL,
    ADDRESS VARCHAR(150) NOT NULL,
    CITY VARCHAR(50) NOT NULL,
    STATE VARCHAR(50) NOT NULL,
    PINCODE VARCHAR(50) NOT NULL,
    AADHAR_NO BIGINT(12) NOT NULL
);

ALTER TABLE passenger ADD CONSTRAINT PK_PASSENGER PRIMARY KEY(PASSENGER_ID);

ALTER TABLE passenger ADD CONSTRAINT UNI_MOBILE UNIQUE(MOBILE_NO);

ALTER TABLE passenger ADD CONSTRAINT UNI_MAIL UNIQUE(EMAIL_ID);

ALTER TABLE passenger ADD CONSTRAINT UNI_AADHAR UNIQUE(AADHAR_NO);

CREATE TABLE TRAIN(
    TRAIN_ID INT,
    TRAIN_NAME VARCHAR(100) NOT NULL,
    TYPE VARCHAR(40) NOT NULL,
    SOURCE VARCHAR(75) NOT NULL,
    DESTINATION VARCHAR(75) NOT NULL
);

ALTER TABLE TRAIN ADD CONSTRAINT PK_TRAIN PRIMARY KEY(TRAIN_ID);

INSERT into TRAIN VALUES(12662,'POTHIGAI SF EXPRESS','SUPERFAST EXPRESS','SENGOTTAI','CHENNAI EGMORE');

INSERT into TRAIN VALUES(12674,'CHERAN SF EXPRESS','SUPERFAST EXPRESS','COIMBATORE','CHENNAI CENTRAL');
INSERT into TRAIN VALUES(12632,'NELLAI SF EXPRESS','SUPERFAST EXPRESS','TIRUNELVELI','CHENNAI EGMORE');
INSERT into TRAIN VALUES(12676,'KOVAI SF EXPRESS','SUPERFAST EXPRESS','COIMBATORE','CHENNAI CENTRAL');
INSERT into TRAIN VALUES(12633,'KANNIYAKUMARI EXPRESS','SUPERFAST EXPRESS','CHENNAI EGMORE','KANNIYAKUMARI');
INSERT into TRAIN VALUES(20666,'CHENNAI EGMORE - TIRUNELVELI VANDE BHARAT EXPRESS','VANDE BHARAT EXPRESS','TIRUNELVELI','CHENNAI EGMORE' );

SELECT * FROM TRAIN;

CREATE TABLE STATION(
    STATION_ID VARCHAR(3) PRIMARY KEY,
    STATION_NAME VARCHAR(50) NOT NULL
);



ALTER TABLE STATION
MODIFY STATION_ID VARCHAR(5);

INSERT INTO STATION VALUES('TEN','TIRUNELVELI JUNCTION');

INSERT INTO STATION VALUES('CVP','KOVILPATTI');

INSERT INTO STATION VALUES('SRT','SATUR');

INSERT INTO STATION VALUES('VPT','VIRUDHUNAGAR JUNCTION');

INSERT INTO STATION VALUES('MDU','MADURAI JUNCTION');

INSERT INTO STATION VALUES('SDN','SHOLAVANDAN');

INSERT INTO STATION VALUES('DG','DINDIGUL');

INSERT INTO STATION VALUES('TPJ','TIRUCHCHIRAPPALLI JUNCTION');

INSERT INTO STATION VALUES('VRI','VRIDDHACHALAM JUNCTION');

INSERT INTO STATION VALUES('VM','VILLUPURAM JUNCTION');

INSERT INTO STATION VALUES('TMV','TINDIVANAM');

INSERT INTO STATION VALUES('MLMR','MELMARUVATHUR');

INSERT INTO STATION VALUES('CGL','CHENGALPATTU JUNCTION');

INSERT INTO STATION VALUES('TBM','TAMBARAM');

INSERT INTO STATION VALUES('MBM','MAMBALAM');

INSERT INTO STATION VALUES('MS','CHENNAI EGMORE')

--
INSERT INTO STATION VALUES('VLY','VALLIYUR');

INSERT INTO STATION VALUES('NCJ','NAGERCOIL JUNCTION');

INSERT INTO STATION VALUES('CAPE','KANNIYAKUMARI');

--

INSERT INTO STATION VALUES('SCT','SENGOTTAI');

INSERT INTO STATION VALUES('TSI','TENKASI JUNCTION');

INSERT INTO STATION VALUES('KDNL','KADAYANALLUR');

INSERT INTO STATION VALUES('PBKS','PAMBA KOVIL SHANDY');

INSERT INTO STATION VALUES('SNKL','SANKARANKOVIL');

INSERT INTO STATION VALUES('RJPM','RAJAPALAYAM');

INSERT INTO STATION VALUES('SVPR','SRIVILLIPUTTUR');

INSERT INTO STATION VALUES('SVKS','SIVAKASI');

INSERT INTO STATION VALUES('TTL','TIRUTTANGAL');

SELECT * FROM train;

INSERT INTO STATION VALUES('CBE','COIMBATORE JUNCTION');

INSERT INTO STATION VALUES('TUP','TIRUPPUR');

INSERT INTO STATION VALUES('ED','ERODE JUNCTION');

INSERT INTO STATION VALUES('SA','SALEM JUNCTION');

INSERT INTO STATION VALUES('KPD','KATPADI JUNCTION');

INSERT INTO STATION VALUES('AJJ','ARAKKONAM JUNCTION');

INSERT INTO STATION VALUES('PER','PERAMBUR');

INSERT INTO STATION VALUES('MAS ','MGR CHENNAI CENTRAL');

UPDATE stations
SET station_ID = 'MAS'
WHERE station_name = 'MGR CHENNAI CENTRAL';

--

SELECT * FROM trainS;

INSERT INTO STATION VALUES('MAP','MORAPPUR');

INSERT INTO STATION VALUES('JTJ','JOLARPETTAI JUNCTION');

INSERT INTO STATION VALUES('AB','AMBUR');

INSERT INTO STATION VALUES('WJR','WALAJAH ROAD JUNCTION');

SELECT * from STATION;

rename table train to trains;

rename table STATION to stations;

CREATE TABLE schedule (
  train_id INT,
  station_id VARCHAR(5),
  departure_time TIME,
  arrival_time TIME,
  days_of_operation SET('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
  PRIMARY KEY (train_id, station_id, days_of_operation),
  FOREIGN KEY (train_id) REFERENCES trains(train_id),
  FOREIGN KEY (station_id) REFERENCES stations(station_id)
);


CREATE TABLE train_routes (
  train_id INT,
  station_id VARCHAR(5),
  visit_order INT,
  PRIMARY KEY (train_id, station_id),
  FOREIGN KEY (train_id) REFERENCES trains(train_id),
  FOREIGN KEY (station_id) REFERENCES stations(station_id)
);

SELECT * FROM trains;

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'TEN', '20:05:00', '20:05:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'CVP', '20:53:00', '20:55:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'SRT', '21:11:00', '21:13:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'VPT', '21:35:00', '21:37:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'MDU', '22:20:00', '22:25:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'SDN', '22:44:00', '22:45:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'DG', '23:22:00', '23:25:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'TPJ', '00:55:00', '01:00:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'VRI', '02:25:00', '02:27:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'VM', '03:50:00', '03:55:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'TMV', '04:25:00', '04:27:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'MLMR', '04:48:00', '04:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'CGL', '05:23:00', '05:25:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'TBM', '05:53:00', '05:55:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12632, 'MBM', '06:13:00', '06:15:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, days_of_operation)
VALUES (12632, 'MS', '07:00:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

UPDATE schedule
SET DAY=1
WHERE train_id = 12662
AND station_id = 'MDU'
AND days_of_operation = 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';




-- Change the data type of the 'day' column to VARCHAR(10)
ALTER TABLE schedule
MODIFY COLUMN day VARCHAR(10);


-- Change the data type of the 'day' column to INT
ALTER TABLE schedule
MODIFY COLUMN day INT;


INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12633, 'MS', '17:20:00', '17:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12633, 'TBM', '17:48:00', '17:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'CGL', '18:18:00', '18:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'MLMR', '18:43:00', '18:45:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'CGL', '18:18:00', '18:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'TMV', '19:08:00', '19:10:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'VM', '19:55:00', '20:00:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'VRI', '20:40:00', '20:42:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'TPJ', '22:25:00', '22:30:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'DG', '23:37:00', '23:40:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'MDU', '00:55:00', '01:00:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'VPT', '01:43:00', '01:45:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'TEN', '03:20:00', '03:25:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'VLY', '04:03:00', '04:05:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'NCJ', '05:00:00', '05:05:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12633, 'CAPE', '05:35:00', '05:35:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

SELECT * FROM schedule ORDER BY train_id,DAY,arrival_time;

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'SCT', '18:20:00', '18:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'TSI', '18:33:00', '18:35:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'KDNL', '18:49:00', '18:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'PBKS', '19:02:00', '19:03:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'SNKL', '19:15:00', '19:17:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'RJPM', '19:40:00', '19:42:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'SVPR', '19:54:00', '19:55:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'SVKS', '20:08:00', '20:10:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'TTL', '20:16:00', '20:17:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'KDNL', '18:49:00', '18:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);


SELECT * FROM schedule ORDER BY train_id,DAY,arrival_time;


INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation)
VALUES (12662, 'VPT', '20:38:00', '20:40:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday');

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'MDU', '21:45:00', '21:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'DG', '22:47:00', '22:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'TPJ', '00:10:00', '00:15:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'VRI', '01:43:00', '01:45:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'VM', '02:50:00', '02:55:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'CGL', '04:18:00', '04:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12662, 'TBM', '04:48:00', '04:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

INSERT INTO schedule (train_id, station_id, arrival_time,departure_time, days_of_operation,DAY)
VALUES (12662, 'MS', '05:40:00', '05:40:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

SELECT * FROM trains;

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12674, 'CBE', '22:50:00', '22:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);


INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12674, 'TUP', '23:33:00', '23:35:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);


INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12674, 'ED', '00:20:00', '00:25:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);


INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12674, 'SA', '01:17:00', '01:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);


INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12674, 'JTJ', '03:18:00', '03:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);


INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12674, 'KPD', '04:28:00', '04:30:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);


INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12674, 'AJJ', '05:18:00', '05:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);


-- INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
-- VALUES (12674, 'MAS', '06:08:00', '06:10:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

SELECT * FROM trains;

INSERT INTO schedule (train_id, station_id, arrival_time,departure_time, days_of_operation,DAY)
VALUES (12674, 'MAS', '07:00:00', '07:00:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',2);

SELECT * FROM schedule ORDER BY train_id,DAY,arrival_time;

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'CBE', '15:15:00', '15:15:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'TUP', '15:58:00', '16:00:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'ED', '16:40:00', '16:45:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'SA', '17:37:00', '17:40:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'MAP', '18:28:00', '18:30:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'JTJ', '19:23:00', '19:25:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'AB', '19:50:00', '19:52:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'KPD', '20:30:00', '20:32:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'WJR', '20:50:00', '20:52:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'AJJ', '21:23:00', '21:25:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'PER', '22:08:00', '22:10:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (12676, 'MAS', '22:50:00', '22:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

