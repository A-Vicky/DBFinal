Declare @i int
Set @i = 1

While @i < 101
Begin
	Insert Into family values ('09010'+ CAST(ABS(CHECKSUM(newid()) %100000)+1 as varchar),'09010'+ CAST(ABS(CHECKSUM(newid()) %100000)+1 as varchar),'09010'+ CAST(ABS(CHECKSUM(newid()) %100000)+1 as varchar))
	Set @i = @i + 1
End