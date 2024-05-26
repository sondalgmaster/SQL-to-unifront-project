USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[Bruker_Update]    Script Date: 26.05.2024 18:30:05 ******/
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

select * from Bruker
 */
ALTER PROCEDURE [dbo].[Bruker_Update]
    @Id int,
    @Navn varchar(250),
    @Etternavn varchar(250),
    @Brukenavn varchar(50),
    @Admin bit,
    @Passord varchar(max),
    @Email varchar(250),
    @StilingId int,
    @TilgangsID int
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Update statement for procedure here
    UPDATE Bruker 
    SET Navn = @Navn,
        Etternavn = @Etternavn,
        Brukenavn = @Brukenavn,
        [Admin] = @Admin,
        Passord = @Passord,
        Email = @Email,
        StilingId = @StilingId,
        TilgangsID = @TilgangsID
    WHERE Id = @Id;
END
