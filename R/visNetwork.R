#' createVisNetwork
#'
#' @param nodes Nodes.
#' @param edges Edges.
#' @param background Background color.
#' @param border Border color.
#' @param highlight Highlight color.
#' @author Jayachandra N
#' @return Network map visualization
#' @import dplyr
#' @import visNetwork
#' @export
#' @examples
#' nodes <- getNodes(head(mtcars), c("cyl", "gear", "vs"), group = TRUE)
#' res <- fixNodeBias(head(mtcars))
#' edges <- getEdges(getAssociation(res), getNodes(res, group = TRUE))
#' createVisNetwork(nodes, edges)
createVisNetwork <- function(nodes, edges, background = "lightblue",
                             border = "darkblue", highlight = "yellow") {
  visNetwork::visNetwork(nodes, edges) %>%
    visNetwork::visNodes(color = list(background = "lightblue",
                                      border = "darkblue",
                                      highlight = "yellow"),
                         shadow = list(enabled = TRUE, size = 10))
}
