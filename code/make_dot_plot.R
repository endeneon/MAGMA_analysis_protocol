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

ggplot(data = df_raw,
       aes(y = BETA,
           x = `-log10P`)) +
  geom_point(size = 1.5) +
  geom_hline(yintercept = 0,
             colour = "royalblue") +
  geom_vline(xintercept = 0,
             colour = "royalblue") +
  xlim(0, 7) +
  theme_bw() +
  facet_grid(VARIABLE ~ .) +
  ggtitle('iPSC derived neuron H-MAGMA')

# plot panel B
df_raw <- read_table2("Apr122021_set_analysis.gsa.out",
                      skip = 4)
df_raw$`-log10P` <- 0 - log10(df_raw$P)
df_raw$VARIABLE <- factor(df_raw$VARIABLE,
                          levels = c("Glut", "NPC", "DA", "GABA", "iPS"))
df_raw$TYPE <- "PGC_SCZ_w3"

ggplot(data = df_raw,
       aes(y = BETA,
           x = `-log10P`)) +
  geom_point(size = 1.5) +
  geom_hline(yintercept = 0,
             colour = "royalblue") +
  geom_vline(xintercept = 0,
             colour = "royalblue") +
  xlim(0, 7) +
  theme_bw() +
  facet_grid(VARIABLE ~ .) +
  ggtitle('[-100k, 20k] window standard MAGMA')
