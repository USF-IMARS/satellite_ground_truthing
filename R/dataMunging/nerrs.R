# Install librarian package if you haven't already
if (!requireNamespace("librarian", quietly = TRUE)) {
  install.packages("librarian")
}

# Load the librarian package
library(librarian)

# Load dplyr package using librarian
shelf(
  dplyr,
  jsonlite
)

loadData <- function(){
  yesDF <- read.csv("data/YES_Mangroves_Rookery.csv") %>%
    select(".geo", "occurrenceStatus")
  noDF <- read.csv("data/NO_Mangroves_Rookery.csv") %>%
    select(".geo", "occurrenceStatus")

    # merge
  mergedDF <- dplyr::full_join(yesDF, noDF, by = c(".geo", "occurrenceStatus"))

  # parse the .geo column
  mergedDF <- mergedDF %>%
    mutate(
      coordinates = lapply(`.geo`, function(x) fromJSON(x)$coordinates),
      lon = sapply(coordinates, function(x) x[1]),
      lat = sapply(coordinates, function(x) x[2]),
      coordinates = NULL,  # rm coordinates now that lat, lon extracted
      `.geo` = NULL  # rm old geom column
    )

  return(mergedDF)
}
