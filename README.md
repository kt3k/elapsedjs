elapsed.js
==========

*elapsed.js* is a simple wrapper of `setTimeout` and aims readability improvement of `setTimeout`.

usage
-----

#### basic use

```javascript
elapsed(500).then(function () {
    "do something";
});
```

### nested use

```javascript
elapsed(500).then(function () {
    "do something";

    elapsed(300).then(function () {
        "do other things";

        elapsed(400).then(function () {
            "do other things";
        });
    })
});
```

#### cancel callback

```javascript
var timer = elapsed(3000).then(function () {
    "do something";
});

$('#button').click(function () {
    timer.cancel();
});
```
