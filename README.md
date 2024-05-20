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
## Plots
![Word Cloud for Random Non-Permanent Countries](https://github.com/bafarris/un-debate-lda-topics/assets/155195678/3addbd4c-1f3f-4a60-a9a4-75e8d1960d41)
Word Cloud - Non-Permanent Countries

![Word Cloud for Permanent Countries](https://github.com/bafarris/un-debate-lda-topics/assets/155195678/2ed28456-1e47-4424-9a1f-f6802e54169a)
Word Cloud - Permanent Countries

![Development Topics - By Country](https://github.com/bafarris/un-debate-lda-topics/assets/155195678/2a66fa5e-bc67-4dd1-b674-7715c31b606b)
Development Topics - By Country 

![Development Topics - By Permanence](https://github.com/bafarris/un-debate-lda-topics/assets/155195678/9a32759d-67d5-4829-b0c0-f7da1d25e296)
Development Topics - By Permanence

![Regional Topics Near or at Given Country - By Country](https://github.com/bafarris/un-debate-lda-topics/assets/155195678/aac25143-155b-422f-b12f-40913dbb96ba)
Regional Topics - By Country

![Regional Topics Near or at Given Country - By Permanence](https://github.com/bafarris/un-debate-lda-topics/assets/155195678/daad207a-967e-43ba-9499-546705cf3425)
Regional Topics - By Permanence

![Security Topics - By Country](https://github.com/bafarris/un-debate-lda-topics/assets/155195678/cee060fa-f296-437c-af8e-5602fbf0c88e)
Security Topics - By Country

![Security Topics - By Permanence](https://github.com/bafarris/un-debate-lda-topics/assets/155195678/6f335448-471b-43c0-871e-6f991b262ed3)
Security Topics - By Permanence

## Limitations and Next Steps
- Topic label assignment could have been inaccurate
- Categorizing topic prevalence topics, and selection, may have been biased
- Only investigated one random group of non-permanent members
- Difference in specificity of topics
- Find a way to have a group confirm accurate topic label assignment
- Hand-coding in future might be useful for categorizing topic prevalence topics
- Investigate more groups of non-permanent members to ensure better randomization
## References
- Baturo, Alexander, et al. “Understanding State Preferences with Text as Data: Introducing the UN General Debate Corpus.” Research & Politics, vol. 4, no. 2, 2017, pp. 205316801771282-, https://doi.org/10.1177/2053168017712821. 
- Binder, Martin, and Monika Heupel. “The Legitimacy of the UN Security Council: Evidence from Recent General Assembly Debates.” International Studies Quarterly, vol. 59, no. 2, 2015, pp. 238–50, https://doi.org/10.1111/isqu.12134.
- Grimmer, Justin, et al. Text as Data: A New Framework for Machine Learning and the Social Sciences. Princeton University Press, 2022.
- Hwang, Wonjae, et al. “Does Membership on the UN Security Council Influence Voting in the UN General Assembly?” International Interactions, vol. 41, no. 2, 2015, pp. 256–78, https://doi.org/10.1080/03050629.2015.982114.
- “Mauritius - UK/US - Chagos Islands Dispute.” Africa Research Bulletin. Political, Social and Cultural Series, vol. 53, no. 6, 2016, pp. 21055C-21055C, https://doi.org/10.1111/j.1467-825X.2016.07140.x.
- Pavlova, Petya. “1974 – The Transformation of ‘Cyprus Dispute.’” Lyuboslovie, vol. 21, 2021, pp. 118–33, https://doi.org/10.46687/OJUW5377.
- Ringrose, Michelle E. “The Politicization of the Genocide Label: Genocide Rhetoric in the UN Security Council.” Genocide Studies and Prevention, vol. 14, no. 1, 2020, pp. 124–42, https://doi.org/10.5038/1911-9933.14.1.1603.
- Robinson, Julia Silge and David. 6 Topic Modeling | Text Mining with R. www.tidytextmining.com, https://www.tidytextmining.com/topicmodeling.html.
