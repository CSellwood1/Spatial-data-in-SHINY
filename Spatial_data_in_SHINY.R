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
                   label = labelOptions(textsize = "15px"))
my_mapL

##
library(sf)
#read in shape files
nafferton_fields<- st_read("C:\\Users\\nick\\Documents\\Newcastle\\Fourth Year\\BIO8068 Management and Visualisation of Data\\Spatial-data-in-SHINY\\www\\naff_fields\\naff_fields.shp")
#retrieve coord reference system from the object
st_crs(nafferton_fields)
#this shows the EPSG code as 6277, want it as the more usual 27700
#transform to correct EPSG
nafferton_fields <- nafferton_fields %>% 
  st_set_crs(27700) %>% 
  st_transform(27700)
#transform to lat/long
nafferton_fields_ll <- st_transform(nafferton_fields, 4326)
#plot the data
plot(nafferton_fields_ll)

