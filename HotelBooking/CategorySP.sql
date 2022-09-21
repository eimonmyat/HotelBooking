
create procedure sp_roomType_Select_All
as 
begin
select Row_Number()Over(Order By RoomTypeName) As No, * from RoomType Order By RoomTypeName
end
go


create procedure sp_roomType_Select_By_RoomTypeName
@RoomTypeName varchar(50)
as 
begin
select Row_Number()Over(Order By RoomTypeName) As No, * from RoomType where RoomTypeName=@RoomTypeName Order By RoomTypeName
end
go

create procedure sp_roomType_Insert
@RoomTypeName varchar(50)

as 
begin
insert into RoomType(RoomTypeName) values (@RoomTypeName)
end
go

create procedure sp_roomType_Update
@RoomTypeID int,
@RoomTypeName varchar(50)

as 
begin
update RoomType set RoomTypeName=@RoomTypeName where RoomTypeID=@RoomTypeID
end
go

create procedure sp_roomType_Delete
@RoomTypeID int
as 
begin
delete from RoomType where RoomTypeID=@RoomTypeID
end
go

create procedure sp_roomType_Select_By_Search_RoomTypeName
@RoomTypeName varchar(50)
as 
begin
select Row_Number()Over(Order By RoomTypeName) As No, * from RoomType where RoomTypeName Like @RoomTypeName+'%' Order By RoomTypeName
end
go










