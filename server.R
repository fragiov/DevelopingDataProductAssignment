shinyServer(
  function(input, output) {
    seed = sample(1:100)
      output$graphicNorm <- renderPlot({
        n <- input$n
        mu <- input$mu
        sd <- input$sd
        set.seed(seed)
        X<-rnorm(n, mu, sd)
        mat <- matrix(c(1,2,4,3), 2)
        layout(mat, c(3.5,1), c(1,3))
        par(mar=c(0, 4.5, 0, 0.5))
        boxplot(X, ylim=c(-10,10), horizontal=TRUE, axes=FALSE,
                col=rgb(0,0.4,0, 0.3), border=rgb(0,0.4,0.3,0.8), bty="n")
        abline(v=as.numeric(summary(X))[2:5], lty=2, col = c(rgb(0,0.4,0.3,0.7),rgb(0,0.4,0.3,0.7),rgb(0.7,0.1,0.2,0.8),rgb(0,0.4,0.3,0.7)))
        par(mar=c(4.5, 4.5, 0.5, 0.5))
        hist(X, prob=TRUE, col=rgb(0,0.4,0, 0.3), 
             border=rgb(0,0.4,0.3,0.4),
             xlim=c(-10,10), ylim=c(0,0.8),
             main=NULL, xlab="")
        rug(X, col=rgb(0,0.4,0.3,0.4))
        abline(v=as.numeric(summary(X))[2:5], lty=2, col = c(rgb(0,0.4,0.3,0.7),rgb(0,0.4,0.3,0.7),rgb(0.7,0.1,0.2,0.8),rgb(0,0.4,0.3,0.7)))
        lines(density(X, adjust=2), col=rgb(0,0.4,0.3,0.4), lwd=2)
        par(mar=c(4.5, 0.5, 0.5, 0.5))
        curve(dnorm(x,mu,sd),col=rgb(0,0.4,0.3,0.7), lwd=2 ,
              xlim=c(mu-4*sd,mu+4*sd), ylim=c(0,0.7), axes=FALSE, main=NULL, xlab="", ylab="")
        lines(density(X), col=rgb(0.7,0.1,0.2,0.8), lwd=2, lty=2)
        plot(1:10,1:10, axes=FALSE, xlab="", ylab="", type="n")
        text(5, 5, paste("Mean =", round(mean(X), 2)), cex=1)
        text(5, 2, paste("Std. Dev. =", round(sd(X), 2)), cex=1)
        text(5, 9, "Empirical Values", cex=1.3)
      })
    output$table <- renderTable({
      n <- input$n
      mu <- input$mu
      sd <- input$sd
      set.seed(seed)
      X<-rnorm(n, mu, sd)
      t(data.frame(Value = round(as.numeric(c(summary(X), sd(X))), 2), row.names=c(names(summary(X)),"Std. Dev.")))
      })
    })

