DROP TABLE blobTest;

CREATE TABLE blobTest (
	fileName	varchar(30)		PRIMARY KEY, 
	blobData	image			NOT NULL
);

