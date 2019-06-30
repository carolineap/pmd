import numpy as np
import matplotlib.pyplot as plt

fig, ax = plt.subplots()

x = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
#vazao
#y = [1372.79, 1128.25, 1068.36, 901.69, 1064.43, 923.33, 998.17, 750.81, 785.42, 860.74]

#latencia média - leitura
yLeitura=[50, 116, 180, 287, 314, 423, 453, 699, 619, 570]
yEscrita=[54, 112, 168, 279, 304, 414, 446, 631, 609, 527]

plt.plot(x, yLeitura, '-o', label="leitura")

plt.plot(x, yEscrita, '-o', label="escrita")


ax.legend()

#vazao
#ax.set(xlabel='número de usuários', ylabel='vazão/s')

#latencia média
ax.set(xlabel='número de usuários', ylabel='latência média (ms)')

plt.show()