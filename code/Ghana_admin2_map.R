
pacman::p_load(tidyverse,tidylog, shiny, flextable, magrittr,tmap,sf)
gh_adm0<-read_sf("data/gha_admin_shp/gha_admbnda_adm0_gss_20210308.shp")
gh_adm2<-read_sf("data/gha_admin_shp/gha_admbnda_adm2_gss_20210308.shp")

#tmap_mode("view")
#map1=tm_shape(gh_adm2)+tm_polygons(col="ADM1_EN")

#map2=tm_shape(edu_new)+tm_symbols(size=0.1,col="amenity")

#map1+map2

choose_region=function(x){
  filter(gh_adm2,ADM1_EN==x)
}
 #choose_region("Greater Accra")

 choose_school=function(x,y){
   filter(edu_new,amenity==x)
   #filter(y) if region was in edu_new data set can filter by coordinate bounding box
 }

choices_reg=factor(gh_adm2$ADM1_EN)

#levels(choices_reg)

 #tm_shape(choose_region("Greater Accra"))+tm_polygons(col="ADM1_EN")+
   #tm_shape( choose_school("Primary"))+tm_symbols(size=0.1,col="amenity")
