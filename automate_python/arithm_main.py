from arithm import add, sub

# This will run when called from command line
if __name__ == "__main__":
    import sys
    if len(sys.argv) != 3:
        sys.exit("Invalid # of arguments")
    print(add(sys.argv[1], sys.argv[2]))