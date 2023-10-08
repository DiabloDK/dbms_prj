CREATE TABLE PASSENGER(
    PASSENGER_ID INT AUTO_INCREMENT PRIMARY KEY,
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

--ALTER TABLE passenger ADD CONSTRAINT PK_PASSENGER PRIMARY KEY(PASSENGER_ID);

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
SET departure_time='08:42:00'
WHERE train_id = 20666
AND station_id = 'DG'





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

SELECT * FROM trains;

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (20666, 'TEN', '06:00:00', '06:00:00', 'Monday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (20666, 'VPT', '07:13:00', '07:15:00', 'Monday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (20666, 'MDU', '07:50:00', '07:55:00', 'Monday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (20666, 'DG', '08:40:00', '08:42:00', 'Monday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (20666, 'TPJ', '09:50:00', '09:55:00', 'Monday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (20666, 'VM', '11:54:00', '11:56:00', 'Monday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (20666, 'TBM', '13:13:00', '13:15:00', 'Monday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

INSERT INTO schedule (train_id, station_id, arrival_time, departure_time, days_of_operation,DAY)
VALUES (20666, 'MS', '13:50:00', '13:50:00', 'Monday,Wednesday,Thursday,Friday,Saturday,Sunday',1);

SELECT train_id,station_id,arrival_time,departure_time,days_of_operation,day FROM schedule ORDER BY train_id,DAY,arrival_time;

SELECT * from trains;

SELECT train_id,station_id,arrival_time,departure_time,days_of_operation,day FROM schedule ORDER BY train_id,DAY,arrival_time;

CREATE TABLE COACH
(
  COACH_ID VARCHAR(10) PRIMARY KEY,
  COACH_TYPE  VARCHAR(30),
  MAXIMUM_CAPACITY INT
);

INSERT INTO COACH VALUES('HA1','COMPOSITE AC ONE TIER/TWO-TIER',30);

INSERT INTO COACH VALUES('D1','NON AC CHAIR CAR',75);

-- INSERT INTO COACH VALUES('D2','NON AC CHAIR CAR',75);

-- INSERT INTO COACH VALUES('D3','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('A1','AC TWO TIER',48)

INSERT INTO COACH VALUES('A2','AC TWO TIER',48)

INSERT INTO COACH VALUES('B1','AC THREE TIER',64)

INSERT INTO COACH VALUES('B2','AC THREE TIER',64)

INSERT INTO COACH VALUES('B3','AC THREE TIER',64)

INSERT INTO COACH VALUES('B4','AC THREE TIER',64)

INSERT INTO COACH VALUES('B5','AC THREE TIER',64)

INSERT INTO COACH VALUES('B6','AC THREE TIER',64)

SELECT * FROM COACH;

INSERT INTO coach VALUES('S1','SLEEPER CLASS',72);

INSERT INTO coach VALUES('S2','SLEEPER CLASS',72);

INSERT INTO coach VALUES('S3','SLEEPER CLASS',72);

INSERT INTO coach VALUES('S4','SLEEPER CLASS',72);

INSERT INTO coach VALUES('S5','SLEEPER CLASS',72);

INSERT INTO coach VALUES('S6','SLEEPER CLASS',72);

INSERT INTO coach VALUES('S7','SLEEPER CLASS',72);

INSERT INTO coach VALUES('S8','SLEEPER CLASS',72);

INSERT INTO coach VALUES('S9','SLEEPER CLASS',72);


INSERT INTO coach VALUES('UR1','UNRESERVED/GENERAL',99)

INSERT INTO coach VALUES('UR3','UNRESERVED/GENERAL',99)

INSERT INTO coach VALUES('UR2','UNRESERVED/GENERAL',99)

INSERT INTO COACH VALUES('H1','AC FIRST CLASS',24)

SELECT * FROM trains;

INSERT INTO coach VALUES('C1','AC CHAIR CAR',75);

INSERT INTO coach VALUES('C2','AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D2','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D3','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D4','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D5','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D6','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D7','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D8','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D9','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D10','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D11','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D12','NON AC CHAIR CAR',75);

INSERT INTO COACH VALUES('D13','NON AC CHAIR CAR',75);

INSERT INTO coach VALUES('C3','AC CHAIR CAR',75);

INSERT INTO coach VALUES('C4','AC CHAIR CAR',75);

INSERT INTO coach VALUES('C5','AC CHAIR CAR',75);

INSERT INTO coach VALUES('C6','AC CHAIR CAR',75);

INSERT INTO coach VALUES('C7','AC CHAIR CAR',75);

INSERT INTO coach VALUES('E1','EXECUTIVE CHAIR CAR',45);

INSERT INTO COACH VALUES('GS1','GENERAL SEATING COACH',99);

INSERT INTO COACH VALUES('GS2','GENERAL SEATING COACH',99);

INSERT INTO COACH VALUES('GS3','GENERAL SEATING COACH',99);

INSERT INTO COACH VALUES('GS4','GENERAL SEATING COACH',99);

SELECT * FROM coach;

CREATE TABLE ASSIGNED_TO_TRAIN
(
  TRAIN_ID INT ,
  COACH_ID  VARCHAR(10),
  SEAT_ID INT,
  FOREIGN KEY (TRAIN_ID) REFERENCES TRAINS(TRAIN_ID),
  FOREIGN KEY (COACH_ID) REFERENCES COACH(COACH_ID)
)

ALTER TABLE ASSIGNED_TO_TRAIN ADD PRIMARY KEY(TRAIN_ID,COACH_ID,SEAT_ID);

SELECT * FROM assigned_to_train;

CREATE PROCEDURE InsertSeats(IN train_id INT, IN coach_id VARCHAR(10), IN max_counter INT)
BEGIN
  DECLARE counter INT DEFAULT 1;

  WHILE counter <= max_counter DO
    INSERT INTO ASSIGNED_TO_TRAIN (TRAIN_ID, COACH_ID, SEAT_ID)
    VALUES (train_id, coach_id, counter);

    SET counter = counter + 1;
  END WHILE;
END

CALL InsertSeats(12632, 'A1', 48);
CALL InsertSeats(12632,'A2',48);
CALL InsertSeats(12632, 'B1', 64);
CALL InsertSeats(12632, 'B2', 64);
CALL InsertSeats(12632, 'B3', 64);
CALL InsertSeats(12632, 'B4', 64);
CALL InsertSeats(12632, 'B5', 64);
CALL InsertSeats(12632, 'B6', 64);
CALL InsertSeats(12632, 'S1', 72);
CALL InsertSeats(12632, 'S2', 72);
CALL InsertSeats(12632, 'S3', 72);
CALL InsertSeats(12632, 'S4', 72);
CALL InsertSeats(12632, 'S5', 72);
CALL InsertSeats(12632, 'S6', 72);
CALL InsertSeats(12632, 'S7', 72);
CALL InsertSeats(12632, 'S8', 72);
CALL InsertSeats(12632, 'HA1', 30);
CALL InsertSeats(12632, 'UR1', 99);
CALL InsertSeats(12632, 'UR2', 99);
CALL InsertSeats(12632, 'UR3', 99);

SELECT * FROM assigned_to_train ORDER BY TRAIN_ID;

SELECT * FROM trains;

CALL InsertSeats(12633, 'S1', 72);
CALL InsertSeats(12633, 'S2', 72);
CALL InsertSeats(12633, 'S3', 72);
CALL InsertSeats(12633, 'S4', 72);
CALL InsertSeats(12633, 'S5', 72);
CALL InsertSeats(12633, 'S6', 72);
CALL InsertSeats(12633, 'S7', 72);
CALL InsertSeats(12633, 'S8', 72);
CALL InsertSeats(12633,'S9',72)
CALL InsertSeats(12633, 'A1', 48);
CALL InsertSeats(12633,'A2',48);
CALL InsertSeats(12633, 'B1', 64);
CALL InsertSeats(12633, 'B2', 64);
CALL InsertSeats(12633, 'B3', 64);
CALL InsertSeats(12633, 'B4', 64);
CALL InsertSeats(12633, 'H1', 24);
CALL InsertSeats(12633, 'UR1', 99);

CALL InsertSeats(12662, 'A1', 48);
CALL InsertSeats(12662,'A2',48);
CALL InsertSeats(12662, 'B1', 64);
CALL InsertSeats(12662, 'B2', 64);
CALL InsertSeats(12662, 'B3', 64);
CALL InsertSeats(12662, 'B4', 64);
CALL InsertSeats(12662, 'B5', 64);
CALL InsertSeats(12662, 'B6', 64);
CALL InsertSeats(12662, 'S1', 72);
CALL InsertSeats(12662, 'S2', 72);
CALL InsertSeats(12662, 'S3', 72);
CALL InsertSeats(12662, 'S4', 72);
CALL InsertSeats(12662, 'S5', 72);
CALL InsertSeats(12662, 'S6', 72);
CALL InsertSeats(12662, 'S7', 72);
CALL InsertSeats(12662, 'S8', 72);
CALL InsertSeats(12662, 'HA1', 30);
CALL InsertSeats(12662, 'UR1', 99);
CALL InsertSeats(12662, 'UR2', 99);
CALL InsertSeats(12662, 'UR3', 99);


CALL InsertSeats(12674, 'H1', 24);
CALL InsertSeats(12674, 'A1', 48);
CALL InsertSeats(12674, 'B1', 64);
CALL InsertSeats(12674, 'B2', 64);
CALL InsertSeats(12674, 'B3', 64);
CALL InsertSeats(12674, 'B4', 64);
CALL InsertSeats(12674, 'B5', 64);
CALL InsertSeats(12674, 'B6', 64);
CALL InsertSeats(12674, 'S1', 72);
CALL InsertSeats(12674, 'S2', 72);
CALL InsertSeats(12674, 'S3', 72);
CALL InsertSeats(12674, 'S4', 72);
CALL InsertSeats(12674, 'S5', 72);
CALL InsertSeats(12674, 'S6', 72);
CALL InsertSeats(12674, 'S7', 72);
CALL InsertSeats(12674, 'S8', 72);
CALL InsertSeats(12674, 'S9', 72);
CALL InsertSeats(12674, 'HA1', 30);
CALL InsertSeats(12674, 'UR1', 99);
CALL InsertSeats(12674, 'UR2', 99);
CALL InsertSeats(12674, 'UR3', 99);

CALL InsertSeats(12676, 'GS1', 99);
CALL InsertSeats(12676, 'GS4', 99);
CALL InsertSeats(12676, 'GS3', 99);
CALL InsertSeats(12676, 'GS2', 99);
CALL InsertSeats(12676, 'C1', 75);
CALL InsertSeats(12676, 'C2', 75);
CALL InsertSeats(12676, 'D1', 75);
CALL InsertSeats(12676, 'D2', 75);
CALL InsertSeats(12676, 'D3', 75);
CALL InsertSeats(12676, 'D4', 75);
CALL InsertSeats(12676, 'D5', 75);
CALL InsertSeats(12676, 'D6', 75);
CALL InsertSeats(12676, 'D7', 75);
CALL InsertSeats(12676, 'D8', 75);
CALL InsertSeats(12676, 'D9', 75);
CALL InsertSeats(12676, 'D10', 75);
CALL InsertSeats(12676, 'D11', 75);
CALL InsertSeats(12676, 'D12', 75);
CALL InsertSeats(12676, 'D13', 75);


CALL InsertSeats(20666, 'C1', 75);
CALL InsertSeats(20666, 'C2', 75);
CALL InsertSeats(20666, 'C3', 75);
CALL InsertSeats(20666, 'C4', 75);
CALL InsertSeats(20666, 'C5', 75);
CALL InsertSeats(20666, 'C6', 75);
CALL InsertSeats(20666, 'C7', 75);
CALL InsertSeats(20666, 'E1', 45);

select * FROM schedule ORDER BY train_id,DAY,arrival_time;

ALTER TABLE schedule drop COLUMN station_sequence ;

ALTER TABLE schedule
ADD COLUMN station_sequence INT;

UPDATE schedule ts
INNER JOIN (
    SELECT
        train_id,
        station_id,
        arrival_time,
        ROW_NUMBER() OVER (PARTITION BY train_id ORDER BY train_id,DAY,arrival_time) AS station_sequence
    FROM
        schedule
    
) t ON ts.train_id = t.train_id AND ts.station_id = t.station_id
SET ts.station_sequence = t.station_sequence;

SELECT * FROM stations;



CREATE TABLE Booking (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerID INT,
    TrainNumber INT,
    DateOfBooking DATE,
    Fare DECIMAL(10, 2),
    NO_OF_PASSENGERS INT,
    BoardingPoint VARCHAR(50),
    Destination VARCHAR(50),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(Passenger_ID),
    FOREIGN KEY (TrainNumber) REFERENCES TRAINS(TRAIN_ID)
);

ALTER TABLE stations
ADD UNIQUE INDEX StationName_UNIQUE (STATION_NAME);


ALTER TABLE Booking
ADD FOREIGN KEY (BoardingPoint) REFERENCES STATIONS(STATION_NAME);

ALTER TABLE Booking
ADD FOREIGN KEY (DESTINATION) REFERENCES STATIONS(STATION_NAME);

CREATE TABLE SEAT_RESERVATION(
  BookingID INT,
  PASSENGERNAME VARCHAR(75),
  GENDER VARCHAR(10),
  AGE INT,
  TRAIN_ID INT,
  COACH_ID VARCHAR(10),
  SEAT_ID INT,
  FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)

);

ALTER TABLE seat_reservation
ADD FOREIGN KEY (TRAIN_ID) REFERENCES ASSIGNED_TO_TRAIN(TRAIN_ID)

ALTER TABLE SEAT_RESERVATION
ADD FOREIGN KEY (COACH_ID) REFERENCES ASSIGNED_TO_TRAIN(COACH_ID)

CREATE INDEX idx_seat_id ON ASSIGNED_TO_TRAIN(SEAT_ID);

SELECT * FROM assigned_to_train

ALTER TABLE SEAT_RESERVATION
ADD FOREIGN KEY (SEAT_ID) REFERENCES ASSIGNED_TO_TRAIN(SEAT_ID)