library(tidyverse)

airbnb = read_csv("airbnb/dataset/AB_NYC_2019.csv", show_col_types = FALSE)

head(airbnb)

colnames(airbnb)

names(airbnb)

View(airbnb)

# How many rows and columns?
dim(airbnb)

glimpse(airbnb)

class(airbnb$room_type)

unique(airbnb$neighbourhood_group)
unique(airbnb$room_type)

table(airbnb$room_type)

barplot(sort(table(airbnb$neighbourhood_group), decreasing = TRUE))

airbnb %>% 
  select(neighbourhood_group) %>% 
  count(neighbourhood_group) %>% 
  arrange(desc(n)) %>% 
  View()

# Check for missing data
airbnb[is.na(airbnb$id), ]
length(airbnb[is.na(airbnb$name), ])

class(airbnb$neighbourhood_group)

airbnb$neighbourhood_group <- as.factor(airbnb$neighbourhood_group)
airbnb$room_type <- as.factor(airbnb$room_type)

# Reorder the factor levels
airbnb$room_type <- factor((airbnb$room_type), 
                           c("Shared room",
                             "Private room",
                             "Entire home/apt"))

class(airbnb$neighbourhood_group)

# names(airbnb)

levels(airbnb$room_type)

# Get missing data
airbnb %>% 
  filter(!complete.cases(.)) %>% 
  View()
