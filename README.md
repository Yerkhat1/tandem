# Tandem

A shared semester tracker for two students at Nazarbayev University, Fall 2026 —
PHYS 161, MATH 161, CSCI 151 and HST 100.

**Live:** https://yerkhat1.github.io/tandem/

It is one static page. No build step, no dependencies, no backend.

## What it does

- **Today** — the day's classes, plus study blocks placed in the gaps of the real timetable.
- **This week** — seven days for both people, with deadlines and the shared evening block.
- **Deadlines** — every date the syllabi commit to, plus anything you add. Exports a CSV for Google Calendar.
- **History load** — each HST 100 week's lecture videos and readings cut into evenings before Wednesday's seminar.
- **Big pushes** — a 150-problem set turned into a daily quota.
- **Courses** — grade weights and the rules that actually cost marks.

The study plan is computed, not stored: class times, meal gaps, deadline urgency and the
Steady/Push budget (2h/1.5h/1.5h or 3h/2h/2h) decide where blocks land. Both people always
see the same plan. Ticks, notes and pushes are saved in the browser they were made in.

## Files

| file | what it is |
| --- | --- |
| `app.html` | the source — written for the Claude artifact runtime, so it has no `<html>`/`<head>`/`<body>` |
| `index.html` | generated: `app.html` wrapped in a full HTML document, this is what GitHub Pages serves |
| `build.sh` | regenerates `index.html` from `app.html` |

Edit `app.html`, then:

```bash
./build.sh
```

## Changing the data

Everything lives in the `DATA` section at the top of the script in `app.html`:
`CLASSES` (the timetables), `WEEKS`, `PHYS_WEEK` / `MATH_WEEK` / `HST_WEEK` (weekly topics and
readings) and `buildDeadlines()`. Deadlines marked `assumed:true` show a dashed chip in the UI —
CS lab dates and WeBWorK due dates are assumptions until the real ones are known.
