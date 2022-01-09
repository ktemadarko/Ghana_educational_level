remotes::install_github("geocompr/geocompkg")
remotes::install_github("nowosad/spData")
remotes::install_github("nowosad/spDataLarge")


edu_name_not_null |>
  mutate(amenity, if_else(amenity %in% c("Basic","basic",
                                         "Preparatory", "preparatory",
                                         "Primary","primary"),"Primary",amenity))
filter(str_detect(edu_facilities$name,(fixed('primary', ignore_case = T))))

summary(str_which(edu_facilities$name,(fixed('primary', ignore_case = T))))

summary(str_extract(edu_facilities$name,(fixed('primary', ignore_case = T))))
