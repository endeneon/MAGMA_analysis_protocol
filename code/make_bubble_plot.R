#!/usr/bin/Rscript
# init
library(readr)
library(ggplot2)
library(RColorBrewer)

# plot panel A
df_raw <- read_table2("set_analysis_iPS_derived_neuron.gsa.out",
                      skip = 3)
df_raw$`-log10P` <- 0 - log10(df_raw$P)
df_raw$VARIABLE <- factor(df_raw$VARIABLE,
                          levels = c("Glut", "NPC", "DA", "GABA", "iPS"))
df_raw$TYPE <- "PGC_SCZ_w3"

ggplot(df_raw, aes(x = VARIABLE,
                   y = TYPE,
                   size = BETA,
                   fill = `-log10P`)) +
  scale_fill_gradient(low = "white",
                      limits = c(0, 7),
                      high = "darkred") +
  scale_size_area(limits = c(0, 0.5)) +
  geom_point(shape = 21) +
  xlab("Cell type") +
  ylab("") +
  theme_bw() +
  theme(legend.position = "bottom",
        legend.box = "horizontal",
        axis.text = element_text(size = 14),
        axis.title = element_text(size = 16))

# plot panel B
df_raw <- read_table2("Apr122021_set_analysis.gsa.out",
                      skip = 4)
df_raw$`-log10P` <- 0 - log10(df_raw$P)
df_raw$VARIABLE <- factor(df_raw$VARIABLE,
                          levels = c("Glut", "NPC", "DA", "GABA", "iPS"))
df_raw$TYPE <- "PGC_SCZ_w3"
ggplot(df_raw, aes(x = VARIABLE,
                   y = TYPE,
                   size = BETA,
                   fill = `-log10P`)) +
  scale_fill_gradient(low = "white",
                      limits = c(0, 7),
                      high = "darkred") +
  scale_size_area(limits = c(0, 0.5)) +
  geom_point(shape = 21) +
  xlab("Cell type") +
  ylab("") +
  theme_bw() +
  theme(legend.position = "bottom",
        legend.box = "horizontal",
        axis.text = element_text(size = 14),
        axis.title = element_text(size = 16))

