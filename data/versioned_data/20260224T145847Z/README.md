# Processed Data Release

- Version: 20260224T145847Z
- Frozen on: 2026-02-24 14:58:47 UTC
- Summary: NDIS data quality flagging pipeline update; all final datasets re-frozen.
- Notes: Highlights: NDIS time series converted to long format with 4 boolean flag columns (flag_decimal_spike_dip, flag_spike_dip, flag_ndis_labs_spike, flag_stale_exact_reappearance). Anomalies are now flagged rather than removed. Other datasets unchanged.

All files listed below now live in `data/versioned_data/20260224T145847Z/`.

## Source Files

- `data/annual_dna_collection/final/Annual_DNA_Collection.csv`
- `data/foia/final/foia_data_clean.csv`
- `data/ndis/final/ndis_time_series.csv`
- `data/sdis/final/SDIS_cross_section.csv`
