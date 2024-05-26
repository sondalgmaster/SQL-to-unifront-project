USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[CancelOrder]    Script Date: 26.05.2024 18:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CancelOrder](
    @OrderId int
)
    -- Add the parameters for the stored procedure here
    
AS
BEGIN
    -- Declare variables
    DECLARE @Quantity int;
    DECLARE @ProduktId int;

    -- Retrieve the quantity and ProduktId for the specified OrderId
    SELECT @Quantity = quantity, @ProduktId = ProduktId
    FROM Ordre 
    WHERE Id = @OrderId;

    -- Check if Quantity is not NULL
    IF @Quantity IS NOT NULL
    BEGIN
        -- Update the stock quantity in the MySQL table
        UPDATE [MYSQL].[mydb2]..[produkter] 
        SET lagerkvantitet = lagerkvantitet + @Quantity
        WHERE id = @ProduktId;
    END

    -- Delete the order from the Ordre table
    DELETE FROM Ordre 
    WHERE Id = @OrderId;
END
