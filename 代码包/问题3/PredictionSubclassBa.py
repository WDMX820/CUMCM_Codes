#根据第二问的k-means聚类模型预测附件表单3中的铅钡玻璃属于哪个亚类
#PredictionSubclassBa.py
import pandas as pd
from sklearn.metrics import silhouette_score
from sklearn.cluster import KMeans

#读入数据
data = pd.read_excel(r'问题2.2Ba.xlsx')
datanew = pd.read_excel(r'问题3Ba.xlsx')
data =data*[0.10004, 0.07672, 0.06711, 0.0192, 0.09087, 0.02804, 0.06935, 0.05069, 0.06034, 0.0226, 0.04203, 0.02232, 0.14445, 0.20625]
datanew =datanew*[0.10004, 0.07672, 0.06711, 0.0192, 0.09087, 0.02804, 0.06935, 0.05069, 0.06034, 0.0226, 0.04203, 0.02232, 0.14445, 0.20625]
print(data)
kmodel = KMeans(n_clusters=5).fit(data)
centerpoint = kmodel.cluster_centers_
typelist = kmodel.labels_
print(centerpoint)
print(typelist)
score = silhouette_score(data, typelist)
print(score)
datanew_pred = kmodel.fit_predict(datanew)
print(datanew_pred)