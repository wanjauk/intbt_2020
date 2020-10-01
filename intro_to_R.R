
# CREATING OBJECTS IN R --------------------------------------------------------

# arithmetic in R
3 + 5
12 / 7

# assignment operators
weight_kg <- 55
weight_kg = 55

# arithmetic using objects
2.2 * weight_kg

# change an objects value
weight_kg <- 57.5

weight_lb <- 2.2 * weight_kg

# DATA TYPES --------------------------------------------------------------
# 6 basic data types

# 1. character
a <- "abc"
typeof(a)

# 2. numeric (real or decimal)
b <- 2
c <- 13.5
typeof(b)

# integer
d <- 2L
typeof(d)

# logical
e <- TRUE
f <- FALSE

# complex
g <- 1+4i

# Note: all these are atomic vectors (holds data of a single data type)


# DATA STRUCTURES ---------------------------------------------------------


######### vectors #################


weight_g <- c(50, 60, 65, 82) # a vector containing numbers
weight_g

animals <- c("mouse", "rat", "dog") # a vector containing characters
animals

# how many elements are in the vector
length(weight_g)
length(animals)

# get the structure of the objects
str(weight_g)
str(animals)

# adding elements to a vector using the c() function
weight_g <- c(weight_g, 90) # add to the end of the vector
weight_g <- c(30, weight_g) # add to the beginning of the vector
weight_g

# Subsetting vectors
animals <- c("mouse", "rat", "dog", "cat")
animals[2] # get the element in the second position

# Note: R indices start at 1

animals[c(3, 2)]

# Conditional subsetting
weight_g <- c(21, 34, 39, 54, 55)

weight_g[weight_g > 30 & weight_g < 50]

weight_g[weight_g <= 30 | weight_g == 55]

animals <- c("mouse", "rat", "dog", "cat")
animals[animals == "cat" | animals == "rat"] # returns both rat and cat

# test whether any elements are in the vector
animals %in% c("rat", "cat", "dog", "duck", "goat")

# subset based on  whether elements are present
animals[animals %in% c("rat", "cat", "dog", "duck", "goat")]


##########
# Missing values
heights <- c(2, 4, 4, NA, 6)
mean(heights)
max(heights)
mean(heights, na.rm = TRUE)
max(heights, na.rm = TRUE)

## Extract those elements which are not missing values.
heights[!is.na(heights)]

na.omit(heights)

heights[complete.cases(heights)]


########### Factors ################
# for categorical data
data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
fdata

sex <- factor(c("male", "female", "female", "male"))

levels(sex)
nlevels(sex)


########## Dataframes##############
download.file(url = "https://ndownloader.figshare.com/files/2292169",
              destfile = "portal_data_joined.csv")

# loading data into R
surveys <- read.csv("portal_data_joined.csv")
View(surveys)

# View the first 6 records
head(surveys)

# structure of the dataframe
str(surveys)

nrow(surveys)
ncol(surveys)

summary(surveys)

# Indexing and subsetting data frames
# first element in the first column of the data frame (as a vector)
surveys[1, 1]

# first element in the 6th column (as a vector)
surveys[1, 6] 

# first column of the data frame (as a vector)
surveys[, 1]

# first column of the data frame (as a data.frame)
surveys[1]  

# first three elements in the 7th column (as a vector)
surveys[1:3, 7] 

# the 3rd row of the data frame (as a data.frame)
surveys[3, ] 

# equivalent to head_surveys <- head(surveys)
head_surveys <- surveys[1:6, ] 


# FUNCTIONS ---------------------------------------------------------------

# calling a function
weight_kg <- sqrt(10)

# arguments of functions
round(3.14159, digits = 2)
round(digits = 2, x = 3.14159) # another way of specifying the arguments
args(round)

# getting help on a function
?round


# creating functions in R

fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}

# freezing point of water
fahrenheit_to_celsius(32)

# boiling point of water
fahrenheit_to_celsius(212)
