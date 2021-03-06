USE [master]
GO
/****** Object:  Database [clinic]    Script Date: 9/12/2014 10:43:17 م ******/
CREATE DATABASE [clinic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clinic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\clinic.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'clinic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\clinic_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [clinic] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clinic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clinic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clinic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clinic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clinic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clinic] SET ARITHABORT OFF 
GO
ALTER DATABASE [clinic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clinic] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [clinic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clinic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clinic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clinic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clinic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clinic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clinic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clinic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clinic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [clinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clinic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clinic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clinic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clinic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clinic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clinic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clinic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [clinic] SET  MULTI_USER 
GO
ALTER DATABASE [clinic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clinic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clinic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clinic] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [clinic]
GO
/****** Object:  StoredProcedure [dbo].[spGetAdminByID]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetAdminByID]
@AdminID int
AS
/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Select  Specific Admin Information by ID 
********************************************************************************************/
BEGIN TRY
begin
SELECT admin_id,admin_type,admin_first_name,admin_middle_name,admin_last_name,admin_date_of_birth,admin_mobile_phone,admin_country,admin_city,admin_picture,admin_notes,username,[password],create_date,modify_date,[status]
FROM admins
WHERE admin_id = @AdminID;
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spGetAdmins]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetAdmins]
AS
/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014    		Ahmed Wajieh		This stored Procedure is made to Select All Admins Information
********************************************************************************************/
BEGIN TRY
begin
SELECT admin_id,admin_type,admin_first_name,admin_middle_name,admin_last_name,admin_date_of_birth,admin_mobile_phone,admin_country,admin_city,admin_picture,admin_notes,username,[password],create_date,modify_date,[status]
FROM admins;
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spGetAppointments]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetAppointments]

AS
/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Select All Appointments Information
********************************************************************************************/
BEGIN TRY
begin
SELECT appointment_id,appointment_type,patient_id,doctor_id,appointment_case,appointment_date,appointment_start_time,appointment_finish_time,appointment_duration,create_date,modify_date,[status]
FROM appointments;
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spGetCities]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetCities]

AS
/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Select All Cities Information
********************************************************************************************/
BEGIN TRY
begin
SELECT city_id,city_name,create_date,modify_date,[status]
FROM cities;
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spGetCountries]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetCountries]

AS
/*******************************************************************************************
Purpose: 
Database Name:DBBroadway
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014    		Ahmed Wajieh		This stored Procedure is made to Select All Countries Information
********************************************************************************************/
BEGIN TRY
begin
SELECT country_id,country_name,create_date,modify_date,[status]
FROM countries;
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spGetDoctorByID]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetDoctorByID]
@DoctorID int
AS
/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Select specific Doctor Information By ID
********************************************************************************************/
BEGIN TRY
begin
SELECT doctor_gender,doctor_first_name,doctor_middle_name,doctor_last_name,doctor_date_of_birth,doctor_speciality,doctor_nationality,doctor_marital_status,doctor_mobile_phone,doctor_country,doctor_city,doctor_picture,doctor_notes,[password],create_date,modify_date,[status]
FROM doctors
WHERE doctor_id = @DoctorID;
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spGetDoctors]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetDoctors]

AS
/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014    		Ahmed Wajieh		This stored Procedure is made to Select All Doctors Information
********************************************************************************************/
BEGIN TRY
begin
SELECT doctor_id,doctor_gender,doctor_first_name,doctor_middle_name,doctor_last_name,doctor_date_of_birth,doctor_speciality,doctor_nationality,doctor_marital_status,doctor_mobile_phone,doctor_country,doctor_city,doctor_picture,doctor_notes,[password],create_date,modify_date,[status]
FROM doctors;
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spGetInsurances]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetInsurances]

