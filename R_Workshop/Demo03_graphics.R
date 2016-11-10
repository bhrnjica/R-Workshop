# *********      GRAPHICS IN R    ********** --- 
#R can produce hihg quality graphics
?read.table
?hist #show help about command
?plot 
?ggplot2



# read data from txt file from the worksheet named mysheet
mydata <- read.csv(file = "Resource/data_sample01.txt", header = TRUE, row.names = 1, encoding = "UTF-8", sep = ";", dec = ".", quote = "\"", comment.char = "")

head(mydata) # view few rows to ge feel of the data
str(mydata)

#convert sallary in to numeric
mydata$Salary <- as.numeric(sub('\\$', '', as.character(mydata$Salary)))
mydata$Salary

#frequency of the value
hist(mydata$Age, main = "Age Histogram in the Company", ylab = "Employee", xlab = "Ages")

min(mydata$Age)

#scatter plots of two columns (showing correlation between columns)
plot(mydata$Age, mydata$Salary)

plot(mydata$Position, mydata$Salary)


#corellation between category and numeric col
library(ggplot2)

#which sallary is higher
ggplot(mydata, aes(x = mydata$Gender, fill = Salary)) + geom_bar(width = 0.5)


#

ggplot(mydata, aes(x = Office, fill = Salary)) +

      geom_bar(width = 0.5) +

      facet_wrap( ~ Gender) +

      ggtitle("Salary") +

      xlab("Office") +

      ylab("Salary") +

      labs(fill = "Salary")


#box plot
#1 and 4 line  - first line
# box second and third quartile
boxplot(mydata$Age)


#ggplot2 sample data diamond
head(diamonds)

#qplot(mydata$Age, mydata$Office,data = mydata, colour=mydata$Gender)

qplot(diamonds$carat, diamonds$price,data = diamonds, colour=diamonds$clarity)

#---- 