create procedure sp_admin_select_all
as
begin
select ROW_NUMBER() over(order by AdminName) as No,* from Admin order by AdminName
end
go

create procedure sp_admin_select_by_AdminNamePassword
@AdminName nvarchar(50),
@Password nvarchar(50)
as
begin
select ROW_NUMBER() over(order by AdminName) as No,* from Admin where AdminName=@AdminName and Password=@Password order by AdminName
end
go

create procedure sp_admin_insert
@AdminName nvarchar(50),
@Password nvarchar(50)
as
begin
insert into Admin(AdminName,Password) values(@AdminName,@Password)
end
go

create procedure sp_admin_update
@AdminID int,
@AdminName nvarchar(50),
@Password nvarchar(50)
as
begin
update Admin set AdminName=@AdminName,Password=@Password where AdminID=@AdminID
end
go

create procedure sp_admin_Delete
@AdminID int
as
begin
delete from Admin where AdminID=@AdminID
end
go

create procedure sp_admin_select_by_SearchAdminName
@AdminName varchar(100)
as
begin
select ROW_NUMBER()over(order by AdminName) as No,* from Admin where AdminName like @AdminName+'%' order by AdminName
end
go