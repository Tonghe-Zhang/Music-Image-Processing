

#sort lines in alphabetic order.

A=[]
with open('harmonic.txt',mode='r') as f:
    for line in f:
        A.append(line.split('\t')) 
    L=len(A)
    B=sorted(A)
     
    f.close()
    

with open('harmonic.txt',mode='w') as f:
    for line in B:
        b="\t".join(tuple(line))
        bb=b.split()
        b1=bb[0:7]
        b2=bb[7:14]
        b3=bb[14:21]

        b1="\t".join(tuple(b1))
        b2="\t".join(tuple(b2))
        b3="\t".join(tuple(b3))

        f.write("%s\n" % b1)
        f.write("%s\n" % b2)
        f.write("%s\n" % b3)

        f.write("\n")
    f.close()  

