library(cluster)

cus_data <- read.csv("Mall_Customers.csv")


##To Calculate the number of cluster to be used in Kmeans, run the following code to observe the variation of number of clusters with Gap station for optimal number of cluster
##library(cluster)
##library(factoextra)
##gap_station <- clusGap(cus_data[,3:5], FUN=kmeans, K.max = 10, nstart=25, B = 50)
##fviz_gap_stat(gap_station)

k6 <- kmeans(cus_data[, 3:5], 6, algorithm = "Lloyd", nstart = 25, iter.max = 100)
require(gridExtra)
plot1 <- ggplot(data = cus_data, aes(x = Annual.Income..k.., y = Spending.Score..1.100.))+geom_point(stat = "identity", aes(color = as.factor(k6$cluster)))+scale_color_discrete(name=" ", breaks=c("1", "2", "3", "4", "5", "6"), labels =c("Cluster 1","Cluster 2","Cluster 3","Cluster 4","Cluster 5","Cluster 6"))
plot2 <- ggplot(data = cus_data, aes(x = Age, y = Spending.Score..1.100.))+geom_point(stat = "identity", aes(color = as.factor(k6$cluster)))+scale_color_discrete(name=" ", breaks=c("1", "2", "3", "4", "5", "6"), labels =c("Cluster 1","Cluster 2","Cluster 3","Cluster 4","Cluster 5","Cluster 6"))
grid.arrange(plot1, plot2, ncol= 2)
