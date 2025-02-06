library(ggplot2)
library(scales)
library(Cairo)
library(svglite)


# Read files
ad_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Alzheimer_genes.csv", header = TRUE, stringsAsFactors = FALSE)
pd_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Parkinson_genes.csv", header = TRUE, stringsAsFactors = FALSE)
dementia_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Dementia_genes.csv", header = TRUE, stringsAsFactors = FALSE)

# Create data
overlap_counts <- data.frame(
  Category = c("AD & PD", "AD & Dementia", "PD & Dementia", "All Three", "Unique AD", "Unique PD", "Unique Dementia"),
  Count = c(3768, 6102, 4130, 3274, 2660, 641, 3756)
)

# Define formal high-quality colors
custom_colors <- c(
  "AD & PD" = "#1b9e77",       # Teal Green
  "AD & Dementia" = "#d95f02", # Deep Orange
  "PD & Dementia" = "#7570b3", # Muted Purple
  "All Three" = "#e7298a",     # Magenta
  "Unique AD" = "#66a61e",     # Olive Green
  "Unique PD" = "#e6ab02",     # Gold
  "Unique Dementia" = "#a6761d" # Brown
)


# Modify the ggplot
p <- ggplot(overlap_counts, aes(x = reorder(Category, -Count), y = Count, fill = Category)) +
  geom_bar(stat = "identity", color = "white", size = 1.2) +
  geom_text(aes(label = Count), vjust = -0.5, size = 5, fontface = "bold", color = "black") +
  scale_fill_manual(values = custom_colors) +  # Apply custom colors
  labs(title = "Overlapped Genes Across AD, PD, and Dementia", 
       x = "Genetic Overlap Categories", 
       y = "Number of Genes") +
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
    axis.title.x = element_text(size = 16, face = "bold", color = "black"),
    axis.title.y = element_text(size = 16, face = "bold", color = "black"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 14),
    axis.text.y = element_text(size = 14),
    panel.grid.major.y = element_line(linetype = "dashed", color = "gray"),
    legend.position = "none"
  )

# Save the plot
ggsave("gene_overlap_chart.svg", plot = p, width = 12, height = 7, dpi = 300)
ggsave("gene_overlap_chart.png", plot = p, width = 12, height = 7, dpi = 300)

# Display the plot
print(p)

--------------------------------------------------------------------------------

library(ggplot2)
library(scales)
library(Cairo)
library(svglite)

# Read CSV files
ad_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Alzheimer_genes.csv", header = TRUE, stringsAsFactors = FALSE)
pd_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Parkinson_genes.csv", header = TRUE, stringsAsFactors = FALSE)
dementia_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Dementia_genes.csv", header = TRUE, stringsAsFactors = FALSE)

# Create data
overlap_counts <- data.frame(
  Category = c("AD & PD", "AD & Dementia", "PD & Dementia", "All Three"),
  Count = c(3768, 6102, 4130, 3274)
)

# Define custom colors for intersections
custom_colors <- c(
  "AD & PD" = "#1b9e77",       # Teal Green
  "AD & Dementia" = "#d95f02", # Deep Orange
  "PD & Dementia" = "#7570b3", # Muted Purple
  "All Three" = "#e7298a"      # Magenta
)

# Ensure correct factor levels for fill mapping
overlap_counts$Category <- factor(overlap_counts$Category, levels = names(custom_colors))

# Create the bar plot
p <- ggplot(overlap_counts, aes(x = Category, y = Count, fill = Category)) +
  geom_bar(stat = "identity", color = "white", size = 1.2, width = 0.7) +
  geom_text(aes(label = Count), vjust = -0.5, size = 5, fontface = "bold", color = "black") +
  scale_fill_manual(values = custom_colors) +
  labs(title = "Gene Intersections Across AD, PD, and Dementia", 
       x = "Genetic Overlap Categories", 
       y = "Number of Genes") + expand_limits(y = 0)
  theme_classic(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title.x = element_text(size = 16, face = "bold"),
    axis.title.y = element_text(size = 16, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 14),
    axis.text.y = element_text(size = 14),
    panel.grid.major.y = element_line(linetype = "dashed", color = "gray"),
    legend.position = "none"
  )

