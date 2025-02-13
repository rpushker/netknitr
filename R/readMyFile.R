#' readMyFile
#'
#' @param this_file File path
#' @author Jayachandra N
#' @return data.frame, content of the file.
#' @export
#' @importFrom openxlsx read.xlsx
#' @importFrom utils read.csv read.table
#' @examples
#' write.csv(mtcars, 'test_data.csv')
#' readMyFile("test_data.csv")
readMyFile <- function(this_file) {
  res <- strsplit(x = this_file, split = "\\.")
  unlisted_res <- unlist(res)
  ext <- unlisted_res[length(unlisted_res)]
  if (ext == "csv")
    tmp <- utils::read.csv(file = this_file, header = TRUE)
  if (ext == "xlsx")
    tmp <- openxlsx::read.xlsx(this_file)
  if (ext == "txt") {
    tmp <- utils::read.table(this_file)
    tmp <- as.data.frame(tmp)
  }
  return(tmp)
}
