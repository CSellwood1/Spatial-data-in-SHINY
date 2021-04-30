library(leaflet)
library(leafem)
library(mapview)

# Create the map
my_map <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=-1.6178, lat=54.9783, popup="World's most important city!")
my_map #display the map

#try using different backdrops to show different map features
#this shows satellite map overlaid with main roads and names of main roads
leaflet() %>% 
  addProviderTiles(providers$Esri.WorldImagery) %>% 
  addProviderTiles(providers$Stamen.TonerLines,
                   options = providerTileOptions(opacity = 0.5)) %>%
  addProviderTiles(providers$Stamen.TonerLabels) %>% 
  addMarkers(lng=-1.6178, lat=54.9783, popup="World's most important city!")

#changing marker symbols
leaflet() %>%
  addTiles() %>%  
  addCircleMarkers(lng=-1.6178, lat=54.9783,
                   popup="The world's most important city!", radius = 5, color = "red") #makes a circular, red marker

#make a london map
my_mapL <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=-0.1278, lat=51.5074, popup="World's most important city!")
my_mapL

#add a circle marker with a label
my_mapL <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=-0.1278, lat=51.5074, popup="World's most important city!") %>%
  addCircleMarkers(lng=-0.1278, lat=51.5074,
                   popup="London population 8 mil",
                   labelOptions = labelOptions(textsize = "15px"))
                   
my_mapL