USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[Stiling_Get]    Script Date: 26.05.2024 18:38:24 ******/
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
-- select * from Stiling_Get 
ALTER FUNCTION [dbo].[Stiling_Get] 
(	
	@Stilingsnavn varchar(250)
)
RETURNS @Tableresult TABLE 
(
	id int
	, Stilingsnavn varchar(250)
	, Stilingsbeskrivelse text
)

AS
begin
	insert into @Tableresult
		select 
			s. Id  
			, Stilingsnavn 
			, Stilingsbeskrivelse 
		from Stiling as s
		where Stilingsnavn like '%'+isnull(@Stilingsnavn, '')+'%'
		return
end


