# k-mean clustering

#import dataset
dataset <- read.csv("Mall_Customers.csv")

#subset
X <- dataset[4:5]

#Ecludian - to find the number of cluster
set.seed(6)
wcss <- vector()
for (i in 1:10) wcss[i] <- sum(kmeans(X, i)$withinss)
plot(1:10, wcss, type = "b", main = paste('Clusters of Client'), 
     xlab = "Number of clusters", ylab = "WCSS")


#fit kmeans to the dataset
set.seed(29)
kmeans <- kmeans(X, 5, 300, nstart = 10)

dataset$cluster <- kmeans$cluster

#visual
library(cluster)
clusplot(X,
         kmeans$cluster,
         line=0,
         shade=T,
         color=T,
         labels = 2,
         plotchar = T,
         span=T,
         main=paste("Cluster of Clients"),
         xlab = "Anual Income",
         ylab = "Spending Score")