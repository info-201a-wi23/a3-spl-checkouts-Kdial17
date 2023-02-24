library("dplyr")
library("stringr")
library("ggplot2")
library("scales")

spl_data <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

spl_df <- spl_data %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-01"))
spl_df$date <- as.Date(spl_df$date, format = "%Y-%m-%d")

hoover_df <- spl_df %>% filter(str_detect(Creator, "Colleen Hoover"))
hoover_df

spl_data <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

spl_df <- spl_data %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-01"))
spl_df$date <- as.Date(spl_df$date, format = "%Y-%m-%d")

hoover_df <- spl_df %>% filter(str_detect(Creator, "Colleen Hoover"))
hoover_df


- "average checkouts"
hoover_mean_checkouts_verity <- hoover_df %>% group_by(Title) %>% 
  summarize(avg_checkouts = mean(Checkouts, na.rm = T)) %>% 
  filter(str_detect(Title, "Verity")) %>% 
  pull(avg_checkouts)
hoover_mean_checkouts_verity

"The average checkouts for the book Verity is 242.384"
  
- "min & max checkouts"
hoover_most_checkouts <- hoover_df %>%
                         filter(str_detect(Title, "Verity")) %>% 
                         filter(Checkouts == max(Checkouts, na.rm = T)) %>% 
                         pull(Checkouts)       
hoover_most_checkouts

"The most checkouts for the book Verity is 313"

hoover_month_most_checkouts <- hoover_df %>% 
  filter(str_detect(Title, "Verity")) %>% 
  filter(Checkouts == max(Checkouts, na.rm = T)) %>% 
  pull(CheckoutMonth)       
hoover_month_most_checkouts 

"The month with the most checkouts for the book Verity was October 2022"

hoover_least_checkouts <- hoover_df %>%
  filter(str_detect(Title, "Verity")) %>% 
  filter(Checkouts == min(Checkouts, na.rm = T)) %>% 
  pull(Checkouts)       
hoover_least_checkouts

"The lowest checkouts for the book Verity was 145"

hoover_month_least_checkouts <- hoover_df %>% 
  filter(str_detect(Title, "Verity")) %>% 
  filter(Checkouts == min(Checkouts, na.rm = T)) %>% 
  pull(CheckoutMonth)       
hoover_month_least_checkouts

"The month with the least checkouts for the book verity was January 2022"

- "What is the month or year with the most/least checkouts for ebooks?"

hoover_most_ebook_checkouts <- hoover_df %>% 
  filter(str_detect(MaterialType, "EBOOK")) %>% 
  filter(Checkouts == max(Checkouts, na.rm = T)) %>% 
  pull(CheckoutMonth)       
hoover_most_ebook_checkouts

"The month with the most ebook checkouts for the author Colleen Hoover was October 2022"

- "How has the number of print book checkouts changed over time?"

"For the books I have chose, there was no data for printed versions."

