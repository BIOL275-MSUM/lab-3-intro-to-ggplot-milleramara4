
# Firefly Histogram -------------------------------------------------------


# Load packages -----------------------------------------------------------

library(tidyverse)

# Spermatophore mass in male fireflies -------------------------------------

firefly_data <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv")

firefly_data

ggplot(data = firefly_data)

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass))

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass), bins = 14)

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass), bins = 14,
                 boundary = 0, closed = "left")

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass), bins = 14,
                 boundary = 0, closed = "left", 
                 fill = "#C5351B", color = "black") +
  labs(x = "Spermatophore Mass (kg)", y = "Frequency (number of species)") +
  scale_y_continuous(breaks = seq(0, 15, 5), limits = c(0, 15), 
                     expand = expansion(mult = 0)) +
  scale_x_continuous(breaks = seq(0, 0.2, 0.02)) +
  theme_classic() +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1))
  )




# Load packages -----------------------------------------------------------

library(auk)                          
birds <- ebird_taxonomy %>%           
  as_tibble() %>%                     
  filter(category == "species")       

# Bird Orders Graph -------------------------------------------------------

birds

distinct(birds, order)
count(birds, order)

ggplot(data = birds) +
  geom_bar(mapping = aes(x=fct_infreq(order)))

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B")

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B") +
  labs(x = "Order of Birds", y = "Frequency (number of birds)")

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_rev(fct_infreq(order))), fill = "#C5351B", 
           width = .8) +
  labs(x = "Order", y = "Frequency (number of species)") +
  scale_y_continuous(limits = c(0, 6500), expand = expansion(mult = 0)) +
  coord_flip() +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(0.8)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  )
