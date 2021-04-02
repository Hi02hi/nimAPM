# to see how far i am from the best
import nimbench, apm

bench(Addition):
  for i in -1000..1000:
    var x = newNumber(i) + newNumber(i)
    doNotOptimizeAway(x)

when defined(full):
   #[
  these are
    ~4x faster than me adding
    ~5-6x faster than me subtracting
    ~6-9x faster than me multiplying
  ]#
  import bigints, bignum
  benchRelative(Proper Addition):
    for i in -1000..1000:
      var x = initBigInt(i) + initBigInt(i)
      doNotOptimizeAway(x)

  benchRelative(GMP Addition):
    for i in -1000..1000:
      var
        result = newInt()
        x = newInt(i)
        y = newInt(i)
      
      discard add(result, x, y) # i think this means put x+y into result, then return result

bench(Subtraction):
  for i in -1000..1000:
    var x = newNumber(i) - newNumber(i)
    doNotOptimizeAway(x)

when defined(full):
  benchRelative(Proper Subtraction):
    for i in -1000..1000:
      var x = initBigInt(i) - initBigInt(i)
      doNotOptimizeAway(x)

  benchRelative(GMP Subtraction):
    for i in -1000..1000:
      var
        result = newInt()
        x = newInt(i)
        y = newInt(i)
      
      discard add(result, x, y)

bench(Multiplacation):
  for i in -1000..1000:
    var x = newNumber(i) * newNumber(i)
    doNotOptimizeAway(x)

when defined(full):
  benchRelative(Proper Multiplacation):
    for i in -1000..1000:
      var x = initBigInt(i) * initBigInt(i)
      doNotOptimizeAway(x)

  benchRelative(GMP Multiplacation):
    for i in -1000..1000:
      var
        result = newInt()
        x = newInt(i)
        y = newInt(i)
      
      discard mul(result, x, y)

bench(Division):
  for i in -1000..1000:
    if i == 0:continue
    var x = newNumber(i) div newNumber(100)
    doNotOptimizeAway(x)

runBenchmarks()