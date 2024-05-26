USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[TilgangsNavn_Get]    Script Date: 26.05.2024 18:38:42 ******/
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
ALTER FUNCTION [dbo].[TilgangsNavn_Get] 
(	
	@TilgangsNavn varchar(250)
)
RETURNS @Tableresult TABLE 
(
	id int
	, TilgangsNavn varchar(250)
)

AS
begin
	insert into @Tableresult
		select 
			t. Id  
			, TilgangsNavn
		from Tilgang as t
		where TilgangsNavn like '%'+isnull(@TilgangsNavn, '')+'%'
		return
end


