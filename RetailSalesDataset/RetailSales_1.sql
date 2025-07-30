
-- ilk 50 toplam sat���m
SELECT TOP 50 Total_Amount, Product_Category 
from retail_sales_dataset

--son 30 g�n i�indeki sat��lar� getir (database'im 2023 y�l�ndan)

-- varchar type tablom olu�mu� onu DATE / DATET�ME �evirmeliyim MODIFY COLUMN !
--ALTER TABLE retail_sales_dataset
---alterCOLUMN DATE DATE/DATET�ME
	
	ALTER TABLE retail_sales_dataset
		Alter COLUMN Sales_Date  Datetime;
--datetime vs sorgularken tek t�rnak!

select * from retail_sales_dataset
where Sales_Date>= '2023-12-01' AND Sales_Date<='2023-12-31'
order by Sales_Date ASC


	--Update ile veri de�i�tirilir yap�s� de�i�tiremem
	-- alter column methodu alter table ile kullan�l�r


--kategori baz�nda toplam sat�� kategorimi group by ile s�n�flnad�rmal�y�m sadece group bylamak istedi�imi yaz unutma ve fonksiyonu unutmamal�s�n
-- s�ralamak i�inde order by kullan sat��a g�re artan �eklinde s�rala

ALTER TABLE	retail_sales_dataset 
ALTER COLUMN Total_Amount INT;

Select Product_Category,SUM(Total_Amount) AS Sum_Total_Amount
from retail_sales_dataset
group by Product_Category 
order by Sum_Total_Amount DESC;

--Her bir Product_Category (�r�n Kategorisi) i�in toplam sat�� miktar�n� hesaplamak.

--ha sonra bu kategorileri, toplam sat�� miktar�na g�re azalan s�rada (en �oktan en aza) s�ralamak.
--��z�m: Toplama Fonksiyonu Kullanmak

--Buamaca ula�mak i�in Total_Amount s�tununu bir toplama fonksiyonu olan SUM() (toplam) ile kullanman�z gerekir.

--SUM(Total_Amount): Her bir Product_Category grubu i�in, o kategoriye ait t�m Total_Amount de�erlerinin toplam�n� hesaplar.


---kategori + cinsiyeti kad�n olanlar� g�steren sat��lar HAVING !!
ALTER TABLE	retail_sales_dataset 
ALTER COLUMN Gender INT

SELECT Product_Category, SUM(Total_Amount) as Toplam_Satis_Miktari, COUNT(Gender) AS Toplam_Kadin_m��teri
from retail_sales_dataset
where Gender = 'Female'
group by Product_Category
Order by Toplam_Satis_Miktari DESC

-- buna cinsiyeti de grupland�rmas�n� istesem 
--where ko�ulu yok hem kad�n hem de erkek gelmesi i�in zaten group by ile s�n�fland�rd�m
Select Product_Category, Gender, SUM(Total_Amount) as Toplam_Satis_Miktari, COUNT(Gender) AS Toplam_M�steri
from retail_sales_dataset
group by Product_Category, Gender -- hem kategoriye hemde cinsiyete g�re grupland�r�r
order by Toplam_Satis_Miktari desc;

--WHERE Gender = 'Female' AND Gender = 'Male' yapma
-- ��nk� bir sat�r�n Gender de�eri ayn� anda hem 'Female' hem de 'Male' olamaz. 
-- bu ko�ulu kullan�rsan�z sorgunuz hi�bir sonu� d�nd�rmez.

--1000 TL �zerindeki sat��lar� listele (WHERE amount > 1000). 
Select Product_Category as Kategori, Total_Amount as Satis_fiyati, Quantity as Miktar, 
  Price_per_Unit as �r�n_baz�nda_satis_fiyati
from retail_sales_dataset
where Total_Amount > 1000
group by Product_Category, Total_Amount, Quantity, Price_per_Unit


select top 5 * from retail_sales_dataset


