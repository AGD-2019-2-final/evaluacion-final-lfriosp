import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    maximum = None
    minimum = None

    for line in sys.stdin:

        key, valor = line.split("\t")

        if key == curkey:
            maximum = max(maximum, valor)
            minimum = min(minimum, valor)
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey,maximum,minimum))

            curkey = key
            maximum = valor
            minimum = valor

    sys.stdout.write("{}\t{}\t{}\n".format(curkey,maximum,minimum))