# Save the plot
ggsave("gene_intersection_chart.svg", plot = p, width = 12, height = 7, dpi = 300)
ggsave("gene_intersection_chart.png", plot = p, width = 12, height = 7, dpi = 300)

# Display the plot
print(p)

--------------------------------------------------------------------------------

library(ggplot2)
library(scales)
library(Cairo)
library(svglite)

# Read CSV files
ad_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Alzheimer_genes.csv", header = TRUE, stringsAsFactors = FALSE)
pd_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Parkinson_genes.csv", header = TRUE, stringsAsFactors = FALSE)
dementia_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Dementia_genes.csv", header = TRUE, stringsAsFactors = FALSE)

# Create data
overlap_counts <- data.frame(
  Category = c("AD & PD", "AD & Dementia", "PD & Dementia", "All Three"),
  Count = c(3768, 6102, 4130, 3274)
)

# Define custom colors for intersections
custom_colors <- c(
  "AD & PD" = "#1b9e77",       # Teal Green
  "AD & Dementia" = "#d95f02", # Deep Orange
  "PD & Dementia" = "#7570b3", # Muted Purple
  "All Three" = "#e7298a"      # Magenta
)

# Ensure correct factor levels for fill mapping
overlap_counts$Category <- factor(overlap_counts$Category, levels = names(custom_colors))

# Create the bar plot
p <- ggplot(overlap_counts, aes(x = Category, y = Count, fill = Category)) +
  geom_bar(stat = "identity", color = "white", size = 1.2, width = 0.7) +
  geom_text(aes(label = Count), vjust = -0.5, size = 7, fontface = "bold", color = "black") +  # Larger text
  scale_fill_manual(values = custom_colors) +
  labs(title = "Gene Intersections Across AD, PD, and Dementia", 
       x = "Genetic Overlap Categories", 
       y = "Number of Genes") + 
  expand_limits(y = 0) +
  theme_classic(base_size = 20) +  # Larger base font size
  theme(
    plot.title = element_text(hjust = 0.5, size = 26, face = "bold", color = "red"),   # Larger title
    axis.title.x = element_text(size = 24, face = "bold", color = "red"),  # Larger axis labels
    axis.title.y = element_text(size = 24, face = "bold", color = "red"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 18, face = "bold"),  # Larger category labels
    axis.text.y = element_text(size = 18, face = "bold"),
    panel.grid.major.y = element_line(linetype = "dashed", color = "gray"),
    legend.position = "none"
  )

# Save the plot
ggsave("gene_intersection_chart.svg", plot = p, width = 12, height = 7, dpi = 300)
ggsave("gene_intersection_chart.png", plot = p, width = 12, height = 7, dpi = 300)

# Display the plot
print(p)

## Here to create csv files for the overlapped genes

# Load required libraries
library(dplyr)

# Read CSV files
ad_genes <- read.csv("/Users/mahamarwatawfik/Downloads/Alzheimer.csv", header = TRUE, stringsAsFactors = FALSE)
pd_genes <- read.csv("/Users/mahamarwatawfik/Downloads/Parkinson.csv", header = TRUE, stringsAsFactors = FALSE)
dementia_genes <- read.csv("/Users/mahamarwatawfik/Downloads/Dementia.csv", header = TRUE, stringsAsFactors = FALSE)


# Find shared genes
overlap_ad_pd <- intersect(ad_genes, pd_genes)
overlap_ad_dementia <- intersect(ad_genes, dementia_genes)
overlap_pd_dementia <- intersect(pd_genes, dementia_genes)
overlap_all <- Reduce(intersect, list(ad_genes, pd_genes, dementia_genes))

# Save results as CSV
write.csv(overlap_ad_pd, "Overlap_AD_PD.csv", row.names = FALSE)
write.csv(overlap_ad_dementia, "Overlap_AD_Dementia.csv", row.names = FALSE)
write.csv(overlap_pd_dementia, "Overlap_PD_Dementia.csv", row.names = FALSE)
write.csv(overlap_all, "Overlap_All_Three.csv", row.names = FALSE)

# Print confirmation
print("Overlapping gene lists have been saved as CSV files.")

