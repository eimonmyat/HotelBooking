create procedure sp_BookingDetail_select_all
as
begin
select * from BookingDetail
end
go

create procedure sp_BookingDetail_insert
@BookingID int,
@RoomID int,
@StartDate date,
@EndDate date
as
begin
insert into BookingDetail(BookingID,RoomID,StartDate,EndDate) values(@BookingID,@RoomID,@StartDate,@EndDate)
end
go


create procedure sp_BookingDetail_select_by_SDED
@StartDate date,
@EndDate date
as 
begin
select Row_Number()Over(Order By RoomNumber) As No,vi_Room.* from vi_Room 
left join (select * from BookingDetail where BookingDetail.StartDate<=@EndDate and 
BookingDetail.EndDate>=@StartDate)as b on (vi_Room.RoomID=b.RoomID) 
where b.RoomID IS NULL
end
go


create procedure sp_BookingDetail_select_by_SDEDRoomType
@StartDate date,
@EndDate date,
@RoomTypeName varchar(50)
as 
begin
select Row_Number()Over(Order By RoomNumber) As No,a.* from (select * from vi_Room where RoomTypeName=@RoomTypeName) as a
left join (select * from BookingDetail where BookingDetail.StartDate<=@EndDate and 
BookingDetail.EndDate>=@StartDate)as b on (a.RoomID=b.RoomID) 
where b.RoomID IS NULL
end
go

create procedure sp_BookingDetail_select_by_SDEDPrice
@StartDate date,
@EndDate date,
@Price int
as 
begin
select Row_Number()Over(Order By RoomNumber) As No,a.* from (select * from vi_Room where Price=@Price) as a
left join (select * from BookingDetail where BookingDetail.StartDate<=@EndDate and 
BookingDetail.EndDate>=@StartDate)as b on (a.RoomID=b.RoomID) 
where b.RoomID IS NULL
end
go