AS
/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014    		Ahmed Wajieh		This stored Procedure is made to Select All insurances Information
********************************************************************************************/
BEGIN TRY
begin
SELECT insurance_id,insurance_name,insurance_notes,create_date,modify_date,[status]
FROM insurances;
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spGetPatientByID]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetPatientByID]
@PatientID int
AS
/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Select Specific Patient Information By ID
********************************************************************************************/
BEGIN TRY
begin
SELECT patient_title,patient_gender,patient_first_name,patient_middle_name,patient_last_name,patient_date_of_birth,patient_nationality,patient_marital_status,patient_weight,patient_height,patient_mobile_phone,patient_home_phone,patient_email,patient_country,patient_city,patient_suburb,patient_last_appointment,patient_occupation,patient_work_company,patient_insurance_company,patient_medical_card,patient_insurance_degree,patient_alergies,patient_picture,patient_notes,[password],create_date,modify_date,[status]
FROM patients
Where patient_id = @PatientID;
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spGetPatients]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetPatients]

AS
/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014    		Ahmed Wajieh		This stored Procedure is made to Select All Patients Information
********************************************************************************************/
BEGIN TRY
begin
SELECT patient_id,patient_title,patient_gender,patient_first_name,patient_middle_name,patient_last_name,patient_date_of_birth,patient_nationality,patient_marital_status,patient_weight,patient_height,patient_mobile_phone,patient_home_phone,patient_email,patient_country,patient_city,patient_suburb,patient_last_appointment,patient_occupation,patient_work_company,patient_insurance_company,patient_medical_card,patient_insurance_degree,patient_alergies,patient_picture,patient_notes,[password],create_date,modify_date,[status]
FROM patients;
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spGetRelations]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetRelations]

AS
/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014    		Ahmed Wajieh		This stored Procedure is made to Select All Relations Information
********************************************************************************************/
BEGIN TRY
begin
SELECT relation_id,patient_id,dependent_id,relation_type,create_date,modify_date,[status]
FROM relations;
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spInsertAdmins]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertAdmins]
@AdminID int,
@AdminType nvarchar(MAX) ,
@AdminFirstName nvarchar(MAX) ,
@AdminMiddleName nvarchar(MAX) ,
@AdminLastName nvarchar(MAX) ,
@AdminDateOfBirth bigint ,
@AdminMobilePhone nvarchar(MAX) ,
@AdminCountry nvarchar(max),
@AdminCity nvarchar(max),
@AdminPicture nvarchar(max),
@AdminNotes nvarchar(max),
@UserName nvarchar(255),
@Password nvarchar(10),
@CreateDate bigint,
@ModifyDate bigint ,
@Status int  
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014    		Ahmed Wajieh		This stored Procedure is made to Insert All Admins Information
********************************************************************************************/
BEGIN TRY
begin
if not exists (select username from admins where username = @UserName)
	begin
		INSERT INTO admins(admin_type,admin_first_name,admin_middle_name,admin_last_name,admin_date_of_birth,admin_mobile_phone,admin_country,admin_city,admin_picture,admin_notes,username,[password],create_date,modify_date,[status])
		VALUES(@AdminType,@AdminFirstName,@AdminMiddleName,@AdminLastName,@AdminDateOfBirth,@AdminMobilePhone,@AdminCountry,@AdminCity,@AdminPicture,@AdminNotes,@UserName,@Password,@CreateDate,@ModifyDate,@Status)	
	end
else
	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spInsertAppointments]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertAppointments]
@AppointmentType int ,
@PatientID int,
@DoctorID int,
@AppointmentCase nvarchar(max),
@AppointmentDate bigint ,
@AppointmentStartTime bigint ,
@AppointmentFinishTime bigint ,
@AppointmentDuration bigint ,
@CreateDate bigint,
@ModifyDate bigint ,
@Status int  
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Insert All Appointments Information
********************************************************************************************/
BEGIN TRY
begin

	begin
		INSERT INTO appointments(appointment_type,patient_id,doctor_id,appointment_case,appointment_date,appointment_start_time,appointment_finish_time,appointment_duration,create_date,modify_date,[status])
		VALUES(@AppointmentType,@PatientID,@DoctorID,@AppointmentCase,@AppointmentDate,@AppointmentStartTime,@AppointmentFinishTime,@AppointmentDuration,@CreateDate,@ModifyDate,@Status)	
	end

	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spInsertCities]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertCities]
