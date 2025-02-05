# Overlapped_Genes
This repository includes the analysis of the overlapped genes across Alzheimer's Disease, Parkinson's Disease, and Dementia

library(ggplot2)
library(scales)
library(Cairo)
library(svglite)


Read files
ad_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Alzheimer_genes.csv", header = TRUE, stringsAsFactors = FALSE)
pd_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Parkinson_genes.csv", header = TRUE, stringsAsFactors = FALSE)
dementia_genes <- read.csv("/Users/mahamarwatawfik/Documents/AD_PD_Dementia/Dementia_genes.csv", header = TRUE, stringsAsFactors = FALSE)

Create data
overlap_counts <- data.frame(
  Category = c("AD & PD", "AD & Dementia", "PD & Dementia", "All Three", "Unique AD", "Unique PD", "Unique Dementia"),
  Count = c(3768, 6102, 4130, 3274, 2660, 641, 3756)
)

Define formal high-quality colors
custom_colors <- c(
  "AD & PD" = "#1b9e77",       # Teal Green
  "AD & Dementia" = "#d95f02", # Deep Orange
  "PD & Dementia" = "#7570b3", # Muted Purple
  "All Three" = "#e7298a",     # Magenta
  "Unique AD" = "#66a61e",     # Olive Green
  "Unique PD" = "#e6ab02",     # Gold
  "Unique Dementia" = "#a6761d" # Brown
)


Modify the ggplot
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

Save the plot
ggsave("gene_overlap_chart.svg", plot = p, width = 12, height = 7, dpi = 300)
ggsave("gene_overlap_chart.png", plot = p, width = 12, height = 7, dpi = 300)

Display the plot
print(p)
