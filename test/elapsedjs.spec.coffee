# spec of elapsed.js

describe 'elapsed', ->

  it 'is a function', ->
    expect(typeof window.elapsed).toBe 'function'

  it 'returns an object', ->
    expect(typeof elapsed()).toBe 'object'

  describe 'which', ->

    it 'has `then` method', ->

      expect(typeof elapsed().then).toBe 'function'

    describe 'which', ->

      it 'returns an object', ->

        expect(typeof elapsed().then()).toBe 'object'

      describe 'which', ->

        it 'has cancel method', ->

           expect(typeof elapsed().then().cancel).toBe 'function'

describe 'elapsed(msec).then(func)', ->

  it 'executes func after msec', ->

    done = false

    spy = jasmine.createSpy()

    elapsed(100).then ->

      spy()

    setTimeout ->

      expect(spy).not.toHaveBeenCalled()

    , 99

    setTimeout ->

      expect(spy).toHaveBeenCalled()

      done = true

    , 101

    waitsFor -> done

describe 'elapsed(msec).then(func).cancel', ->

  it 'cancels func execution', ->

    done = false

    spy = jasmine.createSpy()

    timer = elapsed(100).then ->

      spy()

    setTimeout ->

      timer.cancel()

    , 50

    setTimeout ->

      expect(spy).not.toHaveBeenCalled()

      done = true

    , 150

    waitsFor -> done