@CityName nvarchar(MAX) ,
@CountryID int ,
@CreateDate bigint ,
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014    		Ahmed Wajieh		This stored Procedure is made to Insert All Cities Information
********************************************************************************************/
BEGIN TRY
begin
if not exists (select city_name from cities where city_name = @CityName)
	begin
		INSERT INTO cities(city_name,country_id,create_date,modify_date,[status])
		VALUES(@CityName,@CountryID,@CreateDate,@ModifyDate,@Status)	
	end
else
	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spInsertCountries]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertCountries]
@CountryName nvarchar(MAX) ,
@CreateDate bigint ,
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Insert All Countries Information
********************************************************************************************/
BEGIN TRY
begin
if not exists (select country_name from countries where country_name = @CountryName)
	begin
		INSERT INTO countries(country_name,create_date,modify_date,[status])
		VALUES(@CountryName,@CreateDate,@ModifyDate,@Status)	
	end
else
	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spInsertDoctors]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertDoctors]
@DoctorGender int ,
@DoctorFirstName nvarchar(MAX) ,
@DoctorMiddleName nvarchar(MAX) ,
@DoctorLastName nvarchar(MAX) ,
@DoctorDateOfBirth bigint,
@DoctorSpeciality nvarchar(max),
@DoctorNationality nvarchar(max),
@DoctorMaritalStatus nvarchar(max),
@DoctorMobilePhone nvarchar(max),
@DoctorCountry nvarchar(MAX), 
@DoctorCity nvarchar(MAX) ,
@DoctorPicture nvarchar(MAX), 
@DoctorNotes nvarchar(MAX),  
@Password nvarchar(10),
@CreateDate bigint,
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Insert All Doctors Information
********************************************************************************************/
BEGIN TRY
begin
if not exists (select doctor_mobile_phone from doctors where doctor_mobile_phone = @DoctorMobilePhone)
	begin
		INSERT INTO doctors(doctor_gender,doctor_first_name,doctor_middle_name,doctor_last_name,doctor_date_of_birth,doctor_speciality,doctor_nationality,doctor_marital_status,doctor_mobile_phone,doctor_country,doctor_city,doctor_picture,doctor_notes,[password],create_date,modify_date,[status])
		VALUES(@DoctorGender,@DoctorFirstName,@DoctorMiddleName,@DoctorLastName,@DoctorDateOfBirth,@DoctorSpeciality,@DoctorNationality,@DoctorMaritalStatus,@DoctorMobilePhone,@DoctorCountry,@DoctorCity,@DoctorPicture,@DoctorNotes,@Password,@CreateDate,@ModifyDate,@Status)	
	end
else
	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spInsertInsurances]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertInsurances]
@InsuranceName nvarchar(MAX) ,
@InsuranceNotes nvarchar(MAX),
@CreateDate bigint ,
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Insert All Insurances Information
********************************************************************************************/
BEGIN TRY
begin
if not exists (select insurance_name from insurances where insurance_name = @InsuranceName)
	begin
		INSERT INTO insurances(insurance_name,insurance_notes,create_date,modify_date,[status])
		VALUES(@InsuranceName,@InsuranceNotes,@CreateDate,@ModifyDate,@Status)	
	end
else
	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spInsertPatients]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertPatients]
