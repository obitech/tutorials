def add(a, b):
    return a + b

def test1():
    assert add(3,4) == 7
    assert add(5,5) == 10

def test2():
    assert add(5,5) == 10

def test3():
    assert add('a', str(3)) == 'a3'