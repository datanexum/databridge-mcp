# DataBridge AI — MCP Server

Enterprise data reconciliation, hierarchy management, and financial modeling via the [Model Context Protocol](https://modelcontextprotocol.io/).

**316 MCP tools** across 46 modules for profiling, fuzzy matching, hash comparison, hierarchy building, dbt generation, and Snowflake deployment. Includes online decision-making (VOI, Thompson Sampling bandits, Monte Carlo rollouts) for intelligent workflow planning, a pre-release validation harness (falsification search, property checks, failure clustering, release gating), KB graph enhancement with evidence trails and quality gates (Build 4), closed-loop self-improvement with Platt-scaled calibration and ROI-driven active learning (Build 5), and enterprise intelligence with cost-aware optimization, governance dashboards, and decision debate (Build 6).

## Quick Start

### Docker (recommended)

```bash
docker run -p 786:786 ghcr.io/datanexum/databridge-mcp:latest
```

Connect your MCP client to `http://localhost:786/sse`.

### Smithery

```bash
npx @smithery/cli install @datanexum/databridge-ai
```

### Claude Desktop

Add to your `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "databridge-ai": {
      "command": "docker",
      "args": [
        "run", "-i", "--rm",
        "ghcr.io/datanexum/databridge-mcp:latest",
        "python", "run_server.py", "--full"
      ]
    }
  }
}
```

### Claude Code Plugin

```bash
claude plugin install datanexum/databridge-plugin
```

### Python SDK

```bash
pip install databridge-core
```

```python
from databridge_core import profile_data, compare_hashes

result = profile_data("accounts.csv")
print(f"{result['rows']:,} rows, {result['columns']} columns")
```

## Tool Categories

| Module | Tools | Description |
|--------|-------|-------------|
| BLCE | 84 | Business Logic Comprehension Engine |
| Hierarchy Builder | 49 | Multi-level hierarchy management |
| Data Reconciliation | 38 | Hash comparison, orphan detection |
| Wright Pipeline | 31 | Automated data mart generation |
| Cortex AI | 26 | AI-powered analysis |
| Data Catalog | 19 | Metadata and lineage |
| Templates & Skills | 16 | Industry hierarchy templates |
| + 31 more modules | 5 | See full list in docs |

## Editions

| Edition | Tools | Install |
|---------|-------|---------|
| Community (CE) | 316 | `pip install databridge-ai` |
| Pro | ~349 | `pip install databridge-ai-pro` |
| Enterprise | 381 | Private deployment |

## Links

- [Claude Code Plugin](https://github.com/datanexum/databridge-plugin)
- [Python SDK (PyPI)](https://pypi.org/project/databridge-core/)
- [Docker Image (GHCR)](https://github.com/datanexum/DATABRIDGE_AI/pkgs/container/databridge-mcp)

## License

MIT