@PatientTitle int,
@PatientGender int,
@PatientFirstName nvarchar(max),
@PatientMiddleName nvarchar(max),
@PatientLastName nvarchar(max),
@PatientDateOfBirth bigint,
@PatientNationality nvarchar(max),
@PatientMaritalStatus nvarchar(max),
@PatientWeight float,
@PatientHeight float,
@PatientMobilePhone nvarchar(max),
@PatientHomePhone nvarchar(max),
@PatientEmail nvarchar(max),
@PatientCountry int,
@PatientCity int,
@PatientSuburb nvarchar(max),
@PatientLastAppointment bigint,
@PatientOccupation nvarchar(max),
@PatientWorkCompany nvarchar(max),
@PatientInsuranceCompany int,
@PatientMedicalCard nvarchar(max),
@PatientInsuranceDegree nvarchar(max),
@PatientAlergies nvarchar(max),
@PatientPicture nvarchar(max),
@PatientNotes nvarchar(max),
@Password nvarchar(10),
@CreateDate bigint,
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014    		Ahmed Wajieh		This stored Procedure is made to Insert All Patients Information
********************************************************************************************/
BEGIN TRY
begin
if not exists (select patient_email from patients where patient_email = @PatientEmail)
	begin
		INSERT INTO patients(patient_title,patient_gender,patient_first_name,patient_middle_name,patient_last_name,patient_date_of_birth,patient_nationality,patient_marital_status,patient_weight,patient_height,patient_mobile_phone,patient_home_phone,patient_email,patient_country,patient_city,patient_suburb,patient_last_appointment,patient_occupation,patient_work_company,patient_insurance_company,patient_medical_card,patient_insurance_degree,patient_alergies,patient_picture,patient_notes,[password],create_date,modify_date,[status])
		VALUES(@PatientTitle,@PatientGender,@PatientFirstName,@PatientMiddleName,@PatientLastName,@PatientDateOfBirth,@PatientNationality,@PatientMaritalStatus,@PatientWeight,@PatientHeight,@PatientMobilePhone,@PatientHomePhone,@PatientEmail,@PatientCountry,@PatientCity,@PatientSuburb,@PatientLastAppointment,@PatientOccupation,@PatientWorkCompany,@PatientInsuranceCompany,@PatientMedicalCard,@PatientInsuranceDegree,@PatientAlergies,@PatientPicture,@PatientNotes,@Password,@CreateDate,@ModifyDate,@Status)	
	end
else
	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spInsertRelations]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertRelations]
@PatientID int,
@DependentID int,
@RelationType int,
@CreateDate bigint,
@ModifyDate bigint ,
@Status int
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014   		Ahmed Wajieh		This stored Procedure is made to Insert All Cities Information
********************************************************************************************/
BEGIN TRY
begin

	begin
		INSERT INTO relations(patient_id,dependent_id,relation_type,create_date,modify_date,[status])
		VALUES(@PatientID,@DependentID,@RelationType,@CreateDate,@ModifyDate,@Status)	
	end

	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spUpdateAdmins]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateAdmins]
@AdminID int,
@AdminType nvarchar(MAX) ,
@AdminFirstName nvarchar(MAX) ,
@AdminMiddleName nvarchar(MAX) ,
@AdminLastName nvarchar(MAX) ,
@AdminDateOfBirth bigint ,
@AdminMobilePhone nvarchar(MAX) ,
@AdminCountry nvarchar(max),
@AdminCity nvarchar(max),
@AdminPicture nvarchar(max),
@AdminNotes nvarchar(max),
@UserName nvarchar(255),
@Password nvarchar(10),
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Update All Admin Information
********************************************************************************************/
BEGIN TRY
begin
	begin
		UPDATE admins
		set admin_type=@AdminType,admin_first_name=@AdminFirstName,admin_middle_name=@AdminMiddleName,admin_last_name=@AdminLastName,admin_date_of_birth=@AdminDateOfBirth,admin_mobile_phone=@AdminMobilePhone,admin_country=@AdminCountry,admin_city=@AdminCity,admin_picture=@AdminPicture,admin_notes=@AdminNotes,username=@UserName,[password]=@Password,modify_date=@ModifyDate,[status]=@Status
		Where admin_id = @AdminID;
	end

	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH


