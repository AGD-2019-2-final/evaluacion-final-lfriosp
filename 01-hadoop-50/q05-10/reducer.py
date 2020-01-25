import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = 0

    for line in sys.stdin:

        key, valor = line.split("\t")
        valor = int(valor)

        if key == curkey:
            total += valor
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\n".format(curkey, total))

            curkey = key
            total = valor

    sys.stdout.write("{}\t{}\n".format(curkey, total))
