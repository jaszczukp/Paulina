library(readxl)
library(dplyr)

M4_2019_read <- read_xlsx("1-1_achievement-results-M4.xlsx", skip = 4) %>%
  select(3, 5, 9, 10, 13, 14) %>%
  rename("Score" = "Average \r\nScale Score", "5th_percentile" = "Mathematics Achievement Distribution",
         "25th_percentile" = "...10", "75th_percentile" = "...13", "95th_percentile" = "...14") %>%
  na.omit()
M4_2015_read
M4_2015_read <- read_xlsx("1_1_math-distribution-of-mathematics-achievement-grade-4.xlsx", skip = 4) %>%
  select(3, 4, 7, 8, 11, 12) %>%
  rename("Score" ="Average\r\nScale Score", "5th_percentile" = "Mathematics Achievement Distribution",
         "25th_percentile" = "...8", "75th_percentile" = "...11", "95th_percentile" = "...12") %>% 
  na.omit()


M4_countries <- M4_2015_read[M4_2015_read$Country %in% M4_2019_read$Country, c("Country")]

M4_2019 <- merge(x = M4_countries, y = M4_2019_read, by = "Country", all.x = TRUE)
M4_2015 <- merge(x = M4_countries, y = M4_2015_read, by = "Country", all.x = TRUE)

M4_2019 <- mutate(M4_2019, "Year" = "2019") 
M4_2015 <- mutate(M4_2015, "Year" = "2015") 

M4_merge15 <- rename(M4_2015, "Score2015" = "Score", 
                     "5th_percentile2015" = "5th_percentile",
                     "25th_percentile2015" = "25th_percentile",
                     "75th_percentile2015" = "75th_percentile",
                     "95th_percentile2015" = "95th_percentile")

M4_merge19 <- rename(M4_2019,
                     "Score2019" = "Score",
                     "5th_percentile2019" = "5th_percentile",
                     "25th_percentile2019" = "25th_percentile",
                     "75th_percentile2019" = "75th_percentile",
                     "95th_percentile2019" = "95th_percentile")

M4_table <- merge(x = M4_merge15, y = M4_merge19, by = "Country")
head(M4_table)
M4 <- rbind(M4_2015, M4_2019)
colnames(S4_table)


S4_2019_read <- read_xlsx("2-1_achievement-results-S4.xlsx", skip = 4) %>%
  select(3, 5, 9, 10, 13, 14) %>%
  rename("Score" = "Average \r\nScale Score", "5th_percentile" = "Science Achievement Distribution",
         "25th_percentile" = "...10", "75th_percentile" = "...13", "95th_percentile" = "...14") %>%
  na.omit()

S4_2015_read <- read_xlsx("1_1_science-distribution-of-science-achievement-grade-4.xlsx", skip = 4) %>%
  select(3, 4, 7, 8, 11, 12) %>%
  rename("Score" ="Average\r\nScale Score", "5th_percentile" = "Science Achievement Distribution",
         "25th_percentile" = "...8", "75th_percentile" = "...11", "95th_percentile" = "...12") %>% 
  na.omit()


S4_countries <- S4_2015_read[S4_2015_read$Country %in% S4_2019_read$Country, c("Country")]

S4_2019 <- merge(x = S4_countries, y = S4_2019_read, by = "Country", all.x = TRUE)
S4_2015 <- merge(x = S4_countries, y = S4_2015_read, by = "Country", all.x = TRUE)

S4_2019 <- mutate(S4_2019, "Year" = "2019") 
S4_2015 <- mutate(S4_2015, "Year" = "2015") 

                 
S4_merge15 <- rename(S4_2015, "Score2015" = "Score", 
                       "5th_percentile2015" = "5th_percentile",
                       "25th_percentile2015" = "25th_percentile",
                       "75th_percentile2015" = "75th_percentile",
                       "95th_percentile2015" = "95th_percentile")

S4_merge19 <- rename(S4_2019,
                       "Score2019" = "Score",
                       "5th_percentile2019" = "5th_percentile",
                       "25th_percentile2019" = "25th_percentile",
                       "75th_percentile2019" = "75th_percentile",
                       "95th_percentile2019" = "95th_percentile")

S4_table <- merge(x = S4_merge15, y = S4_merge19, by = "Country")

S4 <- rbind(S4_2015, S4_2019)

