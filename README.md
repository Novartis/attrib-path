# @novartis/attrib-path

> Parse a simplified JSONPath-like syntax

## Why do I want to use this?

We're using this internally to export styles from a design tool into a format that developers can work with directly.

### Path syntax

This tool is used to organize style rules, and as such parses keys in a specific format. Read [src/grammar.ne](./src/grammar.ne) for the formal grammar.

- Dot separated paths: `styles.button.primary`
- Modifiers, with a dollar sign: `styles.button.primary[$disabled]`
  - Intended to represent alternate states
- Modifiers, with a colon: `styles.button.primary[:hover]`
  - Intended to represent pseudoclasses
- Modifiers, with a dot: `styles.button[.icon]`
  - Intended to represent variations

## Installation

```bash
npm install --save Novartis/attrib-path
```

## Usage

```js
import parsePath from '@novartis/attrib-path';
// or: const parsePath = require('@novartis/attrib-path').default;

try {
  const result = parsePath('styles.button.primary[:hover]');
} catch (parseError) {
  // Throws in case of parsing failure
}
```

Result is an array:

```js
result = [
  'styles',
  'button',
  'primary',
  {
    type: 'Modifier',
    value: ':hover',
  },
];
```
