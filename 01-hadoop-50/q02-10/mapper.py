import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        var1 = line.split(',')[3]
        cantidad = line.split(',')[4]
        sys.stdout.write("{}\t{}\n".format(var1,cantidad))
