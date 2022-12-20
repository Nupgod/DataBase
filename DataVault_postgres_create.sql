CREATE TABLE "public.hub_client" (
	"client_hash_key" serial NOT NULL,
	"load_date" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"client_number" varchar(255) NOT NULL,
	CONSTRAINT "hub_client_pk" PRIMARY KEY ("client_hash_key")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sat_client" (
	"client_hash_key" BINARY NOT NULL,
	"load_date" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"FirstName" varchar(100) NOT NULL,
	"SecondName" varchar(100) NOT NULL,
	"Contacts" varchar(100) NOT NULL,
	"Email" varchar(100) NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.hub_service" (
	"service_hash_key" serial NOT NULL,
	"load_date" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"service_code" varchar(255) NOT NULL,
	CONSTRAINT "hub_service_pk" PRIMARY KEY ("service_hash_key")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sat_service" (
	"service_hash_key" BINARY NOT NULL,
	"load_date" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"ServiceName" varchar(100) NOT NULL,
	"Price" integer(100) NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.hub_employee" (
	"employee_hash_key" serial NOT NULL,
	"load_date" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"employee_code" varchar(255) NOT NULL,
	CONSTRAINT "hub_employee_pk" PRIMARY KEY ("employee_hash_key")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sat_employee" (
	"employee_hash_key" BINARY NOT NULL,
	"load_date" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"FirstName" varchar(100) NOT NULL,
	"SecondName" varchar(100) NOT NULL,
	"Contacts" varchar(100) NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.hub_position" (
	"position_hash_key" serial NOT NULL,
	"load_date" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"position_code" varchar(255) NOT NULL,
	CONSTRAINT "hub_position_pk" PRIMARY KEY ("position_hash_key")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sat_position" (
	"position_hash_key" BINARY NOT NULL,
	"PositionName" varchar(100) NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.link_order" (
	"order_hash_key" serial NOT NULL,
	"load_date" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"employee_hash_key" varchar(255) NOT NULL,
	"service_hash_key" varchar(255) NOT NULL,
	"client_hash_key" varchar(255) NOT NULL,
	CONSTRAINT "link_order_pk" PRIMARY KEY ("order_hash_key")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.link_position_employee" (
	"position_employee_hash_key" serial NOT NULL,
	"load_date" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"employee_hash_key" varchar(255) NOT NULL,
	"position_hash_key" BINARY NOT NULL,
	CONSTRAINT "link_position_employee_pk" PRIMARY KEY ("position_employee_hash_key")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "sat_client" ADD CONSTRAINT "sat_client_fk0" FOREIGN KEY ("client_hash_key") REFERENCES "hub_client"("client_hash_key");


ALTER TABLE "sat_service" ADD CONSTRAINT "sat_service_fk0" FOREIGN KEY ("service_hash_key") REFERENCES "hub_service"("service_hash_key");


ALTER TABLE "sat_employee" ADD CONSTRAINT "sat_employee_fk0" FOREIGN KEY ("employee_hash_key") REFERENCES "hub_employee"("employee_hash_key");


ALTER TABLE "sat_position" ADD CONSTRAINT "sat_position_fk0" FOREIGN KEY ("position_hash_key") REFERENCES "hub_position"("position_hash_key");

ALTER TABLE "link_order" ADD CONSTRAINT "link_order_fk0" FOREIGN KEY ("employee_hash_key") REFERENCES "hub_employee"("employee_hash_key");
ALTER TABLE "link_order" ADD CONSTRAINT "link_order_fk1" FOREIGN KEY ("service_hash_key") REFERENCES "hub_service"("service_hash_key");
ALTER TABLE "link_order" ADD CONSTRAINT "link_order_fk2" FOREIGN KEY ("client_hash_key") REFERENCES "hub_client"("client_hash_key");

ALTER TABLE "link_position_employee" ADD CONSTRAINT "link_position_employee_fk0" FOREIGN KEY ("employee_hash_key") REFERENCES "hub_employee"("employee_hash_key");
ALTER TABLE "link_position_employee" ADD CONSTRAINT "link_position_employee_fk1" FOREIGN KEY ("position_hash_key") REFERENCES "hub_position"("position_hash_key");











