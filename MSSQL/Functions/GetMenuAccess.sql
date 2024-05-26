USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMenuAccess]    Script Date: 26.05.2024 18:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[GetMenuAccess] 
(	
	@UserId int
)
RETURNS @tableresult TABLE 
(
	User_Visibility int
	, Tilgang_Visibility int
	, Stilling_Visibility int
	, Grupe_Visibility int
	, GrupeAdmnin_Visibility int
	, KnappAdmin_Visibility int
	, Produkt_Visibility int
	, Bestil_Visibility int
	, Ordre_Visibility int
	, OrdreAdmin_Visibility int

)
AS
BEGIN
 insert into @tableresult values
 (
	dbo.BrukerGrupeSjekk(@UserId, 1),
	dbo.BrukerGrupeSjekk(@UserId, 2),
	dbo.BrukerGrupeSjekk(@UserId, 3),
	dbo.BrukerGrupeSjekk(@UserId, 4),
	dbo.BrukerGrupeSjekk(@UserId, 6),
	dbo.BrukerGrupeSjekk(@UserId, 7),
	dbo.BrukerGrupeSjekk(@UserId, 5),
	dbo.BrukerGrupeSjekk(@UserId, 8),
	dbo.BrukerGrupeSjekk(@UserId, 9),
	dbo.BrukerGrupeSjekk(@UserId, 10)
)

	RETURN
END
