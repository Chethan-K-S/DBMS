select * from car_093 order by year asc; 

select model, count(model) from participated_093 car_093 where 
participated_093.reg_no = car_093.reg_no group by model; 

select participated_18.driver_id as driver_id from accident_093, participated_093 where 
accident_093.report_no = participated_093.report_no and participated_093.damage_amt >= 25000; 

