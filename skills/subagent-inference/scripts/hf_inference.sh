#!/usr/bin/env bash
# Delegation d'un prompt a l'inference d'un petit LLM via Hugging Face Inference API.
# Usage: ./hf_inference.sh "<prompt>" [model] [token]
set -euo pipefail
PROMPT="$1"
MODEL="${2:-Qwen/Qwen2.5-1.5B-Instruct}"
TOKEN="${3:-${HF_TOKEN:-}}"
BODY=$(jq -n --arg p "$PROMPT" '{inputs:$p}')
HEADERS=(-H 'Content-Type: application/json')
[ -n "$TOKEN" ] && HEADERS+=(-H "Authorization: Bearer [REDACTED_SECRET]")
# Essaye le endpoint chat completions (OpenAI-compatible), sinon le endpoint model classique.
curl -fsSL "${HEADERS[@]}" -d "$BODY" \
  "https://router.huggingface.co/v1/chat/completions" 2>/dev/null \
|| curl -fsSL "${HEADERS[@]}" -d "$BODY" \
  "https://api-inference.huggingface.co/models/$MODEL"