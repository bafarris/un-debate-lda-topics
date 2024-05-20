# POLI 176 Final
# Work by Brenna Farris (A17564899)

# Research Question:
# Does permanent status on the UN Security Council make a difference on the 
# most common discussion topics for the given member states in the UN General 
# Debate?

# load packages
library(tidyverse)
library(tokenizers)
library(ggplot2)
library(jsonlite)
library(quanteda)
library(quanteda.textplots)
library(stm)
library(seededlda)
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

# set working directory
setwd("/Users/brennafarris/Desktop/POLI 176/Final_Project")

## Exploration of permanent countries:
# load data
un_data <- read_csv("UNGDspeeches.csv.crdownload")
un_data

# create a corpus of the un speech
corpus_un <- corpus(un_data, text_field = "text")
corpus_un

# pre-processing data
toks <- tokens(corpus_un, remove_punct = TRUE, remove_numbers=TRUE)
toks <- tokens_wordstem(toks)
toks <- tokens_select(toks,  stopwords("en"), selection = "remove")
dfm <- dfm(toks)

# trim the dfm of rare words
dfm1 <- dfm_trim(dfm, min_docfreq = 0.1, docfreq_type = "prop")
dfm1

## Explore data for the five permanent UN members
# specify five permanent un members
permanent_un_countries <- c("GBR", "USA", "RUS", "CHN", "FRA")

# subset to only include data from permanent un members
dfm_subset <- dfm1[un_data$country %in% permanent_un_countries, ]
dfm_subset

# run LDA using quanteda
set.seed(123456789)
lda <- textmodel_lda(dfm_subset, k = 10)
lda

# summarize lda
lda_summary <- summary(lda)
lda_summary

# most likely term for each topic
lda.terms <- terms(lda, 10)
lda.terms

## Assign topic labels
# define topic labels
topic_labels_lda <- c("International Security",
                  "The Cold War and Nuclear Weapons",
                  "States' National Security",
                  "Future Global Events",
                  "International Support for National Development",
                  "National Struggles During War",
                  "Human Rights Protections",
                  "Peace Negotiation Efforts",
                  "France’s Influence on European Development",
                  "China’s Influence on International Development")

# assign labels to topics
names(topic_labels_lda) <- paste0("Topic ", 1:10)
topic_labels_lda

# assign to lda.terms
colnames(lda.terms) <- topic_labels_lda
lda.terms

## Explore most likely topics for USA:
# filter the data for speeches from the USA
usa_data <- un_data[un_data$country == "USA", ]

# create a corpus for the USA subset
corpus_usa <- corpus(usa_data, text_field = "text")

# pre-processing data
toks_usa <- tokens(corpus_usa, remove_punct = TRUE, remove_numbers = TRUE)
toks_usa <- tokens_wordstem(toks_usa)
toks_usa <- tokens_select(toks_usa, stopwords("en"), selection = "remove")
dfm_usa <- dfm(toks_usa)

# trim the dfm of rare words
dfm_usa1 <- dfm_trim(dfm_usa, min_docfreq = 0.1, docfreq_type = "prop")
dfm_usa1

# run LDA using quanteda on the USA subset
set.seed(123456789)
lda_usa <- textmodel_lda(dfm_usa1, k = 10)

# get most likely terms for each topic
lda_terms_usa <- terms(lda_usa, 10)
lda_terms_usa

# define topic labels
topic_labels_usa <- c("Nuclear Weapons Negotiations",
                      "International Economic Development",
                      "Human Rights and Peace Efforts",
                      "Cold War and Nuclear Arms Reductions",
                      "International Peace in an Era of Nuclear Weapons",
                      "National Security and Iraq",
                      "Government Terrorism Intervention",
                      "America and Collaboration",
                      "International Peace Solutions",
                      "Global Development Unity")

# assign labels to topics in the terms matrix
colnames(lda_terms_usa) <- topic_labels_usa
lda_terms_usa

## Explore most likely topics for GBR:
# filter the data for speeches from the GBR
gbr_data <- un_data[un_data$country == "GBR", ]

# create a corpus for the GBR subset
corpus_gbr <- corpus(gbr_data, text_field = "text")

# pre-processing data
toks_gbr <- tokens(corpus_gbr, remove_punct = TRUE, remove_numbers = TRUE)
toks_gbr <- tokens_wordstem(toks_gbr)
toks_gbr <- tokens_select(toks_gbr, stopwords("en"), selection = "remove")
dfm_gbr <- dfm(toks_gbr)

