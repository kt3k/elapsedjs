/**
 * elapsed.js 1.0.0
 * author: Yosiya Hinosawa (@kt3k)
 * license: MIT license
 */

window.elapsed = function (n) {
    'use strict';
    return {
        then: function (func) {
            var timer = window.setTimeout(func, n);

            return {
                cancel: function () {
                    window.clearTimeout(timer);
                }
            };
        }
    };
};
