create procedure sp_room_select_by_RoomNumberRoomTypeName
@RoomNumber varchar(20),
@RoomTypeName varchar(50)
as 
begin
select Row_Number()Over(Order By RoomNumber) As No, * from vi_Room where 
RoomNumber=@RoomNumber and RoomTypeName=@RoomTypeName Order By RoomNumber
end
go

create procedure sp_room_Insert
@RoomNumber varchar(20),
@Price int,
@Capacity int,
@Description varchar(550),
@RoomTypeID int
as 
begin
insert into Room(RoomNumber,Price,Capacity,Description,RoomTypeID) 
values (@RoomNumber,
@Price,
@Capacity,
@Description,
@RoomTypeID)
end
go


create procedure sp_room_select_by_MaxRoomID

as 
begin
select Row_Number()Over(Order By RoomID DESC) As No, * from vi_Room Order By RoomID DESC
end
go

create procedure sp_room_Update
@RoomID int,
@RoomNumber varchar(20),
@Price int,
@Capacity int,
@Description varchar(550),
@RoomTypeID int,
@RoomImage varchar(550)

as 
begin
update Room set RoomNumber=@RoomNumber,Price=@Price,Capacity=@Capacity,
Description=@Description,RoomTypeID=@RoomTypeID,RoomImage=@RoomImage where RoomID=@RoomID
end
go


create procedure sp_room_Insert_Image
@RoomID int,
@RoomImage varchar(550)
as 
begin
update Room set RoomImage=@RoomImage where RoomID=@RoomID
end
go


create procedure sp_room_Delete
@RoomID int
as 
begin
delete from Room where RoomID=@RoomID
end
go

create procedure sp_room_Select_By_SearchRoomNumber
@RoomNumber varchar(20)
as 
begin
select Row_Number()Over(Order By RoomNumber) As No, * from vi_Room where RoomNumber Like @RoomNumber+'%' Order By RoomNumber
end
go


create procedure sp_room_Select_By_SearchRoomTypeName
@RoomTypeName varchar(50)
as 
begin
select Row_Number()Over(Order By RoomNumber) As No, * from vi_Room where RoomTypeName Like @RoomTypeName+'%' Order By RoomNumber
end
go


create procedure sp_room_Select_By_SearchPrice
@Price int
as 
begin
select Row_Number()Over(Order By RoomNumber) As No, * from vi_Room where Price Like @Price+'%' Order By RoomNumber
end
go

create procedure sp_room_Select_By_SearchCapacity
@Capacity int
as 
begin
select Row_Number()Over(Order By RoomNumber) As No, * from vi_Room where Capacity Like @Capacity+'%' Order By RoomNumber
end
go


create procedure sp_Room_Select_All
as 
begin
select Row_Number()Over(Order By RoomNumber) As No, * from vi_Room Order By RoomNumber
end
go

exec sp_Room_Select_All
GO

create procedure sp_Room_Select_By_RoomTypeID
@RoomTypeID int


as 
begin
select Row_Number()Over(Order By RoomNumber) As No, * from vi_Room where RoomTypeID=@RoomTypeID Order By RoomNumber
end
go


create procedure sp_room_select_by_StartDateEndDate
@StartDate date,
@EndDate date
as 
begin
select RoomID from BookingDetail where 
StartDate<=@EndDate and EndDate>=@StartDate group by RoomID
end
go


create procedure sp_Room_Select_By_RoomID
@RoomID int
as 
begin
select Row_Number()Over(Order By RoomNumber) As No, * from vi_Room where RoomID=@RoomID Order By RoomNumber
end
go


