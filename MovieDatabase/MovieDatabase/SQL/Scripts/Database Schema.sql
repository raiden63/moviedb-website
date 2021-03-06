USE [master]
GO
/****** Object:  Database [MovieDB]    Script Date: 4/8/2016 7:53:49 PM ******/
CREATE DATABASE [MovieDB]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'MovieDB', FILENAME = N'D:\VS Workspace\LocalDB\v13.0\MovieDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'MovieDB_log', FILENAME = N'D:\VS Workspace\LocalDB\v13.0\MovieDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieDB] SET  MULTI_USER 
GO
ALTER DATABASE [MovieDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MovieDB]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL DEFAULT (''),
	[LastName] [varchar](50) NOT NULL DEFAULT (''),
	[AddBy] [varchar](50) NULL DEFAULT (''),
	[AddDate] [datetime] NULL DEFAULT (getdate()),
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL,
	[ExpireBy] [varchar](50) NULL,
	[ExpireDate] [datetime] NULL,
	[IsExpired] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genre](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL DEFAULT (''),
	[AddBy] [varchar](50) NOT NULL DEFAULT (''),
	[AddDate] [datetime] NOT NULL DEFAULT (getdate()),
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL,
	[ExpireBy] [varchar](50) NULL,
	[ExpireDate] [datetime] NULL,
	[IsExpired] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NOT NULL DEFAULT (''),
	[Year] [smallint] NOT NULL DEFAULT ((0)),
	[GenreID] [int] NOT NULL DEFAULT ((0)),
	[AddBy] [varchar](50) NOT NULL DEFAULT (''),
	[AddDate] [datetime] NOT NULL DEFAULT (getdate()),
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL,
	[ExpireBy] [varchar](50) NULL,
	[ExpireDate] [datetime] NULL,
	[IsExpired] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movie_Actor]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie_Actor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActorID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[AddBy] [varchar](50) NOT NULL DEFAULT (''),
	[AddDate] [datetime] NOT NULL DEFAULT (getdate()),
	[ExpireBy] [varchar](50) NULL,
	[ExpireDate] [datetime] NULL,
	[IsExpired] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Actor_FirstName]    Script Date: 4/8/2016 7:53:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_Actor_FirstName] ON [dbo].[Actor]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Actor_LastName]    Script Date: 4/8/2016 7:53:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_Actor_LastName] ON [dbo].[Actor]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movie_Actor]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Actor_ToActor] FOREIGN KEY([ActorID])
