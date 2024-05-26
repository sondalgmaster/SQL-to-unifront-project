USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[Stiling_Create]    Script Date: 26.05.2024 18:31:53 ******/
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
*/
ALTER PROCEDURE [dbo].[Stiling_Create]
    @Stilingsnavn varchar(250),
    @Stilingsbeskrivelse text
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statement for procedure here
    INSERT INTO Stiling 
	(
	Stilingsnavn, 
	Stilingsbeskrivelse
	)
    VALUES 
	(
	@Stilingsnavn,
	@Stilingsbeskrivelse);
END
