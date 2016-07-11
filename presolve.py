#!/usr/bin/python 

import sys
fpIn = open("diagnosis.data","r")
fpOut = open("preDiagnosis.data","wt")
attr1 = ['a2_no','a3_no','a4_no','a5_no','a6_no','d1_no','d2_no']
attr2 = ['a2_yes','a3_yes','a4_yes','a5_yes','a6_yes','d1_yes','d2_yes']


lines = fpIn.readlines()
linesCount = len(lines)
for line in lines:
    line = line.strip('\n')
    para = line.split('\t')
    para0 = line.split(',')
    fpOut.write('a1_'+para0[0])
    i = 0
    for p in para:
        if i > 0:
            if p == 'yes':
                fpOut.write(',')
                fpOut.write(attr2[i-1])
            else:
                fpOut.write(',')
                fpOut.write(attr1[i-1])
        i += 1
    fpOut.write('\n')

fpIn.close()
fpOut.close()
