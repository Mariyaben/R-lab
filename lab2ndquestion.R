

install.packages("igraph")

library(igraph)

# Create a new graph
newGraph <- graph.empty(n = 8, directed = FALSE)

# Add edges to the new graph
newGraph <- add_edges(newGraph, c(1, 2, 1, 3, 2, 4, 2, 5, 3, 6, 3, 7, 4, 8))

# Plot the new graph
plot(newGraph, main = "Another Undirected Graph")

# Perform DFS traversal starting from a different vertex


# Perform DFS traversal starting from a specific vertex
dfs <- function(graph, startVertex) {
  cat("DFS traversal starting from vertex", startVertex, ": ")
  cat(startVertex, " ")
  visitedNodes <- rep(FALSE, vcount(graph))
  visitedNodes[startVertex] <- TRUE
  
  
  dfs_recursive <- function(vertex) {
    neighbors <- neighbors(graph, vertex)
    for (neighbor in neighbors) {
      if (!visitedNodes[neighbor]) {
        cat(neighbor, " ")
        visitedNodes[neighbor] <- TRUE
        # Add a check before the recursive call
        if (!visitedNodes[neighbor]) {
          dfs_recursive(neighbor)
        }
      }
    }
  }
  
  
  dfs_recursive(startVertex)
  cat("\n")
}

# Example usage:
dfs(newGraph, 2)

