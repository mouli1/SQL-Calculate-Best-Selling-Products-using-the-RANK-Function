select * from all_products
select * from orders2
 
/*best selling product*/
select a.product_id,a.region,a.total_units,b.distributor_id,rank() 
over(order by a.total_units desc ), b.product_name from
(select product_id,region,sum(no_units) total_units,rank() 
over(order by sum(no_units) desc ) from orders2
where date between '2017-08-01' and '2017-12-31'
group by product_id,region order by total_units desc limit 5)a
inner join all_products b ON a.product_id=b.product_id

