#***************************************
#
#Data analysis with R
#
#*****************************************
#
#titanic data investigation, more info at: https://www.kaggle.com/c/titanic/data
#load data from the dist

#local specific code # read data from txt file from the worksheet named mysheet
t_data <- read.csv(file = "Resource/titanic3.csv", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ",", dec = ".", quote = "\"", comment.char = "")
#quick overview of the data
head(t_data) #when data is big show only  first few rows

# Get the summary of imported data
str(t_data)

#convert survived, pclass columns to factors
t_data$survived <- as.factor(t_data$survived)
t_data$pclass <- as.factor(t_data$pclass)

#convert name to character column
t_data$name <- as.character(t_data$name)
t_data$age <- as.numeric(t_data$age)

str(t_data)

#embarked column is not clear what are letters mean
head(t_data$embarked)

#Add new calculated columns
embarked_fun <- function(value) {
    switch(as.character(value),
  "C" = "Cherbourg",
  "Q" = "Queenstown",
  "S" = "Southampto",
  "Southampto")
}

#calculated column
t_data[, "embarked_long"] <- sapply(t_data[, "embarked"], embarked_fun)
str(t_data)
#convert column to factor
t_data$embarked_long = as.factor(t_data$embarked_long)
#
head(t_data$embarked_long)

length(t_data) # number of columns
length(t_data$survived) # number of rows 

table(t_data$survived) # nice review of category data

table(t_data$survived, t_data$pclass) # combinig two cat columns

table(t_data$survived) / length(t_data$survived) #precent of the survived 

table(t_data$pclass) # nice review of category data


#create Age historgram
hist(t_data$age)


#it cannot calculate because of missing values
median(t_data$age) # error there are missing values

# some statistics
median(t_data$age, na.rm = TRUE) # na.rm = TRUE means skip missing values if exist
min(t_data$age, na.rm = TRUE) # minumum value 
max(t_data$age, na.rm = TRUE) # max values
range(t_data$age, na.rm = TRUE) # range of the value

#plotting
plot(t_data$pclass, t_data$survived)
plot(t_data$embarked_long, t_data$survived)

#box plot
#1 and 4 line  - first line
# box second and third quartile
boxplot(t_data$age)


library("ggplot2")
qplot(t_data$survived, t_data$pclass, data = t_data, colour = t_data$sex)

#Broj putnika po po klasama
ggplot(t_data) + aes(x = pclass, fill = pclass) + geom_bar() +
ggtitle("Broj putnika na Titaniku")

#Broj putnika po poklasama podijeljeni prema spolu
ggplot(t_data) + aes(x = pclass, fill = pclass) + geom_bar() +
        ggtitle("Broj putnika na Titaniku") +
facet_grid(. ~ sex)

#Broj putnika po po klasama, grupisano po ukrcajnim lukama 
ggplot(t_data) + aes(x = embarked_long, fill = survived) + geom_bar() +
        ggtitle("Broj putnika na Titaniku") +
facet_grid(. ~ sex)

#Broj putnika po klasama
ggplot(t_data) + aes(x = pclass, fill = survived) + geom_bar() +
    ggtitle("Broj putnika na Titaniku")

#Broj putnika po klasama
ggplot(t_data) + aes(x = pclass, fill = survived) + geom_bar() +
        ggtitle("Broj putnika na Titaniku") +
        facet_grid(. ~ sex)



##Machine learning preparation####
#create new data from current
data_to_model = data.frame(survived = t_data$survived, pclass = t_data$pclass, age = t_data$age, sibp = t_data$sibsp, parch = t_data$parch, sex = t_data$sex, embarked = t_data$embarked_long)

#structure of the new data
str(data_to_model)