# trim the dfm of rare words
dfm_gbr1 <- dfm_trim(dfm_gbr, min_docfreq = 0.1, docfreq_type = "prop")
dfm_gbr1

# run LDA using quanteda on the GBR subset
set.seed(123456789)
lda_gbr <- textmodel_lda(dfm_gbr1, k = 10)

# get most likely terms for each topic
lda_terms_gbr <- terms(lda_gbr, 10)
lda_terms_gbr

## Assign topic labels
# define topic labels
topic_labels_gbr <- c("Global Future",
                   "European Concerns",
                   "Democratic Freedoms",
                   "International  Efforts in Africa",
                   "Peacekeeping Operations",
                   "International Terrorism",
                   "Support for Global Issues",
                   "Global Trade",
                   "Independence and Negotiations in Africa",
                   "Unity on Global Challenges")

# assign labels to topics in the terms matrix
colnames(lda_terms_gbr) <- topic_labels_gbr
lda_terms_gbr

## Explore most likely topics for RUS:
# filter the data for speeches from the RUS
rus_data <- un_data[un_data$country == "RUS", ]

# create a corpus for the RUS subset
corpus_rus <- corpus(rus_data, text_field = "text")

# pre-processing data
toks_rus <- tokens(corpus_rus, remove_punct = TRUE, remove_numbers = TRUE)
toks_rus <- tokens_wordstem(toks_rus)
toks_rus <- tokens_select(toks_rus, stopwords("en"), selection = "remove")
dfm_rus <- dfm(toks_rus)

# trim the dfm of rare words
dfm_rus1 <- dfm_trim(dfm_rus, min_docfreq = 0.1, docfreq_type = "prop")
dfm_rus1

# run LDA using quanteda on the RUS subset
set.seed(123456789)
lda_rus <- textmodel_lda(dfm_rus1, k = 10)

# get most likely terms for each topic
lda_terms_rus <- terms(lda_rus, 10)
lda_terms_rus

## Assign topic labels
# define topic labels
topic_labels_rus <- c("Nuclear Weapon Policy Ideas",
                   "International Security and Action",
                   "Soviet Union Relations and Policies",
                   "Protecting Human Rights",
                   "Current Global Challenges",
                   "New Political Ideas",
                   "Russian Reform Efforts",
                   "Russian Security Efforts",
                   "Soviet Peace and Arms Agreements",
                   "United Nation's Approach to Global Security")

# assign labels to topics in the terms matrix
colnames(lda_terms_rus) <- topic_labels_rus
lda_terms_rus

## Explore most likely topics for CHN:
# filter the data for speeches from the CHN
chn_data <- un_data[un_data$country == "CHN", ]

# create a corpus for the CHN subset
corpus_chn <- corpus(chn_data, text_field = "text")

# pre-processing data
toks_chn <- tokens(corpus_chn, remove_punct = TRUE, remove_numbers = TRUE)
toks_chn <- tokens_wordstem(toks_chn)
toks_chn <- tokens_select(toks_chn, stopwords("en"), selection = "remove")
dfm_chn <- dfm(toks_chn)

# trim the dfm of rare words
dfm_chn1 <- dfm_trim(dfm_chn, min_docfreq = 0.1, docfreq_type = "prop")
dfm_chn1

# run LDA using quanteda on the CHN subset
set.seed(123456789)
lda_chn <- textmodel_lda(dfm_chn1, k = 10)

# get most likely terms for each topic
lda_terms_chn <- terms(lda_chn, 10)
lda_terms_chn

## Assign topic labels
# define topic labels
topic_labels_chn <- c("China’s Role in International Development",
                   "Peace Efforts",
                   "Unity and International Relations",
                   "Global Economic Development",
                   "Regional Sovereignty Issues",
                   "Cooperation for Global Development",
                   "China’s Economic Development",
                   "Geopolitical Struggles",
                   "Bilateral Relations and Korea",
                   "Nuclear Weapons and Controls")

# assign labels to topics in the terms matrix
colnames(lda_terms_chn) <- topic_labels_chn
lda_terms_chn

## Explore most likely topics for FRA:
# filter the data for speeches from the FRA
fra_data <- un_data[un_data$country == "FRA", ]

# create a corpus for the FRA subset
corpus_fra <- corpus(fra_data, text_field = "text")

# pre-processing data
toks_fra <- tokens(corpus_fra, remove_punct = TRUE, remove_numbers = TRUE)
toks_fra <- tokens_wordstem(toks_fra)
toks_fra <- tokens_select(toks_fra, stopwords("en"), selection = "remove")
dfm_fra <- dfm(toks_fra)

