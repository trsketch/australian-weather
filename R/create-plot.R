# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data using read_csv

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am a location

api_key = read_api_key()
city = "Newcastle"

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point(colour = "cyan")

# Save the plot in graphics/ hi
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)