GO
/****** Object:  StoredProcedure [dbo].[spUpdateAppointments]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateAppointments]
@AppointmentID int,
@AppointmentType int ,
@PatientID int,
@DoctorID int,
@AppointmentCase nvarchar(max),
@AppointmentDate bigint ,
@AppointmentStartTime bigint ,
@AppointmentFinishTime bigint ,
@AppointmentDuration bigint ,
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Update All Appointment Information
********************************************************************************************/
BEGIN TRY
begin
	begin
		UPDATE appointments
		set appointment_type=@AppointmentType,patient_id=@PatientID,doctor_id=@DoctorID,appointment_case=@AppointmentCase,appointment_date=@AppointmentDate,appointment_start_time=@AppointmentStartTime,appointment_finish_time=@AppointmentFinishTime,appointment_duration=@AppointmentDuration,modify_date=@ModifyDate,[status]=@Status
		Where appointment_id = @AppointmentID;
	end

	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spUpdateCities]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateCities]
@CityID int,
@CityName nvarchar(MAX) ,
@CountryID int,
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Update All City Information
********************************************************************************************/
BEGIN TRY
begin
	begin
		UPDATE cities
		set city_name=@CityName,country_id=@CountryID,modify_date=@ModifyDate,[status]=@Status
		Where city_id = @CityID;
	end

	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spUpdateCountries]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateCountries]
@CountryID int,
@CountryName nvarchar(MAX) ,
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Update All Country Information
********************************************************************************************/
BEGIN TRY
begin
	begin
		UPDATE countries
		set country_name=@CountryName,modify_date=@ModifyDate,[status]=@Status
		Where country_id = @CountryID;
	end

	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spUpdateDoctors]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateDoctors]
@DoctorID int,
@DoctorGender int ,
@DoctorFirstName nvarchar(MAX) ,
@DoctorMiddleName nvarchar(MAX) ,
@DoctorLastName nvarchar(MAX) ,
@DoctorDateOfBirth bigint,
@DoctorSpeciality nvarchar(max),
@DoctorNationality nvarchar(max),
@DoctorMaritalStatus nvarchar(max),
@DoctorMobilePhone nvarchar(max),
@DoctorCountry nvarchar(MAX), 
@DoctorCity nvarchar(MAX) ,
@DoctorPicture nvarchar(MAX), 
@DoctorNotes nvarchar(MAX),  
@Password nvarchar(10),
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Update All Doctor Information
********************************************************************************************/
BEGIN TRY
begin
	begin
		UPDATE doctors
		set doctor_gender=@DoctorGender,doctor_first_name=@DoctorFirstName,doctor_middle_name=@DoctorMiddleName,doctor_last_name=@DoctorLastName,doctor_date_of_birth=@DoctorDateOfBirth,doctor_speciality=@DoctorSpeciality,doctor_nationality=@DoctorNationality,doctor_marital_status=@DoctorMaritalStatus,doctor_mobile_phone=@DoctorMobilePhone,doctor_country=@DoctorCountry,doctor_city=@DoctorCity,doctor_picture=@DoctorPicture,doctor_notes=@DoctorNotes,[password]=@Password,modify_date=@ModifyDate,[status]=@Status
		Where doctor_id = @DoctorID;
	end

	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spUpdateInsurances]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateInsurances]
@InsuranceID int,
@InsuranceName nvarchar(MAX) ,
@InsuranceNotes nvarchar(MAX),
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014    		Ahmed Wajieh		This stored Procedure is made to Update All Insurance Information
********************************************************************************************/
BEGIN TRY
begin
	begin
		UPDATE insurances
		set insurance_name=@InsuranceName,insurance_notes=@InsuranceNotes,modify_date=@ModifyDate,[status]=@Status
		Where insurance_id = @InsuranceID;
	end

	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spUpdatePatients]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdatePatients]
