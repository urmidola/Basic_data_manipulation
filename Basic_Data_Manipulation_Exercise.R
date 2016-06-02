# Read refine_original.csv file
mydata <- read.csv("refine_original.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE, strip.white = TRUE)
mydata
Company <- tolower(mydata$company)
Company[1:6] <- c("philips")
Company[14:16] <- c("philips")
Company[7:13] <- c("akzo")
Company[22] <- c("unilever")
Company
#Separate product code and product number into separate columns called product_code and product_number
library(dplyr)
library(tidyr)
Product_details <- mydata[2]
Product_details_1 <- separate(Product_details, Product.code...number, c("Product_code", "Product_number"), sep = "-")
Product_details_1
#Add a column with the product category for each product code
Product_details_1$Product_code
Product_category <- c("Smartphone", "TV", "Laptop", "Tablet")
I <- Product_details_1$Product_code == "p"
Product_details_1 [I, "Product_category"] <- "Smartphone"
I <- Product_details_1$Product_code == "v"
Product_details_1 [I, "Product_category"] <- "TV"
I <- Product_details_1$Product_code == "x"
Product_details_1 [I, "Product_category"] <- "Laptop"
I <- Product_details_1$Product_code == "q"
Product_details_1 [I, "Product_category"] <- "Tablet"
Product_category1 <- Product_details_1$Product_category 
#Create a new column 'full_address' for geocoding
address1 <- mydata[, 3:5]
address1
Full_address <- unite(address1, "Full_address", address, city, country, sep = ",")
Full_address
#Add four binary columns for company
Binary_column <- c("Company_philips", "Company_akzo", "Company_vanhouten", "Company_unilever")
Company
Company_philips <- ifelse(company1 == "philips", print (1), print(0))
Company_akzo <- ifelse(company1 == "akzo", print (1), print(0))
Company_vanhouten <- ifelse(company1 == "van houten", print (1), print(0))
Company_unilever <- ifelse(company1 == "unilever", print (1), print(0))
Company_philips
Company_akzo
Company_vanhouten
Company_unilever
Binary_column <- cbind (Company_philips, Company_akzo, Company_vanhouten, Company_unilever)
Binary_column
#Add four binary columns for product category
Product_category1
Product_smartphone <- ifelse(Product_category1 == "Smartphone", print (1), print (0))
Product_tv <- ifelse(Product_category1 == "TV", print (1), print (0))
Product_laptop <- ifelse(Product_category1 == "Laptop", print (1), print (0))
Product_tablet <- ifelse(Product_category1 == "Tablet", print (1), print (0))
Product_smartphone
Product_tv
Product_laptop
Product_tablet
New_column <- cbind(Product_smartphone, Product_tv, Product_laptop, Product_tablet)
New_column
refine_clean <- cbind(Company, Product_details_1, Full_address, Binary_column, New_column)
refine_clean
write.csv(refine_clean, file = "refine_clean.csv", row.names = FALSE)
