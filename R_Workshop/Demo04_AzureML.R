
# Map 1-based optional input ports to variables
#dataset1 <- maml.mapInputPort(1) # class: data.frame
#dataset2 <- maml.mapInputPort(2) # class: data.frame

#local specific code # read data from txt file from the worksheet named mysheet
dataset1 <- read.csv(file = "Resource/titanic3.csv", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ",", dec = ".", quote = "\"", comment.char = "")

# Contents of optional Zip port are in ./src/
# source("src/yourfile.R");
# load("src/yourData.rdata");

head(dataset1) #when data is big show only  first few rows


# Get the summary of imported data
str(dataset1)

#convert survived, pclass columns to factors
dataset1$survived <- as.factor(dataset1$survived)
dataset1$pclass <- as.factor(dataset1$pclass)

#convert name to character column
dataset1$name <- as.character(dataset1$name)
dataset1$age <- as.numeric(dataset1$age)

#create new data from current
newdata = data.frame(survived=dataset1$survived, pclass=dataset1$pclass, age=dataset1$age, sibp= dataset1$sibsp, parch= dataset1$parch,sex=  dataset1$sex, boat=dataset1$boat)

#structure of the new data
str(newdata)

#create Age historgram
hist(dataset1$age)



# Select data.frame to be sent to the output Dataset port
maml.mapOutputPort("newdata");