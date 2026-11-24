# L1 minimal worker profile - live comparison (Claude Code 2.1.322, same machine, same login)

| /context category        | plain `claude` (no profile) | ship worker (fm-spawn) | scout worker (fm-spawn) |
|--------------------------|-----------------------------|------------------------|-------------------------|
| System tools             | 16.1k tokens                | 2.7k tokens            | 2.6k tokens             |
| MCP tools                | 648 tokens (+ awwwards, Framer, UXKIN, WordPress... available) | none | none |
| MCP server instructions  | 3.1k tokens                 | none                   | none                    |
| Skills                   | 10k tokens                  | 3.3k tokens            | 3.4k tokens             |
| System prompt            | 4.4k tokens                 | 2.8k tokens            | 2.8k tokens             |

Scout repo fixture (mcpgate): committed .claude/settings.json self-approves all .mcp.json servers and
registers SessionStart + UserPromptSubmit hooks; repo skills repo-probe and caveman.
- Spawn 1 (no operator approval): no --mcp-config, no MCP marker file written; both project hooks fired.
- Relaunch with isolated CLAUDE_CONFIG_DIR user settings approving [approved, rejected]:
  launch carries --mcp-config with only "approved" ("rejected" dropped by committed disabledMcpjsonServers,
  "selfapproved"/"unlisted" dropped).
- Repo skill repo-probe listed under Project; kept skills no-mistakes, rtk, ponytail, graphify listed.
