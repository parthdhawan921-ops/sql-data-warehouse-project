# Data Layers

This document defines the responsibilities of the Bronze, Silver, and Gold layers used in the warehouse.

| Layer | Definition | Objective | Object Type | Load Method | Main Transformations | Target Audience |
|---|---|---|---|---|---|---|
| Bronze | Raw, unprocessed data as-is from sources | Traceability and debugging | Tables | Full load (truncate & insert) | None | Data Engineers |
| Silver | Clean and standardized data | Prepare data for analysis | Tables | Full load (truncate & insert) | Cleaning, standardization, normalization, derived columns, enrichment | Data Engineers, Data Analysts |
| Gold | Business-ready data | Provide data for reporting and analytics | Views | None | Integration, aggregation, business logic and rules | Data Analysts, Business Users |

## Layer workflow

### Bronze
- Analyse source systems and understand the available extracts.
- Ingest raw CRM and ERP data.
- Validate data completeness and schema expectations.
- Document the layer and version changes in Git.

### Silver
- Explore and understand the incoming data.
- Clean and standardize the data.
- Validate data correctness.
- Document transformations and version changes in Git.

### Gold
- Explore and understand the business objects.
- Integrate Silver-layer data.
- Apply analytical and business rules.
- Validate data integration.
- Document the data model and version changes in Git.

## Source-system discovery

Important questions during source-system analysis include:

- Who owns the data?
- What business process does it support?
- How is the data stored?
- What integration capabilities are available?
- Are loads incremental or full?
- What historical data is required?
- What is the expected extract size?
- Are there data-volume limitations?
- How can extraction avoid impacting source-system performance?
- What authentication and authorization mechanisms are required?
