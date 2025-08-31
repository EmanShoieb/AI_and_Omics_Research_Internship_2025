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




is.na(data2)

sum(is.na(data2))

colSums(is.na(data2))

rowSums(is.na(data2))



classify_gene <- function(logFC, padj) {
  if (is.na(padj)) padj <- 1
  if (logFC > 1 & padj < 0.05) {
    return("Upregulated")
  } else if (logFC < -1 & padj < 0.05) {
    return("Downregulated")
  } else {
    return("Not_Significant")
  }
}


input_dir <- "Raw_Data"
output_dir <- "Resultts"

if(dir.exists(output_dir)){
  dir.create(output_dir)
}


files_to_process <- c("DEGs_Data_1.csv" , "DEGs_Data_2.csv")

result_list <- list()

files <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")






for (file_names in files_to_process) {
  data <- read.csv(file)
  data$padj[is.na(data$padj)] <- 1
  
  status <- vector("character", length = nrow(data))
  for (i in 1:nrow(data)) {
    status[i] <- classify_gene(data$logFC[i], data$padj[i])
  }
  data$status <- status
  
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

results_dir <- "Results"
if (!dir.exists(results_dir)) dir.create(results_dir)


write.csv(data, file = "results/data.csv")
write.csv(data2, file = "results/data2.csv")



save.image(file = "full_workspace.RData")

save(data, data2, file = "workspace.RData")


load("workspace.RData")
load("full_workspace.RData")




