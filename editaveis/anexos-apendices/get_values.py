#!/usr/bin/python

import sys
import os
import csv
import subprocess
from multiprocessing.pool import ThreadPool
from pyexcel_ods import save_data

MAX = 150
_MAX_THREADS = 7
global b
data = {}
type_algorithm = {'kmp': [u'KMP', 1],
                  'rk': [u'Rabin-Karp', 0],
                  'ori': [u'Original', 2],
                  'levenshtein': [u'Levenshtein', 3],
                  'dice_coefficient': [u'Dice Coefficient', 4],
                  }

commands = sys.argv[1:]
if len(commands) == 0:
    commands = ['goo', 'gyt',
                'latexy', 'texlive',
                'libreoffice', 'libreoice',
                'firefox', 'firefoxy',
                'qtdeclarative', 'qwerty'
                ]
for cmds in commands:
    data[cmds] = [[u'Rabin-Karp'], [u'KMP'],
                  [u'Original'], [u'Levenshtein'], [u'Dice']]


def run(search):
    for i in xrange(0, MAX):
        cmd = './bin/apt search %s 2>> %s_%s.txt' % (search, search, b)
        subprocess.call(cmd, shell=True)


def process(file='firefox_test_apt-search-ori.txt'):
    sheet = file.split('_')[0]
    name = file.split('-')[-1].split('.')[0]
    model = type_algorithm[name][1]
    name = type_algorithm[name][0]
    with open(file, 'rb') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=':')
        print('Loading %s from %s') % (name, sheet)
        for line in spamreader:
            data[sheet][model].append(float(line[1]))
    save_data('teste.ods', data)


if __name__ == '__main__':
    branchs = ['test/apt-search-kmp',
               'test/apt-search-rk',
               'test/apt-search-ori',
               'test/apt-search-levenshtein',
               'test/apt-search-dice_coefficient',
               ]
    for branch in branchs:
        subprocess.call('git checkout ' + branch, shell=True)
        subprocess.call("make clean && make", shell=True)
        b = branch.replace('/', '_')

        _pool = ThreadPool(processes=_MAX_THREADS)
        result = _pool.map(run, commands)
        _pool.close()
        _pool.join()

    files = [f for f in os.listdir('.') if os.path.isfile(f)]
    files = sorted(files)
    for f in files:
        try:
            process(f)
        except KeyError:
            pass