# trim the dfm of rare words
dfm_fra1 <- dfm_trim(dfm_fra, min_docfreq = 0.1, docfreq_type = "prop")
dfm_fra1

# run LDA using quanteda on the FRA subset
set.seed(123456789)
lda_fra <- textmodel_lda(dfm_fra1, k = 10)

# get most likely terms for each topic
lda_terms_fra <- terms(lda_fra, 10)
lda_terms_fra

## Assign topic labels
# define topic labels
topic_labels_fra <- c("Nuclear Weapons",
                   "Terrorism and Actions",
                   "Human Rights Protections",
                   "Collaboration and Governing",
                   "France’s Role in Global Development",
                   "United Nations Protecting Rights",
                   "Community Peace Efforts",
                   "Security Council Actions",
                   "France’s Peace Advocacy",
                   "European Sovereignty Dynamics")

# assign labels to topics in the terms matrix
colnames(lda_terms_fra) <- topic_labels_fra
lda_terms_fra

## Explore data for the five non-permanent UN members
# randomly select 5 non-permanent Security Council UN countries
random_countries <- un_data %>%
  filter(!country %in% c("GBR", "USA", "RUS", "CHN", "FRA")) %>%
  sample_n(5)
random_countries

# specify five non-permanent un members
non_permanent_un_countries <- c("GRC", "NOR", "STP", "ROU", "MUS")

# subset to only include data from permanent un members
dfm_subset2 <- dfm1[un_data$country %in% non_permanent_un_countries, ]
dfm_subset2

# run LDA using quanteda
set.seed(123456789)
lda2 <- textmodel_lda(dfm_subset2, k = 10)
lda2

# summarize lda
lda_summary2 <- summary(lda2)
lda_summary2

# get most likely terms for each topic
lda.terms2 <- terms(lda2, 10)
lda.terms2

## Assign topic labels
# define topic labels
topic_labels_lda2 <- c("Sovereignty",
                   "Peace in the Developing World",
                   "Global Conflicts",
                   "Negotiation Efforts",
                   "Democracies",
                   "Human Rights and Economic Interactions",
                   "Policies and the International Economy",
                   "Island States’ Development and Security",
                   "European Actions and Collaboration",
                   "International Security")

# assign labels to topics
names(topic_labels_lda2) <- paste0("Topic ", 1:10)
topic_labels_lda2

# assign to lda.terms2
colnames(lda.terms2) <- topic_labels_lda2
lda.terms2

## Explore most likely topics for GRC:
# filter the data for speeches from the GRC
grc_data <- un_data[un_data$country == "GRC", ]

# create a corpus for the GRC subset
corpus_grc <- corpus(grc_data, text_field = "text")

# pre-processing data
toks_grc <- tokens(corpus_grc, remove_punct = TRUE, remove_numbers = TRUE)
toks_grc <- tokens_wordstem(toks_grc)
toks_grc <- tokens_select(toks_grc, stopwords("en"), selection = "remove")
dfm_grc <- dfm(toks_grc)

# trim the dfm of rare words
dfm_grc1 <- dfm_trim(dfm_grc, min_docfreq = 0.1, docfreq_type = "prop")
dfm_grc1

# run LDA using quanteda on the GRC subset
set.seed(123456789)
lda_grc <- textmodel_lda(dfm_grc1, k = 10)

# get most likely terms for each topic
lda_terms_grc <- terms(lda_grc, 10)
lda_terms_grc

## Assign topic labels
# define topic labels
topic_labels_grc <- c("European Security",
                   "Cyprus Issues",
                   "Greece’s Crisis Support",
                   "Peace Goals and Cyprus",
                   "World Development",
                   "Economic Collaboration",
                   "Greece’s Economic Politics",
                   "Regional Rights and Cyprus",
                   "Negotiations",
                   "Regional Rights and Turkey")

# assign labels to topics in the terms matrix
colnames(lda_terms_grc) <- topic_labels_grc
lda_terms_grc

## Explore most likely topics for NOR
# filter the data for speeches from the
nor_data <- un_data[un_data$country == "NOR", ]

# create a corpus for the NOR subset
corpus_nor <- corpus(nor_data, text_field = "text")

# pre-processing data
toks_nor <- tokens(corpus_nor, remove_punct = TRUE, remove_numbers = TRUE)
toks_nor <- tokens_wordstem(toks_nor)
toks_nor <- tokens_select(toks_nor, stopwords("en"), selection = "remove")
dfm_nor <- dfm(toks_nor)

