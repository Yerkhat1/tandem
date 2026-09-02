#!/usr/bin/env bash
# Regenerates index.html (the GitHub Pages page) from app.html (the Claude artifact source).
# app.html is written artifact-style — no <!doctype>, no <head>, no <body> — so this wraps it.
set -euo pipefail
cd "$(dirname "$0")"
python3 - <<'PY'
src = open('app.html').read()
cut = src.index('</style>') + len('</style>')
head, body = src[:cut], src[cut:]
ICON = ("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'%3E"
        "%3Ctext y='.9em' font-size='90'%3E%F0%9F%8C%99%3C/text%3E%3C/svg%3E")
out = f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="color-scheme" content="dark light">
<meta name="theme-color" content="#0E1218">
<meta name="description" content="Fall 2026 semester tracker: deadlines, timetable and a daily study plan.">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-title" content="Tandem">
<link rel="icon" href="{ICON}">
{head}
</head>
<body>
{body}
</body>
</html>
"""
open('index.html','w').write(out)
print('built index.html')
PY
