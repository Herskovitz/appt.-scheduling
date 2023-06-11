/*
Appointments
AppointmentId pk
PatientFirstName varchar(30) not null not blank
patientLastName varchar(30) not null not blank
DOB date not null 
PhoneNumber varchar(11) not null not blank
AppointmentDateTime datetime not null must be between dob and current date
Provider varchar not null not blank
ReasonForVisit varchar(20) not null not blank
Summary varchar(200) not null
TeleHealth bit not null
TelehealthCode as case when Telehealth = 1 then GUID else null
ReferenceNumber as concat 1st 2 digits of last name, then 1st 2 digits of first name, then the appt. day of month 
AppointmentDateTime must be between dob and current date
constraint unique Provider, AppointmentDateTime
*/