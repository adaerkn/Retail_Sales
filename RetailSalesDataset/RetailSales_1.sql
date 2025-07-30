
-- ilk 50 toplam satýþým
SELECT TOP 50 Total_Amount, Product_Category 
from retail_sales_dataset

--son 30 gün içindeki satýþlarý getir (database'im 2023 yýlýndan)

-- varchar type tablom oluþmuþ onu DATE / DATETÝME çevirmeliyim MODIFY COLUMN !
--ALTER TABLE retail_sales_dataset
---alterCOLUMN DATE DATE/DATETÝME
	
	ALTER TABLE retail_sales_dataset
		Alter COLUMN Sales_Date  Datetime;
--datetime vs sorgularken tek týrnak!

select * from retail_sales_dataset
where Sales_Date>= '2023-12-01' AND Sales_Date<='2023-12-31'
order by Sales_Date ASC


	--Update ile veri deðiþtirilir yapýsý deðiþtiremem
	-- alter column methodu alter table ile kullanýlýr


--kategori bazýnda toplam satýþ kategorimi group by ile sýnýflnadýrmalýyým sadece group bylamak istediðimi yaz unutma ve fonksiyonu unutmamalýsýn
-- sýralamak içinde order by kullan satýþa göre artan þeklinde sýrala

ALTER TABLE	retail_sales_dataset 
ALTER COLUMN Total_Amount INT;

Select Product_Category,SUM(Total_Amount) AS Sum_Total_Amount
from retail_sales_dataset
group by Product_Category 
order by Sum_Total_Amount DESC;

--Her bir Product_Category (Ürün Kategorisi) için toplam satýþ miktarýný hesaplamak.

--ha sonra bu kategorileri, toplam satýþ miktarýna göre azalan sýrada (en çoktan en aza) sýralamak.
--Çözüm: Toplama Fonksiyonu Kullanmak

--Buamaca ulaþmak için Total_Amount sütununu bir toplama fonksiyonu olan SUM() (toplam) ile kullanmanýz gerekir.

--SUM(Total_Amount): Her bir Product_Category grubu için, o kategoriye ait tüm Total_Amount deðerlerinin toplamýný hesaplar.


---kategori + cinsiyeti kadýn olanlarý gösteren satýþlar HAVING !!
ALTER TABLE	retail_sales_dataset 
ALTER COLUMN Gender INT

SELECT Product_Category, SUM(Total_Amount) as Toplam_Satis_Miktari, COUNT(Gender) AS Toplam_Kadin_müþteri
from retail_sales_dataset
where Gender = 'Female'
group by Product_Category
Order by Toplam_Satis_Miktari DESC

-- buna cinsiyeti de gruplandýrmasýný istesem 
--where koþulu yok hem kadýn hem de erkek gelmesi için zaten group by ile sýnýflandýrdým
Select Product_Category, Gender, SUM(Total_Amount) as Toplam_Satis_Miktari, COUNT(Gender) AS Toplam_Müsteri
from retail_sales_dataset
group by Product_Category, Gender -- hem kategoriye hemde cinsiyete göre gruplandýrýr
order by Toplam_Satis_Miktari desc;

--WHERE Gender = 'Female' AND Gender = 'Male' yapma
-- Çünkü bir satýrýn Gender deðeri ayný anda hem 'Female' hem de 'Male' olamaz. 
-- bu koþulu kullanýrsanýz sorgunuz hiçbir sonuç döndürmez.

--1000 TL üzerindeki satýþlarý listele (WHERE amount > 1000). 
Select Product_Category as Kategori, Total_Amount as Satis_fiyati, Quantity as Miktar, 
  Price_per_Unit as Ürün_bazýnda_satis_fiyati
from retail_sales_dataset
where Total_Amount > 1000
group by Product_Category, Total_Amount, Quantity, Price_per_Unit


select top 5 * from retail_sales_dataset


