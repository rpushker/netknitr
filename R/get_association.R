#' getAssociation
#' @param crude_data data frame to get associations between the values of
#' different columns
#' @author Jayachandra N
#' @description
#' Determine the associations between the values of different columns within
#' the input data frame crude_data.
#'
#' @return data frame of edges indicating from and to nodes
#' @export
#' @importFrom stats na.omit
#' @examples
#' getAssociation(head(mtcars))
getAssociation <- function(crude_data) {
  res <- lapply(1:(length(crude_data) - 1), FUN = function(i) {
    unique_items <- unique(as.character(na.omit(crude_data[, i])))
    if (i < length(crude_data)) {
      temp_crude_data <- crude_data[, c(i, i + 1)]
    }
    lapply(unique_items, FUN = function(j) {
      this_row <- temp_crude_data[as.character(temp_crude_data[, 1]) == as.character(j), ]
      this_row[, 1] <- as.character(this_row[, 1])
      this_row[, 2] <- as.character(this_row[, 2])
      names(this_row) <- c("from", "to")
      this_row
    })
  })

  res <- lapply(seq_along(res), FUN = function(i) {
    do.call("rbind", res[[i]])
  })
  res <- do.call("rbind", res)
  res <- unique(res)
  res$flag <- ifelse(res$from == res$to, FALSE, TRUE)
  res <- res[res$flag == TRUE, ][, c("from", "to")]
  return(res)
}
