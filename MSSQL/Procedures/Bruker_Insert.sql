USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[Bruker_Insert]    Script Date: 26.05.2024 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
/* EXEC Bruker_Insert 
    @Navn = 'John',
    @Etternavn = 'Doe',
    @Brukenavn = 'johndoe',
    @Admin = 0,
    @Passord = 'password123',
    @Email = 'john@example.com',
    @StilingId = 1,
    @TilgangsID = 1;
 */

ALTER PROCEDURE [dbo].[Bruker_Insert]
	 @Navn varchar(250)
	, @Etternavn varchar(250)
	, @Brukenavn varchar(250)
	, @Admin bit
	, @Passord varchar(250)
	, @Email varchar (250)
	, @StilingId int
	, @TilgangsID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Bruker 
	(

		Navn
		, Etternavn
		, Brukenavn
		, [Admin]
		, Passord
		, Email
		, StilingId
		, TilgangsID
	)values
	(

		@Navn
		, @Etternavn
		, @Brukenavn
		, @Admin
		, @Passord
		, @Email
		, @StilingId
		,@TilgangsID
	)
END
