CREATE SCHEMA sochpead_v1;

CREATE TABLE sochpead_v1.scpa_manufacturer_info ( 
	scpa_manf_info_id    int  NOT NULL  AUTO_INCREMENT,
	scpa_manf_name       varchar(100)  NOT NULL  ,
	scpa_manf_info_address varchar(100)    ,
	scpa_manf_info_city  varchar(50)    ,
	scpa_manf_info_state varchar(2)    ,
	scpa_manf_info_website varchar(100)    ,
	CONSTRAINT pk_scpa_manufacturer_info PRIMARY KEY ( scpa_manf_info_id )
 ) engine=InnoDB;

CREATE TABLE sochpead_v1.scpa_user_address ( 
	scpa_user_address_id bigint  NOT NULL  AUTO_INCREMENT,
	scpa_user_address_city varchar(100)  NOT NULL  ,
	scpa_user_address_state varchar(2)  NOT NULL  ,
	scpa_user_address_zip varchar(5)  NOT NULL  ,
	scpa_user_address_type varchar(2)  NOT NULL  ,
	scpa_user_address_phone varchar(10)    ,
	scpa_user_address_phone_type varchar(30)    ,
	CONSTRAINT pk_scpa_user_address PRIMARY KEY ( scpa_user_address_id )
 ) engine=InnoDB;

CREATE TABLE sochpead_v1.scpa_user_profile ( 
	scpa_user_id         bigint  NOT NULL  AUTO_INCREMENT,
	scpa_username        varchar(100)  NOT NULL  ,
	scpa_user_password   varchar(100)  NOT NULL  ,
	scpa_user_firstname  varchar(100)  NOT NULL  ,
	scpa_user_lastname   varchar(100)  NOT NULL  ,
	scpa_user_email      int  NOT NULL  ,
	CONSTRAINT pk_scpa_user_profile PRIMARY KEY ( scpa_user_id )
 ) engine=InnoDB;

CREATE TABLE sochpead_v1.scpa_manufacturer ( 
	scpa_manf_id         int  NOT NULL  AUTO_INCREMENT,
	scpa_manf_info_id    int  NOT NULL  ,
	CONSTRAINT pk_scpa_manufacturer PRIMARY KEY ( scpa_manf_id )
 ) engine=InnoDB;

CREATE INDEX idx_scpa_manufacturer ON sochpead_v1.scpa_manufacturer ( scpa_manf_info_id );

ALTER TABLE sochpead_v1.scpa_manufacturer ADD CONSTRAINT fk_scpa_manufacturer FOREIGN KEY ( scpa_manf_info_id ) REFERENCES sochpead_v1.scpa_manufacturer_info( scpa_manf_info_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sochpead_v1.scpa_user_profile ADD CONSTRAINT fk_scpa_user_profile FOREIGN KEY ( scpa_user_id ) REFERENCES sochpead_v1.scpa_user_address( scpa_user_address_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

