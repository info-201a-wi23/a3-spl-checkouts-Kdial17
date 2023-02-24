library(dplyr)
library(ggplot2)
library(stringr)

spl_data <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

spl_df <- spl_data %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-01"))
spl_df$date <- as.Date(spl_df$date, format = "%Y-%m-%d")

hoover_df <- spl_df %>% filter(str_detect(Creator, "Colleen Hoover"))

hoover_ends_df <- hoover_df %>%
  filter(str_detect(Title, "It Ends with Us: A Novel"))

silvera_df <- spl_df %>% 
  filter(str_detect(Creator, "Adam Silvera"))

silvera_end_df <- silvera_df %>% 
  filter(str_detect(Title, "They Both Die at the End"))

miller_df <- spl_df %>%
  filter(str_detect(Creator, "Madeline Miller"))

miller_song_df <- miller_df %>% 
  filter(str_detect(Title, "The Song of Achilles"))

reid_df <- spl_df %>%
  filter(str_detect(Creator, "Taylor Jenkins Reid"))

reid_hugo_df <- reid_df %>%
  filter(str_detect(Title, "The Seven Husbands of Evelyn Hugo: A Novel"))

chart_2 <- ggplot(data = hoover_ends_df) +
  geom_smooth(aes(x = date, y = Checkouts, color = "It Ends with Us")) +
  geom_smooth(data = silvera_end_df, aes(x = date, y = Checkouts, color = "They Both Die in the End")) +
  geom_smooth(data = miller_song_df, aes(x = date, y = Checkouts, color = "The Song of Achilles")) +
  geom_smooth(data = reid_hugo_df, aes(x = date, y = Checkouts, color = "The Seven Husbands of Evelyn Hugo")) +
  labs(title = "Books promoted on TikTok have a greater number of Checkouts", x = "Date", y = "Number of Checkouts", colour = "Book Title") +
  scale_y_continuous(breaks = seq(0, 400, 50))
chart_2
