
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


##yardım iste!!
#30 yaşından küçük kişi sayısının cinsiyete göre dağılımını gösteren grafik
age_filter= data.groupby(["Gender"])[["Age"]].apply(lambda x : (x<30).sum()).reset_index()
plt.figure(figsize=(10,10))
sns.barplot(x="Gender", y="Age", data=age_filter)
plt.xlabel("Gender")
plt.ylabel("miktar")
plt.title("30 yaşından küçük kişi sayısının cinsiyete göre dağılımı")
plt.show()


