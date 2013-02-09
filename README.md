elapsed.js
==========

*elapsed.js* is a thin wrapper of `setTimeout` and aims to increase the readability of the code using `setTimeout`.

source code
-----------

```
window.elapsed = function (n) {
    'use strict';
    return {
        then: function (func) {
            var timer = window.setTimeout(func, n);

            return {
                cancel: function () {
                    clearTimeout(timer);
                };
            };
        }
    };
};
```

usage
-----

#### one time use
```javascript
elapsed(500).then(function () {
    doIt();
});
```

#### reuse same elapsed object
```javascript
var elapsed300 = elapsed(300);

elapsed300.then(function() {
    doThis();

    elapsed300.then(function () {
        doThat();
    });
});
```

### clearTimeout and cancel callback
```javascript
var timer = elapsed(3000).then(function () {
    doIt();
});

$('#button').click(function () {
    timer.cancel();
});
```
