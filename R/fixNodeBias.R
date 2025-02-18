#' fixNodeBias
#'
#' @param my_data data frame
#' @author Jayachandra N
#' @description
#' Fix the possible bias that occurs while generating the nodes.
#'
#' @return data frame
#' @export
#' @examples
#' res <- fixNodeBias(head(mtcars))
fixNodeBias <- function(my_data) {

  res <- lapply(names(my_data), FUN = function(i) {
    return(paste0(i, " : ", my_data[[i]]))
  })

  res <- as.data.frame(do.call("cbind", res))

  names(res) <- names(my_data)

  return(res)
}
