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

    elapsed(500).then ->

      spy()

    setTimeout ->

      expect(spy).not.toHaveBeenCalled()

    , 499

    setTimeout ->

      expect(spy).toHaveBeenCalled()

      done = true

    , 501

    waitsFor -> done
