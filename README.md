Generate network for your data
================
Jayachandra N
2025-02-12

## Are you looking to explore the complex relationships within your CSV data? The netknitr open-source framework, developed using R, RShiny, and visNetwork, makes this task simple. All you need to do is install netknitr on your computer, and you can easily generate network maps to visualize the connections within your data.

``` r
# install.packages('netknitr')
# netknitr::knitNet()
```

### Curious about how it works? Check out the step-by-step guide provided by the netknitr framework to see how it generates network maps.

## Load

``` r
# install.packages('netknitr')
library(netknitr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(visNetwork)
```

## Data : It works for any data

``` r
set.seed(0009)

mtcars$name <- row.names(mtcars)
cols <- c('gear', 'name', "cyl")
my_data <- mtcars[,cols]
my_data
```

    ##                     gear                name cyl
    ## Mazda RX4              4           Mazda RX4   6
    ## Mazda RX4 Wag          4       Mazda RX4 Wag   6
    ## Datsun 710             4          Datsun 710   4
    ## Hornet 4 Drive         3      Hornet 4 Drive   6
    ## Hornet Sportabout      3   Hornet Sportabout   8
    ## Valiant                3             Valiant   6
    ## Duster 360             3          Duster 360   8
    ## Merc 240D              4           Merc 240D   4
    ## Merc 230               4            Merc 230   4
    ## Merc 280               4            Merc 280   6
    ## Merc 280C              4           Merc 280C   6
    ## Merc 450SE             3          Merc 450SE   8
    ## Merc 450SL             3          Merc 450SL   8
    ## Merc 450SLC            3         Merc 450SLC   8
    ## Cadillac Fleetwood     3  Cadillac Fleetwood   8
    ## Lincoln Continental    3 Lincoln Continental   8
    ## Chrysler Imperial      3   Chrysler Imperial   8
    ## Fiat 128               4            Fiat 128   4
    ## Honda Civic            4         Honda Civic   4
    ## Toyota Corolla         4      Toyota Corolla   4
    ## Toyota Corona          3       Toyota Corona   4
    ## Dodge Challenger       3    Dodge Challenger   8
    ## AMC Javelin            3         AMC Javelin   8
    ## Camaro Z28             3          Camaro Z28   8
    ## Pontiac Firebird       3    Pontiac Firebird   8
    ## Fiat X1-9              4           Fiat X1-9   4
    ## Porsche 914-2          5       Porsche 914-2   4
    ## Lotus Europa           5        Lotus Europa   4
    ## Ford Pantera L         5      Ford Pantera L   8
    ## Ferrari Dino           5        Ferrari Dino   6
    ## Maserati Bora          5       Maserati Bora   8
    ## Volvo 142E             4          Volvo 142E   4

``` r
res <- lapply(names(my_data), FUN = function(i) {
  paste0(i, " : ", my_data[[i]])
}) %>% do.call('cbind', .) %>% as.data.frame()
names(res) <- names(my_data)
res %>% head()
```

    ##       gear                     name     cyl
    ## 1 gear : 4         name : Mazda RX4 cyl : 6
    ## 2 gear : 4     name : Mazda RX4 Wag cyl : 6
    ## 3 gear : 4        name : Datsun 710 cyl : 4
    ## 4 gear : 3    name : Hornet 4 Drive cyl : 6
    ## 5 gear : 3 name : Hornet Sportabout cyl : 8
    ## 6 gear : 3           name : Valiant cyl : 6

``` r
my_data <- res
head(my_data)
```

    ##       gear                     name     cyl
    ## 1 gear : 4         name : Mazda RX4 cyl : 6
    ## 2 gear : 4     name : Mazda RX4 Wag cyl : 6
    ## 3 gear : 4        name : Datsun 710 cyl : 4
    ## 4 gear : 3    name : Hornet 4 Drive cyl : 6
    ## 5 gear : 3 name : Hornet Sportabout cyl : 8
    ## 6 gear : 3           name : Valiant cyl : 6

