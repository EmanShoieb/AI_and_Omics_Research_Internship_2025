getwd()
setwd("..")

data <- read.csv(file.choose())
View(data)
str(data)


data2 <- read.csv(file.choose())
View(data2)
str(data2)

is.na(data)

sum(is.na(data))

colSums(is.na(data))

rowSums(is.na(data))




claen_data_2 <- data[, colSums(is.na(data))==0]
claen_data_2

clean_data_3 <- data

clean_data_3[is.na(clean_data_3)] <- 0
clean_data_3


clean_data_4 <- data
clean_data_4[is.na(clean_data_4)] <- mean(data$Gene_Id, na.rm = TRUE)
clean_data_4


is.na(data2)

sum(is.na(data2))

colSums(is.na(data2))

rowSums(is.na(data2))




claen_data2_2 <- data2[, colSums(is.na(data2))==0]
claen_data2_2

clean_data2_3 <- data2

clean_data2_3[is.na(clean_data2_3)] <- 0
clean_data2_3


clean_data2_4 <- data2
clean_data2_4[is.na(clean_data2_4)] <- mean(data$Gene_Id, na.rm = TRUE)
clean_data2_4

function(x)
{padj/(logFC^2)}


calculate_BMI <- function(padj, logFC){
  bmi <- padj/(logFC^2)
  
  return(bmi)
}



calculate_BMI(70, 1.86)



input_dir <- "Raw_Data"
output_dir <- "Resultts"

if(dir.exists(output_dir)){
  dir.create(output_dir)
}




files_to_process <- c("DEGs_Data_1.csv" , "DEGs_Data_2.csv")

result_list <- list()

for (file_names in files_to_process) {
  cat("\nProcessing:", file_names, "\n")
  
  input_file_path <- file.path(input_dir, file_names)
  
  
  data <- read.csv(input_file_path, header = TRUE)
  cat("File imported. Checkinh for missing values...\n")
  
  if("logFC" %in% names(data)){
    missing_count <- sum(is.na(data$logFC))
    
    cat("Missing values in 'logFC':", missing_count, "\n")
    data$logFC[is.na(data$logFC)] <- mean(data$logFC, na.rm = TRUE)
    
  }
  
  if("padj" %in% names(data)){
    missing_count <- sum(is.na(data$padj))
    
    cat("Missing values in 'padj':", missing_count, "\n")
    data$padj[is.na(data$padj)] <- mean(data$padj, na.rm = TRUE)
    
  }
  data$bmi <- caculate_BMI(data$padj, data$logFC)
  cat("BMI has been calculated successfully.\n")
  
  result_list[[file_names]] <- data
  
  output_file_path <- file.path(output_dir, paste0("BMI_results", file_names))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("Resuls daved to:", output_file_path, "\n")
  
  
}


results_1 <- result_list[[1]]
results_2 <- result_list[[2]]



view(results_1)
view(results_2)
