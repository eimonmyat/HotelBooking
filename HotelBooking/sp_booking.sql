create procedure sp_booking_select_all
as
begin
select * from Booking
end
go

create procedure sp_booking_select_by_notistatus
@CustID int
as
begin
select * from Booking where CustID=@CustID and NotiStatus<>'-'
end
go

create procedure sp_booking_insert
@BookingDate date,
@CustID int,
@TotalAmount int,
@CheckStatus varchar(50)
as
begin
insert into Booking(BookingDate,CustID,TotalAmount,CheckStatus) values(@BookingDate,@CustID,@TotalAmount,@CheckStatus)
end
go