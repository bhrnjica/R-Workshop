# *********      DATA.FRAME    ********** --- 
#most important data type in R

? data.frame #show help about command

library(xlsx)

# read data from excel file from the worksheet named mysheet
e_data <- read.xlsx("Resource/data_sample.xlsx", sheetName = "sample1")

head(e_data) # view few rows to ge feel of the data

length(e_data) # number of columns
length(e_data$Ime) # number of rows 


str(e_data) # structure of the data

#convert name to character type
e_data$Name_char <- as.character(e_data$Name)

#category  columns

hist(e_data$Sall)  # histogram of the sallary

table(e_data$Gender) # nice review of category data
table(e_data$Smoker) # nice review of category data

table(e_data$Gender, e_data$Smoker) # combinig two cat columns

table(e_data$Gender) / length(e_data$Gender)  #precent of the male and femails in the company

#numerical columns
sd(e_data$Sallary) # standard deviation

mean(e_data$Age)   #mean

median(e_data$Age) # median

var(e_data$Age)    #variance

sd(e_data$Age)    # standard devijation of the age
sqrt(var(e_data$Age)) # standard devijation calculated by variaance

min(e_data$Sallary)  # minumum sallary in the company
max(e_data$Sallary)  # max sallary in the company

range(e_data$Age)    # range of the Age of the company

quantile(e_data$Age, probs = 0.4) # quantile calculation

#
sum(e_data$Age) / length(e_data$Age)  # ahother way to cal average (median)

cor(e_data$Age, e_data$Sallary)     # Pearson correlation between two columns

cor(e_data$Age, e_data$Sallary, method = "spearman") # Spearmen correlation of the two columns


cov(e_data$Age, e_data$Sallary)   # covariance cal

var(e_data$Age, e_data$Sallary)  # var two clumns


plot(e_data$Age, e_data$Sallary)  # scatter plot of te two columns

#---- 