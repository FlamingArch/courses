import matplotlib.pyplot as plt
import math

x=list(range(100))
l=[]; l2=[]; a=1
plt.plot(x, [y*y for y in x])
plt.plot(x, [(7*y)*math.log(y,2) for y in x]
plt.show()

