USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[Tilgang_Create]    Script Date: 26.05.2024 18:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
/*
select * from Stiling

EXEC Stiling_Update
	@id = 1,
	@Stilingsnavn = 'Skolegut',
	@Stilingsbeskrivelse = 'ok'

EXEC Stiling_Create
	@Stilingsnavn = 'Admin',
	@Stilingsbeskrivelse = 'okk'


EXEC Stiling_Delete
	@id = 3
*/


ALTER PROCEDURE [dbo].[Tilgang_Create]
	@TilgangsNavn varchar(250)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Delete the row from the Stiling table where Id matches the @id parameter
    insert into Tilgang
	(TilgangsNavn)
	values
	(@TilgangsNavn)
END
