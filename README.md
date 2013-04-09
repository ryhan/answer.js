answer.js
=========

Better in-page search, created by [Ryhan Hassan](http://github.com/ryhan).

## Usage

### Include the following libraries
```html
<script src="lib/jquery.js"></script>
<script src="lib/underscore.js"></script>
<script src="lib/natural.js"></script>
<script src="lib/jspos/lexer.js"></script>
<script src="lib/jspos/lexicon.js_"></script>
<script src="lib/jspos/POSTagger.js"></script>
<script src="answer.js"></script>
```
### Preprocess the article
Create a new `answer` object, and run `read()` on any text.

```javascript
reader = new answer();
reader.read($('article').text());
```

### Query with questions
Running `match( text )` will return an array of sentences in descending rank with their rank.

```javascript
var answers = reader.match("What is the longevity of a soap bubble limited by?");

// Log the top answer, formatted as [score, text]
console.log(answers[0]);
```

## Demos

- `demo.html` logs the top answer to the console
- `search.html` is a demo with a styled search field.
