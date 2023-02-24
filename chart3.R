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

reid_df <- spl_df %>%
  filter(str_detect(Creator, "Taylor Jenkins Reid"))

reid_hugo_df <- reid_df %>%
  filter(str_detect(Title, "The Seven Husbands of Evelyn Hugo: A Novel"))

reid_hugo_df$Title[str_detect(reid_hugo_df$Title, "The Seven Husbands of Evelyn Hugo: A Novel")] <- "The Seven Husbands of Evelyn Hugo"

henry_df <- spl_df %>%
  filter(str_detect(Creator, "Emily Henry"))

henry_lovers_df <- henry_df %>%
  filter(str_detect(Title, "Book Lovers"))

henry_lovers_df$Title[str_detect(henry_lovers_df$Title, "Book Lovers")] <- "Book Lovers"

sally_df <- spl_df %>%
  filter(str_detect(Creator, "Sally Rooney"))

sally_world_df <- sally_df %>%
  filter(str_detect(Title, "Beautiful World, Where Are You: A Novel"))

sally_world_df$Title[str_detect(sally_world_df$Title, "Beautiful World, Where Are You: A Novel")] <- "Beautiful World, Where Are You: A Novel"

chart_3 <- ggplot(data = hoover_verity) +
  geom_smooth(aes(x = date, y = Checkouts, color = "Verity")) +
  geom_smooth(data = reid_hugo_df, aes(x = date, y = Checkouts, color = "The Seven Husbands of Evelyn Hugo")) +
  geom_smooth(data = henry_lovers_df, aes(x = date, y = Checkouts, color = "Book Lovers")) +
  geom_smooth(data = sally_world_df, aes(x = date, y = Checkouts, color = "Beautiful World, Where Are You: A Novel")) +
  labs(title = "TikTok's Impact on Book Checkouts", x = "Date", y = "Number of Checkouts", colour = "Book Title") +
  scale_y_continuous(breaks = seq(0, 500, 100))
chart_3