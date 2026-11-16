# immunopipe-EberhardtCS-2021


Reanalysis of the scRNA-seq and scTCR-seq data from [Eberhardt, Christiane S., et al., 2021](https://www.nature.com/articles/s41586-021-03862-z) using [immunopipe](https://github.com/pwwang/immunopipe).

> [Eberhardt, Christiane S., et al. "Functional HPV-specific PD-1+ stem-like CD8 T cells in head and neck cancer." Nature 597.7875 (2021): 279-284.](https://www.nature.com/articles/s41586-021-03862-z)
>

## Data preparation

The data was downloaded from [GSE180268](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE180268), where 6 samples from 6 patients were sequenced with scRNA-seq and scTCR-seq.

See `prepare-data.sh` for details.

## Configuration

> [!NOTE]
> This is not a replication of the original paper.
>

We used a minimal configuration for the analysis, which includes very basic steps such as cell filtering, clustering, and differential expression analysis. The configuration can be found in `Immunopipe.config.toml`.

## Results/Reports

You can find the results in the `Immunopipe-output` directory.

The report can be found at [https://imp-eberhardtcs-2021.pwwang.com/REPORTS](https://imp-eberhardtcs-2021.pwwang.com/REPORTS).
