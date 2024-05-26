USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[Grupe_Get]    Script Date: 26.05.2024 18:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- select * from Bruker_Get (NULL)
-- select * from Stiling_Get (NULL)
-- select * from [TilgangsNavn_Get] (NULL)
ALTER FUNCTION [dbo].[Grupe_Get] 
(	
    @GrupeNavn varchar(250)
)
RETURNS @Tableresult TABLE 
(
    ID int,
    GrupeNavn varchar(250),
    GrupeBeskrivelse text
)
AS
BEGIN
    INSERT INTO @Tableresult
    SELECT 
        ID,
        GrupeNavn,
        GrupeBeskrivelse
    FROM 
        Grupe
    WHERE 
        GrupeNavn LIKE '%' + ISNULL(@GrupeNavn, '') + '%';

    RETURN;
END


