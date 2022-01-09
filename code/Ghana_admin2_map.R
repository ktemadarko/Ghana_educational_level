
pacman::p_load(tidyverse,tidylog, shiny, flextable, magrittr,tmap,sf)
gh_adm2<-read_sf("data/gha_admin_shp/gha_admbnda_adm2_gss_20210308.shp")

tmap_mode("view")
tm_shape(gh_adm2)+tm_polygons()+tm_fill(col="ADM1_EN")

"ADM1_EN"
