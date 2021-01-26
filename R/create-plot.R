# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "Sydney"

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point() + 
  labs(caption = "Australian Weather",
       x = "Temperature (degrees)",
       y = "Humidity (metric)") +
  facet_wrap(~WindDir9am)

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)


bar_plot = df %>% 
  group_by(Location) %>% 
  summarise(average_rainfall =mean(Rainfall, na.rm = TRUE)) %>% 
  ggplot(aes(y = Location, x = average_rainfall)) + 
  geom_col()

# Save the plot in graphics/
ggsave(filename = "graphics/bar-plot-average-rainfall.png", plot = bar_plot)
