shinyUI(pageWithSidebar(
  headerPanel("Ring my Bell... Curve!"),
  sidebarPanel(
    p("The normal distribution is probably the most important and most widely used distribution in statistics. 
      It is sometimes called the bell curve, although the tonal qualities of such a bell would be less than pleasing. 
      It is also called the Gaussian curve after the German mathematician Karl Friedrich Gauss. Strictly speaking, it is not correct 
      to talk about THE normal distribution since there are many normal distributions. In fact, normal distributions can differ 
      in their means and in their standard deviations."),  
    h4("Choose the distribution parameters"),
    p("To unambiguously define a normal distribution, you have to specify two quantities: 
      the theoretical mean and the standard deviation. This simple App allows you to change 
      directly the values of these parameters (using the sliders) and to visualize how 
      the shape of the distribution consequently changes."),
    sliderInput('mu', 'Theoretical Mean:', value = 0, min = -5, max = 5, step = 1,),
    sliderInput('sd', 'Theoretical Standard Deviation:', value = 1, min = 0.5, 
                max = 2.05, step = 0.05,),
    h4("Choose the sample size"),
    p("If we extract a random sample from a normal distribution it will also be normally distributed. 
      The estimates of the parameters calculated on the sample will convergence in probability to the 
theoretical ones. You can proof this assumption changing the sample size and evaluating the precision of the estimates."),
    sliderInput('n', 'Sample Size:',value = 100, min = 25, 
                max = 500, step = 25,)
    ),
  mainPanel(
    plotOutput('graphicNorm'),
    wellPanel(
      p("The above visualization allows to compare the empirical distribution of the sample
               and the theoretical bell-shaped normal distribution. The histogram, the boxplot and the kernel 
               density show in different ways how the shape of the distribution changes when changing the values of its parameters. 
               As you can see, the mean determines the location of the distribution centre, while the standard
               deviation determines its height and width. When the standard deviation is large, the curve is short and wide; 
               when the standard deviation is small, the curve is tall and narrow. The table below shows the values of some important 
               quantities useful to define the geometrical properties of the empirical distribution."),
    tableOutput("table"),
    p("Looking in particular to the values of the empirical mean and standard deviation (also shown in the upper-right 
             corner of the graph), we notice that when the sample size grows the estimates become more precise and accurate, 
             converging to the theoretical values. In general the empirical distribution (in red) fits better the 
             theoretical one (in green) when the sample size is large."))
  )))
