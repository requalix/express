// Generated by CoffeeScript 1.6.2
(function() {
  var HEIGHT, WIDTH, ctx, isDown, keyDownCallbacks, keyUpCallbacks, root, translate, viewportHeight, viewportWidth, viewportX, viewportY,
    _this = this;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  root.UP = 38;

  root.DOWN = 40;

  root.ESC = 27;

  root.SPACE = 32;

  ctx = null;

  WIDTH = null;

  HEIGHT = null;

  viewportX = 0;

  viewportY = 0;

  viewportWidth = 1;

  viewportHeight = 1;

  translate = function(x, y) {
    return [(x - viewportX) * WIDTH / viewportWidth, (y - viewportY) * HEIGHT / viewportHeight];
  };

  root.sglInit = function() {
    ctx = $("#game")[0].getContext("2d");
    viewportWidth = WIDTH = $("#game").width();
    return viewportHeight = HEIGHT = $("#game").height();
  };

  root.drawCircle = function(x, y, radius, fillStyle) {
    var _ref;

    _ref = translate(x, y), x = _ref[0], y = _ref[1];
    if (fillStyle) {
      ctx.fillStyle = fillStyle;
    }
    ctx.beginPath();
    ctx.arc(x, y, radius / viewportWidth * WIDTH, 0, Math.PI * 2, true);
    ctx.closePath();
    return ctx.fill();
  };

  root.drawRect = function(x, y, width, height, fillStyle) {
    var _ref;

    _ref = translate(x, y), x = _ref[0], y = _ref[1];
    if (fillStyle) {
      ctx.fillStyle = fillStyle;
    }
    ctx.beginPath();
    ctx.rect(x, y, width * WIDTH / viewportWidth, height * HEIGHT / viewportHeight);
    ctx.closePath();
    return ctx.fill();
  };

  root.drawLine = function(x1, y1, x2, y2, strokeStyle) {
    var _ref, _ref1;

    _ref = translate(x1, y1), x1 = _ref[0], y1 = _ref[1];
    _ref1 = translate(x2, y2), x2 = _ref1[0], y2 = _ref1[1];
    if (strokeStyle) {
      ctx.strokeStyle = strokeStyle;
    }
    ctx.beginPath();
    ctx.moveTo(x1, y1);
    ctx.lineTo(x2, y2);
    return ctx.stroke();
  };

  root.setViewport = function(x, y, width, height) {
    if (width == null) {
      width = viewportWidth;
    }
    if (height == null) {
      height = viewportHeight;
    }
    viewportWidth = width;
    viewportHeight = height;
    viewportX = x;
    return viewportY = y;
  };

  isDown = {};

  keyDownCallbacks = {};

  keyUpCallbacks = {};

  root.registerKeyDown = function(keyCode, callback) {
    var _ref;

    if ((_ref = keyDownCallbacks[keyCode]) == null) {
      keyDownCallbacks[keyCode] = [];
    }
    return keyDownCallbacks[keyCode].push(callback);
  };

  root.registerKeyUp = function(keyCode, callback) {
    var _ref;

    if ((_ref = keyUpCallbacks[keyCode]) == null) {
      keyUpCallbacks[keyCode] = [];
    }
    return keyUpCallbacks[keyCode].push(callback);
  };

  $(document).keydown(function(event) {
    var callback, _i, _len, _ref, _ref1, _results;

    if (!isDown[event.keyCode]) {
      isDown[event.keyCode] = true;
      _ref1 = (_ref = keyDownCallbacks[event.keyCode]) != null ? _ref : [];
      _results = [];
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        callback = _ref1[_i];
        _results.push(callback());
      }
      return _results;
    }
  });

  $(document).keyup(function(event) {
    var callback, _i, _len, _ref, _ref1, _results;

    isDown[event.keyCode] = false;
    _ref1 = (_ref = keyUpCallbacks[event.keyCode]) != null ? _ref : [];
    _results = [];
    for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
      callback = _ref1[_i];
      _results.push(callback());
    }
    return _results;
  });

  root.startGame = function(fn) {
    var draw;

    draw = function() {
      ctx.clearRect(0, 0, WIDTH, HEIGHT);
      return fn();
    };
    return setInterval(draw, 10);
  };

}).call(this);