# trim the dfm of rare words
dfm_nor1 <- dfm_trim(dfm_nor, min_docfreq = 0.1, docfreq_type = "prop")
dfm_nor1

# run LDA using quanteda on the  NOR subset
set.seed(123456789)
lda_nor <- textmodel_lda(dfm_nor1, k = 10)

# get most likely terms for each topic
lda_terms_nor <- terms(lda_nor, 10)
lda_terms_nor

## Assign topic labels
# define topic labels
topic_labels_nor <- c("Sustainable Development Goals",
                   "United Nations Reforms",
                   "Global Development",
                   "Norway and International Development",
                   "Norway and Human Rights",
                   "Nuclear Weapons Negotiations",
                   "European Maritime Law",
                   "United Nations Actions",
                   "Human Rights and the Economy",
                   "Freedoms in the Middle East")

# assign labels to topics in the terms matrix
colnames(lda_terms_nor) <- topic_labels_nor
lda_terms_nor

## Explore most likely topics for STP
# filter the data for speeches from the STP subset
stp_data <- un_data[un_data$country == "STP", ]

# create a corpus for the STP subset
corpus_stp <- corpus(stp_data, text_field = "text")

# pre-processing data
toks_stp <- tokens(corpus_stp, remove_punct = TRUE, remove_numbers = TRUE)
toks_stp <- tokens_wordstem(toks_stp)
toks_stp <- tokens_select(toks_stp, stopwords("en"), selection = "remove")
dfm_stp <- dfm(toks_stp)

# trim the dfm of rare words
dfm_stp1 <- dfm_trim(dfm_stp, min_docfreq = 0.1, docfreq_type = "prop")

# run LDA using quanteda on the STP subset
set.seed(123456789)
lda_stp <- textmodel_lda(dfm_stp1, k = 10)

# get most likely terms for each topic
lda_terms_stp <- terms(lda_stp, 10)
lda_terms_stp

## Assign topic labels
# define topic labels
topic_labels_stp <- c("São Tomé and Príncipe and Government Challenges",
                   "International Rights",
                   "Adopting Resolutions and Taking Action",
                   "São Tomé and Príncipe National Identity",
                   "Economic Development Issues and Africa",
                   "Sustainable Development Actions",
                   "Work with Taiwan",
                   "Peace Efforts",
                   "Regional Independence and Relations",
                   "Talking about Solutions to Problems")

# assign labels to topics in the terms matrix
colnames(lda_terms_stp) <- topic_labels_stp
lda_terms_stp

## Explore most likely topics for ROU
# filter the data for speeches from the ROU subset
rou_data <- un_data[un_data$country == "ROU", ]

# create a corpus for the ROU subset
corpus_rou <- corpus(rou_data, text_field = "text")

# pre-processing data
toks_rou <- tokens(corpus_rou, remove_punct = TRUE, remove_numbers = TRUE)
toks_rou <- tokens_wordstem(toks_rou)
toks_rou <- tokens_select(toks_rou, stopwords("en"), selection = "remove")
dfm_rou <- dfm(toks_rou)

# trim the dfm of rare words
dfm_rou1 <- dfm_trim(dfm_rou, min_docfreq = 0.1, docfreq_type = "prop")

# run LDA using quanteda on the ROU subset
set.seed(123456789)
lda_rou <- textmodel_lda(dfm_rou1, k = 10)

# get most likely terms for each topic
lda_terms_rou <- terms(lda_rou, 10)
lda_terms_rou

## Assign topic labels
# define topic labels
topic_labels_rou <- c("Romania and International Development",
                   "Regional Security",
                   "Global Development Problems",
                   "The Changing World and War",
                   "Romania, Europe, and Democracy",
                   "Nuclear Weapons Policies",
                   "Human Rights and Democracies",
                   "Global Unity and Actions",
                   "Romania and Security",
                   "Romania and Peace Efforts")

# assign labels to topics in the terms matrix
colnames(lda_terms_rou) <- topic_labels_rou
lda_terms_rou

## Explore most likely topics for MUS
# filter the data for speeches from the MUS subset
mus_data <- un_data[un_data$country == "MUS", ]

# create a corpus for the MUS subset
corpus_mus <- corpus(mus_data, text_field = "text")

