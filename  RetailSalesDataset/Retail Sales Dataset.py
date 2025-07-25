
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

data= pd.read_csv("retail_sales_dataset.csv")

print(data.head())

print(data.info())

print(data.describe())

print(data.isnull().sum())

#normalde print yazmadan çalışırdı neden çalışmadı sor??


#groupby methodu
#önce sütun adlarını görmek istiyorum
print(data.columns)

groupby_Date = data.groupby("Date")[["Total Amount"]].mean().reset_index()
print(groupby_Date)


#kategori bazında ortalama grafiği (matplotlib)

#1 kategoriye göre grupluyorum yeni verimi hazırladım
#grafik için seaborn kullandım
category_set= data.groupby(["Product Category"])[["Total Amount"]].mean().reset_index()
plt.figure(figsize=(10,10))
sns.barplot(x="Product Category", y="Total Amount" , data=category_set)
plt.xlabel("Product Category")
plt.ylabel("Total Amount")
plt.title("Kategori bazında ortalama satış grafiği")
plt.show()

#Gender'a göre grafik çıkar. ama yaşı 30 dan büyük olan toplam kişi sayılarını gösterir
#countplot methodu

#'Age' > 30 koşulu True/False döndürür, sum() bunları 1/0 olarak toplar

# ters düşün önce yaşı filtrelemem lazım sonra gender'ı
#dataframe'den okuyorum [] unutma!!

##people_over_30= data["Age"].apply(lambda x : (x>30)).sum()
#gender_over_30= people_over_30.groupby(["Gender",["Age"]]).size().reset_index()
#groupby people_over yapamadım çünkü object yani sayı!! df ya da seri değil bu yüzden

##plt.figure(figsize=(10,10))
##sns.scatterplot(x="Gender", y="Age", hue= "Count" , data=gender_over_30)


##yardım iste!!

age_filter= data.groupby(["Gender"])[["Age"]].apply(lambda x : x["Age"]>30).reset_index()
plt.figure(figsize=(10,10))
sns.barplot(x="Gender", y="Age", data=age_filter)
plt.xlabel("Gender")
plt.show()