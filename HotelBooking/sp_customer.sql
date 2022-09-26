create procedure sp_customer_select_all
as
begin
select ROW_NUMBER() over(order by CustID) as No,* from Customer order by CustID
end
go

create procedure sp_customer_select_by_email
@Email varchar(20)
as
begin
select ROW_NUMBER() over(order by CustID) as No,* from Customer where Email=@Email order by CustID
end
go

create procedure sp_customer_insert
@CustName varchar(50),
@Address varchar(100),
@Phone varchar(20),
@Email varchar(20),
@Password varchar(20)
as
begin
insert into Customer(CustName,Address,Phone,Email,Password) values(@CustName,@Address,@Phone,@Email,@Password)
end
go

create procedure sp_customer_select_for_login
@Email varchar(20),
@Password varchar(20)
as
begin
select ROW_NUMBER() over(order by CustID) as No,* from Customer where Email=@Email and Password=@Password order by CustID
end
go

create procedure sp_customer_select_by_CustID
@CustID int
as
begin
select ROW_NUMBER() over(order by CustID) as No,* from Customer where CustID=@CustID order by CustID
end
go

create procedure sp_customer_select_by_CustName
@CustName varchar(50)
as
begin
select ROW_NUMBER() over(order by CustID) as No,* from Customer where CustName=@CustName order by CustID
end
go