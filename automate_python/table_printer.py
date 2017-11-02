tableData = [['apples', 'oranges', 'cherries', 'banana'],
             ['Alice', 'Bob', 'Carol', 'David'],
             ['dogs', 'cats', 'moose', 'goose']]

# Gets length of longest string in each sub-array
length = [max([len(x) for x in item]) for item in tableData]

for row in range(len(tableData[0])):
    for col in range(len(tableData)):
        print(str(tableData[col][row]).rjust(length[col]) + ' ', end='')
    print()