@PatientID int,
@PatientTitle int,
@PatientGender int,
@PatientFirstName nvarchar(max),
@PatientMiddleName nvarchar(max),
@PatientLastName nvarchar(max),
@PatientDateOfBirth bigint,
@PatientNationality nvarchar(max),
@PatientMaritalStatus nvarchar(max),
@PatientWeight float,
@PatientHeight float,
@PatientMobilePhone nvarchar(max),
@PatientHomePhone nvarchar(max),
@PatientEmail nvarchar(max),
@PatientCountry int,
@PatientCity int,
@PatientSuburb nvarchar(max),
@PatientLastAppointment bigint,
@PatientOccupation nvarchar(max),
@PatientWorkCompany nvarchar(max),
@PatientInsuranceCompany int,
@PatientMedicalCard nvarchar(max),
@PatientInsuranceDegree nvarchar(max),
@PatientAlergies nvarchar(max),
@PatientPicture nvarchar(max),
@PatientNotes nvarchar(max),
@Password nvarchar(10),
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014     		Ahmed Wajieh		This stored Procedure is made to Update All Patient Information
********************************************************************************************/
BEGIN TRY
begin
	begin
		UPDATE patients
		set patient_title=@PatientTitle,patient_gender=@PatientGender,patient_first_name=@PatientFirstName,patient_middle_name=@PatientMiddleName,patient_last_name=@PatientLastName,patient_date_of_birth=@PatientDateOfBirth,patient_nationality=@PatientNationality,patient_marital_status=@PatientMaritalStatus,patient_weight=@PatientWeight,patient_height=@PatientHeight,patient_mobile_phone=@PatientMobilePhone,patient_home_phone=@PatientHomePhone,patient_email=@PatientEmail,patient_country=@PatientCountry,patient_city=@PatientCity,patient_suburb=@PatientSuburb,patient_last_appointment=@PatientLastAppointment,patient_occupation=@PatientOccupation,patient_work_company=@PatientWorkCompany,patient_insurance_company=@PatientInsuranceCompany,patient_medical_card=@PatientMedicalCard,patient_insurance_degree=@PatientInsuranceDegree,patient_alergies=@PatientAlergies,patient_picture=@PatientPicture,patient_notes=@PatientNotes,[password]=@Password,modify_date=@ModifyDate,[status]=@Status
		Where patient_id = @PatientID;
	end

	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[spUpdateRelations]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateRelations]
@RelationID int,
@PatientID int,
@DependentID int,
@RelationType int,
@ModifyDate bigint ,
@Status int 
AS

/*******************************************************************************************
Purpose: 
Database Name:clinic
Version History:
Date				Author				   Change
-----------------	------------------	   ----------------------------------------------------
12-09-2014    		Ahmed Wajieh		This stored Procedure is made to Update All Relation Information
********************************************************************************************/
BEGIN TRY
begin
	begin
		UPDATE relations
		set patient_id=@PatientID,dependent_id=@DependentID,relation_type=@RelationType,modify_date=@ModifyDate,[status]=@Status
		Where relation_id = @RelationID;
	end

	begin
		return -1
	end
