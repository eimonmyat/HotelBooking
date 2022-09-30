create procedure sp_admin_booking_select_all
as
begin
select ROW_NUMBER() over(order by BookingID) as No,* from vi_Admin_Booking order by BookingID
end
go

create procedure sp_admin_booking_select_by_Check
as
begin
select ROW_NUMBER() over(order by BookingID) as No,* from vi_Admin_Booking 
where CheckStatus<>'Check' order by BookingID
end
go

create procedure sp_admin_booking_update
@BookingID int,
@CheckStatus varchar(50)
as
begin
update Booking set CheckStatus=@CheckStatus where BookingID=@BookingID
end
go

create procedure sp_admin_booking_select_by_NotiStatus
@CustID int
as
begin
select ROW_NUMBER() over(order by BookingID) as No,* from vi_Admin_Booking 
where CustID=@CustID and NotiStatus<>'-' order by BookingID
end
go


create procedure sp_booking_NotiStatus_Update
@BookingID int,
@NotiStatus varchar(5)
as
begin
update Booking set NotiStatus=@NotiStatus where BookingID=@BookingID
end
go


create procedure sp_booking_notistatus_update
@BookingID int,
@NotiStatus varchar(5)
as
begin
update Booking set NotiStatus=@NotiStatus where BookingID=@BookingID
end
go