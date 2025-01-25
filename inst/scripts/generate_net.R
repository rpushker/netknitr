
# Example 1
set.seed(7979)

my_data <- data.frame("X" = c(sample(letters[1:5], 10, replace = T)),
                      "Y" = c(sample(LETTERS[1:5], 10, replace = T)),
                      "Z" = c(sample(letters[5:9], 10, replace = T)),
                      "GRP" = sample(1:2, size = 5, replace = T))
cols <- c("X", "Y", "Z")

nodes <- getNodes(my_data, columns_for_nodes = cols, group = TRUE)
nodes$shape <- getShapes(nodes)
nodes$colors <- sample(c("darkred", "grey", "orange", "darkblue", "purple", 'green'), nrow(nodes), replace = T)

associations <- getAssociation(my_data[,cols])
edges <- getEdges(associations,nodes)

visNetwork(nodes, edges) %>%
  visNodes(color = list(background = "lightblue",
                        border = "darkblue",
                        highlight = "yellow"),
           shadow = list(enabled = TRUE, size = 10))

## Example 2
set.seed(797)
mtcars$name <- row.names(mtcars)
cols <- c('gear', 'name', "cyl")
my_data <- mtcars[,cols]

res <- lapply(names(my_data), FUN = function(i) {
  paste0(i, " : ", my_data[[i]])
}) %>% do.call('cbind', .) %>% as.data.frame()
names(res) <- names(my_data)
res %>% head()
my_data <- res

nodes <- getNodes(my_data, columns_for_nodes = cols, group = TRUE)
nodes$shape <- getShapes(nodes)
nodes$colors <- sample(c("darkred", "grey", "orange", "darkblue", "purple", 'green'), nrow(nodes), replace = T)

associations <- getAssociation(my_data[,cols])
edges <- getEdges(associations,nodes)
visNetwork(nodes, edges) %>%
  visNodes(color = list(background = "lightblue",
                        border = "darkblue",
                        highlight = "yellow"),
           shadow = list(enabled = TRUE, size = 10))
