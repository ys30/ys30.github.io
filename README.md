# Yu Song — Environmental & Climate Data Science Portfolio

Source repository for my environmental and climate data science portfolio.

**Live portfolio:** https://ys30.github.io/

## Focus areas

- Climate risk and climate-economy analytics
- Environmental exposure and health
- GIS and remote sensing
- Ecological and geospatial modeling
- Statistical and machine-learning workflows
- Decision-support and data visualization

## Selected work

The live site presents case studies including climate-risk decision support, environmental exposure analysis, BECCS spatial siting, sector-specific climate damage functions, ecological machine learning, and extreme-weather analytics.

**Updated ecological modeling case study:** [Matched XGBoost / MaxEnt / Bayesian SDM benchmark](https://ys30.github.io/projects/ecological-sdm-xgboost.html) — 1,167 NSW forest plots, 23 matched taxon–fold cells, feature-representation sensitivity and retrospective rare-taxon prioritization. The associated manuscript is maintained privately.

**Updated energy-systems research engineering case:** [Western US Energy Transition Modeling](https://ys30.github.io/projects/energy-transition-analysis-pypsa.html) — independent 2024 EIA-930/860/923 data-quality and source-population audits, CISO/BPAT 8,784-hour gas-only screening models, and a [CI-verified 35-zone, 24-hour NARIS planning-Link PyPSA/HiGHS integration](https://github.com/ys30/Energy-Transition-Analysis-PyPSA/blob/main/docs/verified_naris35_24h_synthetic_load_opf.md) (131 directional interfaces, 42,840 MWh synthetic load and balanced generation, 816 MWh hypothetical local backup in isolated zone p19). The network experiment uses synthetic demand/generation/cost inputs and **does not constitute calibrated historical Western-US operation**. [Passing network CI](https://github.com/ys30/Energy-Transition-Analysis-PyPSA/actions/runs/41718188340).

**Updated climate–grid resilience case study:** [Climate & Grid Resilience](https://ys30.github.io/projects/climate-grid-resilience-pypsa.html) — audited SRP EIA-860/923/930 source scopes; ERA5 plant-site meteorology covering all 12 eligible gas plants and one coal plant in July 2024 (9,672 UTC plant-hours); same-plant January/July analysis at eight gas sites (11.90°C → 37.00°C); and a controlled PyPSA wind-input sensitivity experiment (113,630 vs 120,557 MWh *artificial simulated gap*). Weather-to-production performance and actual outages are **not calibrated or observed**. [Research methods and original run evidence](https://github.com/ys30/Climate-Grid-Resilience-Research).

## Technical toolkit

Python · R · SQL · GIS · Remote Sensing · Statistical Modeling · Machine Learning · R Shiny

## Repository structure

```
index.html      # Portfolio homepage
style.css       # Site styling
projects/       # Project case-study pages
assets/         # Portfolio assets
```

For project context and selected research, visit the [live portfolio](https://ys30.github.io/).
