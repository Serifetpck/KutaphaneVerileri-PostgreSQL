Create TABLE ogrenci
(
ogrno int primary key ,
ograd varchar(20),
ogrsoyad varchar (20),
cinsiyet varchar(6),
dtarih date,
sinif varchar(5),
puan int
);
insert into ogrenci values(10,'sena','akır','k','2011.05.01','10-B',90);
insert into ogrenci values(11,'sema','cakır','k','2012.05.01','10-A',70);
insert into ogrenci values(12,'emre','bakır','e','2011.05.02','10-D',60);
insert into ogrenci values(13,'serhat','takır','e','2011.05.01','10-B',40);
insert into ogrenci values(14,'sena','hakır','k','2014.05.01','10-B',100);
insert into ogrenci values(15,'ceren','fakır','k','2015.05.01','10-B',10);
insert into ogrenci values(16,'hamit','bakır','e','2016.05.02','10-C',50);
insert into ogrenci values(17,'sevgi','cakır','k','2011.06.01','5-B',90);
insert into ogrenci values(18,'sercan','kır','k','2011.09.01','5-H',90);
insert into ogrenci values(19,'ezgi','eren','k','2011.09.01','5-B',70);
insert into ogrenci values(20,'Tarik','yanki','e',NULL,'5-D',70);



Create table islem(
islemno int,
ogrno int,
kitapno int,
atarih date,
vtarih date,
constraint ogrno_fk foreign key(ogrno) references ogrenci(ogrno)
);
insert into islem values(56,10,123,'2011.05.01',null);
insert into islem values(78,12,125,'2012.05.01','2012.05.06');
insert into islem values(45,12,126,'2011.05.02','2011.05.15');
insert into islem values(47,13,155,'2011.05.01','2011.05.18');
insert into islem values(23,14,194,'2014.05.01','2011.05.23');
insert into islem VALUES(87,14,155,'2015.08.07','2015.09.06');
insert into islem VALUES(86,13,123,'2017.09.03','2017.09.20');

Create table kitap(
kitapno int primary key ,
isbnno int,
kitapadi varchar(50),
yazarno int,
turno int,
sayfasayisi int
		
);
insert into kitap values(123,22,'aşk',33,51,275);
insert into kitap values(125,25,'kalp',33,52,279);
insert into kitap values(126,26,'yokluk',31,53,325);
insert into kitap values(155,27,'varlık',32,54,556);
insert into kitap values(194,28,'mantık',30,54,102);
insert into kitap values(198,29,'mutlak',30,52,107);


alter table kitap
set puan int


Create table tur(
turno int primary key ,
turadı varchar(50)		
);
insert into tur values(51,'bilim kurgu');
insert into tur values(52,'fantastik');
insert into tur values(53,'distopya');
insert into tur values(54,'tarih');
insert into tur values(55,'kisisel gelisim');
Create table yazar(
yazarno int primary key,
yazarad varchar(50)	,
yazarsoyad varchar(50)	
);
insert into yazar values(30,'Ali','sazan');
insert into yazar values(31,'fatma','aliye');
insert into yazar values(32,'dilan','zaman');
insert into yazar values(33,'murat','hazır');
insert into yazar values(34,'doğan','cüceloğlu');

--1.Öğrenci tablosundaki öğrencinin adını ve soyadını ve sınıfını listeleyin.

select ograd,ogrsoyad,sinif from ogrenci

--2.Öğrenci tablosundaki cinsiyeti kız (K) olan kayıtları listeleyiniz.

select * from ogrenci where cinsiyet='k'

--3..Öğrenciler tablosundaki sınıfların adını her sınıf bir kez görülecek şekilde listeleyiniz.

SELECT distinct sinif from ogrenci 

select sinif from ogrenci GROUP by sinif

--4.Öğrenci tablosundaki cinsiyeti Kız ve Sınıfı 10A olan öğrencileri listeleyiniz.

select * from ogrenci where cinsiyet='k' and sinif='10-A'

select * from ogrenci where cinsiyet='k' 
INTERSECT
select* from ogrenci where sinif='10-A'

--5.Öğrenci tablosundaki 10A veya 10B sınıfındaki öğrencilerin adını, soyadını ve sınıfını listeleyiniz.

select ograd,ogrsoyad,sinif from ogrenci where sinif='10-B' or sinif='10-A'

