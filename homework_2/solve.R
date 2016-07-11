#设置工作路径
setwd('/Users/SparkFour/Study/研究生课程/数据挖掘/作业/github_repo/datamining_homework/homework_2')

#加载算法库
library("grid")
library("Matrix")
library("arules")
library("arulesViz")

#读取数据，以Basket方式
#tr<-read.transactions("traindata.csv",format="basket",sep=",",rm.duplicates=TRUE)
tr<-read.transactions("preDiagnosis.data",format="basket",sep=",",rm.duplicates=TRUE)

#获得频繁项集
frequentsets=eclat(tr,parameter=list(support=0.3,maxlen=4))
summary(frequentsets)
inspect(frequentsets)  
#查看支持度最高的前20个频繁项集
inspect(sort(frequentsets,by="support")[1:20]) 

#抽取关联规则
rules = apriori(tr,parameter = list(support = 0.3,confidence = 0.3))
summary(rules) 
inspect(rules)


#根据支持度对求得的关联规则子集排序并察看
inspect(sort(rules,by="support")[1:10])  
#根据置信度对求得的关联规则子集排序并察看
inspect(sort(rules,by="confidence")[1:10]) 

#根据lift对求得的关联规则子集排序并察看
inspect(sort(rules,by="lift")[1:10])   
itemFrequencyPlot(tr,support = 0.3,cex.names =0.8) 


plot(rules)
plot(rules, measure = c("support", "lift"), shading = "confidence")

#画泡泡图
plot(rules, method = "grouped")

#画平行坐标图
plot(rules, method="paracoord", control=list(reorder=TRUE))