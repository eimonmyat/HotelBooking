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