animals = ["cats", "dogs", "mammals", "birds", "fish", "reptiles"]
for i in animals[:]:
   if len(i) > 6:
      animals.insert(0, "HUMANS")
print(animals)