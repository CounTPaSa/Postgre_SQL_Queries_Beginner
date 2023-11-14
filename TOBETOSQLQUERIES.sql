--26. Stokta bulunmayan ürünlerin ürün listesiyle birlikte tedarikçilerin ismi ve iletişim numarasını (`ProductID`, `ProductName`, `CompanyName`, `Phone`) almak için bir sorgu yazın.
select p.product_id as "id", product_name as "units out of stock", s.contact_name
as "shipper", s.phone as "phone" from products p
inner join suppliers s on p.supplier_id = s.supplier_id
where units_in_stock = 0 order by product_id;

--27. 1998 yılı mart ayındaki siparişlerimin adresi, siparişi alan çalışanın adı, çalışanın soyadı
select o.ship_address, e.first_name || ' ' || e.last_name as EmployeeNAME from orders o
inner join employees e on e.employee_id = o.employee_id
where o.order_date <'1998-04-01' and order_date > '1998-02-28'
order by o.ship_address;

--28. 1997 yılı şubat ayında kaç siparişim var?
select count(*) as feborders from orders where order_date <'1997-03-01' and order_date > '1997-01-31';

--29. London şehrinden 1998 yılında kaç siparişim var?
select count(*) as LOrders from orders where order_date >'1997-12-31'
and order_date <'1999-01-01' and ship_city = 'London';

--30. 1997 yılında sipariş veren müşterilerimin contactname ve telefon numarası
select c.contact_name, c.phone, o.order_date from customers c
inner join orders o on c.customer_id = o.customer_id
where order_date >'1996-12-31' and order_date <'1998-01-01'
order by contact_name;

--31 Taşıma ücreti 40 üzeri olan siparişlerim
select ship_name, freight from orders where freight > 40 order by freight desc;

--32. Taşıma ücreti 40 ve üzeri olan siparişlerimin şehri, müşterisinin adı
select o.ship_city, c.contact_name, freight from orders o inner join customers c
on c.customer_id = o.customer_id
where freight > 40 order by freight desc;

--33. 1997 yılında verilen siparişlerin tarihi, şehri, çalışan adı -soyadı ( ad soyad birleşik olacak ve büyük harf),
select upper(e.first_name || ' ' || e.last_name) as Employee_Name, o.ship_city,o.order_date from orders o
inner join employees e on o.employee_id = e.employee_id
where o.order_date >'1996-12-31' and order_date <'1998-01-01';

--34. 1997 yılında sipariş veren müşterilerin contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )
select c.contact_name,
replace(replace(replace(replace(replace(c.phone, ' ', ''), '(', ''), ')', ''), '-', ''), '+', '') AS phone_number 
from orders o
join customers c on o.customer_id = c.customer_id
where o.order_date between '1997-01-01' and '1997-12-31';

--35. Sipariş tarihi, müşteri contact name, çalışan ad, çalışan soyad
select o.order_date,c.contact_name,e.first_name,e.last_name from orders o 
join customers c on o.customer_id = c.customer_id
join employees e on o.employee_id = e.employee_id;

--36. Geciken siparişlerim?
select order_id from orders where required_date < shipped_date;

--37. Geciken siparişlerimin tarihi, müşterisinin adı
select o.order_id, o.order_date, c.company_name from orders o
join customers c on o.customer_id = c.customer_id
where required_date < shipped_date;

--38. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
select p.product_name, c.category_name from orders o
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
join categories c on p.category_id = c.category_id
where o.order_id = 10248;

--39. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
select o.order_id, p.product_name, s.company_name from orders o
join order_Details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
join suppliers s on p.supplier_id = s.supplier_id
where o.order_id = 10248;

--40. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
select p.product_name, od.quantity from employees e
join orders o on  e.employee_id = o.employee_id
join order_Details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where e.employee_id = 3 and o.order_date between '1997-01-01' and '1997-12-31' ;

--41. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
select e.employee_id, first_Name || ' ' || last_Name  as full_name, sum(od.unit_price * od.quantity) as toplam_fiyat from employees e
join orders o on e.employee_id = o.employee_id
join order_Details od on o.order_id = od.order_id
where o.order_date between '1997-01-01' and '1997-12-31'
group by e.employee_id
order by sum(od.unit_price * od.quantity) desc limit 1;

