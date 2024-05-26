USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[Stilingsnavn_Update]    Script Date: 26.05.2024 18:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Stilingsnavn_Update]
    @Id int,
    @Stilingsnavn varchar(250),
    @Stilingsbeskrivelse text
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Update statement for procedure here
    UPDATE Stiling 
    SET Stilingsnavn = @Stilingsnavn,
        Stilingsbeskrivelse = @Stilingsbeskrivelse
    WHERE Id = @Id;
END
