USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[Grupe_Update]    Script Date: 26.05.2024 18:31:27 ******/
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
select * from Grupe

EXEC Grupe_Delete
    @id = 2

*/
ALTER PROCEDURE [dbo].[Grupe_Update]
    @ID int,
	@GrupeNavn varchar(250),
	@GrupeBeskrivelse text
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statement for procedure here
    Update Grupe
	set	GrupeNavn = @GrupeNavn,
		GrupeBeskrivelse = @GrupeBeskrivelse
	where ID = @ID
	
END
