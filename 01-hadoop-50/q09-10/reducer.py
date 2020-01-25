import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    minimum = None
    contador = 0

    for line in sys.stdin:
        if contador<=5:
            aux, key, fecha, valor = line.split("\t")
            valor = int(valor)
            sys.stdout.write("{}\t{}\t{}\n".format(key, fecha, valor))
            contador += 1