select ograd, ogrsoyad, sinif from ogrenci where sinif='10-B' 
UNION ALL
select ograd, ogrsoyad, sinif from ogrenci where sinif='10-A'

--6.Öğrenci tablosundaki öğrencinin adını, soyadını ve numarasını okul numarası olarak listeleyiniz. (as kullanım örneği)

select concat(ograd,' ',ogrsoyad,' ',ogrno) as okul_numarasi from ogrenci;

select ograd, ogrsoyad, ogrno as okul_numarası from ogrenci

select ograd ||ogrsoyad || ogrno as "okulNo" from ogrenci


--7.Öğrenci tablosundaki öğrencinin adını ve soyadını birleştirip, adsoyad olarak listeleyiniz. (as kullanım örneği)

select ograd ||ogrsoyad  as "adsoyad" from ogrenci

--8.Öğrenci tablosundaki Adı ‘s’ harfi ile başlayan öğrencileri listeleyiniz.

select * from ogrenci WHERE ograd ilike 'S%'

--9.kitap tablosundaki sayfa sayısı 50 ile 200 arasında olan kitapların adını ve sayfa sayısını listeleyiniz.

select kitapadi,sayfasayisi from kitap where sayfasayisi>50 and sayfasayisi<200

SELECT  kitapadi,sayfasayisi from kitap where sayfasayisi between 50 and 200

--10. Öğrenci tablosunda adı sena, emre ve serhat olan öğrencileri listeleyiniz.

SELECT  * from ogrenci where ograd in('sena','emre','Serhat')

--12.Öğrenci tablosundaki öğrencilerden adı A, D ve K ile başlayan öğrencileri listeleyiniz.

select * from ogrenci where ograd like '[sch]%'

--13.Öğrenci tablosundaki sınıfı 9A olan Erkekleri veya sınıfı 9B olan kızların adını, soyadını, 
--sınıfını ve cinsiyetini listeleyiniz.

select ograd , ogrsoyad, sinif, cinsiyet from ogrenci where sinif='10-B' and cinsiyet='e'
UNION ALL
select ograd , ogrsoyad, sinif, cinsiyet from ogrenci where sinif='5-B' and cinsiyet='k'


select ograd,ogrsoyad,sinif,cinsiyet from ogrenci
where (sinif='10-B' and cinsiyet='e') or (sinif='5-B' and cinsiyet='k')

--14. Sınıfı 10A veya 10B olan erkekleri listeleyiniz.


select * from ogrenci
where (sinif='10-B' and cinsiyet='e') or (sinif='10-C' and cinsiyet='e')



select *
from ogrenci
where sinif in('10-B','10-C') and cinsiyet='e';

--15.Öğrenci tablosunda doğum yılı 1989 olan öğrencileri listeleyiniz.
--Öğrenci tablosunda doğum yılı 1989 olan öğrencileri listeleyiniz.

 
select * from ogrenci
where dtarih between '2011.01.01' and '2011.12.31'


--16.Öğrenci numarası 30 ile 50 arasında olan Kız öğrencileri listeleyiniz.

select * from ogrenci
where (ogrno between 10 and 15) and cinsiyet='k'

--17.Mayıs ayında okunmayan kitapları listeleyin.

select kitapadi from kitap 
where kitapno in(select kitapno from islem where  atarih  not in (MONTH FROM atarih)=05)

select * from kitap where kitap.kitapno not in (select DISTINCT islem.kitapno from islem where extract( MONTH from atarih)=05)

--extract tarihteki ay yıl ve günü ayıklamaya yarar
select aylar as extract (MONTH from atarih) from islem 

--18 Kitap alan öğrencinin adı, soyadı, kitap aldığı tarih listelensin. Kitap almayan öğrencilerinde listede görünsün.

select ograd, ogrsoyad, atarih
from ogrenci
left join islem
on ogrenci.ogrno=islem.ogrno

--19 10A veya 10B sınıfındaki öğrencilerin adı soyadı ve okuduğu kitap sayısını getirin.

select sinif, ograd,ogrsoyad,count(islemno) from ogrenci
left join islem on islem.ogrno=ogrenci.ogrno
where sinif in ('10-A','10-B')
group by sinif,ograd,ogrsoyad
order by count(*)

