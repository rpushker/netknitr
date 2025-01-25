#' knitNet
#' @author Jayachandra N
#' @return shiny ui page
#' @export
#' @import shiny
#' @import shinydashboard
#' @examples
#' \dontrun{
#' knitNet
#' }
knitNet <- function(){
  shiny::runApp(system.file(package = "netknitr", "app"))
}
