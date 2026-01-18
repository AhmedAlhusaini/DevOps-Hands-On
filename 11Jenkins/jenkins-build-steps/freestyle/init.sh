#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Jenkins Freestyle Init — commencing mildly chaotic excellence..."
echo "👷 BUILD: $BUILD_NUMBER | JOB: $JOB_NAME | NODE: $NODE_NAME"
echo "📦 WORKSPACE: $WORKSPACE"
echo "🕒 Started at: $(date -Iseconds)"
echo

# Optional: dramatic pause for suspense
sleep 1

echo "🧹 Pre-flight check: ensuring workspace exists"
if [[ ! -d "$WORKSPACE" ]]; then
  echo "😱 Workspace missing—summoning it from the void..."
  mkdir -p "$WORKSPACE"
fi

echo "🧪 Environment sanity snapshot:"
env | sort | sed 's/^/   • /' | head -n 20
echo "   (…truncated for mystery)"
echo

echo "🐙 Git vibes (if present):"
if command -v git >/dev/null 2>&1 && [[ -d .git ]]; then
  echo "   • Branch: $(git rev-parse --abbrev-ref HEAD || echo 'unknown')"
  echo "   • Commit: $(git rev-parse --short HEAD || echo 'unknown')"
  echo "   • Status:"
  git status --short || true
else
  echo "   • No git repo detected—we roll with what we’ve got."
fi
echo

echo "🧰 Tooling check:"
for tool in bash sh curl jq node python3 docker; do
  if command -v "$tool" >/dev/null 2>&1; then
    echo "   ✔ $tool: $(command -v "$tool")"
  else
    echo "   ✖ $tool: not found (we pretend it’s fine)"
  fi
done
echo

echo "🧪 Running ‘tests’ (theater edition)…"
mkdir -p build/reports
echo "All tests passed with flying emojis ✅" > build/reports/test-summary.txt
echo "Coverage: 101% (we counted vibes) 🎯" >> build/reports/test-summary.txt
cat build/reports/test-summary.txt
echo

echo "📁 Producing artifact of questionable utility…"
mkdir -p build/artifacts
tar -czf build/artifacts/freestyle-init-${BUILD_NUMBER}.tgz build || {
  echo "💥 Artifact packaging failed—panic gracefully."
  exit 1
}
ls -lh build/artifacts
echo

echo "📣 Post-build haiku:"
cat <<'HAIKU'
Pipelines awaken,
Logs whisper in green and blue—
Ship it, brave Jenkins.
HAIKU
echo

echo "✅ Freestyle init complete. If anything broke, it was a feature."
