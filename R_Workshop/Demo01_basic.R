#
# *********      R INTRODUCTION    ********** ---
#########################################
# Open Source Project, GNU License
# 2 main distributions/interpreters; 
#       1. CRAN - official         - http://r-project.org
#       2. MRAN - Microsoft R Open - http://www.revolutionanalytics.com
#       3. R Server    - https://www.microsoft.com/en-us/cloud-platform/r-server 
#
# 2 main R Tools
#       1. R Studio         - http://rstudio.com
#       2. R Tool for VS    - http://microsoft.github.io/RTVS-docs/ 
#
#
#----
# *********      HOW TO GET QUICK HELP    ********** ---
#########################################
?data.frame #- shows help on Help window

# http://www.statmethods.net/    - very good help site about R lang

# great youtube videos: https://www.youtube.com/results?search_query=R+language

#----

# *********      BASIC ARITHMETIC    ********** ---
#########################################


1 + 1
var1 <- pi
var1 ^ 2
var2 = 42
exp(3) -> var3
var3
#----


# *********      VECTOR TYPE    ********** --- 
#########################################

vec1 <- c(1, 2, 3) #vector of 3 elements
vec2 <- 1:11 #vector of elements between 1 and 11
vec3 <- rep(x = 4, 7) #vector with repeted 4 value for 7 times 
vec3
vec4 <- seq(from = 1, to = 12, by = 1.333) #create vector elements between value 1 to 12 with 1.333 diference
vec5 <- seq(1, 12, length.out = 10) #create vector element 


#index vectors

vec4[3] #get third element
vec4[1:3] #get from first to  third element

vec4[34:35] #get nonexisting elements  

vec4[c(1, 3, 7)] #get several elements at once

vec4[c(1, 1, 2)] #call one element multiple times

vec4[-4] #get all elements but skip 4th

vec4[ - (1:3)] #get all element but skip 1,2,3 element

vec4[9:1] #get elements in revers order

#equality vector  check
vec6 <- c(2, 2, 2)
all.equal(vec6, c(2, 2, 2))
all.equal(vec6, c(2, 1, 2))

#element vector equality
vec6 == c(2, 2, 2)
vec6 != c(2, 1, 2)
#---


# *********      LIST DATA TYPE    ********** --- 
#########################################
list1 <- list(vec1, vec2, vec4) #list as list of three vectors
list2 <- list(name1 = vec1, name2 = vec2, name3 = vec4) #list as list of three vectors with names

list2$name1
list2$name1[2]
#----

# *********      MATRIX DATATYPE    ********** ---- 
#most important data type in R
#create matrix 2x3 
mat1 = matrix(
     c(2, 4, 3, 1, 5, 7), # the data elements 
     nrow = 2, # number of rows 
     ncol = 3, # number of columns 
     byrow = TRUE) # fill matrix by rows 

nrow(mat1) # numer of rows
ncol(mat1) #numbr of col3

mat1[2, 3] #get element of 2nd row and 3rd column
mat1[2,] # the 2nd row 
mat1[, 3] # the 3rd column 

mat1[, c(1, 3)] # the 1st and 3rd columns 

#matrix operations

t(mat1) # transponse matrix

mat1 + mat1 #matrix addition
2 * mat1 # multiplication scalar and matrix

t(mat1) %*% mat1 # matrix multiplication

mat2 = matrix(
  c(2, 4, 3, 1, 5, 7, 3, 4, 5),
  nrow = 3, ncol = 3, byrow = TRUE)

solve(mat2) # find inverse matrix of the mat2

mat_b = c(1, -2, 4) # vector

solve(mat2, mat_b) # solve system of linear equations
#----


