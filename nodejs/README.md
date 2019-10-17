node.js
=======

I use node.js as a package manager for binaries made available through it. Not for JavaScript development.

Download and install node.js from <https://nodejs.org/.>

Need to set permissions.

```bash
sudo chown -R ${USER} /usr/local/lib/node_modules
```

Install node.js packages.

```bash
npm install -g alex
npm install -g htmlhint
npm install -g write-good
```

This installs the following packages.

- alex: linter for prose; catches insensitive, inconsiderate writing
- htmlhint: static code analysis tool for HTML
- write-good: naive linter for English prose
