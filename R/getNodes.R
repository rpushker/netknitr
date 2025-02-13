#' getNodes
#'
#' @param crude_data Data Frame that you want to build a network for.
#' @param columns_for_nodes Vector of column names for crude_data, works well
#' for at least 3 columns
#' @param group Logical value, set TRUE to differentiate nodes by shapes
#' and colors. Default value is FALSE
#' @author Jayachandra N
#' @return Data frame, each unique item is a node and associated with unique id
#' @export
#' @examples
#' getNodes(head(mtcars), c("cyl", "gear", "vs"), group = TRUE)
getNodes <-  function(crude_data, columns_for_nodes = NULL, group = FALSE) {

  if (group == FALSE) {
    if (is.null(columns_for_nodes)) {
      print("----Columns considerd for nodes----->")
      res <- lapply(names(crude_data), FUN = function(x) {
        print(x)
        unique(as.character(crude_data[[x]]))
      })
      res <- do.call("c", res)

    } else {
      print("----Columns considerd for nodes----->")
      res <- lapply(columns_for_nodes, FUN = function(x) {
        print(x)
        unique(as.character(crude_data[[x]]))
      })
      res <- do.call("c", res)
    }
    res <- unique(res)
    res <- data.frame(id = seq_along(res), label = res)
  } else if (group == TRUE) {
    if (is.null(columns_for_nodes)) {
      print("----Columns considerd for nodes----->")
      res <- lapply(names(crude_data), FUN = function(x) {
        print(x)
        data.frame(label = unique(as.character(crude_data[[x]])), "group" = x)
      })
      res <- do.call("rbind", res)

    } else {
      print("----Columns considerd for nodes----->")
      res <- lapply(columns_for_nodes, FUN = function(x) {
        print(x)
        data.frame(label = unique(as.character(crude_data[[x]])), "group" = x)
      })
      res <- do.call("rbind", res)
    }
    res$id <- seq_len(nrow(res))
    res <- res[, c(3, 1, 2)]
  }
  return(res)
}
