use FacilityDB
go

delete Appointments
go 

insert Appointments(PatientLastName, PatientFirstName, DOB, PhoneNumber, AppointmentDateTime, Provider, ReasonForVisit, Summary, Telehealth)
select 'Smith', 'John', '03-24-1979', '212-100-2000', '2023-08-09 12:30', 'Davies Mark MD', 'General-Sick', 'Sore throat', 0
union select 'Jackson', 'Olga', '01-01-1989', '212-123-4567', '2023-07-01 10:00', 'Newman, Michael MD', 'Ophthalmology-Well', '', 0
union select 'Hill', 'Bill', '10-25-1975', '212-999-8888', '2023-07-02 11:00', 'Friedman, Sharon RN', 'Dermatology-Sick', 'Eczema', 1
union select 'Jefferson', 'James', '11-12-2000', '212-212-2121', '2023-07-05 8:30', 'Ruben, Jack MD', 'General-Well', '', 1
union select 'Berger', 'Anne', '10-01-1954', '212-456-7890', '2023-06-10 16:00', 'Cohen, Michael MD', 'Dentistry-Sick', 'Cavities', 0
union select 'Sparrow', 'Jason', '09-09-1999', '212-359-9865', '2023-06-02 15:00', 'Davies, Mark MD', 'General-Sick', 'Low-grade Fever', 1
--YYYY-MM-DD HH:MI:SS.