# pre-processing data
toks_mus <- tokens(corpus_mus, remove_punct = TRUE, remove_numbers = TRUE)
toks_mus <- tokens_wordstem(toks_mus)
toks_mus <- tokens_select(toks_mus, stopwords("en"), selection = "remove")
dfm_mus <- dfm(toks_mus)

# trim the dfm of rare words
dfm_mus1 <- dfm_trim(dfm_mus, min_docfreq = 0.1, docfreq_type = "prop")

# run LDA using quanteda on the MUS subset
set.seed(123456789)
lda_mus <- textmodel_lda(dfm_mus1, k = 10)

# get most likely terms for each topic
lda_terms_mus <- terms(lda_mus, 10)
lda_terms_mus

## Assign topic labels
# define topic labels
topic_labels_mus <- c("Human Rights and Nuclear Weapons",
                   "Regional Development",
                   "International Peace",
                   "War and Actions",
                   "Sustainable Development Goals",
                   "Communities’ Security and Conflicts in Africa",
                   "Africa and Economic Development Policies",
                   "Indian Ocean Regional Issues",
                   "Mauritius and Sovereignty",
                   "National Assembly and Africa")

# assign labels to topics in the terms matrix
colnames(lda_terms_mus) <- topic_labels_mus
lda_terms_mus

## Create Plots to Learn More
## Word Clouds

# Word Cloud for Permanent Countries
textplot_wordcloud(dfm_subset, col="black")

# Word Cloud for Random Non-Permanent Countries
textplot_wordcloud(dfm_subset2, col="black")

## Bar Graphs
# Bar Graph of Topic Prevalence - Security Topics - By Country

# create a data frame with values
securitydatacountry <- data.frame(
  Country = c("USA", "GBR", "RUS", "CHN", "FRA", "GRC", "NOR", "STP", "ROU", 
              "MUS"),
  Value = c(5, 1, 5, 1, 3, 1, 1, 0, 3, 2)
)

# create the bar plot
ggplot(securitydatacountry, aes(x = Country, y = Value, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(title = "Security Topics - By Country", x = "Country", y = "Value") +
  theme_minimal()

# Bar Graph of Topic Prevalence - Security Topics - By Permanence

# create a data frame with values
securitydataperm <- data.frame(
  Country = c("Permanent", "Not Permanent"),
  Value = c(15, 7)
)

# create the bar plot
ggplot(securitydataperm, aes(x = Country, y = Value, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(title = "Security Topics - By Permanence", x = "Membership Status", 
       y = "Value") +
  theme_minimal()

# Bar Graph of Topic Prevalence - Regional Topics Near or at Given Country - 
# By Country

# create a data frame with values
regionaldatacountry <- data.frame(
  Country = c("USA", "GBR", "RUS", "CHN", "FRA", "GRC", "NOR", "STP", "ROU", 
              "MUS"),
  Value = c(0, 1, 1, 2, 1, 4, 1, 5, 2, 6)
)

# create the bar plot
ggplot(regionaldatacountry, aes(x = Country, y = Value, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(title = "Regional Topics Near or at Given Country - By Country", 
       y = "Value") +
  theme_minimal()

# Bar Graph of Topic Prevalence - Regional Topics Near or at Given Country - 
# By Permanence

# create a data frame with values
regionaldataperm <- data.frame(
  Country = c("Permanent", "Not Permanent"),
  Value = c(5, 18)
)

# create the bar plot
ggplot(regionaldataperm, aes(x = Country, y = Value, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(title = "Regional Topics Near or at Given Country - By Permanence", 
       x = "Membership Status", y = "Value") +
  theme_minimal()

# Bar Graph of Topic Prevalence - Development Topics - By Country

# create a data frame with values
developmentdatacountry <- data.frame(
  Country = c("USA", "GBR", "RUS", "CHN", "FRA", "GRC", "NOR", "STP", "ROU", 
              "MUS"),
  Value = c(1, 1, 0, 4, 0, 2, 2, 1, 0, 2)
)

# create the bar plot
ggplot(developmentdatacountry, aes(x = Country, y = Value, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(title = "Development Topics - By Country", y = "Value") +
  theme_minimal()

# Bar Graph of Topic Prevalence - Development Topics - By Permanence

# create a data frame with values
developmentdataperm <- data.frame(
  Country = c("Permanent", "Not Permanent"),
  Value = c(6, 7)
)

# create the bar plot
ggplot(developmentdataperm, aes(x = Country, y = Value, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(title = "Development Topics - By Permanence", x = "Membership Status", 
       y = "Value") +
  theme_minimal()
