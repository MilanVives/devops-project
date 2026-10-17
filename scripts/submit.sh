#!/usr/bin/env bash
# Dient je werk in: pusht je commits en daarna een submit/<tijdstip>-tag.
# Classroom 50 verbetert elke submit/-tag en publiceert het resultaat als Release.
# Windows: voer dit uit in Git Bash.
set -euo pipefail

if [ -n "$(git status --porcelain)" ]; then
  echo "Je hebt nog niet-gecommitte wijzigingen. Commit ze eerst:" >&2
  echo "  git add ." >&2
  echo "  git commit -m \"Beschrijf je wijziging\"" >&2
  echo >&2
  git status --short >&2
  exit 1
fi

branch="$(git rev-parse --abbrev-ref HEAD)"
git push origin "$branch"
tag="submit/$(date -u +%Y-%m-%dT%H-%M-%SZ)"
git tag "$tag"
git push origin "$tag"

url="$(git remote get-url origin | sed -E 's#^git@github\.com:#https://github.com/#; s#://[^/@]+@#://#; s#\.git$##')"
echo
echo "Ingediend als $tag."
echo "Je resultaat verschijnt binnen enkele minuten onder Releases: $url/releases"
