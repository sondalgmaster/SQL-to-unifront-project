USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[Bruker_Delete]    Script Date: 26.05.2024 18:24:17 ******/
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

 /*
 EXEC Bruker_Delete
	@id = 2
 */
ALTER PROCEDURE [dbo].[Bruker_Delete]
    @Id int
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Delete statement for procedure here
    DELETE FROM Bruker 
    WHERE Id = @Id;
END