## Determine Nodes

    ## [1] "----Columns considerd for nodes----->"
    ## [1] "gear"
    ## [1] "name"
    ## [1] "cyl"

    ##    id                      label group
    ## 1   1                   gear : 4  gear
    ## 2   2                   gear : 3  gear
    ## 3   3                   gear : 5  gear
    ## 4   4           name : Mazda RX4  name
    ## 5   5       name : Mazda RX4 Wag  name
    ## 6   6          name : Datsun 710  name
    ## 7   7      name : Hornet 4 Drive  name
    ## 8   8   name : Hornet Sportabout  name
    ## 9   9             name : Valiant  name
    ## 10 10          name : Duster 360  name
    ## 11 11           name : Merc 240D  name
    ## 12 12            name : Merc 230  name
    ## 13 13            name : Merc 280  name
    ## 14 14           name : Merc 280C  name
    ## 15 15          name : Merc 450SE  name
    ## 16 16          name : Merc 450SL  name
    ## 17 17         name : Merc 450SLC  name
    ## 18 18  name : Cadillac Fleetwood  name
    ## 19 19 name : Lincoln Continental  name
    ## 20 20   name : Chrysler Imperial  name
    ## 21 21            name : Fiat 128  name
    ## 22 22         name : Honda Civic  name
    ## 23 23      name : Toyota Corolla  name
    ## 24 24       name : Toyota Corona  name
    ## 25 25    name : Dodge Challenger  name
    ## 26 26         name : AMC Javelin  name
    ## 27 27          name : Camaro Z28  name
    ## 28 28    name : Pontiac Firebird  name
    ## 29 29           name : Fiat X1-9  name
    ## 30 30       name : Porsche 914-2  name
    ## 31 31        name : Lotus Europa  name
    ## 32 32      name : Ford Pantera L  name
    ## 33 33        name : Ferrari Dino  name
    ## 34 34       name : Maserati Bora  name
    ## 35 35          name : Volvo 142E  name
    ## 36 36                    cyl : 6   cyl
    ## 37 37                    cyl : 4   cyl
    ## 38 38                    cyl : 8   cyl

## Can include shapes and Colors

``` r
nodes$shape <- getShapes(nodes)
nodes$colors <- sample(c("darkred", "grey", "orange", "darkblue", "purple", 'green'), nrow(nodes), replace = T)
head(nodes)
```

    ##   id                label group shape   colors
    ## 1  1             gear : 4  gear   dot   orange
    ## 2  2             gear : 3  gear   dot   orange
    ## 3  3             gear : 5  gear   dot darkblue
    ## 4  4     name : Mazda RX4  name  star   orange
    ## 5  5 name : Mazda RX4 Wag  name  star    green
    ## 6  6    name : Datsun 710  name  star darkblue

## Determine Edges

``` r
associations <- getAssociation(my_data[,cols])
edges <- getEdges(associations,nodes)
head(edges)
```

    ##   from to
    ## 1    1  4
    ## 2    1  5
    ## 3    1  6
    ## 4    1 11
    ## 5    1 12
    ## 6    1 13

## Network

``` r
visNetwork(nodes, edges) %>%
  visNodes(color = list(background = "lightblue",
                        border = "darkblue",
                        highlight = "yellow"),
           shadow = list(enabled = TRUE, size = 10))
```

<div class="visNetwork html-widget html-fill-item" id="htmlwidget-af7ad2104b8aa0694667" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-af7ad2104b8aa0694667">{"x":{"nodes":{"id":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38],"label":["gear : 4","gear : 3","gear : 5","name : Mazda RX4","name : Mazda RX4 Wag","name : Datsun 710","name : Hornet 4 Drive","name : Hornet Sportabout","name : Valiant","name : Duster 360","name : Merc 240D","name : Merc 230","name : Merc 280","name : Merc 280C","name : Merc 450SE","name : Merc 450SL","name : Merc 450SLC","name : Cadillac Fleetwood","name : Lincoln Continental","name : Chrysler Imperial","name : Fiat 128","name : Honda Civic","name : Toyota Corolla","name : Toyota Corona","name : Dodge Challenger","name : AMC Javelin","name : Camaro Z28","name : Pontiac Firebird","name : Fiat X1-9","name : Porsche 914-2","name : Lotus Europa","name : Ford Pantera L","name : Ferrari Dino","name : Maserati Bora","name : Volvo 142E","cyl : 6","cyl : 4","cyl : 8"],"group":["gear","gear","gear","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","name","cyl","cyl","cyl"],"shape":["dot","dot","dot","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","star","database","database","database"],"colors":["orange","orange","darkblue","orange","green","darkblue","purple","grey","purple","grey","darkblue","orange","darkblue","green","darkred","green","darkred","darkred","purple","green","grey","grey","darkblue","green","grey","orange","orange","green","green","purple","darkred","darkred","green","orange","orange","orange","darkred","darkred"]},"edges":{"from":[1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35],"to":[4,5,6,11,12,13,14,21,22,23,29,35,7,8,9,10,15,16,17,18,19,20,24,25,26,27,28,30,31,32,33,34,36,36,37,36,38,36,38,37,37,36,36,38,38,38,38,38,38,37,37,37,37,38,38,38,38,37,37,37,38,36,38,37]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot","color":{"background":"lightblue","border":"darkblue","highlight":"yellow"},"shadow":{"enabled":true,"size":10}},"manipulation":{"enabled":false}},"groups":["gear","name","cyl"],"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script>
