
pacman::p_load(tidyverse,tidylog, shiny, flextable, magrittr,tmap,sf,DT)
gh_adm0<-read_sf("data/gha_admin_shp/gha_admbnda_adm0_gss_20210308.shp")
gh_adm2<-read_sf("data/gha_admin_shp/gha_admbnda_adm2_gss_20210308.shp")

#load edu facilities
#try<-read_sf("data/hotosm_gha_education_facilities_gpkg/hotosm_gha_education_facilities.gpkg")
#try<-read_sf("data/hotosm_gha_edu_facilities_points_shp/hotosm_gha_education_facilities_points.shp")

edu_facilities <-read_sf("data/hotosm_gha_edu_facilities_polygons_shp/hotosm_gha_education_facilities_polygons.shp")

#left=st_join(polygon, try)
#leftj=st_join(polygon, try, left=T)
#leftj2=st_join(try,polygon, left=T)

#summary(duplicated(edu_new$name))
#edu_new$name[duplicated(edu_new$name)]
#summary(duplicated(edu_n1$name))
#summary(duplicated(edu_n2$name))

tmap_mode("view")
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
