#' knitNet
#' @author Jayachandra N
#' @description
#' Run inbuilt shiny app after installing the package.
#' 
#' @return shiny ui page
#' @export
#' @import shiny
#' @import shinydashboard
#' @examplesIf interactive()
#' knitNet()
knitNet <- function() {
  shiny::runApp(system.file(package = "netknitr", "app"))
}
