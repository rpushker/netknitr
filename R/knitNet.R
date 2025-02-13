#' knitNet
#' @author Jayachandra N
#' @return shiny ui page
#' @export
#' @import shiny
#' @import shinydashboard
#' @examplesIf interactive()
#' knitNet()
knitNet <- function() {
  shiny::runApp(system.file(package = "netknitr", "app"))
}
