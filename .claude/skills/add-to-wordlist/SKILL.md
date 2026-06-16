---
name: add-to-wordlist
description: Add a term to the spell check wordlist when pyspelling fails in CI
disable-model-invocation: true
---

Usage: /add-to-wordlist <word>

Steps:

1. If no word provided, ask the user which term the spell checker rejected (shown in CI logs as "Misspelled word").

2. Add the word (lowercase) to `.wordlist.txt` — one word per line, keep alphabetical order.

3. Check `dictionary.dic` — it uses Aspell format where the first line is a word count. If you add a word there too, increment the count on line 1.

4. Show a diff of changed files.

5. Remind the user to verify locally before pushing:
   ```
   pyspelling -c .spellcheck.yml
   ```