--42. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
select e.employee_id, first_Name || ' ' || last_Name  as full_name, sum(od.unit_price * od.quantity) as toplam_fiyat from employees e
join orders o on e.employee_id = o.employee_id
join order_Details od on o.order_id = od.order_id
group by e.employee_id
order by sum(od.unit_price * od.quantity)  desc limit 1;

--43. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
select p.product_name, od.unit_price, c.category_name from orders o
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
join categories c on p.category_id = c.category_id
order by od.unit_price desc limit 1;
--44. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
select first_name || ' ' || last_name, o.order_date, o.order_id from employees e
join orders o on e.employee_id = o.employee_id
order by o.order_date;

--45. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
select avg(od.unit_price), o.order_id, o.order_date from orders o
join order_details od on o.order_id = od.order_id
group by o.order_id
order by o.order_date desc limit 5;

--46. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
select p.product_name, c.category_name, sum(od.quantity) as sum from orders o
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
join categories c on p.category_id = c.category_id
Where extract(month from o.order_date) = 01
group by p.product_name, c.category_name
order by sum desc;

--48. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
select p.product_name, c.category_name, s.supplier_id,od.quantity from orders o
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
join categories c on p.category_id = c.category_id
join suppliers s on p.supplier_id = s.supplier_id 
where od.quantity = (select max(quantity) from order_details) limit 1;

--49. Kaç ülkeden müşterim var
select count(distinct ship_country) as countries from orders;

--50. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?
select sum(od.unit_price * od.quantity) as sum from employees e
join orders o on e.employee_id = o.employee_id
join order_details od on o.order_id = od.order_id
where e.employee_id=3 and o.order_date >='1998-01-01';

--51. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
select p.product_name, c.category_name, od.quantity from orders o
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
join categories c on p.category_id = c.category_id
where o.order_id = 10248;

--52. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
select p.product_id, s.company_name from orders o
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
join suppliers s on p.supplier_id = s.supplier_id
where o.order_id = 10248;

--53. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
select p.product_name, od.quantity from employees e
join orders o on e.employee_id = o.employee_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where e.employee_id = 3 and o.order_date between '1997-01-01' and '1997-12-31'
group by p.product_name, od.quantity;

--54. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
select e.employee_id, first_Name || ' ' || last_Name as FULLNAME,
sum(od.unit_price * od.quantity) as SUM from employees e
join orders o on e.employee_id = o.employee_id
join order_Details od on o.order_id = od.order_id
where o.order_date between '1997-01-01' and '1997-12-31'
group by e.employee_id, o.order_id
order by sum(od.unit_price * od.quantity) desc limit 1;

--55. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
select e.employee_id, first_Name || ' ' || last_Name  as FULLNAME,
sum(od.unit_price * od.quantity) as SUM from employees e
join orders o on e.employee_id = o.employee_id
join order_Details od on o.order_id = od.order_id
group by e.employee_id
order by sum(od.unit_price * od.quantity)  desc limit 1;

--56. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
select p.product_name, od.unit_price, c.category_name from orders o
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
join categories c on p.category_id = c.category_id
order by od.unit_price desc limit 1;

--57. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
select first_Name || ' ' || last_Name as FULLNAM, o.order_date, o.order_id from employees e
join orders o on e.employee_id = o.employee_id
order by o.order_date;

--58. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
select o.order_id, avg(od.unit_price) as average, o.order_date from orders o
join order_details od on o.order_id = od.order_id
group by o.order_id
order by o.order_date desc limit 5;

--59. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
select p.product_name, c.category_name, sum(od.quantity) as toplam_satis from orders o
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
join categories c on p.category_id = c.category_id
Where extract(month from o.order_date) = 01
group by p.product_name, c.category_name
order by toplam_satis desc;

--60. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
with avg as (select avg(od.quantity) as avg_sales from order_details od)
select od.order_id, p.product_name,od.quantity from order_details od
join products p on od.product_id = p.product_id
cross join avg a
where a.avg_sales<od.quantity
order by od.quantity;

--61. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
select p.product_name, c.category_name, s.supplier_id,od.quantity from orders o
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
join categories c on p.category_id = c.category_id
join suppliers s on p.supplier_id = s.supplier_id 
where od.quantity = (select max(quantity) from order_details);

