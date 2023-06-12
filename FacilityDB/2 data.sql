use FacilityDB
go

delete Appointments
go 

insert Appointments(PatientLastName, PatientFirstName, DOB, PhoneNumber, ScheduleDate, AppointmentDateTime, Provider, Department, TypeOfVisit, ReasonForVisit, Telehealth, Summary)
select 'Smith', 'John', '03-24-1979', '212-100-2000', '2023-08-06', '2023-08-09 12:30', 'Davies Mark MD', 'General', 'Sick', 'Sore throat', 0, ''
union select 'Jackson', 'Olga', '01-01-1989', '212-123-4567', '2023-02-01', '2023-07-01 10:00', 'Newman, Michael MD', 'Ophthalmology', 'Well', '', 0, ''
union select 'Hill', 'Bill', '10-25-1975', '212-999-8888', '2023-04-09', '2023-07-02 11:00', 'Friedman, Sharon RN', 'Dermatology', 'Sick', 'Eczema', 1, ''
union select 'Jefferson', 'James', '11-12-2000', '212-212-2121', '2023-06-09', '2023-06-10 8:30', 'Ruben, Jack MD', 'General', 'Well', '', 1, 'well visit, all looks good, waiting for lab results'
union select 'Berger', 'Anne', '10-01-1954', '212-456-7890', '2023-04-09', '2023-06-10 16:00', 'Cohen, Michael MD', 'Dentistry', 'Sick', 'Cavities', 0, 'filled upper right tooth #12'
union select 'Sparrow', 'Jason', '09-09-1999', '212-359-9865', '2023-05-09', '2023-06-02 15:00', 'Davies, Mark MD', 'General', 'Sick', 'Low-grade Fever', 1, 'tested positive for Covid-19'
union select 'Jefferson', 'James', '11-12-2000', '212-212-2121', '2023-06-05', '2023-07-05 8:30', 'Ruben, Jack MD', 'General', 'Well', '', 1, ''
union select 'Rosen', 'Charlie', '09-09-1999','212-359-9865' , '2022-05-20', '2022-06-02 15:00', 'Davies, Mark MD', 'General', 'Sick', 'Low-grade Fever', 1, 'virus, advised pt. to rest'
union select 'Berger', 'Anne', '10-01-1954', '212-456-7890', '2022-04-25', '2022-06-10 16:00', 'Cohen, Michael MD', 'Dentistry', 'Sick', 'Cavities', 0, 'X-ray of full mouth, fillings on coming visit'
union select 'Rosenberg', 'Anne', '10-12-1974', '212-456-7890', '2021-4-25', '2021-06-10 15:30', 'Cohen, Michael MD', 'Dentistry', 'Sick', 'Root-Canal', 0, 'Root canal part 1'
union select 'Jefferson', 'James', '11-12-2000', '212-212-2121', '2021-7-01', '2021-07-05 8:30', 'Ruben, Jack MD', 'General', 'Well', '', 1, 'all looks good, waiting for lab results'
union select 'Jefferson', 'James', '11-12-2000', '212-212-2121', '2022-7-01', '2022-07-05 8:30', 'Ruben, Jack MD', 'General', 'Well', '', 1, 'all looks good, waiting for lab results'
union select 'Herman', 'Herman', '10-25-1965', '212-999-8888', '2021-3-27', '2021-04-02 11:30', 'Friedman, Sharon RN', 'Dermatology', 'Sick', 'Eczema', 1, 'prescribed hydrocortisone ointment'
union select 'Hill', 'Cyndi', '09-24-1969', '212-919-8658', '2020-08-25', '2020-09-27 13:00', 'Fried, Michael MD', 'Dermatology', 'Well', '', 0, 'all good, pt. to return in 12 mos.'
union select 'Hill', 'Cyndi', '09-24-1969', '212-919-8658', '2022-07-01', '2022-07-02 11:00', 'Friedman, Sharon RN', 'Dermatology', 'Sick', 'Hives', 1, 'allergic reaction - allergen unknown, pt. received cortisone shot + tablets'

