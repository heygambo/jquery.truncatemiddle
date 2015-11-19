# jquery.truncateMiddle

jquery.truncateMiddle is a naive implementation to trunacate strings in the middle like the Apple Finder does.
I'm saying it is naive because you have to provide it with a maximum length. It cannot figure out the count of characters that can go into a certain DOM element, yet.

Feel free to contribute.

## Installation

HTML:

```html
<body>
  ...
  <script src="/path/to/jquery.truncatemiddle.js"></script>
</body>

## Usage

```html
<p class="truncate-middle">Your very long title that wouldn't fit in a tiny box.</p>
```

```javascript
// Initialize
$('.truncate-middle').trunacteMiddle({length: 25});
```

```javascript
// Update
$('.truncate-middle').trunacteMiddle({length: 100, ellipsis: ' [...] '});
```

## License
MIT
