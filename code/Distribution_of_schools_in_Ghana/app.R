#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Distribution of Schools in Ghana"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          helpText("Create maps displaying the different types of education facilities in Ghana."),

          selectInput("region", "Region", choices=levels(choices_reg),
                       multiple=F, selectize=T),
          radioButtons("school", "School", choices=levels(edu_new$amenity))),

        # Show a plot of the generated distribution
      mainPanel(
           tmapOutput("tmap")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$tmap <- renderTmap({
       # tm_shape(gh_adm0)+tm_borders()+ # the national borders
        map1=tm_shape(choose_region(input$region))+tm_polygons(id="ADM2_EN",col="ADM1_EN",palette="RdPu")#+tm_text("ADM1_EN")
        map2=tm_shape(choose_school(input$school))+tm_symbols(id="name",size=0.1,col="amenity", palette = "magma")#+tm_text("name")
        map1+map2
    })
}

# Run the application
shinyApp(ui = ui, server = server)
