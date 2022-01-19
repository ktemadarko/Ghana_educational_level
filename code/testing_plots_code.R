choose_locality_plot=function(x){
  gh_school_attend |>
    filter(Locality=="Urban") |>
    ggplot( aes(x=ADM1_EN, y=Percent_dropout, fill=ADM1_EN))+
    geom_col(position = position_dodge(0.9))+scale_y_continuous(limits = c(0,80))+
    geom_text(aes(label=Percent_dropout), size=3,hjust=-0.3,
              position = position_dodge(0.9))+
    scale_fill_viridis_d()+coord_flip()+facet_wrap(~Gender, ncol=2)+
    labs(paste())}


#filter female only
gh_school_attend |>
  filter(Gender=="Female") |>
  ggplot( aes(x=ADM1_EN, y=Percent_dropout, fill=ADM1_EN))+
  geom_col(position = position_dodge(0.9))+scale_y_continuous(limits = c(0,80))+
  geom_text(aes(label=Percent_dropout), size=3,hjust=-0.3,
            position = position_dodge(0.9))+
  scale_fill_viridis_d()+coord_flip()+facet_wrap(~Locality, ncol=2)


choose_gender_region=function(x,y){
  gh_school_attend |> filter(Gender==x,
                             ADM1_EN==y)
}

#choose_indicator=function(){

#}
#gh_school_attend |>
# filter(Gender=Female)

school_plot_try1=function(){
  ggplot(gh_school_attend, aes(x=Gender, y=per_dropout, fill=Locality))+
    geom_col(position="dodge2")+ scale_y_continuous(n.breaks=5)+
    geom_text(label=gh_school_attend$Percent_dropout, size=3, vjust=-1,
              position = position_dodge(0.9))+
    scale_fill_viridis_d()+facet_wrap(~Region, nrow=2)#+coord_flip()
}

school_plot_try1=function(){
  gh_school_attend |>
    filter(ADM1_EN=="Volta") |>
    ggplot( aes(x=ADM1_EN, y=Percent_dropout, fill=Locality))+
    geom_col(position="dodge2")+
    geom_text(aes(label=Percent_dropout), size=3, vjust=-1,
              position = position_dodge(0.9))+
    scale_fill_viridis_d()}



choose_locality_plot=function(x){
  gh_school_attend |>
    filter(Locality=="Urban") |>
    ggplot( aes(x=ADM1_EN, y=Percent_dropout, fill=ADM1_EN))+
    geom_col(position = position_dodge(0.9))+scale_y_continuous(limits = c(0,80))+
    geom_text(aes(label=Percent_dropout), size=3,hjust=-0.3,
              position = position_dodge(0.9))+
    scale_fill_viridis_d()+coord_flip()+facet_wrap(~Gender, ncol=2)+
    labs(paste())
}

school_plot_try3=function(){
  gh_school_attend |>
    filter(Locality=="Urban") |>
    ggplot( aes(x=ADM1_EN, y=Percent_dropout, fill=ADM1_EN))+
    geom_col(position = position_dodge(0.9))+scale_y_continuous(limits = c(0,80))+
    geom_text(aes(label=Percent_dropout), size=3,hjust=-0.3,
              position = position_dodge(0.9))+
    scale_fill_viridis_d()+coord_flip()+facet_wrap(~Gender, ncol=2)}





gh_school_attend |>
  filter(Locality=="Urban") |>
  ggplot( aes(x=ADM1_EN, y=Percent_dropout, fill=ADM1_EN))+
  geom_col(position = position_dodge(0.9))+scale_y_continuous(limits = c(0,80))+
  geom_text(aes(label=Percent_dropout), size=3,hjust=-0.3,
            position = position_dodge(0.9))+
  scale_fill_viridis_d()+coord_flip()+facet_wrap(~Gender, ncol=2)+
  labs(title =paste("A plot displaying Percent_dropout Urban"))

#r eruptions, eval=FALSE, include=FALSE

inputPanel(
  selectInput("region", "Region", choices=levels(choices_reg),
              multiple=F, selectize=T),
  radioButtons("school", "School", choices=levels(edu_new$amenity))
)

renderPlot({
  tm_shape
})


try_pivot1<-gh_school_attend |>
  pivot_wider(names_from=c(Locality),
              values_from=c(Percent_dropout,Percent_Currently_in_School,
                            Percent_Never_Attended_School))
summary(try_pivot1)

#making new dfs for ghanacensus 2021 package
gh_school_attend_2021<-gh_school_attend%>%
  rename(Region=ADM1_EN)

gh_school_attend_2021<-gh_school_attend_2021[,c(1,6,7,2,9,3,10,4,8,5)]


gh_adm1_geom=gh_adm1 |>
  rename(Region=ADM1_EN) |>
  select(c(3,13)) |>

  gh_adm1_geom%<>%
  mutate(across(c(Region),factor))

gh_school_attend_2021%<>%
  rename(Percent_Currently_Attending_School=Percent_Currently_in_School,
         Percent_Dropped_out_of_School=Percent_dropout)

Ghana_2021_school_attendance_geometry=merge(gh_school_attend_2021,gh_adm1_geom, by="Region")

gh_adm1_geom$Region[gh_adm1_geom$Region == "Northern East"]<-"North East"

#save(x, y, file = "xy.RData")
save(Ghana_2021_school_attendance_geometry, file = "C:/Users/LENOVO/Documents/Rpackages/rGhanaCensus/data/Ghana_2021_school_attendance_geometry.RData")

load("Ghana_educational_level/gh_edu_geom.RData")
a <- readRDS("stuff.RDS")
