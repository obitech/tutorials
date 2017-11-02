numbers = [42]

def add_numbers(temp):
    for i in range(3):
        temp.append(i)
    return temp

print(add_numbers(numbers))
