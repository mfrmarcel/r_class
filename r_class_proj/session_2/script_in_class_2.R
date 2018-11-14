#### R Class 2 #### 

# R has a set of base functions, but there may be 
# functions that have been developed that you may 
# want to implement in R, but require you to 
# download them from an opensource database. 

# CRAN database

# This is the function to install packages 
# install.packages('stringr')
# install.packages('dplyr')
# install.packages('tidyverse')

#### Libraries #### 

library(stringr)
library(dplyr)
library(tidyverse)

#### Character Vectors ####

# Let's generate some character vectors 

char_vect1 = c('black', 'latinx', 'white',
               'asian')
char_vect2 = c('male', 'female', 'trans',
               'non-binary')

# You can't run CERTAIN functions over character
# vectors like you could with, perhaps, numeric
# vectors. For example, if you wanted to take 
# the "average" of a chracter vector, you will 
# obviously receive an error 

mean(x = char_vect1)
mean(x = char_vect2)
median(x = char_vect1)
median(x = char_vect2)

# But there are other functions that are made 
# specifically for manipulating character vectors,
# for instance, the paste() function 

output_char1 = 
  paste(char_vect1, char_vect2, sep = '/')
output_char1

# You could also collapse character vectors 
# with paste 

output_char2 = paste(char_vect1, char_vect2, 
                     collapse = '|')
output_char2


output_char2b = paste(char_vect1, 
                     collapse = '|')
length(char_vect1)
length(output_char2b)


# Some interesting manipulations with base R 
# and the stringr package 

toupper(char_vect1)

# Nesting a function within a function to 
# reverse capitalization 

tolower(toupper(char_vect1))

# Stringr versions

str_to_upper(char_vect1)
str_to_upper(char_vect2)

# Say you want a 12 character element for all 
# elements involved, padded with leading 
# zeros 

str_pad(string = char_vect1, width = 12,
        side = 'left', pad = '0')

lead_vect_0 = 
  str_pad(string = '4513', width = 5, 
        side = 'left', pad = '0')

lead_vect_0 = 
  gsub(x = lead_vect_0, pattern = '^0', 
     replacement = '')

# Stringer way 
# lead_vect_0 = 
#  str_replace(string = lead_vect_0, 
#            pattern = '^0', '')

# Substring function 

date_char = c('2008-01-06', '2011-08-10',
              '2016-07-01')

substring(text = date_char, first = 1,
          last = 4) 

# Let's say we want to choose elements from 
# the vector on the basis of a string pattern.
# We can use the grep() function. 

# Value version --- output character 

grep(x = char_vect1, pattern = 'black',
     value = TRUE)

char_vect1b = rep(char_vect1, 2)

grep(x = char_vect1b, pattern = 'black',
     value = TRUE)

# Numeric Aside 

num_aside = c(1, 1, 1, 4)
num_aside[num_aside == 1]

# Index version --- output the indices 

indx = grep(x = char_vect1b, pattern = 'black',
     value = FALSE)

char_vect1b[indx]


# Let's say we want to replace parts of a 
# character vector based on some sort of pattern

char_vect1_a = 
  paste(char_vect1, 'person', sep = ' ')
char_vect1_a

# Let's replace "person" with "individual" 

gsub(x = char_vect1_a, pattern = 'person',
     replacement = 'individual')

# Let's remove whitespace

gsub(x = char_vect1_a, pattern = ' ',
     replacement = '')

# For more on character manipulation, see: 
# https://www.gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf

#### Factor Vectors #### 

# Let's construct one from scratch 

fact_vect = c(1, 2, 3, 4, 5)
fact_vect = factor(fact_vect, 
       labels = c('white', 'black', 'latinx',
                  'asian', 'other'))

fact_vect_b = rep(fact_vect, 2)

# What happens when you convert a factor? 

as.numeric(fact_vect_b)

as.character(fact_vect_b)

as.numeric(as.character(fact_vect_b))

# Levels 

levels(fact_vect_b)

# You can relevel the reference category 

relevel(x = fact_vect_b, ref = 'latinx')


#### Numeric Vectors #### 

num_vect1 = c(1, 2, 3, 4, 5)
num_vect2 = c(11, 12, 13, 14, 15)

# We can run functions over numeric vectors

mean(num_vect1)
median(num_vect1)
sd(num_vect1)

mean(num_vect2)
median(num_vect2)
sd(num_vect2)

log(num_vect1)
log(num_vect2)

# If numeric vectors have the same number of 
# elements, we can pass mathematical operations 
# on them such as addition, subtraction, division
# multiplication, etc. 

num_vect1
num_vect2
num_vect1 + num_vect2
num_vect1 - num_vect2
num_vect1 / num_vect2
num_vect1 * num_vect2


num_vect1_na = num_vect1
num_vect1_na[5] = NA

# Missing element vector

num_vect1_na + num_vect2

#### Matrices and dataframes #### 

# Datasets in R are formulated in an n x k 
# format, just like matrices. They are 
# constructed of rows and columns, but there 
# are differences between ~~matrices~~ and 
# ~~dataframes~~ The subtleties and distinctions
# we will discuss via practice. 

library(tidyverse)
library(dplyr)

# Setting the seed


# set.seed(2317)
# set.seed(123)

# Seed example

# seed_vect = rnorm(1000)
# sample(seed_vect, 2)

# [1] -2.196813 -0.284845
# [1] -0.3745809 -1.6015362

set.seed(2317)

norm_vect = rnorm(10)
race_vect = c('black', 'black', 'white', 'asian',
              'asian', 'asian', 'latinx',
              'black', 'white', 'black')
norm_vect2 = rnorm(n = 10, mean = 3)
norm_vect2[5]

mat = cbind(norm_vect, norm_vect2, race_vect)
mat_rbind = rbind(norm_vect, norm_vect2, race_vect)

# Lets look at the propertise of the matrix

str(mat)
glimpse(mat)

# You could also generate a matrix via the 
# matrix() function, but you'll notice, it 
# doesnt fix the character problem 

matrix(c(norm_vect, norm_vect2, race_vect),
       nrow = 10, ncol = 3)

# You can also select rows and columns or 
# elements within rows and columns on the index
# of the matrix, using the [ ]

mat[, 1]

mat[, 3]

mat[1, 1]

mat[1, 3]




