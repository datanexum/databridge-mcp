# DataBridge AI

**"Upload your Chart of Accounts. Get a production-ready financial hierarchy and dbt models. Zero config."**

[![PyPI version](https://badge.fury.io/py/databridge-ai.svg)](https://pypi.org/project/databridge-ai/)
[![Python 3.10+](https://img.shields.io/badge/python-3.10+-blue.svg)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

DataBridge AI is a **Financial Data Implementation Engine**. It automates the "60-second wow" — the journey from a raw COA file to a validated hierarchy and running data mart.

### How it Works
1. **Upload** — Drag and drop any COA, GL extract, or financial data file.
2. **Auto-Map** — AI detects your ERP, recommends hierarchy templates, and maps accounts.
3. **Deploy** — Export dbt models, Snowflake scripts, or Power BI-ready structures.

## Quick Start (No Installation)
Try the guided demo in seconds using Docker:
```bash
docker run -p 5050:5050 datanexum/databridge-ai:demo
# Open http://localhost:5050
```

---

## Features

| Module | Tools | Description |
|--------|-------|-------------|
| **Hierarchy Builder** | 49 | Create and manage multi-level hierarchy projects (up to 15 levels) |
| **Data Reconciliation** | 38 | Compare and validate data from CSV, SQL, PDF, JSON sources |
| **Wright Module** | 31 | Hierarchy-driven data mart generation with 4-object pipeline |
| **Cortex AI** | 26 | Snowflake Cortex AI with natural language to SQL |
| **Data Catalog** | 19 | Centralized metadata registry with business glossary |
| **Templates & Skills** | 16 | Pre-built templates and AI expertise definitions |
| **Data Observability** | 15 | Real-time metrics, alerting, anomaly detection, health scoring |
| **Data Versioning** | 12 | Semantic versioning, snapshots, rollback, and diff |
| **Git/CI-CD** | 12 | Automated workflows and GitHub integration |
| **Lineage Tracking** | 11 | Column-level lineage and impact analysis |
| **PlannerAgent** | 11 | AI-powered workflow planning and agent suggestions |
| **ScriptGenerator** | 3 | Plan → executable Python script (E2E, BLCE, or Custom strategies) |
| **Workflow Controller** | 2 | Subprocess management, phase tracking, live monitoring |
| **GraphRAG Engine** | 10 | Anti-hallucination layer with graph + vector retrieval |
| **Unified AI Agent** | 10 | Cross-system operations (Book/Librarian/Researcher) |
| **dbt Integration** | 8 | Generate dbt projects from hierarchies |
| **Data Quality** | 7 | Expectation suites and data contracts |
| **DataShield** | 12 | Offline pre-AI masking with preserved table purpose and analytical patterns |
| **Diff Utilities** | 6 | Character-level text and data comparison |
| **Hierarchy-Graph Bridge** | 5 | Event-driven sync between hierarchies, GraphRAG, and lineage |
| **Grounded Detection** | 5 | KB-grounded audit loop: Detect > Feedback > Adjust > Memorize |
| **AI Relationship Discovery** | 8 | Schema analysis, naming pattern detection, relationship inference |
| **Cortex Table Understanding** | 5 | AI-powered table documentation and graph sync |
| **BLCE** | 84 | Business Logic Comprehension Engine — extract, normalize, govern, and deploy logic from SQL, Python, Excel, DAX, MDX, PDF |
| **Mart Factory** | 10 | Hierarchy-driven data mart generation with automated 4-object DDL pipeline |
| **Slack Integration** | 3 | Post messages, reconciliation reports, workflow alerts |
| **Jira / Linear** | 4 | Issue creation, workflow linking, status tracking |
| **Google Sheets** | 4 | Import/export data, sync hierarchies, write results |
| **Power BI** | 3 | DAX measures, dataset export, push datasets |
| **Tableau** | 3 | TDS datasource generation, hierarchy export, publishing |
| **Airflow / Dagster** | 3 | Export workflows as DAGs and job definitions |
| **Terraform** | 3 | Export Snowflake objects as HCL, generate grants |
| **VS Code** | 3 | Workspace, MCP settings, launch config generation |
| **Batch Excel Triage** | 1 | Scan, classify, and generate quality reports for Excel file batches |
| **IKE — Institutional Wisdom** | 34 | Self-learning knowledge engine (6 pillars): KB, Fix Gen, Debate, Scoring, Learning, Wisdom Extractor |
| **And more...** | 44 | Console dashboard, recommendations, orchestrator, etc. |

### Hierarchy-Centric Architecture

DataBridge AI v0.45.0 introduces a hierarchy-centric architecture where the **Hierarchy Builder** serves as the central data structure. The new **Hierarchy-Graph Bridge** (`hierarchy/graph_bridge.py`) uses event-driven propagation to keep all downstream systems in sync:

- **Hierarchy changes** trigger automatic reindexing in the GraphRAG vector store
- **Lineage graphs** are rebuilt to reflect updated hierarchy relationships
- **Impact analysis** propagates through the catalog and observability subsystems
- **Wright Pipeline** can generate data marts directly from hierarchy projects via `wright_from_hierarchy`

### GraphRAG Runtime Health Monitoring

GraphRAG now includes startup bootstrap and runtime health logging so graph/vector/RAG synchronization can be verified during operation.

- **Startup bootstrap (automatic):**
  - Initializes embedding provider + vector store
  - Performs best-effort indexing for catalog and hierarchies
- **Runtime monitor (automatic):**
  - Writes periodic status snapshots every ~120 seconds
  - Confirms vector/embedder/retriever readiness and hierarchy bridge wiring

Use unified ops action to check runtime state:

```python
rag_ops(action="runtime_status", log_limit=50)
```

Runtime health log file:

```text
data/graphrag/runtime_health.jsonl
```

Codex GraphRAG index behavior:
- `codex_graphrag` auto-builds index if missing
- auto-refreshes index when `docs/Codex/*.json` is newer than `data/codex_graphrag/index.json`

### DataShield Positioning

DataShield is not positioned as a warehouse security boundary. It is an **offline Python-based pre-AI masking layer** for clients who do not want raw data sent to AI.

- Raw client data is masked before any AI processing in DataBridge.
- AI sees only post-processed scrambled/synthetic data.
- DataShield stores table summary and purpose metadata before masking so semantic context is preserved after scrambling.
- Post-processed Snowflake data is used for relationship discovery, profiling, and warehouse design, and is intentionally de-correlated from client source data.

## Editions

DataBridge AI is available in four editions:

| | **Community (CE)** | **Pro** | **Pro Examples** | **Enterprise** |
|---|:---:|:---:|:---:|:---:|
| **Tools** | ~106 | ~247 | Tests & Tutorials | 320+ |
| **Distribution** | Public PyPI | GitHub Packages | GitHub Packages | Private Deploy |
| **License** | MIT (Free) | License Key | Requires Pro Key | Dedicated Key |
| Data Reconciliation | ✅ | ✅ | | ✅ |
| Fuzzy Matching | ✅ | ✅ | | ✅ |
| PDF/OCR Extraction | ✅ | ✅ | | ✅ |
| dbt Basic | ✅ | ✅ | | ✅ |
| Data Quality | ✅ | ✅ | | ✅ |
| UI Dashboard | ✅ | ✅ | | ✅ |
| Cortex AI Agent | | ✅ | | ✅ |
| Wright Pipeline | | ✅ | | ✅ |
| GraphRAG Engine | | ✅ | | ✅ |
| Data Observability | | ✅ | | ✅ |
| Full Data Catalog | | ✅ | | ✅ |
| Column Lineage | | ✅ | | ✅ |
| Hierarchy Builder | | ✅ | | ✅ |
| AI Orchestrator | | ✅ | | ✅ |
| Data Versioning | | ✅ | | ✅ |
| Git/CI-CD Automation | | ✅ | | ✅ |
| Table Understanding | | ✅ | | ✅ |
| AI Relationship Discovery | | ✅ | | ✅ |
| 47 Tests + 29 Tutorials | | | ✅ | |
| Custom Agents | | | | ✅ |
| White-label | | | | ✅ |
| SLA Support | | | | ✅ |

See [Commercialization Guide](docs/COMMERCIALIZATION.md) for full details.

## DataBridge AI Pro

Pro adds **19 modules** with ~213 additional tools on top of Community Edition:

| Module | Tools | Description |
|--------|-------|-------------|
| **Hierarchy Builder** | 49 | Multi-level hierarchy projects (up to 15 levels) |
| **Wright Pipeline** | 31 | 4-object data mart factory (VW_1 → DT_2 → DT_3A → DT_3) with hierarchy integration |
| **Cortex AI** | 26 | Snowflake Cortex natural language to SQL and AI reasoning |
| **Data Catalog** | 19 | Centralized metadata registry with automatic lineage |
| **Faux Objects** | 18 | Domain persona-based hierarchy generation |
| **Connections** | 16 | Multi-database connectivity management |
| **AI Orchestrator** | 16 | Multi-agent task coordination and workflow management |
| **Data Observability** | 15 | Real-time metrics, alerting, anomaly detection |
| **Data Versioning** | 12 | Semantic versioning, snapshots, rollback, and diff |
| **Git/CI-CD** | 12 | Automated workflows and GitHub integration |
| **Lineage Tracking** | 11 | Column-level lineage and impact analysis |
| **PlannerAgent** | 11 | AI-powered workflow planning and agent suggestions |
| **GraphRAG Engine** | 10 | Anti-hallucination layer with graph + vector retrieval |
| **Unified AI Agent** | 10 | Cross-system operations (Book/Librarian/Researcher) |
| **Hierarchy-Graph Bridge** | 5 | Event-driven sync between hierarchies, GraphRAG, and lineage |
| **Console Dashboard** | 5 | Real-time broadcast messaging and monitoring |
| **Schema Matcher** | 5 | Cross-database schema comparison and mapping |
| **AI Relationship Discovery** | 8 | Schema analysis, naming patterns, relationship inference |
| **Cortex Table Understanding** | 5 | AI-powered table documentation and graph sync |
| **Data Matcher** | 4 | Row-level data comparison across connections |
| **BLCE** | 72 | Business Logic Comprehension Engine — extract, normalize, govern, deploy business logic |
| **DataShield** | 12 | Offline pre-AI masking; AI only sees post-processed scrambled data |

## Pro Examples

The **Pro Examples** add-on (`databridge-ai-examples`) provides a comprehensive tests and tutorials package:

- **29 use-case tutorials**: Beginner (4), Financial (7), Faux Objects (8), ERP DW (10)
- **47 test files**: CE test suite + Pro test suite + shared fixtures
- Requires a valid Pro license key

## Installation

### DataBridge Core (Open Source — Developers & Data Engineers)

The standalone reconciliation, profiling, and ingestion toolkit — no license key needed:

```bash
pip install databridge-core  # v1.0.0 on PyPI
```

```bash
# Profile a file
databridge profile sales.csv

# Compare two sources
databridge compare source.csv target.csv --keys id

# Fuzzy match across systems
databridge fuzzy erp.csv gl.csv --column name --threshold 80
```

9 CLI commands, 16 Python API functions. See [databridge-core](https://github.com/datanexum/databridge-core) for full docs.

### DataBridge AI Platform (Full Suite)

```bash
# Community Edition (free, from PyPI)
pip install databridge-ai

# With optional dependencies
pip install databridge-ai[pdf]       # PDF support
pip install databridge-ai[snowflake] # Snowflake support
pip install databridge-ai[all]       # All dependencies

# Pro Edition (requires license key)
export DATABRIDGE_LICENSE_KEY="DB-PRO-YOURKEY-20260101-signature"
pip install databridge-ai-pro --extra-index-url https://ghp_TOKEN@raw.githubusercontent.com/datanexum/DATABRIDGE_AI/main/

# Pro Examples (requires Pro license key)
pip install databridge-ai-examples                # CE tests + beginner tutorials
pip install databridge-ai-examples[pro]           # + Pro tests + advanced tutorials
```

## Licensing

DataBridge AI uses a key-based licensing system for Pro and Enterprise editions.

**License Key Format:**
```
DB-{TIER}-{CUSTOMER_ID}-{EXPIRY}-{SIGNATURE}
Example: DB-PRO-ACME001-20270209-a1b2c3d4e5f6
```

```bash
# Generate a license key (admin)
python scripts/generate_license.py PRO CUSTOMER01 365

# Check license status (MCP tool)
get_license_status()
```

See [docs/COMMERCIALIZATION.md](docs/COMMERCIALIZATION.md) for key management, distribution, and API reference.

## Quick Start

### As MCP Server (Claude Desktop)

```bash
python run_server.py          # Slim mode (default, ~15 tools)
python run_server.py --full   # Full mode (all tools)
```

Add to your `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "DataBridge_AI": {
      "command": "python",
      "args": ["run_server.py"]
    }
  }
}
```

### Web UI Dashboard

```bash
cd databridge-ce/ui
python server.py
# Open http://127.0.0.1:5050
```

### Workbench UI Features

The Web UI includes several guided workflows:

- **AI Planner** — Conversational workflow builder powered by Claude. Describe what you want in natural language and get an executable multi-step plan with agent assignments and confidence scores.
- **Execution Wizard** — 3-step guided modal (Connection → Options → Review) for configuring plan execution. Discovers Snowflake connections, lets you set row limits, ERP type, and skip phases before generating a script.
- **Workflow Controller** — Live monitoring of running workflows via vis.js flow graph and Mermaid flowchart with 4 layout modes (LR, TB, Swimlane, Freeform).
- **Onboarding Banner** — First-run welcome card with guided actions to help new users get started.

### Programmatic Usage

```python
from src.server import mcp

# Run as MCP server
mcp.run()
```

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│  Workbench UI (:5050)           │  Claude / LLM Client      │
│  AI Planner · Workflow Editor   │  MCP Protocol             │
│  Execution Wizard · Dashboard   │                           │
└──────────────┬──────────────────┴──────────┬────────────────┘
               │ HTTP/WS                     │ MCP
               ▼                             ▼
┌─────────────────────────────────────────────────────────────┐
│            Flask Server + MCP Server (316 Tools)            │
│                                                             │
│  AI Layer                                                   │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │  Planner    │  │  Script     │  │  Workflow   │         │
│  │  Agent      │  │  Generator  │  │  Controller │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
│                                                             │
│  Plugin Modules                                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │  Hierarchy  │  │   Cortex    │  │   Wright    │         │
│  │   Builder   │  │   Agent     │  │   Module    │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │    Data     │  │   Lineage   │  │    Data     │         │
│  │   Catalog   │  │   Tracker   │  │   Quality   │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   GraphRAG  │  │ Observabil- │  │    Data     │         │
│  │   Engine    │  │    ity      │  │ Versioning  │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
│  ┌─────────────┐                                            │
│  │    BLCE     │  Business Logic Comprehension Engine       │
│  │  (84 tools) │  SQL/Python/Excel/DAX/MDX/PDF parsing      │
│  └─────────────┘                                            │
│  ┌─────────────┐                                            │
│  │ Integrations│  Slack, Jira, Sheets, Power BI, Tableau,  │
│  │  (26 tools) │  Airflow, Terraform, VS Code               │
│  └─────────────┘                                            │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  IKE — Institutional Wisdom (Standalone Microservice)       │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐       │
│  │ P1: KB   │ │ P2: Fix  │ │ P3:Debate│ │P4:Scoring│       │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘       │
│  ┌──────────┐ ┌──────────────────────────────────────┐      │
│  │P5:Learn  │ │ P6: Wisdom Extractor (Excel Intel)   │      │
│  └──────────┘ └──────────────────────────────────────┘      │
│  34 MCP tools · FastAPI :8000 · gRPC :50051                 │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│              Snowflake / CSV / SQL / PDF                     │
└─────────────────────────────────────────────────────────────┘
```

## Core Modules

### Hierarchy Builder
Create and manage multi-level hierarchy projects for financial reporting, organizational structures, and data classification.

```python
# Create a hierarchy project
create_hierarchy_project(name="Revenue P&L", description="Revenue hierarchy")

# Add hierarchies with source mappings
create_hierarchy(project_id="...", name="Product Revenue", parent_id="...")
add_source_mapping(hierarchy_id="...", source_column="ACCOUNT_CODE", source_uid="41%")

# Export and deploy
export_hierarchy_csv(project_id="...")
generate_hierarchy_scripts(project_id="...")
```

### Cortex AI Integration
Natural language to SQL and AI-powered data operations using Snowflake Cortex.

```python
# Configure Cortex
configure_cortex_agent(connection_id="snowflake-prod", cortex_model="mistral-large")

# Natural language query
analyst_ask(question="What was total revenue by region last quarter?",
            semantic_model_file="@ANALYTICS.PUBLIC.MODELS/sales.yaml")

# AI reasoning loop
cortex_reason(goal="Analyze data quality in PRODUCTS table")
```

### Wright Module (Data Mart Factory)
Generate data marts using the 4-object pipeline pattern: VW_1 → DT_2 → DT_3A → DT_3

```python
# Create mart configuration
create_mart_config(project_name="upstream_gross", report_type="GROSS",
                   hierarchy_table="TBL_0_GROSS_LOS_REPORT_HIERARCHY")

# Generate pipeline
generate_mart_pipeline(config_name="upstream_gross")
```

### Data Versioning
Track changes to hierarchies, catalog assets, and semantic models with semantic versioning.

```python
# Create version snapshot
version_create(object_type="hierarchy", object_id="revenue-pl",
               description="Added new cost centers", bump="minor")

# Compare versions
version_diff(object_type="hierarchy", object_id="revenue-pl",
             from_version="1.0.0", to_version="1.1.0")

# Rollback
version_rollback(object_type="hierarchy", object_id="revenue-pl", to_version="1.0.0")
```

### Data Observability
Real-time metrics collection, alerting, anomaly detection, and health scoring.

```python
# Record metrics
obs_record_metric(name="hierarchy.validation.success_rate", value=98.5,
                  type="gauge", tags='{"project_id": "revenue-pl"}')

# Create alert rules
obs_create_alert_rule(name="Low success rate",
                      metric_name="hierarchy.validation.success_rate",
                      threshold=95.0, comparison="<", severity="warning")

# Detect anomalies
obs_detect_anomaly(metric_name="hierarchy.validation.success_rate", value=72.0)

# Get asset health score
obs_get_asset_health(asset_id="revenue-pl", asset_type="hierarchy_project")

# System health dashboard
obs_get_system_health()
```

### GraphRAG Engine
Anti-hallucination layer using graph + vector retrieval-augmented generation.

```python
# Unified search action
rag_search(action="search", query="What hierarchies use ACCOUNT_CODE?", max_results=5)

# Validate AI output against knowledge graph
rag_ops(action="validate_output", content="SELECT * FROM REVENUE", content_type="sql")

# Runtime health (bootstrap + bridge wiring + vector readiness)
rag_ops(action="runtime_status", log_limit=25)
```

## Configuration

Create a `.env` file:

```env
# Data directory
DATA_DIR=./data

# License key (for Pro/Enterprise)
DATABRIDGE_LICENSE_KEY=DB-PRO-YOURKEY-20260101-signature

# NestJS backend (optional)
NESTJS_BACKEND_URL=http://localhost:8001
NESTJS_API_KEY=your-api-key

# Snowflake (optional)
SNOWFLAKE_ACCOUNT=your-account
SNOWFLAKE_USER=your-user
SNOWFLAKE_PASSWORD=your-password

# Cortex AI
CORTEX_DEFAULT_MODEL=mistral-large
```

## Documentation

- **[CLAUDE.md](CLAUDE.md)** - Complete tool reference and usage guide for Claude
- **[GEMINI.md](GEMINI.md)** - Gemini integration guide and quick reference
- **[docs/AI_AGENT_CONTEXT.md](docs/AI_AGENT_CONTEXT.md)** - Directives and system context for AI agents
- **[docs/deep_dives/](docs/deep_dives/)** - Detailed technical guides for core modules, agents, and plugins
- **[docs/MANIFEST.md](docs/MANIFEST.md)** - Auto-generated tool manifest
- **[docs/COMMERCIALIZATION.md](docs/COMMERCIALIZATION.md)** - Licensing, tiers, and distribution
- **[docs/GRAPHRAG_RUNTIME_OPERATIONS.md](docs/GRAPHRAG_RUNTIME_OPERATIONS.md)** - Runtime health, auto-updates, and troubleshooting for graph/vector/RAG sync
- **[docs/excel_plugin_tutorial_user_guide.html](docs/excel_plugin_tutorial_user_guide.html)** - Excel add-in tutorial and user guide
- **[apps/excel-plugin/SSO_SETUP.md](apps/excel-plugin/SSO_SETUP.md)** - Microsoft SSO (NAA/MSAL-first) setup for the Excel add-in
- **IKE Microservice** (`ike/`) — Self-learning knowledge engine with 6 pillars (KB, Fix Gen, Debate, Scoring, Learning, Wisdom Extractor), 34 MCP tools, FastAPI REST + gRPC APIs
- **[docs/compliance/OPEN_SOURCE_COMPLIANCE.md](docs/compliance/OPEN_SOURCE_COMPLIANCE.md)** - OSS compliance process and governance
- **[docs/compliance/THIRD_PARTY_NOTICES.md](docs/compliance/THIRD_PARTY_NOTICES.md)** - Third-party package notices and license review flags
- **[Wiki](../../wiki)** - Architecture, getting started, and tutorials

## Community Edition

The `databridge-ce/` folder contains the open-source Community Edition with:
- Plugin architecture for custom tools
- Web UI dashboard
- Starter templates

## Contributing

Contributions are welcome! Please read our contributing guidelines before submitting PRs.

## License

MIT License - See [LICENSE](LICENSE) for details.

Copyright (c) 2024-2026 DataBridge AI Team
