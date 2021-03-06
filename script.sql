USE [carsDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](150) NOT NULL,
	[Power] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[Prize] [nvarchar](50) NOT NULL,
	[Version] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engines]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engines](
	[Id_engine] [int] IDENTITY(1,1) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[EDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Engines] PRIMARY KEY CLUSTERED 
(
	[Id_engine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wheels]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wheels](
	[ID_Whells] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Session] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_wheels] PRIMARY KEY CLUSTERED 
(
	[ID_Whells] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAllBigWheels]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[spAllBigWheels]
	
AS
BEGIN
	SELECT * 
	FROM dbo.wheels
	WHERE dbo.wheels.size >16
	

	SET NOCOUNT ON;

   

END
GO
/****** Object:  StoredProcedure [dbo].[spAllCars]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAllCars] 
	
AS
BEGIN
	SELECT * 
	FROM dbo.Cars
	

	SET NOCOUNT ON;

   

END
GO
/****** Object:  StoredProcedure [dbo].[spAllSmallWheels]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAllSmallWheels]
	
AS
BEGIN
	SELECT * 
	FROM dbo.wheels
	WHERE dbo.wheels.size <=16
	

	SET NOCOUNT ON;

   

END
GO
/****** Object:  StoredProcedure [dbo].[spAllSummerWheels]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAllSummerWheels]
	
AS
BEGIN
	SELECT * 
	FROM dbo.wheels
	WHERE dbo.wheels.Session='summer'
	

	SET NOCOUNT ON;

   

END
GO
/****** Object:  StoredProcedure [dbo].[spAllWinterWheels]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[spAllWinterWheels]
	
AS
BEGIN
	SELECT * 
	FROM dbo.wheels
	WHERE dbo.wheels.Session='winter'
	

	SET NOCOUNT ON;

   

END
GO
/****** Object:  StoredProcedure [dbo].[spCarGraterThan]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCarGraterThan]
	(
	@cena as int
	)
AS
BEGIN
	SELECT * 
	FROM dbo.Cars
	WHERE dbo.Cars.Prize > @cena
	

	SET NOCOUNT ON;

   

END
GO
/****** Object:  StoredProcedure [dbo].[spCarLowThan]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCarLowThan]
	(
	@cena as int
	)
AS
BEGIN
	SELECT * 
	FROM dbo.Cars
	WHERE dbo.Cars.Prize <= @cena
	

	SET NOCOUNT ON;

   

END
GO
/****** Object:  StoredProcedure [dbo].[spExpensiveAndPowerCars]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[spExpensiveAndPowerCars]


AS
BEGIN

SELECT * 
FROM DBO.Cars
WHERE dbo.Cars.Prize >50000
UNION
SELECT *
FROM dbo.Cars
WHERE dbo.Cars.Power>200

	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spModelCarName]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModelCarName] (@ime as varchar(max))
	
AS
BEGIN
	SELECT * 
	FROM dbo.Cars
	WHERE model LIKE @ime +'%'

	SET NOCOUNT ON;

   

END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrationPrize]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegistrationPrize]
	(
	@reg as int
	)
	
AS
BEGIN
IF(@reg <=30000)
BEGIN
SELECT dbo.Cars.Model
FROM dbo.Cars
WHERE dbo.Cars.Power <=150
END
IF(@reg > 30000 and @reg <60000)
BEGIN
SELECT dbo.Cars.Model
FROM dbo.Cars
WHERE dbo.Cars.Power >150 AND dbo.Cars.Power <=200
END
IF(@reg > 60000 and @reg <=100000)
BEGIN
SELECT dbo.Cars.Model
FROM dbo.Cars
WHERE dbo.Cars.Power >200 AND dbo.Cars.Power <=400
END


END
GO
/****** Object:  StoredProcedure [dbo].[spSetCarPrice]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSetCarPrice]
	(
	
	@cena AS INT,
	@naziv AS VARCHAR(MAX)
	)
AS
BEGIN
	UPDATE dbo.Cars
SET  dbo.Cars.Prize = @cena
WHERE dbo.Cars.Model=@naziv;
	

	SET NOCOUNT ON;

   

END
GO
/****** Object:  StoredProcedure [dbo].[spSetNewEngineVerson]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSetNewEngineVerson]
	(
	
	@starinaziv AS VARCHAR(MAX), 
	@naziv AS VARCHAR(MAX)
	)
AS
BEGIN
	UPDATE dbo.Engines
SET  dbo.Engines.Version=@naziv
WHERE dbo.Engines.Version =@starinaziv
	

	SET NOCOUNT ON;

   

END
GO
/****** Object:  StoredProcedure [dbo].[spSetWheelSize]    Script Date: 4/15/2021 3:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[spSetWheelSize]
(
@ime AS VARCHAR(MAX),
@velicina AS INT
)

AS
BEGIN
UPDATE dbo.wheels 
SET dbo.wheels.Size = @velicina
WHERE dbo.wheels.Name=@ime
	
	SET NOCOUNT ON;

    
	
END
GO
