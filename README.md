# Tandem

A semester tracker for two students at Nazarbayev University, Fall 2026:
PHYS 161, MATH 161, CSCI 151 and HST 100.

**Live:** https://yerkhat1.github.io/tandem/

It is one static page. No build step, no dependencies, no backend.

## What it does

- **Today**: the day's classes and study blocks in one list, with ticks, plus what is due in the next 7 days.
- **Week**: the whole weekly routine, day by day, with the week's deadlines on each day.
- **Deadlines**: everything still ahead, a form to add your own, and the course rules that cost marks.

The routine is fixed per person (`ROUTINE` in `app.html`). Lashyn's is her own notebook plan,
moved so no block overlaps a class. On top of it:

- in the 6 days before an exam, that subject's blocks switch to exam prep
- on an exam day, blocks that collide with the exam are marked skipped
- history blocks list the exact lecture videos and readings for the next seminar
- in weeks without a physics lab, Monday's history block runs longer

Ticks and added deadlines are saved in the browser they were made in.

## Files

| file | what it is |
| --- | --- |
| `app.html` | the source, written artifact-style (no `<html>`/`<head>`/`<body>`) |
| `index.html` | generated from `app.html`; this is what GitHub Pages serves |
| `build.sh` | regenerates `index.html` |

Edit `app.html`, then:

```bash
./build.sh
```

## Changing the data

Everything is at the top of the script in `app.html`: `CLASSES` (timetables), `ROUTINE`,
`WEEKS`, `PHYS_WEEK` / `MATH_WEEK` / `HST_WEEK` and `buildDeadlines()`. Deadlines marked
`assumed:true` show "date assumed": the CS lab and WeBWorK dates are guesses until the real ones are known.
