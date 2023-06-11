--AS: you don't have proper sample code for most of your questions, just letting you know.
--The total amount of Telehealth appts. comparing the last three years.
select TotalTelehealth = count(*), Year = year(a.AppointmentDateTime)
from Appointments a
group by year(a.AppointmentDateTime)
having year(a.AppointmentDateTime) in (2021,2022,2023)
--The number of days prior to the appts. that the appts. are scheduled, comparing the Telehealth appts. to the in-person appts.
--AS I am assuming that the appointments were scheduled today, since you don't have a column for day scheduled. 
select AvgDaysPriorToAppt = avg(datediff(day, getdate(), a.AppointmentDateTime)), a.Telehealth
from Appointments a 
group by a.Telehealth
--The Provider with the most appts.-The Provider with the lowest number of appts.-The average number of appts. per Provider.
select  top 1 NumOfAppointments = count(*), a.Provider
from Appointments a 
group by a.Provider
order by NumOfAppointments desc

select  top 1 NumOfAppointments = count(*), a.Provider
from Appointments a 
group by a.Provider
order by NumOfAppointments asc

--AS Not sure what you mean average per provider, there is no average if you are counting per provider, it is an exact number. ie: A dr has 5 appointments, it is not an average, he just has 5 appointments.

--The amount of appts. per department (General, Dentistry, Ophthalmology, Dermatology)
select NumAppt = count(*), a.ReasonForVisit
from Appointments a 
group by a.ReasonForVisit
--A report of all the past visits in this format: Date and Time of appointment: Patients Last Name, Patients First Name - Appointment Summary
select SummaryPerVisit = concat(a.AppointmentDateTime, ': ', a.PatientLastName, ', ', a.PatientFirstName, ' - ', a.Summary)
from Appointments a 