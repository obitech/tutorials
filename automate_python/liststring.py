# Write a function that takes a list value as an argument and returns 
# a string with all the items separated by a comma and a space, 
# with and inserted before the last item. For example, passing 
# the previous spam list to the function would return 
# 'apples, bananas, tofu, and cats'. But your function should 
# be able to work with any list value passed to it.

def create_list():
    ar = []
    while True:
        print("Enter list item #" + str(len(ar) + 1) + ": ")
        inp = input()
        if inp == "": 
            break
        ar.append(inp)

    return ar

ar = create_list()
print("You entered: " + str(ar))
print()

def str_to_list(list):
    temp = list[:]
    for i in range(len(temp) - 1):
        temp[i] += ", "
    temp.insert(-1, "and")

    return " ".join(temp)

print("Final string: " + str_to_list(ar))