end
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO
/****** Object:  Table [dbo].[admins]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_type] [int] NULL,
	[admin_first_name] [nvarchar](max) NULL,
	[admin_middle_name] [nvarchar](max) NULL,
	[admin_last_name] [nvarchar](max) NULL,
	[admin_date_of_birth] [bigint] NULL,
	[admin_mobile_phone] [nvarchar](max) NULL,
	[admin_country] [int] NULL,
	[admin_city] [int] NULL,
	[admin_picture] [nvarchar](max) NULL,
	[admin_notes] [nvarchar](max) NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](10) NOT NULL,
	[create_date] [bigint] NULL,
	[modify_date] [bigint] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_admins] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UN_admin] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[appointments]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointments](
	[appointment_id] [int] IDENTITY(1,1) NOT NULL,
	[appointment_type] [int] NULL,
	[patient_id] [int] NULL,
	[doctor_id] [int] NOT NULL,
	[appointment_case] [nvarchar](max) NULL,
	[appointment_date] [bigint] NULL,
	[appointment_start_time] [bigint] NULL,
	[appointment_finish_time] [bigint] NULL,
	[appointment_duration] [bigint] NULL,
	[create_date] [bigint] NULL,
	[modify_date] [bigint] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_appointments] PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cities]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [nvarchar](max) NULL,
	[country_id] [int] NULL,
	[create_date] [bigint] NULL,
	[modify_date] [bigint] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_cities] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[countries]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [nvarchar](max) NULL,
	[create_date] [bigint] NULL,
	[modify_date] [bigint] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_countries] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[doctors]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctors](
	[doctor_id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_gender] [int] NULL,
	[doctor_first_name] [nvarchar](max) NULL,
	[doctor_middle_name] [nvarchar](max) NULL,
	[doctor_last_name] [nvarchar](max) NULL,
	[doctor_date_of_birth] [bigint] NULL,
	[doctor_speciality] [nvarchar](max) NULL,
	[doctor_nationality] [nvarchar](max) NULL,
	[doctor_marital_status] [int] NULL,
	[doctor_mobile_phone] [nvarchar](max) NULL,
	[doctor_country] [int] NULL,
	[doctor_city] [int] NULL,
	[doctor_picture] [nvarchar](max) NULL,
	[doctor_notes] [nvarchar](max) NULL,
	[password] [nvarchar](10) NULL,
	[create_date] [bigint] NULL,
	[modify_date] [bigint] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_doctors] PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[insurances]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insurances](
	[insurance_id] [int] IDENTITY(1,1) NOT NULL,
	[insurance_name] [nvarchar](max) NULL,
	[insurance_notes] [nvarchar](max) NULL,
	[create_date] [bigint] NULL,
	[modify_date] [bigint] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_insurances] PRIMARY KEY CLUSTERED 
(
	[insurance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[patients]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patients](
	[patient_id] [int] IDENTITY(1000,1) NOT NULL,
	[patient_title] [int] NULL,
	[patient_gender] [int] NULL,
	[patient_first_name] [nvarchar](max) NULL,
	[patient_middle_name] [nvarchar](max) NULL,
	[patient_last_name] [nvarchar](max) NULL,
	[patient_date_of_birth] [bigint] NULL,
	[patient_nationality] [nvarchar](max) NULL,
	[patient_marital_status] [int] NULL,
	[patient_weight] [float] NULL,
	[patient_height] [float] NULL,
	[patient_mobile_phone] [nvarchar](max) NULL,
	[patient_home_phone] [nvarchar](max) NULL,
	[patient_email] [nvarchar](max) NULL,
	[patient_country] [int] NULL,
	[patient_city] [int] NULL,
	[patient_suburb] [nvarchar](max) NULL,
	[patient_last_appointment] [bigint] NULL,
	[patient_occupation] [nvarchar](max) NULL,
	[patient_work_company] [nvarchar](max) NULL,
	[patient_insurance_company] [int] NULL,
	[patient_medical_card] [nvarchar](max) NULL,
	[patient_insurance_degree] [nvarchar](max) NULL,
	[patient_alergies] [nvarchar](max) NULL,
	[patient_picture] [nvarchar](max) NULL,
	[patient_notes] [nvarchar](max) NULL,
	[password] [nvarchar](10) NULL,
	[create_date] [bigint] NULL,
	[modify_date] [bigint] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__patients__4D5CE4760C85F901] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[relations]    Script Date: 9/12/2014 10:43:17 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relations](
	[relation_id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[dependent_id] [int] NULL,
	[relation_type] [int] NULL,
	[create_date] [bigint] NULL,
	[modify_date] [bigint] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_relations] PRIMARY KEY CLUSTERED 
(
	[relation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[admins]  WITH CHECK ADD  CONSTRAINT [FK_admins_cities] FOREIGN KEY([admin_city])
REFERENCES [dbo].[cities] ([city_id])
GO
ALTER TABLE [dbo].[admins] CHECK CONSTRAINT [FK_admins_cities]
GO
ALTER TABLE [dbo].[admins]  WITH CHECK ADD  CONSTRAINT [FK_admins_countries] FOREIGN KEY([admin_country])
REFERENCES [dbo].[countries] ([country_id])
GO
ALTER TABLE [dbo].[admins] CHECK CONSTRAINT [FK_admins_countries]
GO
ALTER TABLE [dbo].[appointments]  WITH CHECK ADD  CONSTRAINT [FK_appointments_doctors] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[doctors] ([doctor_id])
GO
ALTER TABLE [dbo].[appointments] CHECK CONSTRAINT [FK_appointments_doctors]
GO
ALTER TABLE [dbo].[appointments]  WITH CHECK ADD  CONSTRAINT [FK_appointments_patients] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patients] ([patient_id])
GO
ALTER TABLE [dbo].[appointments] CHECK CONSTRAINT [FK_appointments_patients]
GO
ALTER TABLE [dbo].[cities]  WITH CHECK ADD  CONSTRAINT [FK_cities_countries] FOREIGN KEY([country_id])
REFERENCES [dbo].[countries] ([country_id])
GO
ALTER TABLE [dbo].[cities] CHECK CONSTRAINT [FK_cities_countries]
GO
ALTER TABLE [dbo].[doctors]  WITH CHECK ADD  CONSTRAINT [FK_doctors_cities] FOREIGN KEY([doctor_city])
REFERENCES [dbo].[cities] ([city_id])
GO
ALTER TABLE [dbo].[doctors] CHECK CONSTRAINT [FK_doctors_cities]
GO
ALTER TABLE [dbo].[doctors]  WITH CHECK ADD  CONSTRAINT [FK_doctors_cities1] FOREIGN KEY([doctor_city])
REFERENCES [dbo].[cities] ([city_id])
GO
ALTER TABLE [dbo].[doctors] CHECK CONSTRAINT [FK_doctors_cities1]
GO
ALTER TABLE [dbo].[doctors]  WITH CHECK ADD  CONSTRAINT [FK_doctors_countries] FOREIGN KEY([doctor_country])
REFERENCES [dbo].[countries] ([country_id])
GO
ALTER TABLE [dbo].[doctors] CHECK CONSTRAINT [FK_doctors_countries]
GO
ALTER TABLE [dbo].[doctors]  WITH CHECK ADD  CONSTRAINT [FK_doctors_countries1] FOREIGN KEY([doctor_country])
REFERENCES [dbo].[countries] ([country_id])
GO
ALTER TABLE [dbo].[doctors] CHECK CONSTRAINT [FK_doctors_countries1]
GO
ALTER TABLE [dbo].[patients]  WITH CHECK ADD  CONSTRAINT [FK_patients_cities] FOREIGN KEY([patient_city])
REFERENCES [dbo].[cities] ([city_id])
GO
ALTER TABLE [dbo].[patients] CHECK CONSTRAINT [FK_patients_cities]
GO
ALTER TABLE [dbo].[patients]  WITH CHECK ADD  CONSTRAINT [FK_patients_countries] FOREIGN KEY([patient_country])
REFERENCES [dbo].[countries] ([country_id])
GO
ALTER TABLE [dbo].[patients] CHECK CONSTRAINT [FK_patients_countries]
GO
ALTER TABLE [dbo].[patients]  WITH CHECK ADD  CONSTRAINT [FK_patients_insurances] FOREIGN KEY([patient_insurance_company])
REFERENCES [dbo].[insurances] ([insurance_id])
GO
ALTER TABLE [dbo].[patients] CHECK CONSTRAINT [FK_patients_insurances]
GO
ALTER TABLE [dbo].[relations]  WITH CHECK ADD  CONSTRAINT [FK_relations_patients] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patients] ([patient_id])
GO
ALTER TABLE [dbo].[relations] CHECK CONSTRAINT [FK_relations_patients]
GO
ALTER TABLE [dbo].[relations]  WITH CHECK ADD  CONSTRAINT [FK_relations_patients1] FOREIGN KEY([dependent_id])
REFERENCES [dbo].[patients] ([patient_id])
GO
ALTER TABLE [dbo].[relations] CHECK CONSTRAINT [FK_relations_patients1]
GO
USE [master]
GO
ALTER DATABASE [clinic] SET  READ_WRITE 
GO
