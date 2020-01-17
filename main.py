#!/usr/bin/python
import getopt
import os
import sys


def main(argv):
    inputfile = ''
    try:
        opts, args = getopt.getopt(argv, "hi:", ["ifile="])
    except getopt.GetoptError:
        print('usage : test.py -i <inputfile>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print('test.py -i <inputfile>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
    if os.path.isfile(inputfile):
        with open(inputfile, 'r') as content_file:
            content = content_file.read()
            print(content)
    else:
        raise Exception(' Input file does not exist: {}'.format(inputfile))


if __name__ == "__main__":
    main(sys.argv[1:])
