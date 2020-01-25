import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    for line in sys.stdin:
        line = line.strip()
        num = line.split("\t")[0]
        num = int(num)
        letras = line.split("\t")[1]
        letras = letras.split(",")

        for letra in letras:
            letra = str(letra)
            sys.stdout.write("{}\t{}\t{}\n".format(letra + str(num/100), letra, num))
