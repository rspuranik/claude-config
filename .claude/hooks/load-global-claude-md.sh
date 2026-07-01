#!/bin/bash
# Copies the canonical CLAUDE.md from this repo into the global ~/.claude location
# so it's available in every Claude Code web session (ephemeral containers).
mkdir -p ~/.claude
cp "$(dirname "$0")/../../CLAUDE.md" ~/.claude/CLAUDE.md
