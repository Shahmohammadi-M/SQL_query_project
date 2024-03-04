select distinct
c.full_name,
spending_tier=Case
when po.order_total<20
then 'low'
when po.order_total between 20 and 100
then 'medium'
when po.order_total>100
then 'high'
else'no'
end

from customer c
left join product_order po
on c.customer_id=po.customer_id
and po.order_date>'8/1/2020'
where city_state_zip_id in(select city_state_zip_id from city_state_zip z 
where z.state_name='california' ) 
order by c.full_name desc


select getdate(), SYSDATETIME()

select dateadd(year,-1,sysdatetime())




select 
c.full_name,
o.order_date
from dbo.product_order o
inner join dbo.customer c
    on o.customer_id=c.customer_id
where o.order_date> dateadd(Month,-1,SYSDATETIME())



declare @override int=500

select srvc_name, min_participants,isnull_participants=ISNULL (min_participants,0),
coalesce_participants=coalesce(min_participants,@override,0),
coalesce_participants=coalesce(min_participants,@override,'n/a')
from additional_service



select COUNT(*)
from customer c 
inner join product_order po
on c.customer_id=po.customer_id

select COUNT(*)as number_of_orders , c.full_name
from customer c 

inner join product_order po
on c.customer_id=po.customer_id
group by c.full_name


select sum(po.order_total), c.full_name
from customer c 

inner join product_order po
on c.customer_id=po.customer_id
group by c.full_name


select sum(po.order_total), c.full_name
from customer c
inner join product_order po
on c.customer_id=po.customer_id
group by c.full_name


select c.full_name,
yr=Year(po.order_date),
highest_order_total=MAX(po.order_total)
from customer c
inner join product_order po
on c.customer_id=po.customer_id
group by c.full_name,Year(po.order_date)



select c.full_name,
yr=Year(po.order_date),
order_total=po.order_total
from customer c
inner join product_order po
on c.customer_id=po.customer_id
group by c.full_name,Year(po.order_date)


select  c.full_name,
order_count=count(*)
from customer c
inner join product_order po
on c.customer_id=po.customer_id
group by c.full_name
order by c.full_name,count(*)


select  customer_name=c.full_name,
order_count=count(*)
from customer c
inner join product_order po
on c.customer_id=po.customer_id
group by c.full_name
order by order_count,customer_name


select  customer_name=c.full_name,
order_count=sum(po.order_total)
from customer c
inner join product_order po
on c.customer_id=po.customer_id
group by c.full_name
having sum(po.order_total)>500
