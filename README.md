# Social Perceptions of Abortion in the United States, 1972–2022

## Overview

This project examines changes in U.S. attitudes toward abortion over five decades using General Social Survey (GSS) data. The analysis considers seven circumstances involving fetal health, the woman's health, rape, economic constraints, marital status, family size, and abortion for any reason.

The paper analyzes 46,700 survey responses and finds that attitudes shifted modestly over time, with substantial differences by circumstance. One reported result is that support for abortion for any reason increased from 37.7% in 1977 to 58.9% in 2022.

## Authors

- Kuiyao Qiao
- Xiaoyu Miao

## Data source

The project uses the NORC [General Social Survey](https://gss.norc.org/get-the-data.html) cumulative data for 1972–2022. The repository preserves the source extract at `inputs/data/raw_data/GSS.xlsx` and the cleaned analysis file at `inputs/data/analysis_data/analysis_data.csv`.

The survey variables analyzed are `abdefect`, `abnomore`, `abhlth`, `abpoor`, `abrape`, `absingle`, and `abany`. Responses other than `YES` or `NO` are treated as missing for the analysis.

## Methods

The R workflow:

1. reads the tracked GSS workbook;
2. standardizes the seven response variables to `YES`, `NO`, or missing;
3. validates the year range and response coding; and
4. produces descriptive tables and time-series visualizations in Quarto.

The study is descriptive and discusses the limits of survey nonresponse, sample composition, and inference from survey attitudes to the wider U.S. population.

## Repository structure

- `inputs/data/raw_data/` — tracked GSS source workbook.
- `inputs/data/analysis_data/` — cleaned CSV used in the analysis.
- `scripts/` — data-access notes, cleaning code, simulation, and validation checks.
- `outputs/paper/` — Quarto source, bibliography, and rendered paper.
- `other/literature/` — supporting literature.
- `other/llm/` — documented record of LLM assistance.
- `other/sketches/` — planning sketches for the data, graphs, and tables.

## Reproducibility

From the repository root, run:

```sh
Rscript scripts/02-data_cleaning.R
Rscript scripts/03-test_data.R
quarto render "outputs/paper/Analysis of Changes in Social Perceptions on Abortion.qmd"
```

The workflow requires R with `readxl`, `dplyr`, `tidyr`, `here`, `readr`, `tidyverse`, `ggplot2`, `knitr`, and `kableExtra`, plus Quarto for rendering. `scripts/01-download_data.R` documents the manual GSS data-access step; the committed workbook is the source snapshot used for the reported results.

## Main output

`outputs/paper/Analysis-of-Changes-in-Social-Perceptions-on-Abortion.pdf` is the rendered paper.

## LLM disclosure

Use of ChatGPT 4 and Claude for language, structure, diagramming, and troubleshooting is documented in `other/llm/usage.txt`.
