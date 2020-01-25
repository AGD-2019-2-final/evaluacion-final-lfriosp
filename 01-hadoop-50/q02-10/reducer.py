import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    maximo = None

    for line in sys.stdin:

        key, valor = line.split("\t")
        valor = int(valor)

        if key == curkey:
            maximo = max(valor,maximo)

        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\n".format(curkey, maximo))

            curkey = key
            maximo = valor

    sys.stdout.write("{}\t{}\n".format(curkey, maximo))
