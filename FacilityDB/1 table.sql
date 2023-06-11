use FacilityDB
go

drop table if exists Appointments 
go 

create table dbo.Appointments(
    AppointmentId int not null identity primary key,
    PatientFirstName varchar(30) not null constraint ck_Appointments_PatientFirstName_cannot_be_blank check(PatientFirstName <> ''),
    PatientLastName varchar(30) not null constraint ck_Appointments_PatientLastName_cannot_be_blank check(PatientLastName <> ''),
    DOB date not null constraint ck_Appointments_DOB_must_be_before_the_current_date check(DOB < getdate()),
    PhoneNumber varchar(12) not null constraint ck_Appointments_PhoneNumber_cannot_be_blank check(PhoneNumber <> ''),
    AppointmentDateTime datetime not null,
--AS Let me know if you want first and last name split up for the provider.
    Provider varchar(100) not null constraint ck_Appointments_Provider_cannot_be_blank check(Provider <> ''),
    ReasonForVisit varchar(20) not null constraint ck_Appointments_ReasonForVisit_cannot_be_blank check(ReasonForVisit <> ''),
    Summary varchar(200) not null default '',
    Telehealth bit not null,
    TelehealthCode as case Telehealth when 1 then newid() else null end, 
    ReferenceNumber as upper(concat(substring(patientLastName,1,2), substring(PatientFirstName,1,2), day(AppointmentDateTime))) persisted,
    constraint ck_Appointments_AppointmentDateTime_must_be_after_DOB check(AppointmentDateTime > DOB),
    constraint u_Appointments_Provider_AppointmentDateTime unique(Provider, AppointmentDateTime)
)
go