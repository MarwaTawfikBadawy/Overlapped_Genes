# Overlapped Genes across AD, PD, and Dementia
Analysis of the overlapped genes across Alzheimer's, Parkinson's, and Dementia Diseases

Here we are summarizing the overlapping genes and pathways detected in the three neurodegenerative diseases.

---

```{r}
library(ggplot2)
library(scales)
library(Cairo)
library(svglite)
```

```{r}
# Create data
overlap_counts <- data.frame(
  Category = c("AD & PD", "AD & Dementia", "PD & Dementia", "All Three", "Unique AD", "Unique PD", "Unique Dementia"),
  Count = c(3768, 6102, 4130, 3274, 2660, 641, 3756)
)
```


```{r}
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
```

```{r}
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
```

```{r}
# Save the plot
ggsave("gene_overlap_chart.svg", plot = p, width = 12, height = 7, dpi = 300)
ggsave("gene_overlap_chart.png", plot = p, width = 12, height = 7, dpi = 300)
```

```{r}
Display the plot
print(p)
```
