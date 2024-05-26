USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[AddToGroup]    Script Date: 26.05.2024 18:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
-- EXEC AddToGroup @Id = 1, @GrupeID = 7;

ALTER PROCEDURE [dbo].[AddToGroup] 
    @Id int,
    @GrupeNavn varchar(250)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the Group name exists
    IF EXISTS (SELECT 1 FROM [Grupe] WHERE GrupeNavn = @GrupeNavn)
    BEGIN
        -- Update the Bruker with the provided Group name
        UPDATE Bruker
        SET GrupeID = (SELECT Id FROM [Grupe] WHERE GrupeNavn = @GrupeNavn)
        WHERE Id = @Id;

        SELECT 'User assigned to group successfully.';
    END
    ELSE
    BEGIN
        SELECT 'Group does not exist.';
    END
END

