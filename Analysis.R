library(plyr)    
library(ggplot2) 

#read all csv data
American<- read.csv("C:\\Users\\sdas\\Desktop\\Spring 2022\\Web scrap project\\Price_point\\American.csv")
Asian<- read.csv("C:\\Users\\sdas\\Desktop\\Spring 2022\\Web scrap project\\Price_point\\Asian.csv")
Indian<- read.csv("C:\\Users\\sdas\\Desktop\\Spring 2022\\Web scrap project\\Price_point\\Indian.csv")
Italian<- read.csv("C:\\Users\\sdas\\Desktop\\Spring 2022\\Web scrap project\\Price_point\\Italian.csv")
Mexican<- read.csv("C:\\Users\\sdas\\Desktop\\Spring 2022\\Web scrap project\\Price_point\\Mexican.csv")
Steakhouse<- read.csv("C:\\Users\\sdas\\Desktop\\Spring 2022\\Web scrap project\\Price_point\\Steakhouse.csv")

#all resturansts from 6 cuisines combined
my_data <- rbind(American,Asian,Indian,Italian,Mexican,Steakhouse)

write.csv(my_data,"C:\\Users\\sdas\\Desktop\\Spring 2022\\Web scrap project\\Price_point\\my_data.csv")

#histogram of Ratings
ggplot(my_data, aes(x=Rating)) + 
  geom_histogram(color="black", fill="lightblue",bins=6)

#histogram of Reviewer
ggplot(my_data, aes(x=Reviewer)) + 
  geom_histogram(color="black", fill="lightblue",bins=6)


#Reviewer vs Cuisine for all price range
 ggplot(aes(x=Reviewer,y=Cuisine, fill=price), data=my_data) +
  geom_boxplot()+ggtitle("Popularity of Resturants in Austin")+xlab("Number of Reviews") 

#Ratingr vs Cuisine for all price range
 ggplot(aes(x=Rating,y=Cuisine, fill=price), data=my_data) +
  geom_boxplot()+ggtitle("Rating of Resturants in Austin")+xlab("Customer's Rating") 



counts <- table(my_data$Cuisine, my_data$Rating)

barplot(counts, main="Major Cuisines Distribution in Austin",
   xlab="Cuisine", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)

