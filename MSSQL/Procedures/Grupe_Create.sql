USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[Grupe_Create]    Script Date: 26.05.2024 18:31:13 ******/
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

EXEC Grupe_Create
    @GrupeNavn = 'Nannestad VGS',
    @GrupeBeskrivelse = 'beskrivelse';

*/
ALTER PROCEDURE [dbo].[Grupe_Create]
    @GrupeNavn varchar(250),
    @GrupeBeskrivelse varchar(max) -- Change data type to varchar(max)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Check if both parameters are not null and not empty strings
    IF @GrupeNavn IS NOT NULL AND @GrupeNavn <> ''
    BEGIN
        -- Insert statement for procedure here
        INSERT INTO Grupe (GrupeNavn, GrupeBeskrivelse)
        VALUES (@GrupeNavn, @GrupeBeskrivelse);
    END
    ELSE
    BEGIN
        -- Optionally, you can raise an error or handle the case differently
        PRINT 'Both @GrupeNavn must be provided with valid values.';
    END
END
