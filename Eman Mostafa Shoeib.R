dir.create("data")
dir.create("script")
dir.create("results")

gene_expression <- c(2.3, 3.8, 3.9, 5.6, 9.4)
mean_result <- mean(gene_expression)
plot(gene_expression)
hist(gene_expression)
barplot(gene_expression)
summary(gene_expression)

x <- 24
class(x)

y <- 40
class(y)

z <- 24L
class(z)

var_1 <- c(28.4, 23.7, 2.9)
class(var_1)

var_2 <- as.integer(var_1)
class(var_2)
var_3 <- as.numeric(var_2)
class(var_3)

var_4 <- c("gene1", "gene2", "gene3")
class(var_4)

var_5 <- c("3.8", "4.6", "5.9")
class(var_5)


var_6 <- c(3.8, 4.6, 5.9)
class(var_6)
mean(var_6)


disease_status <- c("cancer", "normal", "cancer", "cancer", "normal")
class(disease_status)


disease_status <- as.factor(disease_status)
class(disease_status)
disease_status

disease_status <- factor(disease_status,
                         levels = c("normal", "cancer"))
disease_status




data <- read.csv(file.choose())
View(data)
str(data)


data$gender_fac <- as.factor(data$gender)
str(data)

data$gender_num <- ifelse(data$gender_fac == "female",1 ,0)
class(data$gender_num)

data$gender_num <- as.factor(data$gender_num)
class(data$gender_num)


data$diagnisis_fac <- as.factor(data$diagnosis)
str(data)

data$diagnosis <- factor(data$diagnosis,
                         levels = c("Cancer", "Normal"))
data$diagnosis


data$smoker_fac <- as.factor(data$smoker)
str(data)

data$smoker <- factor(data$smoker,
                         levels = c("Yes", "No"))
data$smoker



data$age_fac <- as.factor(data$age)
str(data)



data$bmi_fac <- as.factor(data$bmi)
str(data)




write.csv(disease_status, file = "results/patient_data.csv")




save.image(file = "full_workspace.RData")

save(gene_expression, disease_status, file = "workspace.RData")


load("workspace.RData")
load("full_workspace.RData")


