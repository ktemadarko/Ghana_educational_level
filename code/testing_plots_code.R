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
