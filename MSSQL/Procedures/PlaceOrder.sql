USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[PlaceOrder]    Script Date: 26.05.2024 18:31:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PlaceOrder]
(   
    @BrukerId int,
    @ProduktId int,
    @Quantity int
)
AS
BEGIN
    DECLARE @NewOrderId int;
	--declare @ProduktId int;
	--set @ProduktId = 2;
	declare @TSQL as varchar(max);
	declare @memavablekvantitet as varchar(max)

	declare @memLagerkvantitet as table
	(
			lagerkvantitet int
	)
    declare @LagerKvantitet int;
  
	SELECT  @TSQL = 'SELECT * FROM OPENQUERY(MYSQL,''SELECT lagerkvantitet FROM mydb2.produkter WHERE id = ''''' + cast(@ProduktId as varchar) + ''''''')'
	insert into @memLagerkvantitet EXEC(@TSQL)
	set @LagerKvantitet = (select top 1 lagerkvantitet from @memLagerkvantitet);


    -- If sufficient quantity is available, proceed with the order
    IF @LagerKvantitet >= @Quantity
    BEGIN
	


update [MYSQL].[mydb2]..[produkter] 
set lagerkvantitet = lagerkvantitet - @Quantity
where id = @ProduktId



        -- Insert order into Ordre table in MSSQL
        INSERT INTO Ordre (BrukerId, ProduktId, Quantity)
        VALUES (@BrukerId, @ProduktId, @Quantity);

        -- Get the ID of the newly inserted order
        SET @NewOrderId = SCOPE_IDENTITY();

        -- Return the ID of the inserted order
        SELECT @NewOrderId;
    END
    ELSE
    BEGIN
        -- If quantity is not available, return a negative value indicating failure
        SELECT -1; -- Or handle the failure in another appropriate way
    END;
END;

/*






*/


		/*
        UPDATE OPENQUERY(MYSQL, '
            UPDATE mydb2.produkter 
            SET lagerkvantitet = lagerkvantitet - ? 
            WHERE id = ?')
        SET @AvailableQuantity = @AvailableQuantity - @Quantity;


		EXEC PlaceOrder @BrukerId = 1, @ProduktId = 2, @Quantity = 300
		

		select * from Ordre


		*/