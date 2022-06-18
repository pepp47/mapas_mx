# mapa de carreteras federales --------------------------------------------

setwd("C:/Users/mejic/Downloads/mapas/conjunto de datos_m")


library(tidyverse)
library(rgdal)
library(sf)
library(RColorBrewe)
library(ggthemes)



map_est<-read_sf("gdb_ref_esta_ine_2009.shp")
map_vial<-read_sf("red_vial.shp")

# Filtros para el mapa Federal y sin peaje

map_vial%>%
  filter(JURISDI== "Fed." & PEAJE == "No" )%>%
  arrange(LONGITUD)->map_vial_1
  

map_vial_1$RECUBRI<-factor(map_vial_1$RECUBRI)
 
  ggplot(map_est)+
     geom_sf()+
     xlab("Longitud") + ylab("Latitud")+
     geom_sf(data=map_vial_1, aes(color = RECUBRI), 
             key_glyph = "point")+
   theme_economist()+
  scale_color_wsj(name="Recubrimiento\nde las\ncarreteras")+
  labs(title = "Carreteras federales, sin peaje, 2021")->mapa_ca

ggsave( "mapa_ca.png", dpi = 500, height = 6, width  = 10  )







