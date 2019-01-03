bank_data  <- read.csv2("bank-full.csv",na.strings = 'na')
View(bank_data)
str(bank_data)
summary(bank_data)

#PART A: Create a visual for representing missing values in the dataset.

#assigning unknown values to na
bank_data[bank_data == 'unknown'] = 'na'

#capturing all rows not complete
bank_data_missing <- bank_data[!complete.cases(bank_data),]
str(bank_data_missing)
summary(bank_data_missing)

#count and graphical display of missing values column wise
library(mice)
md.pattern(bank_data_missing)

# VISUAL DISPLAY
library(VIM)

# display by magnitude
aggr(bank_data_missing, prop = F, numbers = T)

# display by proportion
aggr(bank_data_missing, prop = T, numbers = T)



# PART B: Show a distribution of clients based on a Job.
table(bank_data$job)
library(ggplot2)
qplot(x = bank_data$job)


#PART C: Check whether is there any relation between Job and Marital Status
#Ho : there is no relationship between job and marital status
#H1 : there is relationship between job and marital status

levels(bank_data$job)
levels(bank_data$marital)

contigency_table <- table(bank_data$job, bank_data$marital)
chisq.test(bank_data$job,  bank_data$marital, correct=FALSE)
## since p-value < significance level, we reject Ho and conclude there is a relationship between job and marital status


#PART D: Check whether is there any association between Job and Education
#Ho : there is no association between job and education
#H1 : there is association between job and education

levels(bank_data$job)
levels(bank_data$education)

contigency_table_2 <- table(bank_data$job, bank_data$education)
chisq.test(bank_data$job,  bank_data$education, correct=FALSE)
## since p-value < significance level, we reject Ho and conclude there is a relationship between job and education


















