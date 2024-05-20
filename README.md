# Permanence on the UN Security Council and Topics of Discussion
- POLI 176 Final Project by Brenna Farris (UCSD)
## Research Question
Does permanent status on the UN Security Council make a difference on the most common discussion topics for the given member states in the UN General Debate?
- Permanent members in safe positions of power
- May have influential policy opinions
- General Assembly may provide insight into policy opinions
- Place to start examination between power dynamics and policies in the UN
## Data: UN General Assembly Debate Corpus
- Baturo et al. (2017) investigated this corpus
- Member states in UN give statements every year
- Covers major issues in international politics
- Reveals some states’ different points of view
## Previous Research
- Binder and Heupel (2015) - Do statements made in General Assembly Debates effect perception of UN Security Council legitimacy?
- Hwang et al. (2015) - How members temporarily joining the Security Council change their voting behavior?
- Ringrose (2020) - How language is used in UN Security Council by permanent members regarding genocide and political goals?
## Method: Topic Modeling
- R programming
- Ran code for 10 countries and 2 groups by permanence
- Randomly selected 5 non-permanent members
- Create a corpus and use bag-of-words method
- Run LDA using quanteda with 10 topics for each country/group
- Find most likely terms
- Assign topic labels based on most likely terms
- Used plots to compare and analyze
- Use Word Cloud plots to learn more generally about the two permanence groups
- Use topic prevalence bar plots to compare different types of topics and their frequency
## Results
- In word clouds for permanent/non-permanent groups noticed prevalence of the following topics among the countries examined: security, regional issues, and development
- Counted number of topics relating to these categories by permanence and country
- Compared with bar plots
- Word clouds did not reveal many differences, but sparked investigation into frequency of similar topics between countries
- From bar plots, there does appear to be a difference in topic prevalence
- From categories examined, it appears permanent countries may discuss security more
- Non-permanent countries may discuss regional issues more
