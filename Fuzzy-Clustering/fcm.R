library(e1071)
library(dbscan)
library(corrplot)
library(factoextra)
data("iris")
iris2 <- iris[,-5]
#FCM
cm1 <- cmeans(iris2, centers = 3, iter.max = 100, 
              dist = "euclidean", m = 3)
#k-means
set.seed(20)
km1 <- kmeans(iris2,3,25)

print(cm1)
print(km1)

par(mfrow=c(1,2))
hullplot(iris2,cm1$cluster)
hullplot(iris2,km1$cluster)

corrplot(cm1$membership[c(77,87,104,124,147),], 
         is.corr = FALSE)

fviz_cluster(list(data = iris2, cluster=cm1$cluster), 
             ellipse.type = "norm",
             ellipse.level = 0.99,
             palette = "jco",
             ggtheme = theme_minimal())

table(iris$Species, cm1$cluster)
table(iris$Species, km1$cluster)
