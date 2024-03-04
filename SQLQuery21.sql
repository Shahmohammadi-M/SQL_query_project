select
    srvc_name,
	min_participants,
	per_person_price
From dbo.additional_service
where srvc_name not in (--conditions
                  'Gift Basket Delivery - Small',
                  'Gift Basket Delivery - Medium')


select
    srvc_name,
	min_participants,
	per_person_price
From dbo.additional_service
where srvc_name like 'Gift Basket Delivery%'


select
    srvc_name,
	min_participants,
	per_person_price
From dbo.additional_service
where srvc_name not like '%party%'

select
    srvc_name,
	min_participants,
	per_person_price
From dbo.additional_service
where per_person_price >= 125

select
    srvc_name,
	min_participants,
	per_person_price
From dbo.additional_service
where per_person_price<75





select top 3
    service_name=srvc_name,
	minimum= min_participants
From dbo.additional_service

select top 3
    srvc_name [s m], 
	min_participants[m p]
From dbo.additional_service

select
    srvc_name,
	min_participants,
	per_person_price
From dbo.additional_service
where min_participants<=6
and per_person_price<=25

select
    srvc_name,
	min_participants,
	per_person_price
From dbo.additional_service
where srvc_name like 'catering%'
or srvc_name like 'gift%'
or srvc_name ='Two Tree Tasing Party%'

select
    srvc_name,
	min_participants,
	per_person_price
From dbo.additional_service
where per_person_price<30
and 

(
srvc_name like 'Catering%'
or
srvc_name like 'gift%'
)


select p.product_id,
p.flavor_id,
f.flavor_name,
p.price,
pt.*
from dbo.product p
inner join oil_flavor f
 on p.flavor_id=f.flavor_id
inner join product_type pt
 on p.product_type_id= pt.product_type_id
where pt.product_type='Case'


select c.full_name,
po.order_total
from customer c
left outer join product_order po
on c.customer_id=po.customer_id
where first_name='Sydney'

select c.full_name,
po.order_total
from customer c
left outer join product_order po
on c.customer_id=po.customer_id
where po.order_total is Null


select full_name
from dbo.customer
where city_state_zip_id in (9,10)

select *
from dbo.city_state_zip
where city_name='Boston'

select full_name
from dbo.customer c
where city_state_zip_id in (select z.city_state_zip_id
from dbo.city_state_zip z
where city_name='Boston')

select c.full_name,
z.city_name
from customer c
inner join city_state_zip z
on c.city_state_zip_id=z.city_state_zip_id
where city_name='Boston'




declare @price_prefix as varchar(20)='$'
select f.flavor_name,
pt.product_type,
p.price,
cast_price=cast(p.price as int)
--convet_price=convert(decimal(6,3), p.price),
--dollar_sign=@price_prefix+cast(p.price as varchar(20))
--doller_sign=concat(@price_prefix,p.price)

from product p
inner join oil_flavor f
on p.flavor_id=f.flavor_id
inner join product_type pt
on p.product_type_id=pt.product_type_id


---format
select f.flavor_name,
pt.product_type,
p.price,
format_price=format(p.price,'c','en-GB')
from product p
inner join oil_flavor f
on p.flavor_id=f.flavor_id
inner join product_type pt
on p.product_type_id=pt.product_type_id



select 
c.full_name,
o.order_date
from dbo.product_order o
inner join dbo.customer c
on o.customer_id=c.customer_id
where o.order_date> dateadd(month,-1,getdate())