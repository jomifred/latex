# Latex and JaCaMo

This project provides a Docker image to compile LaTeX documents that uses minted/pygments to show JaCaMo sources with syntax highlight.

See [./test/main.pdf]() folder for the

Step to use:
0. Install Docker
1. Download [scripts/latex-docker](`scripts/latex-docker`) and place it somewhere in your `PATH`
2. Run

   `latex-docker` _your latex file_

   to compile your document

Example:

```
cd test
latex-docker main
```
