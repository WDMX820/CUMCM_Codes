#根据第二问的k-means聚类模型预测附件表单3中的高钾玻璃属于哪个亚类
#PredictionSubclassK.py
import pandas as pd
from sklearn.metrics import silhouette_score
from sklearn.cluster import KMeans

#读入数据
data = pd.read_excel(r'问题2.2K.xlsx')
datanew = pd.read_excel(r'问题3K.xlsx')#附件表单3中的高钾玻璃均在风化前的成分比例
data =data*[0.12221, 0.03461, 0.07807, 0.09079, 0.21886, 0.05188, 0.02665, 0.05286, 0.03529, 0.02853, 0.03508, 0.0386, 0.01857, 0.16801]
datanew =datanew*[0.12221, 0.03461, 0.07807, 0.09079, 0.21886, 0.05188, 0.02665, 0.05286, 0.03529, 0.02853, 0.03508, 0.0386, 0.01857, 0.16801]
print(data)
kmodel = KMeans(n_clusters=2).fit(data)
centerpoint = kmodel.cluster_centers_
typelist = kmodel.labels_
print(centerpoint)
print(typelist)
score = silhouette_score(data, typelist)
print(score)
datanew_pred = kmodel.fit_predict(datanew)#预测附件表单3中的高钾玻璃属于哪一类
print(datanew_pred)