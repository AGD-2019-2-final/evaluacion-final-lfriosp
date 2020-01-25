import sys
import operator
from operator import itemgetter

#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    sort = sorted(sys.stdin, key=itemgetter(2))

    for line in sort:
        key, valor = line.split(",")
        valor = int(valor)

        sys.stdout.write("{},{}\n".format(key, valor))
