$ ->
  sglInit()

  INF = 1/0
  PLAYER_RADIUS = 0.25
  TICK_HEIGHT = 0.1
  TICK_DISTANCE = 1
  STUFF_WIDTH = 0.2
  VIEWPORT_WIDTH = 8
  PLAYER_X_IN_VIEWPORT = VIEWPORT_WIDTH / 3
  VIEWPORT_HEIGHT = 4
  JUMP_DISTANCE = 4 * TICK_DISTANCE
  DIST_FOR_COLLISION = 0.2

  # Speeds are in ticks per second, time is second since start of song.
  SPEEDS = [
    { time: 0, speed: 20/60 }
    { time: 4, speed: 2*86/60 }
    { time: 20.2, speed: 2*86/60 }
    { time: 20.8, speed: 40/60 }
    { time: 21.8, speed: 40/60 }
    { time: 22.3, speed: 3*86/60 }
    { time: 86.4, speed: 3*86/60 }
    { time: 86.7, speed: 40/60 }
    { time: 89.1, speed: 40/60 }
    { time: 89.3, speed: 4*86/60 }
    { time: 111.59, speed: 5*86/60 }
    { time: 177, speed: 4*86/60 }
    { time: 180, speed: 86/60 }
    { time: 200, speed: 86/60 }
    { time: 200.2, speed: 0 }
    { time: 201, speed: 4*86/60 }
    { time: 245.52, speed: 6*86/60 }
    { time: INF, speed: 86/60 }
  ]

  INTENDED_JUMPS = [
     {time: 0.010986328125, direction: -1}
     {time: 5.614013671875, direction: -1},
     {time: 8.2, direction: 1},
     {time: 11.239013671875, direction: -1},
     {time: 13.897705078125, direction: -1},
     {time: 16.798095703125, direction: 1},
     {time: 19.888623046875, direction: -1},
     {time: 25.037841796875, direction: -1},
     {time: 26.444091796875, direction: 1},
     #{time: 29.586181640625, direction: -1},
     #{time: 30.970458984375, direction: 1},
     {time: 30.706787109375, direction: -1} 
     {time: 33.453369140625, direction: -1},
     {time: 34.837646484375, direction: 1},
     {time: 36.243896484375, direction: -1},
     {time: 39.056396484375, direction: -1},
     {time: 40.440673828125, direction: 1},
     {time: 41.846923828125, direction: -1},
     {time: 44.593505859375, direction: 1},
     {time: 45.977783203125, direction: -1},
     {time: 47.384033203125, direction: 1},
     {time: 50.152587890625, direction: 1},
     {time: 51.536865234375, direction: -1},
     {time: 52.943115234375, direction: 1},
     {time: 55.733642578125, direction: -1},
     {time: 57.117919921875, direction: 1},
     {time: 58.524169921875, direction: -1},
     {time: 59.908447265625, direction: 1},
     {time: 61.314697265625, direction: -1},
     {time: 62.698974609375, direction: 1},
     {time: 65.511474609375, direction: -1},
     {time: 66.895751953125, direction: 1},
     {time: 68.302001953125, direction: -1},
     {time: 69.730224609375, direction: -1},
     {time: 71.136474609375, direction: 1},
     {time: 72.520751953125, direction: -1},
     {time: 75.223388671875, direction: 1},
     {time: 76.629638671875, direction: -1},
     {time: 79.530029296875, direction: -1},
     {time: 80.936279296875, direction: 1},
     {time: 82.957763671875, direction: -1},
     {time: 84.935302734375, direction: -1},
     {time: 86.505361328125, direction: 1},
     {time: 89.989013671875, direction: 1},
     {time: 90.670166015625, direction: -1},
     {time: 91.351318359375, direction: -1},
     {time: 92.032470703125, direction: -1},
     {time: 92.713623046875, direction: 1},
     {time: 93.394775390625, direction: -1},
     {time: 94.779052734375, direction: -1},
     {time: 95.438232421875, direction: 1},
     {time: 96.097412109375, direction: -1},
     {time: 97.547607421875, direction: -1},
     {time: 98.184814453125, direction: 1},
     {time: 98.822021484375, direction: -1},
     {time: 99.459228515625, direction: 1},
     {time: 100.074462890625, direction: -1},
     {time: 100.689697265625, direction: 1},
     {time: 101.304931640625, direction: -1},
     {time: 103.194580078125, direction: -1},
     {time: 103.809814453125, direction: 1},
     {time: 104.403076171875, direction: -1},
     {time: 105.985107421875, direction: 1},
     {time: 106.556396484375, direction: -1},
     {time: 107.149658203125, direction: 1},
     {time: 108.753662109375, direction: 1},
     {time: 109.324951171875, direction: 1},
     {time: 109.896240234375, direction: 1},
     {time: 110.489501953125, direction: 1},
     {time: 111.038818359375, direction: -1},
     {time: 111.610107421875, direction: 1},
     {time: 112.159423828125, direction: -1},
     {time: 112.730712890625, direction: 1},
     {time: 113.302001953125, direction: -1},
     {time: 113.873291015625, direction: 1},
     {time: 114.444580078125, direction: -1},
     {time: 114.993896484375, direction: 1},
     {time: 115.565185546875, direction: -1},
     {time: 116.334228515625, direction: 1},
     {time: 117.125244140625, direction: -1},
     {time: 117.960205078125, direction: -1},
     {time: 118.817138671875, direction: 1},
     {time: 119.586181640625, direction: 1},
     {time: 120.377197265625, direction: 1},
     {time: 121.036376953125, direction: -1},
     {time: 121.761474609375, direction: -1},
     {time: 122.398681640625, direction: -1},
     {time: 123.189697265625, direction: -1},
     {time: 123.826904296875, direction: 1},
     {time: 124.661865234375, direction: 1},
     {time: 125.343017578125, direction: -1},
     {time: 125.914306640625, direction: -1},
     {time: 126.507568359375, direction: 1},
     {time: 127.100830078125, direction: -1},
     {time: 128.243408203125, direction: 1},
     {time: 128.968505859375, direction: 1},
     {time: 129.759521484375, direction: -1},
     {time: 130.352783203125, direction: -1},
     {time: 131.143798828125, direction: 1},
     {time: 131.759033203125, direction: 1},
     {time: 132.462158203125, direction: -1},
     {time: 133.209228515625, direction: -1},
     {time: 133.868408203125, direction: 1},
     {time: 134.461669921875, direction: -1},
     {time: 135.274658203125, direction: 1},
     {time: 135.911865234375, direction: -1},
     {time: 136.724853515625, direction: 1},
     {time: 137.318115234375, direction: 1},
     {time: 137.933349609375, direction: -1},
     {time: 138.548583984375, direction: 1},
     {time: 139.317626953125, direction: -1},
     {time: 140.108642578125, direction: -1},
     {time: 140.877685546875, direction: 1},
     {time: 141.492919921875, direction: -1},
     {time: 142.305908203125, direction: 1},
     {time: 142.921142578125, direction: 1},
     {time: 143.602294921875, direction: -1},
     {time: 144.305419921875, direction: -1},
     {time: 144.920654296875, direction: 1},
     {time: 145.667724609375, direction: -1},
     {time: 146.480712890625, direction: 1},
     {time: 147.117919921875, direction: -1},
     {time: 147.799072265625, direction: -1},
     {time: 148.568115234375, direction: 1},
     {time: 149.249267578125, direction: -1},
     {time: 149.952392578125, direction: 1},
     {time: 150.567626953125, direction: 1},
     {time: 151.270751953125, direction: -1},
     {time: 151.995849609375, direction: 1},
     {time: 152.633056640625, direction: -1},
     {time: 153.424072265625, direction: -1},
     {time: 154.105224609375, direction: -1},
     {time: 154.808349609375, direction: -1},
     {time: 155.511474609375, direction: -1},
     {time: 156.148681640625, direction: 1},
     {time: 157.203369140625, direction: -1},
     {time: 157.840576171875, direction: 1},
     {time: 158.499755859375, direction: -1},
     {time: 159.158935546875, direction: 1},
     {time: 160.323486328125, direction: -1},
     {time: 161.026611328125, direction: -1},
     {time: 161.729736328125, direction: 1},
     {time: 162.806396484375, direction: -1},
     {time: 163.509521484375, direction: -1},
     {time: 164.520263671875, direction: -1},
     {time: 165.882568359375, direction: -1},
     {time: 167.530517578125, direction: -1},
     {time: 168.189697265625, direction: 1},
     {time: 168.870849609375, direction: -1},
     {time: 170.057373046875, direction: -1},
     {time: 170.738525390625, direction: 1},
     {time: 171.419677734375, direction: -1},
     {time: 172.100830078125, direction: 1},
     {time: 172.781982421875, direction: -1},
     {time: 173.463134765625, direction: 1},
     {time: 175.748291015625, direction: -1},
     {time: 177.066650390625, direction: -1},
     {time: 177.857666015625, direction: 1},
     {time: 178.934326171875, direction: -1},
     {time: 181.197509765625, direction: 1},
     {time: 183.988037109375, direction: -1},
     {time: 186.778564453125, direction: 1},
     {time: 189.569091796875, direction: -1},
#     {time: 192.359619140625, direction: 1},
#     {time: 195.150146484375, direction: -1},
#     {time: 198.819580078125, direction: -1},
#     {time: 200.972900390625, direction: 1},
#     {time: 201.741943359375, direction: -1},
#     {time: 202.445068359375, direction: 1},
#     {time: 203.631591796875, direction: -1},
#     {time: 205.037841796875, direction: -1},
#     {time: 205.740966796875, direction: -1},
#     {time: 208.861083984375, direction: 1},
#     {time: 210.355224609375, direction: -1},
#     {time: 211.761474609375, direction: 1},
#     {time: 212.640380859375, direction: -1},
#     {time: 214.793701171875, direction: -1},
#     {time: 215.650634765625, direction: 1},
#     {time: 216.529541015625, direction: -1},
#     {time: 217.254638671875, direction: 1},
#     {time: 217.979736328125, direction: 1},
#     {time: 219.078369140625, direction: -1},
#     {time: 219.979248046875, direction: 1},
#     {time: 221.011962890625, direction: -1},
#     {time: 221.583251953125, direction: 1},
#     {time: 222.506103515625, direction: 1},
#     {time: 223.143310546875, direction: 1},
#     {time: 223.714599609375, direction: -1},
#     {time: 224.681396484375, direction: -1},
#     {time: 227.625732421875, direction: -1},
#     {time: 228.504638671875, direction: 1},
#     {time: 229.295654296875, direction: 1},
#     {time: 229.822998046875, direction: -1},
#     {time: 230.592041015625, direction: -1},
#     {time: 231.470947265625, direction: 1},
#     {time: 232.086181640625, direction: 1},
#     {time: 233.031005859375, direction: -1},
#     {time: 235.228271484375, direction: -1},
#     {time: 236.458740234375, direction: 1},
#     {time: 239.644775390625, direction: 1},
#     {time: 240.479736328125, direction: -1},
#     {time: 241.248779296875, direction: -1},
#     {time: 241.951904296875, direction: 1},
#     {time: 243.292236328125, direction: -1},
#     {time: 244.149169921875, direction: -1},
#     {time: 244.896240234375, direction: -1},
#     {time: 245.555419921875, direction: 1},
#     {time: 246.280517578125, direction: -1},
#     {time: 246.983642578125, direction: 1},
#     {time: 247.840576171875, direction: 1},
#     {time: 248.719482421875, direction: -1},
#     {time: 249.554443359375, direction: -1},
#     {time: 250.081787109375, direction: -1},
#     {time: 250.828857421875, direction: 1},
#     {time: 251.707763671875, direction: 1},
#     {time: 252.388916015625, direction: -1},
#     {time: 253.026123046875, direction: -1},
#     {time: 253.970947265625, direction: -1},
#     {time: 254.739990234375, direction: -1},
#     {time: 255.333251953125, direction: -1},
#     {time: 256.168212890625, direction: -1},
#     {time: 257.178955078125, direction: -1},
#     {time: 258.321533203125, direction: 1},
#     {time: 259.002685546875, direction: 1},
#     {time: 261.353759765625, direction: 1},
#     {time: 262.166748046875, direction: -1},
#     {time: 262.803955078125, direction: -1},
#     {time: 264.451904296875, direction: -1},
#     {time: 265.836181640625, direction: -1},
#     {time: 266.715087890625, direction: -1},
#     {time: 268.187255859375, direction: 1},
#     {time: 269.000244140625, direction: 1},
#     {time: 269.659423828125, direction: -1},
#     {time: 270.472412109375, direction: -1},
#     {time: 271.153564453125, direction: -1},
#     {time: 272.032470703125, direction: 1},
#     {time: 272.625732421875, direction: -1},
#     {time: 273.438720703125, direction: -1},
#     {time: 274.141845703125, direction: 1},
#     {time: 277.152099609375, direction: 1},
#     {time: 278.602294921875, direction: -1},
#     {time: 279.327392578125, direction: 1},
#     {time: 280.074462890625, direction: -1},
#     {time: 280.931396484375, direction: -1},
#     {time: 282.447509765625, direction: -1},
#     {time: 283.106689453125, direction: -1},
#     {time: 283.677978515625, direction: -1},
#     {time: 284.139404296875, direction: 1},
#     {time: 285.260009765625, direction: -1},
#     {time: 286.798095703125, direction: -1},
#     {time: 287.633056640625, direction: 1},
#     {time: 289.127197265625, direction: -1},
#     {time: 290.665283203125, direction: -1},
#     {time: 292.071533203125, direction: 1},
#     {time: 292.950439453125, direction: -1},
#     {time: 293.675537109375, direction: 1},
#     {time: 294.422607421875, direction: -1},
#     {time: 297.542724609375, direction: -1},
#     {time: 298.201904296875, direction: 1},
#     {time: 299.652099609375, direction: -1},
#     {time: 300.399169921875, direction: -1},
#     {time: 301.871337890625, direction: -1},
#     {time: 303.431396484375, direction: 1},
#     {time: 304.046630859375, direction: -1},
#     {time: 308.660888671875, direction: -1},
#     {time: 310.089111328125, direction: -1},
#     {time: 310.814208984375, direction: -1},
#     {time: 312.440185546875, direction: -1},
#     {time: 313.077392578125, direction: -1},
#     {time: 315.406494140625, direction: 1}
  ]

  DIFFICULTY = [
    {time: 0, difficulty: 0.0}
    {time: 22.393491744995117, difficulty: 0.4}
    {time: 44.50532150268555, difficulty: 0.6}
    {time: 55.84508514404297, difficulty: 0.5}
    {time: 69.04436492919922, difficulty: 0.4}
    {time: 80.5565414428711, difficulty: 0.5}
    {time: 92.5555648803711, difficulty: 0.6}
    {time: 100.36393737792969, difficulty: 0.7}
    {time: 136.5236358642578, difficulty: 0.8}
    {time: INF, 0}
  ]

  score = 0
  personalBest = 0
  doPersonalBest = ->
    personalBest = Math.max(personalBest, score)
    $("#personalBest").text(personalBest)
  refreshScore = -> $("#score").text(score)
  resetScore = ->
    score = 0
    refreshScore()
  incrementScore = ->
    score++
    refreshScore()

  # Pausing

  playing = false

  togglePlaying = ->
    if playing
      $('audio')[0].pause()
      playing = false
    else
      $('audio')[0].play()
      playing = true

  registerKeyDown ESC, togglePlaying
  registerKeyDown UP, -> togglePlaying() if not playing
  registerKeyDown DOWN, -> togglePlaying() if not playing

  # Mapping a time (seconds) to an x coordinate

  getElapsedDistance = (a, b) ->
    [t0, s0] = [a.time, a.speed]
    [t1, s1] = [b.time, b.speed]
    elapsedTime = (t1-t0)
    return (s0+s1) * elapsedTime / 2

  mapTimeToX = (time) ->
    distance = 0
    i = 0
    while SPEEDS[i+1].time < time
      distance += getElapsedDistance SPEEDS[i], SPEEDS[i+1]
      i++

    totalDeltaTime = (SPEEDS[i+1].time - SPEEDS[i].time)
    totalDeltaSpeed = (SPEEDS[i+1].speed - SPEEDS[i].speed)
    myDeltaTime = (time - SPEEDS[i].time)
    myDeltaSpeed = totalDeltaSpeed * myDeltaTime / totalDeltaTime
    mySpeed = SPEEDS[i].speed + myDeltaSpeed

    distance += getElapsedDistance SPEEDS[i], { time: time, speed: mySpeed }

  # Computationally expensive, only use for debugging
  mapXToTime = (x) ->
    lower = 0
    upper = 6 * 60 # 6 minute song
    while upper - lower > 1/60
      middle = (lower + upper) / 2
      if mapTimeToX(middle) <= x
        lower = middle
      else
        upper = middle
    middle

  # Player X coordinate

  getTime = -> $('audio')[0].currentTime
  getPlayerX = -> mapTimeToX(getTime())

  # Jumping

  sineStart = -10
  nextSineStart = INF
  nextSineDirection = -1
  sineDirection = -1

  getJumpY = (startX, atX, direction) ->
    x = atX - startX
    if x >= JUMP_DISTANCE
      0
    else
      Math.sin(x / JUMP_DISTANCE * Math.PI) * 1.75 * direction

  getPlayerY = ->
    x = getPlayerX()
    if x > nextSineStart
      sineStart = nextSineStart
      sineDirection = nextSineDirection
      nextSineStart = INF
    getJumpY(sineStart, x, sineDirection)

  isJumping = -> sineStart + JUMP_DISTANCE > getPlayerX()

  doJump = (direction) ->
    nextSineDirection = direction
    nextSineStart = if isJumping() then sineStart + JUMP_DISTANCE else getPlayerX()
    console.log { time: mapXToTime(nextSineStart), direction: nextSineDirection }

  registerKeyDown UP, -> doJump -1
  registerKeyDown DOWN, -> doJump +1

  # debugging/level design
  for i in [0..9]
    do (i) ->
      registerKeyDown (""+i).charCodeAt(0), -> console.log { time: getTime(), difficulty: i }

  # player's x value

  registerKeyDown SPACE, ->
    console.log $('audio')[0].currentTime

  setViewport -3, -2, VIEWPORT_WIDTH, VIEWPORT_HEIGHT

  drawPlayer = ->
    drawCircle getPlayerX(), getPlayerY(), PLAYER_RADIUS, 'rgba(0,0,0,0.9)'

  getViewportX = -> getPlayerX() - PLAYER_X_IN_VIEWPORT

  drawXAxis = ->
    viewportX = getViewportX()
    drawLine viewportX, 0, viewportX + VIEWPORT_WIDTH, 0, 'red'
    i = Math.ceil(viewportX)
    while i < viewportX + VIEWPORT_WIDTH
      drawLine i, -TICK_HEIGHT, i, +TICK_HEIGHT
      i++

  ### Difficulty ###

  getDifficultyAt = (time) ->
    lower = 0
    upper = DIFFICULTY.length
    while lower + 1 != upper
      middle = Math.floor((lower + upper) / 2)
      if DIFFICULTY[middle].time <= time
        lower = middle
      else
        upper = middle
    DIFFICULTY[lower].difficulty

  #### Stuff! ####

  stuffIndex = 0
  stuff = []

  goodStuffCollision = (thing) ->
    if thing.color == 'blue' and playing
      incrementScore()
      thing.color = 'green'

  fadeOutVolume = (volume) ->
    if volume >= 0
      $('audio')[0].volume = volume
      myFader = ->
        fadeOutVolume volume-0.01
      setTimeout myFader, 10
    else
      fadeInVolume 0

  badStuffCollision = (thing) ->
    # return # god mode
    doPersonalBest()
    $("#game").fadeOut 'slow', ->
      resetScore()
      stuffIndex = 0
      nextSineStart = INF
      sineStart = -10
      for thing in stuff
        if thing.color == 'green'
          thing.color = 'blue'
      $('audio')[0].currentTime = 0
      $("#game").fadeIn 'slow'

  # Generate the stuff here

  pr = (x) -> Math.random() < x

  for jump in INTENDED_JUMPS
    i = start = mapTimeToX(jump.time)
    while i < start + JUMP_DISTANCE * 1.1
      difficulty = getDifficultyAt(mapXToTime(i))
      if i != start and i < start + JUMP_DISTANCE * .9
        if pr(difficulty * 0.5)
          stuff.push { x: i, y: getJumpY(start, i, -jump.direction), color: 'red', collision: badStuffCollision }
        else if pr(difficulty * 0.5)
          stuff.push { x: i, y: 0, color: 'red', collision: badStuffCollision }
      if pr(Math.max(1-difficulty, 0.5))
        stuff.push { x: i, y: getJumpY(start, i, jump.direction), color: 'blue', collision: goodStuffCollision }
      i += JUMP_DISTANCE / 7

  t = INTENDED_JUMPS[INTENDED_JUMPS.length-1].time + 2
  while t < 6 * 60
    difficulty = getDifficultyAt(t)
    if pr(difficulty)
      if pr(difficulty * 0.1)
        stuff.push { x: mapTimeToX(t), y: Math.random()*4-2, color: 'red', collision: badStuffCollision }
      else
        stuff.push { x: mapTimeToX(t), y: Math.random()*4-2, color: 'blue', collision: goodStuffCollision }
    t += 60/80/8

  stuff.push { x: INF, y: 0, color: 'yellow' }

  square = (x) -> x * x

  drawStuff = ->
    viewportX = getViewportX()
    while stuff[stuffIndex].x < viewportX-1
      stuffIndex++
    i = stuffIndex
    thingsToCallback = []
    playerX = getPlayerX()
    playerY = getPlayerY()
    noMorePush = false
    while stuff[i].x < viewportX + VIEWPORT_WIDTH + 1
      drawRect stuff[i].x-STUFF_WIDTH/2, stuff[i].y-STUFF_WIDTH/2, STUFF_WIDTH, STUFF_WIDTH, stuff[i].color
      if square(stuff[i].x-playerX) + square(stuff[i].y-playerY) < square(DIST_FOR_COLLISION)
        thingsToCallback.push stuff[i] if not noMorePush
        noMorePush = true if stuff[i].color == 'red' # HAX to stop shit turning green after restarting.
      i++
    for thing in thingsToCallback
      thing.collision(thing)

  #### Main loop ####

  startGame ->
    setViewport getViewportX(), -2
    drawXAxis()
    drawStuff()
    drawPlayer()
