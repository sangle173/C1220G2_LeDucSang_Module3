use classicmodels;

delimiter //
create procedure find_all_customer()
begin
	select * from customers;
end // 
delimiter ;

delimiter //

drop procedure if exists `find_all_customer`//

create procedure find_all_customer()

begin

   select *  from customers where customerNumber = 175;

end; //

delimiter ;

call find_all_customer();