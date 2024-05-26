USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[Bruker_Get]    Script Date: 26.05.2024 18:36:55 ******/
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
ALTER FUNCTION [dbo].[Bruker_Get] 
(	
	@Username varchar(250)
)
RETURNS @Tableresult TABLE 
(
	Id int
	, Navn varchar(250)
	, Etternavn varchar(250)
	, Brukenavn varchar(250)
	, [Admin] bit
	, Passord varchar(250)
	, Email varchar (250)
	, StilingId int
	, Stilingsnavn varchar(250)
	, Stilingsbeskrivelse varchar(250)
	, TilgangsNavn varchar(250)
	, GrupeID int
	, GrupeNavn varchar(250)
	, GrupeBeskrivelse text

)

AS
begin
	insert into @Tableresult
		select 
			b.Id 
			, Navn 
			, Etternavn 
			, Brukenavn 
			, [Admin] 
			, Passord 
			, Email 
			, StilingId 
			, Stilingsnavn
			, Stilingsbeskrivelse
			, TilgangsNavn
			, GrupeID
			, GrupeNavn
			, GrupeBeskrivelse
		from Bruker b
		left join Stiling s 
			on b.StilingId = s.Id
		left join Tilgang t 
			on b.TilgangsID = t.Id
		left join Grupe g
			on b.GrupeID = g.ID

		where Brukenavn like '%'+isnull(@Username, '')+'%'
		return
end


