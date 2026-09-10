# JinghaoJin · 靳京皓

A bilingual personal academic website built with the official **al-folio** Jekyll runtime. English is the default at `/`; Chinese starts at `/zh/`. The upper-right language control always links to the corresponding page and works without JavaScript.

## Local development

Requires Ruby 3.3+ and Node.js. `scripts/jekyll.sh` also detects Homebrew Ruby on macOS.

```sh
export PATH="/opt/homebrew/opt/ruby@3.3/bin:$PATH" # macOS, if needed
bundle install
npm ci
npm run dev
```

Open `http://127.0.0.1:4000/`. For production output:

```sh
npm run build
npm run check:site
```

Output is in `dist/`. The site has no database. Content is stored in Markdown, YAML, and BibTeX. See [中文维护说明](docs/personal/维护说明.md) for editing.

## Source and content

- `_data/profile.yml`: the bilingual biography, research interests, and public contact links.
- `_data/i18n.yml`: navigation, labels, and empty states in both languages.
- `_bibliography/papers.bib`: publications; imported from INSPIRE and manually verified on 2026-09-10.
- `_notes/`, `_talks/`: bilingual Markdown entries. Copy files from `templates/`, remove `.example`, and replace their content before publishing.
- `_pages/personal/`: section pages and paired URLs.
- `_layouts/academic*.liquid`, `_layouts/personal-bib.liquid`, `_includes/personal/`: custom site layouts composing al-folio's official head, scripts, and theme styles.
- `assets/css/personal.css`: the small personal style layer.
- `.openai/hosting.json`: Sites identifier and static output configuration. No secrets belong in this file.

Talks and Notes are deliberately empty until Jinghao supplies content. No portrait is shown until one is supplied.

## Publication provenance

[INSPIRE author record](https://inspirehep.net/authors/3196060) · [paper record](https://inspirehep.net/literature/3159215) · [arXiv:2605.24978](https://arxiv.org/abs/2605.24978). Springer and Crossref confirm publication on 2026-09-09 in Journal of High Energy Physics, volume 2026, issue 9, article 123: [DOI:10.1007/JHEP09(2026)123](<https://doi.org/10.1007/JHEP09(2026)123>). This newer publisher metadata takes precedence over the INSPIRE record, which had not yet added the journal information. The author order and original English title are retained in both language versions. The Fudan affiliation, research interests, and displayed email come from Jinghao directly. ORCID comes from his supplied INSPIRE profile.

The al-folio MIT license is preserved in `LICENSE`; exact template provenance is in `SOURCE.md`.
