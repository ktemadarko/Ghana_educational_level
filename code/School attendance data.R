pacman::p_load(tidyverse,tidylog, shiny, flextable, magrittr,tmap,sf,DT)
#load Ghana school attendance data 3 years and above from the Ghana 2021 Census Literacy reports
gh_school_attend=read_csv("data/GHA_2021_Census_Pop_3yrs_school_attendance.csv")

gh_school_attend$per_dropout=round(((gh_school_attend$`Dropped out of School`/gh_school_attend$Total)*100),2)


choose_gender=function(x){
  filter(gh_school_attend,Gender==x)
}

#gh_school_attend |>
 # filter(Gender=Female)
ggplot(gh_school_attend, aes(x=Gender, y=per_dropout, fill=Locality))+
  geom_col(position="dodge2")+
geom_text(label=gh_school_attend$per_dropout, angle=45, vjust=1)+
  scale_fill_viridis_d()+facet_wrap(~Region, nrow=4)#+coord_flip()
