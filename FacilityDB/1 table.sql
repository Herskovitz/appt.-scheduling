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
    ScheduleDate date not null,
    AppointmentDateTime datetime not null,
--AS Let me know if you want first and last name split up for the provider.
    Provider varchar(100) not null constraint ck_Appointments_Provider_cannot_be_blank check(Provider <> ''),
    Department varchar(50) not null constraint ck_Appointments_Department_must_be_one_of_4_options check(Department in ('Ophthalmology', 'Dermatology', 'General', 'Dentistry')),
    TypeOfVisit char(4) not null constraint ck_Appointments_TypeOfVisit_must_sick_or_well check(TypeOfVisit in ('sick', 'well')),
    ReasonForVisit varchar(100) not null,
    Summary varchar(200) not null,
    Telehealth bit not null,
    TelehealthCode as case Telehealth when 1 then newid() else null end, 
    ReferenceNumber as upper(concat(substring(patientLastName,1,2), substring(PatientFirstName,1,2), day(AppointmentDateTime))) persisted,
    constraint ck_Appointments_AppointmentDateTime_must_be_after_DOB check(AppointmentDateTime > DOB),
    constraint u_Appointments_Provider_AppointmentDateTime unique(Provider, AppointmentDateTime),
    constraint ck_Appointments_TypeOfVisit_is_well_and_ReasonForVisit_is_blank_or_TypeOfVisit_Sick_and_ReasonForVisit_is_not_blank 
        check((TypeOfVisit = 'well' and ReasonForVisit = '') or (TypeOfVisit = 'sick' and ReasonForVisit <> '')),
    constraint ck_Appointments_ScheduleDate_is_before_AppointmentDateTime_by_at_least_one_day check(datediff(day, ScheduleDate, AppointmentDateTime) >= 1),
    constraint ck_Appointments_if_AppointmentDateTime_did_not_happen_yet_then_summary_blank 
        check((AppointmentDateTime >= getdate() and Summary = '') or (AppointmentDateTime < getdate() and Summary <> ''))
)
go