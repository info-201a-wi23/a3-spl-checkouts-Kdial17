library(dplyr)
library(ggplot2)
library(stringr)

spl_data <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

spl_df <- spl_data %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-01"))
spl_df$date <- as.Date(spl_df$date, format = "%Y-%m-%d")

hoover_df <- spl_df %>% 
  filter(str_detect(Creator, "Colleen Hoover"))

hoover_verity <- hoover_df %>% 
  filter(str_detect(Title, "Verity"))

hoover_late_df <- hoover_df %>% 
  filter(str_detect(Title, "Too Late"))

chart_1 <- ggplot(data = hoover_verity) +
  geom_smooth(aes(x = date, y = Checkouts, color = "Verity")) +
  geom_smooth(data = hoover_late_df, aes(x = date, y = Checkouts, color = "Too Late")) +
  labs(title = "Verity Checkouts Dominates Too Late", x = "Date", y = "Number of Checkouts", colour = "Book Title")
chart_1