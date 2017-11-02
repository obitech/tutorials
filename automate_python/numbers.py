numbers = []

while True:
    print("Enter value #" + str(len(numbers) + 1) + " or enter nothing to stop") 
    inp = input()
    if inp == "":
        break
    numbers += [int(inp)]

print("You entered:")
for x in numbers:
    print(x)
