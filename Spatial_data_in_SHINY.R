library(leaflet)
library(leafem)
library(mapview)

# Create the map
my_map <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=-1.6178, lat=54.9783, popup="World's most important city!")
my_map #display the map
