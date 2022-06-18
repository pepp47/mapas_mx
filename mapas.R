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
   theme_bw()+
   xlab("Longitud") + ylab("Latitud")+
   geom_sf(data=map_vial_1, aes(color = RECUBRI))+
   scale_color_brewer(name="Recubrimiento\nde las\ncarreteras",
                      palette = "Dark2")+
   labs(title = "Carreteras federales, con y sin peaje, 2021")->mapa_ca

ggsave(mapa_ca, "mapa_ca.png", dpi = 500 )





dir()

