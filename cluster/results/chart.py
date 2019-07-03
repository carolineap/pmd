import numpy as np
import matplotlib.pyplot as plt

fig, ax = plt.subplots()

x = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1500]
#vazao
#y = [1372.79, 1128.25, 1068.36, 901.69, 1064.43, 923.33, 998.17, 750.81, 785.42, 860.74]

#latencia média - leitura
yLeitura=[222, 174, 160, 159, 165, 176, 190, 322, 355,423, 662]
yEscrita=[ 196,149,134,133,138,149,162,293,328,392,624]		

plt.plot(x, yLeitura, '-o', label="leitura")

plt.plot(x, yEscrita, '-o', label="escrita")


ax.legend()

#vazao
#ax.set(xlabel='número de usuários', ylabel='vazão/s')

#latencia média
ax.set(xlabel='número de usuários', ylabel='Elapsed Time Média(ms)')

plt.show()