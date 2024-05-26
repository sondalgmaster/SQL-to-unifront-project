USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[Grupe_Delete]    Script Date: 26.05.2024 18:31:21 ******/
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

EXEC Grupe_Create
    @GrupeNavn = 'Nannestad VGSs',
    @GrupeBeskrivelse = 'beskrivelsee';

*/
ALTER PROCEDURE [dbo].[Grupe_Delete]
    @ID int
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statement for procedure here
    Delete from Grupe where ID = @ID
END