REFERENCES [dbo].[Actor] ([ID])
GO
ALTER TABLE [dbo].[Movie_Actor] CHECK CONSTRAINT [FK_Movie_Actor_ToActor]
GO
ALTER TABLE [dbo].[Movie_Actor]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Actor_ToMovie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[Movie_Actor] CHECK CONSTRAINT [FK_Movie_Actor_ToMovie]
GO
/****** Object:  StoredProcedure [dbo].[DeleteActor]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Expire a Actor record by ID
-- =============================================
CREATE PROCEDURE [dbo].[DeleteActor]
	@id int,
	@user varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [dbo].[Actor] 
	SET ExpireBy = @user,
		ExpireDate = GETDATE(),
		IsExpired = 1
	WHERE ID = @id
		AND IsExpired = 0;

	-- Expire all records associating the actor with the movie
	UPDATE [dbo].[Movie_Actor]
	SET ExpireBy = @user,
		ExpireDate = GETDATE(),
		IsExpired = 1
	WHERE ActorID = @id
		AND IsExpired = 0;
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteGenre]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Expire a Genre record by ID
-- =============================================
CREATE PROCEDURE [dbo].[DeleteGenre]
	@id int,
	@user varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [dbo].[Genre] 
	SET ExpireBy = @user,
		ExpireDate = GETDATE(),
		IsExpired = 1
	WHERE ID = @id
		AND IsExpired = 0;
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteMovie]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Expire a Movie record by ID
-- =============================================
CREATE PROCEDURE [dbo].[DeleteMovie]
	@id int,
	@user varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [dbo].[Movie] 
	SET ExpireBy = @user,
		ExpireDate = GETDATE(),
		IsExpired = 1
	WHERE ID = @id
		AND IsExpired = 0;

	-- Expire all records associating the movie with the actor(s)
	UPDATE [dbo].[Movie_Actor]
	SET ExpireBy = @user,
		ExpireDate = GETDATE(),
		IsExpired = 1
	WHERE MovieID = @id
		AND IsExpired = 0;
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteMovie_Actor]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Remove association between an Actor and a Movie
-- =============================================
CREATE PROCEDURE [dbo].[DeleteMovie_Actor]
	@actorID int,
	@movieID int,
	@user varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [dbo].[Movie_Actor]
	SET ExpireBy = @user,
		ExpireDate = GETDATE(),
		IsExpired = 1
	WHERE ActorID = @actorID 
		AND MovieID = @movieID
		AND IsExpired = 0;
END


GO
/****** Object:  StoredProcedure [dbo].[GetActor]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Get Actor information by ID
-- =============================================
CREATE PROCEDURE [dbo].[GetActor]
	@id int
AS
	BEGIN
		SELECT ID, FirstName, LastName FROM [dbo].[Actor]
		WHERE ID = @id
			AND IsExpired = 0;
	END


GO
/****** Object:  StoredProcedure [dbo].[GetActors]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Get all Actor records that include the passed Movie
-- =============================================
CREATE PROCEDURE [dbo].[GetActors]
	@movieID int = 0,
	@genreID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@movieID > 0)
	BEGIN
		SELECT a.ID, a.FirstName, a.LastName FROM [dbo].[Actor] a
			JOIN [dbo].[Movie_Actor] ma ON a.ID = ma.ActorID
		WHERE a.IsExpired = 0
			AND ma.IsExpired = 0
			AND ma.MovieID = @movieID
	END
	ELSE IF (@genreID > 0)
	BEGIN
		SELECT DISTINCT a.ID, a.FirstName, a.LastName FROM [dbo].[Actor] a
			JOIN [dbo].[Movie_Actor] ma ON a.ID = ma.ActorID
			JOIN [dbo].[Movie] m ON m.ID = ma.MovieID
			JOIN [dbo].[Genre] g ON g.ID = m.GenreID
		WHERE a.IsExpired = 0
			AND ma.IsExpired = 0
			AND m.IsExpired = 0
			AND g.IsExpired = 0
			AND g.ID = @genreID
	END
	ELSE 
	BEGIN
		SELECT ID, FirstName, LastName FROM [dbo].[Actor]
			WHERE IsExpired = 0
	END
END


GO
/****** Object:  StoredProcedure [dbo].[GetGenre]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Get Genre information by ID
-- =============================================
CREATE PROCEDURE [dbo].[GetGenre]
	@id int
AS
	BEGIN
		SELECT ID, Name FROM [dbo].[Genre]
		WHERE ID = @id
			AND IsExpired = 0;
	END

GO
/****** Object:  StoredProcedure [dbo].[GetGenres]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Get a list of all entered Genres
-- =============================================
CREATE PROCEDURE [dbo].[GetGenres]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID, Name FROM [dbo].[Genre]
		WHERE IsExpired = 0;
END

GO
/****** Object:  StoredProcedure [dbo].[GetMovie]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Get Movie information by ID
-- =============================================
CREATE PROCEDURE [dbo].[GetMovie]
	@id int
AS
	BEGIN
		SELECT ID, Title, [Year], GenreID FROM [dbo].[Movie]
		WHERE ID = @id
			AND IsExpired = 0;
	END


GO
/****** Object:  StoredProcedure [dbo].[GetMovies]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Get all Movie records that include the passed Actor
-- =============================================
CREATE PROCEDURE [dbo].[GetMovies]
	@actorID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@actorID > 0) 
	BEGIN
		SELECT m.ID, m.Title, m.[Year], m.GenreID as 'GenreID' FROM [dbo].[Movie] m
			JOIN [dbo].[Movie_Actor] ma ON ma.ActorID = @actorID AND m.ID = ma.MovieID
		WHERE m.IsExpired = 0
			AND ma.IsExpired = 0
	END
	ELSE
	BEGIN
		SELECT ID, Title, [Year], GenreID FROM [dbo].[Movie]
			WHERE IsExpired = 0;
	END
END


GO
/****** Object:  StoredProcedure [dbo].[GetStatistics]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Get an array of statistics
-- =============================================
CREATE PROCEDURE [dbo].[GetStatistics]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Actors Per Genre
	SELECT g.Name as 'Genre', Count(DISTINCT a.ID) as '# Actors' FROM [dbo].[Genre] g
		JOIN [dbo].[Movie] m ON m.GenreID = g.ID
		JOIN [dbo].[Movie_Actor] ma ON ma.MovieID = m.ID
		JOIN [dbo].[Actor] a ON ma.ActorID = a.ID
	WHERE g.IsExpired = 0
		AND m.IsExpired = 0
		AND ma.IsExpired = 0
		AND a.IsExpired = 0
	GROUP BY g.Name;

	-- Actors Per Movie
	SELECT m.Title, Count(DISTINCT a.ID) as '# Actors' FROM [dbo].[Movie] m
		JOIN [dbo].[Movie_Actor] ma ON m.ID = ma.MovieID
		JOIN [dbo].[Actor] a ON a.ID = ma.ActorID
	WHERE m.IsExpired = 0
		AND ma.IsExpired = 0
		AND a.IsExpired = 0
	GROUP BY m.Title;

	-- Movies Per Actor
	SELECT Concat(a.FirstName, ' ', a.LastName) as 'Actor', Count(DISTINCT m.ID) as '# Movies' FROM [dbo].[Movie] m
		JOIN [dbo].[Movie_Actor] ma ON m.ID = ma.MovieID
		JOIN [dbo].[Actor] a ON a.ID = ma.ActorID
	WHERE m.IsExpired = 0
		AND ma.IsExpired = 0
		AND a.IsExpired = 0
	GROUP BY a.LastName, a.FirstName;

	-- Number of Actors
	SELECT Count(*) as '# Actors' FROM [dbo].[Actor] a
	WHERE a.IsExpired = 0

	-- Number of Movies
	SELECT Count(*) as '# Movies' FROM [dbo].[Movie] m
	WHERE m.IsExpired = 0

	-- Genres Entered
	SELECT Name as 'Genre' from [dbo].[Genre] g
	WHERE g.IsExpired = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SubmitActor]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Add or Update an Actor record
-- =============================================
CREATE PROCEDURE [dbo].[SubmitActor]
	@id int = 0,
	@firstName varchar(50),
	@lastName varchar(50),
	@user varchar(50)
AS
	BEGIN
		DECLARE @output TABLE (
			ID int,
			FirstName varchar(50),
			LastName varchar(50)
		)
		IF @id = 0
		BEGIN
			INSERT INTO [dbo].[Actor] (FirstName, LastName, AddBy, AddDate) 
			OUTPUT inserted.ID, @firstName, @lastName
				INTO @output
			VALUES (@firstName, @lastName, @user, GETDATE())
		END
		ELSE
		BEGIN
			UPDATE [dbo].[Actor] 
			SET FirstName = @firstName, 
				LastName = @lastName,
				UpdateBy = @user,
				UpdateDate = GETDATE()
			WHERE ID = @id
		END

		SELECT ID, FirstName, LastName
		FROM @output;
	END

GO
/****** Object:  StoredProcedure [dbo].[SubmitGenre]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Add or Update a Genre record
-- =============================================
CREATE PROCEDURE [dbo].[SubmitGenre]
	@id int = 0,
	@name varchar(50),
	@user varchar(50)
AS
	BEGIN
		DECLARE @output TABLE (
			ID int,
			Name varchar(50)
		)
		IF @id = 0
		BEGIN
			INSERT INTO [dbo].[Genre] (Name, AddBy, AddDate) 
			OUTPUT inserted.ID, @name
				INTO @output
			VALUES (@name, @user, GETDATE())
		END
		ELSE
		BEGIN
			UPDATE [dbo].[Genre] 
			SET Name = @name, 
				UpdateBy = @user,
				UpdateDate = GETDATE()
			WHERE ID = @id
		END

		SELECT ID, Name
		FROM @output;
	END

GO
/****** Object:  StoredProcedure [dbo].[SubmitMovie]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubmitMovie]
	@id int = 0,
	@title varchar(200),
	@year smallint = 0,
	@genreID int,
	@user varchar(50)
AS
	BEGIN
		DECLARE @output TABLE (
			ID int,
			Title varchar(200),
			[Year] smallint,
			GenreId int
		)

		IF @id = 0
		BEGIN
			INSERT INTO [dbo].[Movie] (Title, [Year], GenreID, AddBy, AddDate) 
			OUTPUT inserted.ID, @title, @year, @genreID
				INTO @output
			VALUES (@title, @year, @genreID, @user, GETDATE())
		END
		ELSE
		BEGIN
			UPDATE [dbo].[Movie] 
			SET Title = @title, 
				[Year] = @year,
				GenreID = @genreID,
				UpdateBy = @user,
				UpdateDate = GETDATE()
			OUTPUT inserted.ID, @title, @year, @genreID
				INTO @output
			WHERE ID = @id
		END

		SELECT ID, Title, [Year], GenreID
		FROM @output;
	END

GO
/****** Object:  StoredProcedure [dbo].[SubmitMovie_Actor]    Script Date: 4/8/2016 7:53:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris Bowe
-- Create date: 4/7/2016
-- Description:	Associate an Actor to a Movie, or vice-versa
-- =============================================
CREATE PROCEDURE [dbo].[SubmitMovie_Actor]
	@movieID int,
	@actorID int,
	@user varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @exists bit = 0
	DECLARE @output TABLE (
		ID int,
		MovieID int,
		ActorID int
	)

	SELECT @exists = 1 FROM [dbo].[Movie_Actor]
	WHERE MovieID = @movieID
		and ActorID = @actorID
		AND IsExpired = 0;

	-- Insert a new record if a non-expired one does not exist
	IF @exists = 0
	BEGIN
		INSERT INTO [dbo].[Movie_Actor] (ActorID, MovieID, AddBy, AddDate)
		OUTPUT inserted.ID, @movieID, @actorID 
			INTO @output
		VALUES (@actorID, @movieID, @user, GETDATE());
	END

	SELECT ID, MovieID, ActorID FROM @output;
END


GO
USE [master]
GO
ALTER DATABASE [MovieDB] SET  READ_WRITE 
GO
