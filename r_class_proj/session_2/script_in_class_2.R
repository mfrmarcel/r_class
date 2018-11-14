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


mat = cbind(norm_vect, norm_vect2, race_vect)
mat_rbind = rbind(norm_vect, norm_vect2, race_vect)

# Lets look at the properties of the matrix

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

# Let's try to fix the fact that our matrix has some
# charactar vectors 

mat[, 1] = as.numeric(mat[, 1])
mat[, 2] = as.numeric(mat[, 2])

mat[, 1:2] = apply(X = mat[, 1:2], MARGIN = 2,
      FUN = function(x) as.numeric(x))

# Problem: Any non-numeric vector in a matrix will 
# force the matrix to have all its columns 
# be character vectors

mat2 = apply(X = mat[, 1:2], MARGIN = 2,
             FUN = function(x) as.numeric(x))

# We can apply functions over columns

mean(mat2[, 1])

mean(mat2[, 2])

# We can also apply functions over rows

mean(mat2[1, ])
median(mat2[1, ])
range(mat2[1, ])

# Matrix properties apply --- addition.

mat3 = cbind(rnorm(10, 5), rnorm(10, 3, 2),
             rnorm(10, 2, 1))
mat2 = cbind(mat2, norm_vect)

mat2 + mat3 
mat2 - mat3 

# Multiplication (element wise)

mat2 * mat3

# Division (element wise)

mat2 / mat3

# Multiplication (matrix algebra sense)
# %*% %*% 

mat2 %*% mat3 

mat2 %*% t(mat3)

# Let's work with a different kind of object
# DATAFRAMES! 

df1 = as.data.frame(
  cbind(norm_vect, norm_vect2, race_vect),
  stringsAsFactors = FALSE
)

# DFs are nice because we can call column-wise 
# vectors easily 

df1$norm_vect
df1$norm_vect2
df1$race_vect

class(df1$norm_vect)
class(df1$norm_vect2)
class(df1$race_vect)

df1$norm_vect = as.numeric(df1$norm_vect)
df1$norm_vect2 = as.numeric(df1$norm_vect2)

# install.packages('tibble')
# library(tibble)

str(df1)
glimpse(df1)

# Although dataframes behave in similar ways 
# as matrices and have a simialr structure, they're
# not matrices

df1$norm_vect * df1$norm_vect2
df1$norm_vect / df1$norm_vect2
df1$norm_vect + df1$norm_vect2
df1$norm_vect - df1$norm_vect2

# You can run a bunch of different manipulations 
# on dataframes 

colnames(df1) = c('var1', 'var2', 'race')

# You can also generate new variables/vectors/columns
# quite easily with the dataframe framework 

df1$var3 = NA 
df1$var3 = df1$var1 * 3 

df1$var4 = NA
df1$var4 = df1$var1 / df1$var2

# As an aside, you can call by variable name 

df1[, c('var1', 'var2', 'var3')]
df1[, 'race']

# You can also use various dplyr functions on 
# dataframes 

# library(dplyr) 

# DPLYR VERSION

df1_a = df1 %>% mutate(var5 = var2 * var3) %>% 
  rename(first_var = var1) %>% 
  mutate(race = recode(race, `black` = 'b',
                       `white` = 'w', 
                       `asian` = 'a',
                       `latinx` = 'l'))

# BASE R VERSION

df1_a_base = df1

df1_a_base$var5 = NA
df1_a_base$var5 = df1_a_base$var2 * df1_a_base$var3
colnames(df1_a_base)[1] = 'first_var'
df1_a_base$race[df1_a_base$race == 'black'] = 'b'
df1_a_base$race[df1_a_base$race == 'white'] = 'w'
df1_a_base$race[df1_a_base$race == 'asian'] = 'a'
df1_a_base$race[df1_a_base$race == 'latinx'] = 'l'
