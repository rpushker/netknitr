#' getShapes
#'
#' @param nodes nodes data, output of getNodes function
#' @param shapes character vector indicating manual shapes to choose for nodes
#' @author Jayachandra N
#' @return a vector of shapes which is ready to cbind with nodes data
#' @export
#' @examples
#' \dontrun{
#' nodes <- getNodes(head(mtcars), c("cyl", "gear", "vs"), group =TRUE)
#' nodes$shape <- getShapes(nodes)
#' }
getShapes <- function(nodes, shapes = NULL) {
  if(length(grep("group", names(nodes))) >= 1) {

    if(!is.null(shapes)) {
      my_shapes <- shapes
    } else {
      my_shapes <- c("square",
                     "triangle",
                     "box",
                     "circle",
                     "dot",
                     "star",
                     "ellipse",
                     "database",
                     "text",
                     "diamond")
    }

    if(length(unique(nodes$group)) > length(my_shapes)) {
      print("Note :: Number of different groups > shapes available. Shapes may be same for diferent groups")
    }
    temp <- data.frame(node = unique(nodes$group),
                       shape = sample(my_shapes, length(unique(nodes$group)), replace = TRUE))

    res <- lapply(as.character(nodes$group), FUN = function(j) {
      as.character(temp$shape[which(j == as.character(temp$node))])
    })
    res <- do.call('c', res)

  } else {
    print("There is not group column in nodes")
    res <- NA
  }
  return(res)
}

