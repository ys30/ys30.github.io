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

## Featured research update — Paper S (27 November 2026)

**[Renewable siting weights and the modeled value of 4-to-8-hour battery duration](https://ys30.github.io/projects/energy-transition-analysis-pypsa.html#paper-s-heading)** — a working-manuscript study grounded in the 27 November 2026 main draft and 26 November supplementary information.

- **Research question:** At fixed statewide wind/PV nameplate and battery design, how much do county resource-potential weights versus 2025 EIA-860 operating-generator geography change modeled marginal battery-duration operating value?
- **Data and method:** four Western U.S. states (AZ, CO, ID, WY); 15 original ReEDS 2022 renewable weather-reference years (2007–2013 and 2016–2023); fixed and weather-matched load; single-node, 8,760-hour chronological SciPy/HiGHS linear programs. This paper's LPs are *not* a validated PyPSA Western network model.
- **Geographic divergence:** wind/PV county-weight total variation distance **0.604–0.862**. For the fixed-demand baseline, 2025 fleet weighting increases the reported per-scheme median modeled 4→8h operating value by **67% in Idaho and 77% in Wyoming**. These percentage changes compare scheme-specific medians; *paired* median siting contrasts are computed separately.
- **Mechanism:** wind/PV Shapley attribution, full-year paired scenario experiments, and input-only storage-transfer models. Median marginal transfer shares: **18% within daily resets, 86% within weekly resets**; weekly model-effect sign matches **58/60** state–year pairs. Annual near-perfect correlation is structurally expected, not independent external validation.
- **Limited observational diagnostic:** for Idaho Power 2023, solar month×local-hour-deseasonalized Pearson r is **0.819 with resource-potential weights vs 0.906 with 2025 fleet weights**, wind **0.699 vs 0.698**, over 8,743 valid hours per fuel. The BA footprint and actual 2023 generator composition are not verified equivalents to the statewide modeled profiles.
- **Economics:** baseline matched-demand screen has **0/2,160** comparisons above the selected ATB extension hurdles; a *distinct* 3×3 penetration/wind-mix grid yields **213/1,080** modeled cases above its lowest Advanced/4% illustrative hurdle. These comparisons are not real investment feasibility, market revenue or calibrated 2023-dollar dispatch.

**Figures:** the website renders responsive manuscript-data-aligned charts for the **36 design-point paired medians** and the **IPCO residual shape comparison**. The companion Word manuscript figures are retained in the source drafts; do not silently substitute the older synthetic **20-zone/540-LP EFS** storage results or the separate **$315.993M 2024 BA** model for this four-state Paper S study.

**Source and status:** [research repository](https://github.com/ys30/Energy-Transition-Analysis-PyPSA) · [3×3 optimization audit](https://github.com/ys30/Energy-Transition-Analysis-PyPSA/actions/runs/44209543001) · [common R=1.5 sensitivity](https://github.com/ys30/Energy-Transition-Analysis-PyPSA/actions/runs/44919128370) · **working manuscript, not published or independently verified observed electricity-market performance**.

## Selected work

**Western US Weather JAX — engineering and paper results:** [Portfolio case study](https://ys30.github.io/projects/western-us-weather-jax.html) · [GitHub experiment repository](https://github.com/ys30/Western-US-Weather-JAX). The site now separates (1) JAX GPU engineering on a real NVIDIA Tesla T4 (33.29 s initial GPU vs 258.51 s one CPU reference; 3.191155 K audited CPU/GPU test-RMSE parity), and (2) the ten-seed, four-case, four-arm reference × historical-climatology research analysis (negative interaction for 39/40 full-year and 30/40 observed-hot evaluations). The latter is a retrospective ERA5 working manuscript under preparation, not a published or operational-weather benchmark.

The live site presents case studies including climate-risk decision support, environmental exposure analysis, BECCS spatial siting, sector-specific climate damage functions, ecological machine learning, and extreme-weather analytics.

**Updated ecological / geospatial ML case study (v6.25b):** [Spatially robust model benchmarking & field decision analytics](https://ys30.github.io/projects/ecological-sdm-xgboost.html) · [Research GitHub](https://github.com/ys30/Ecological-SDM-XGBoost). 1,167 NSW plots, eight taxa, 13 model configurations and 23 geographic validation schemes; quadratic logistic regression ranked first in 18/23 schemes, and spatial partitions reversed close XGBoost–MaxEnt rankings. The case study now includes geographic validation, model comparison and fixed-budget rare-taxon screening figures. Exploratory nested-tuning findings are distinguished from historical verified analyses; the manuscript is pre-submission.

**Featured Paper T — Industrial-style energy-data evidence:** [Western US Energy Transition Modeling case study](https://ys30.github.io/projects/energy-transition-analysis-pypsa.html) · [project research README](https://github.com/ys30/Energy-Transition-Analysis-PyPSA). The homepage card and featured project section now visualize the v20.8.3 source-forensic research: **289,080** EFS2020/ReEDS2022 state-hour comparisons, source-index **−2/−3 h** in ten states with rounded-scale residual, Idaho's frozen-mixture **62%** error reduction, corrected ReEDS p14 **18.86–19.08%** historical estimated demand share (distinct from the numerical fitted weights), and **937 passing CI tests**. An observed AZPS/Phoenix irradiance proxy experiment tests timing sensitivity but is **not** a physical EFS/ReEDS source-clock certification or measured PV generation. Full manuscript remains private, pre-submission; code is public.

**Updated energy-systems research engineering case:** [Western US Energy Transition Modeling](https://ys30.github.io/projects/energy-transition-analysis-pypsa.html) — independent 2024 EIA-930/860/923 data-quality and source-population audits, CISO/BPAT 8,784-hour gas-only screening models, and a [CI-verified 35-zone, 24-hour NARIS planning-Link PyPSA/HiGHS integration](https://github.com/ys30/Energy-Transition-Analysis-PyPSA/blob/main/docs/verified_naris35_24h_synthetic_load_opf.md) (131 directional interfaces, 42,840 MWh synthetic load and balanced generation, 816 MWh hypothetical local backup in isolated zone p19). The network experiment uses synthetic demand/generation/cost inputs and **does not constitute calibrated historical Western-US operation**. [Passing network CI](https://github.com/ys30/Energy-Transition-Analysis-PyPSA/actions/runs/41718188340).

**Updated climate–grid resilience case study:** [Climate & Grid Resilience](https://ys30.github.io/projects/climate-grid-resilience-pypsa.html) — audited SRP EIA-860/923/930 source scopes; ERA5 plant-site meteorology covering all 12 eligible gas plants and one coal plant in July 2024 (9,672 UTC plant-hours); same-plant January/July analysis covering all twelve eligible gas sites (12.01°C → 37.08°C); and a controlled PyPSA wind-input sensitivity experiment (113,630 vs 120,557 MWh *artificial simulated gap*). Weather-to-production performance and actual outages are **not calibrated or observed**. [Research methods and original run evidence](https://github.com/ys30/Climate-Grid-Resilience-Research).

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
