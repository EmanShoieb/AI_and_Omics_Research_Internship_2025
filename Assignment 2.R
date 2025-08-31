

data <- read.csv(file.choose())
View(data)
str(data)

is.na(data)

sum(is.na(data))

colSums(is.na(data))

rowSums(is.na(data))



clean_data_1 <-- na.omit(data)
clean_data_1

claen_data_2 <- data[, colSums(is.na(data))==0]
claen_data_2

clean_data_3 <- data

clean_data_3[is.na(clean_data_3)] <- 0
clean_data_3


clean_data_4 <- data
clean_data_4[is.na(clean_data_4)] <- mean(data$age, na.rm = TRUE)
clean_data_4

function(x)
{weight/(height^2)}
 

calculate_BMI <- function(weight, height){
  bmi <- weight/(height^2)
  
  return(bmi)
}

calculate_BMI(weight = 60, height = 1.75)

calculate_BMI(70, 1.86)

calculate_BMI <- function(weight, height= 1.75){
  bmi <- weight/(height^2)
  
  return(bmi)
}
calculate_BMI(60)



input_dir <- "Raw_Data"
output_dir <- "Resultts"

if(dir.exists(output_dir)){
  dir.create(output_dir)
}


files_to_process <- c("BMI_data_1.csv" , "BMI_data_2.csv")

result_list <- list()

for (file_names in files_to_process) {
  cat("\nProcessing:", file_names, "\n")
  
  input_file_path <- file.path(input_dir, file_names)
  
  
  data <- read.csv(input_file_path, header = TRUE)
  cat("File imported. Checkinh for missing values...\n")
  
  if("height" %in% names(data)){
    missing_count <- sum(is.na(data$height))
    
    cat("Missing values in 'height':", missing_count, "\n")
    data$height[is.na(data$heirgt)] <- mean(data$height, na.rm = TRUE)
    
  }
  
  if("weight" %in% names(data)){
    missing_count <- sum(is.na(data$weight))
    
    cat("Missing values in 'weight':", missing_count, "\n")
    data$weight[is.na(data$weight)] <- mean(data$weight, na.rm = TRUE)
    
  }
  data$bmi <- caculate_BMI(data$weight, data$height)
  cat("BMI has been calculated successfully.\n")
  
  result_list[[file_names]] <- data
  
  output_file_path <- file.path(output_dir, paste0("BMI_results", file_names))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("Resuls daved to:", output_file_path, "\n")
  
  
}
  

results_1 <- result_list[[1]]
results_2 <- result_list[[2]]
