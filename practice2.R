data2 <- read.csv(file.choose())
View(data2)
str(data2)


data2$age_fac <- as.factor(data2$age)
str(data2)





data2$diagnosis_fac <- as.factor(data2$diagnosis)
str(data2)



data2$diagnosis_num <- ifelse(data2$diagnosis_fac == "cancer", 3 , 2)
class(data2$diagnosis_num)

data2$diagnosis_num <- as.factor(data2$diagnosis_num)
class(data2$diagnosis_num)






data2$gender_fac <- as.factor(data2$gender)
str(data2)



data2$gender_num <- ifelse(data2$gender_fac == "female", 1 , 0)
class(data2$gender_num)

data2$gender_num <- as.factor(data2$gender_num)
class(data2$gender_num)






save.image(file = "full_workspace.RData")

load("full_workspace.RData")