# jquery.truncateMiddle

jquery.truncateMiddle is a naive implementation to trunacate strings in the middle like the Apple Finder does.
I'm saying it is naive because you have to provide it with a maximum length. It cannot figure out the count of characters that can go into a certain DOM element, yet.

It turns strings like this:
My Marvel Collection – Spiderman and his Amazing Friends 1

into something like this:
My Marvel Colle...azing Friends 1



Feel free to contribute.


## Installation

HTML:

```html
<body>
  ...
  <script src="/path/to/jquery.truncatemiddle.js"></script>
</body>
```

## Usage

HTML:

```html
<p class="truncate-middle">Your very long title that wouldn't fit in a tiny box.</p>
```

JavaScript:

```javascript
// Initialize
$('.truncate-middle').truncateMiddle({length: 25});

// Other ellipsis
$('.truncate-middle').truncateMiddle({length: 25, ellipsis: ' [...] '});
```

The plugin is keeping a copy of the original text. That's why you can update the text at any time.
E.g. to adjust for fluid layouts.

```javascript
// Updating existing elements
$('.truncate-middle').truncateMiddle('setOptions', {length: 100, ellipsis: ' [...] '});
```

## License
MIT