--62. Kaç ülkeden müşterim var
select count( distinct ship_country) as ALLCNTRIES from orders;

--63. Hangi ülkeden kaç müşterimiz var
select country, count(customer_id) as SUMCUSTOMER from customers
group by country;

--64. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?
select sum(od.unit_price * od.quantity) as SUMM from employees e
join orders o on e.employee_id = o.employee_id
join order_details od on o.order_id = od.order_id
where e.employee_id=3 and o.order_date >='1998-01-01';

--65. 10 numaralı ID ye sahip ürünümden son 3 ayda ne kadarlık ciro sağladım?
select sum(od.quantity*od.unit_price) as SUMM from orders o
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where p.product_id = 10  and o.order_date >= '1998-02-06';

--66. Hangi çalışan şimdiye kadar toplam kaç sipariş almış..?
select first_Name || ' ' || last_Name  as FULLNAME, count (o.order_id) as toplam_siparis from employees e
left join orders o on e.employee_id = o.employee_id
group by e.first_Name, e.last_Name
order by FULLNAME desc;

--67. 91 müşterim var. Sadece 89’u sipariş vermiş. Sipariş vermeyen 2 kişiyi bulun
select c.company_name from customers c
left join orders o on c.customer_id = o.customer_id
where o.customer_id is null;

--68. Brazil’de bulunan müşterilerin Şirket Adı, TemsilciAdi, Adres, Şehir, Ülke bilgileri
select company_name, contact_name, address, city, country from customers
where country = 'Brazil';

--69. Brezilya’da olmayan müşteriler
select company_name, country from customers
where country != 'Brazil'
order by country;

--70. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
select company_name, country from customers
where country in ('Spain', 'France', 'Germany')
order by country;

--71. Faks numarasını bilmediğim müşteriler
select company_name from customers
where fax is null;

--72. Londra’da ya da Paris’de bulunan müşterilerim
select company_name, city from customers
where city in ('London', 'Paris')
order by city;

--73. Hem Mexico D.F’da ikamet eden HEM DE ContactTitle bilgisi ‘owner’ olan müşteriler
select company_name, city, contact_title from customers
where city = 'México D.F.' and contact_title= 'Owner';

--74. C ile başlayan ürünlerimin isimleri ve fiyatları
select product_name, unit_price from products
where product_name like 'C%';

--75. Adı (FirstName) ‘A’ harfiyle başlayan çalışanların (Employees); Ad, Soyad ve Doğum Tarihleri
select first_name, last_name, birth_date from employees
where first_name like 'A%'
order by first_name;

--76. İsminde ‘RESTAURANT’ geçen müşterilerimin şirket adları
select company_name from customers
where lower(company_name) like '%restaurant%';

--77. 50$ ile 100$ arasında bulunan tüm ürünlerin adları ve fiyatları
select product_name, unit_price from products
where unit_price between 50 and 100
order by unit_price;

--78. 1 temmuz 1996 ile 31 Aralık 1996 tarihleri arasındaki siparişlerin (Orders), SiparişID (OrderID) ve SiparişTarihi (OrderDate) bilgileri
select order_id, order_date from orders
where order_date between '1996-07-01' AND '1996-12-31';

--79. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
select customer_id, country from customers
where country = 'Spain' or country ='France' or country ='Germany';

--80. Faks numarasını bilmediğim müşteriler
select customer_id from customers
where fax is null;

--81. Müşterilerimi ülkeye göre sıralıyorum:
select customer_id, country from customers
order by country;

--82. Ürünlerimi en pahalıdan en ucuza doğru sıralama, sonuç olarak ürün adı ve fiyatını istiyoruz
select product_name, unit_price from products
order by unit_price desc;

--83. Ürünlerimi en pahalıdan en ucuza doğru sıralasın, ama stoklarını küçükten-büyüğe doğru göstersin sonuç olarak ürün adı ve fiyatını istiyoruz
select product_name, unit_price, units_in_stock from products
order by unit_price desc, units_in_stock asc;

--84. 1 Numaralı kategoride kaç ürün vardır..?
select count(product_id) from products
where category_id = '1';

--85. Kaç farklı ülkeye ihracat yapıyorum..?
select COUNT(DISTINCT ship_country) as DISTCOUNTRY from orders;