--20.kaç sınıf var
select  count (distinct sinif) as top from ogrenci


--21.Adı e harfi ile başlayan yazarların kitapları

select kitapadi from kitap where yazarno in (select yazarno from yazar where yazarad ilike 'a%')


--22.Doğum tarihi null olan öğrencileri listeleyin.

select * from ogrenci where dtarih is  null

--51. Alınan kitapların kitap numarasını, adını kaç defa alındığını (alınmayan kitapların yanında 0 olsun) listeleyin.
select kitap.kitapno, kitap.kitapadi, islemno from kitap 
left join islem on islem.kitapno=kitap.kitapno
group by kitap.kitapno, kitap.kitapadi

--71.En az sayfası olan kitabın adını ve sayfa sayısını listeleyiniz.

select kitapadi, sayfasayisi from kitap where sayfasayisi= (select min(sayfasayisi) from kitap) 

select kitapadi,sayfasayisi from kitap order by  sayfasayisi limit 1

--49. Kitap almayan öğrencileri listeleyin.

select ogrenci.ograd from ogrenci where ogrno not in (select ogrno from islem )
select ogrenci.ograd from ogrenci where not exists  (select ogrno from islem where islem.ogrno=ogrenci.ogrno )


--65.Öğrenci tablosundaki öğrenci sayısını gösterin

select count(ogrno) from ogrenci


--75.İsme göre öğrenci sayılarının adedini bulunuz.(Örn: ali 5 tane, ahmet 8 tane )

select ogrenci.ograd ,count(ograd) from ogrenci group by ograd


--79.Her öğrencinin okuduğu kitap sayısını getiriniz.

select ograd,  ogrenci.ogrno, count(islem.islemno) from ogrenci

left join islem on islem.ogrno = ogrenci.ogrno

GROUP by ogrenci.ogrno

--35. Nurettin Belek isimli yazarı ekleyip yazar numarasını yazdırınız.
--(Not: Otomatik arttırmada son arttırılan değer @@IDENTITY değişkeni içinde tutulur.)

 
insert into yazar(yazarad, yazarsoyad)
values('Nurettin','Belek')
select @@IDENTITY

--44. bilim kurgu türündeki kitapları okuyan öğrencilerin numarasını, adını, soyadını ve okuduğu kitabın adını listeleyin

select ogrenci.ograd, ogrenci.ogrsoyad,ogrenci.ogrno , kitap.kitapadi from ogrenci
join islem on islem.ogrno = ogrenci.ogrno 
join kitap on kitap.kitapno=islem.kitapno
join tur on tur.turno =kitap.turno 
where tur.turadı ='bilim kurgu'


select distinct ogrenci.ogrno,ograd,ogrsoyad,kitapadi
from ogrenci,islem,kitap,tur
where ogrenci.ogrno=islem.ogrno
and islem.kitapno=kitap.kitapno
and kitap.turno=tur.turno
and tur.turadı='bilim kurgu'


--43.10B veya 10A sınıfındaki öğrencilerin numarasını, adını, soyadını ve okuduğu kitapları listeleyin.


select  ogrenci.ogrno,ograd,ogrsoyad,kitapadi
from ogrenci , kitap ,islem
where ogrenci.ogrno=islem.ogrno
and islem.kitapno=kitap.kitapno
and (ogrenci.sinif ='10-A' or ogrenci.sinif='10-B')


/*select ogrenci.ogrno, ogrenci.ograd, kitap.kitapadi from ogrenci,islem,kitap
where ogrenci.ogrno in
(select ogrno  from islem where kitapno in
(select kitapno from kitap where turno in
(select turno from tur where turadı='bilim kurgu' )))
and islem.kitapno=kitap.kitapno*/

--57. Sayfa sayısı ortalama sayfa sayısından fazla olan kitapları listeleyiniz.

select kitapadi from kitap where sayfasayisi> ( select Round(avg(sayfasayisi)) from kitap )

--58.İç içe select ile dram türündeki kitapları listeleyiniz.

select kitapadi from kitap where turno in (select turno from tur where tur.turadı='tarih' )


--67.Öğrenci tablosunda kaç farklı isimde öğrenci olduğunu listeleyiniz.

select count (select ogrenci.ograd  from ogrenci
group by ogrenci.ograd) from ogrenci

