Declare @i int
Set @i = 1

While @i < 15001
Begin
	Insert Into Crime values(DATEADD(DAY,ABS(CHECKSUM(newid())%6000),1998-01-01),DATEADD(DAY,ABS(CHECKSUM(newid())%6000),1999-01-01),
	CAST(ABS(CHECKSUM(newid()) %100)+1 as varchar) +' weeks',ABS(CHECKSUM(newid()) %100000)+1,'09010'+ CAST(ABS(CHECKSUM(newid()) %100000)+1 as varchar),
	ABS(CHECKSUM(newid()) %5)+1 ,ABS(CHECKSUM(newid()) %72)+1,ABS(CHECKSUM(newid()) %4)+1);
	Set @i = @i + 1
End