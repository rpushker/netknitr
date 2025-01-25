
#' getEdges
#'
#' @param polished_data data frame, output of getAssociation function
#' @param nodes data frame, output of getNodes function
#' @author Jayachandra N
#' @return data frame of edges indicationg from and to node ids
#' @export
#' @examples
#' \dontrun{
#' res <- fixNodeBias(head(mtcars))
#' edges <- getEdges(getAssociation(res), getNodes(res, group = T))
#' }
getEdges <- function(polished_data, nodes) {
  from <- lapply(1:nrow(polished_data), FUN = function(x) {
    pos <- which(as.character(nodes$label) == as.character(polished_data$from[x]))
    nodes[pos,]$id
  })
  from <- do.call("c", from)
  to <- lapply(1:nrow(polished_data), FUN = function(x) {
    pos <- which(as.character(nodes$label) == as.character(polished_data$to[x]))
    nodes[pos,]$id
  })
  to <- do.call('c', to)
  edges <- data.frame(from = from, to =to)
}