--73.numarası 14 olan öğrencinin okuduğu toplam sayfa sayısını bulunuz.

select sum(sayfasayisi)  from kitap 
join islem on islem.kitapno=kitap.kitapno 
join ogrenci on ogrenci.ogrno= islem.ogrno where ogrenci.ogrno=14

--78.Her öğrencinin adını, soyadını ve okuduğu toplam sayfa sayısını büyükten küçüğe doğru listeleyiniz.

select  ogrenci.ograd,ogrenci.ogrsoyad, sum(sayfasayisi)  from ogrenci
join islem on ogrenci.ogrno= islem.ogrno
join kitap on kitap.kitapno= islem.kitapno
group by ogrenci.ograd,ogrenci.ogrsoyad
order by sum(sayfasayisi) desc


select ograd,ogrsoyad,sum(sayfasayisi) as sayfa from ogrenci,kitap,islem
where ogrenci.ogrno=islem.ogrno and kitap.kitapno=islem.kitapno
group by ograd,ogrsoyad,ogrenci.ogrno
order by sayfa
--38. Tüm öğrencilerin puanını 5 puan arttırın.

update ogrenci 
set puan=puan+5

select puan from ogrenci


--42. distopya ve tarih türündeki kitapların adını ve türünü listeleyin.

select kitap.kitapadi, tur.turadı from kitap,tur
where kitap.turno=tur.turno
and (tur.turadı ='distopya' or tur.turadı ='tarih')

--43. 10B veya 10A sınıfındaki öğrencilerin numarasını, adını, soyadını ve okuduğu kitapları listeleyin.
select ogrenci.ograd,ogrenci.ogrsoyad, ogrenci.ogrno from ogrenci,islem,kitap
where ogrenci.sinif='10-A' OR ogrenci.sinif='10-B'
and  ogrenci.ogrno=islem.ogrno
and  islem.kitapno=kitap.kitapno

-- senanın okumadığı kitaplar


--45. Öğrencinin adını, soyadını ve kitap aldığı tarihleri listeleyin.

select ogrenci.ograd,ogrenci.ogrsoyad, islem.atarih from ogrenci,islem 
where  ogrenci.ogrno=islem.ogrno


--49. Kitap almayan öğrencileri listeleyin.


SELECT ogrenci.ogrno,ogrenci.ograd
From ogrenci
where ogrenci.ogrno not in (select islem.ogrno from islem)



--50. Alınan kitapların kitap numarasını, adını ve kaç defa alındığını kitap numaralarına göre artan sırada listeleyiniz.

select kitap.kitapadi,kitap.kitapno ,count(islem.islemno) from kitap 
inner join islem on islem.kitapno=kitap.kitapno
group by kitap.kitapadi,kitap.kitapno
order by kitap.kitapno
--53.Her öğrencinin adı, soyadı, kitabın adı, yazarın adı soyad ve kitabın türünü ve
--kitabın alındığı tarihi listeleyiniz. Kitap almayan öğrenciler de listede görünsün.

select kitap.kitapadi,ogrenci.ograd,ogrenci.ogrsoyad,tur.turadı,yazar.yazarad,yazar.yazarsoyad from ogrenci LEFT join
islem on islem.ogrno = ogrenci.ogrno left join kitap on kitap.kitapno=islem.kitapno 
left join tur on tur.turno=kitap.turno left join yazar on  kitap.yazarno=yazar.yazarno


select kitap.kitapadi,tur.turadı from kitap LEFT join
tur on kitap.turno=tur.turno left join yazar on  kitap.yazarno=yazar.yazarno


--60.İç içe sorgu ile kitap okumayan öğrencileri listeleyiniz.
SELECT ogrenci.ograd,ogrenci.ogrsoyad from ogrenci 

where ogrenci.ogrno not in (select islem.ogrno from islem)





--61. İç içe select ile okunmayan kitapları listeleyiniz.
SELECT kitap.kitapadi from kitap

where kitap.kitapno not in (select islem.kitapno from islem)


--20. Öğrenciler tablosundaki ilk 10 kaydı listeleyiniz.

select * from ogrenci limit 10

--22.Öğrenciler tablosundaki en yaslı öğrencileri listeleyiniz.

select * from ogrenci where dtarih = ( SELECT dtarih from ogrenci   where dtarih is not null ORDER by dtarih limit 1)




