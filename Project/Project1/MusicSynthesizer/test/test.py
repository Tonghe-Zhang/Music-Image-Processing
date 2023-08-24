

import numpy as np


'''
calculate the relative shift(in half a key) w.r.t. the C in this octave.
WARNINGL result might be negative when user inputs C flat
output falls into [-1,12]
'''
def abs_position_in_octave(name,alter='N')->np.int:
    #name
    name=name.upper()
    if name=='C' or name==1:
        y=0
    elif name=='D' or name==2:
        y=2
    elif name=='E' or name==3:
        y=4
    elif name=='F' or name==4:
        y=5
    elif name=='G' or name==5:
        y=7
    elif name=='A' or name==6:
        y=9
    elif name=='B' or name==7:
        y=11
    else:
        print(f"Undefined note name {name}")
        raise(NotImplementedError)
    
    #N: natural,   S: sharp,  F: flat. 
    alter=alter.upper()
    y=y if (alter=='N') else (y+1 if (alter=='S') else y-1)
    
    print(f"\n Absolute Position:{y}")
    return y


def note2pitch(alter='N',name='A',octave=4)->np.double:

    shamt_within_octave=abs_position_in_octave(name=name,alter=alter)

    shamt_between_octaves=(octave-4)*12
    
    shamt_wrt_central_A=(shamt_within_octave-9)+shamt_between_octaves

    base_pitch=440.000000 

    pitch=base_pitch * pow(1.05946309, shamt_wrt_central_A)

    return pitch

''''

translate a simplified notation of notes w.r.t to a fixed key to the frequency.
e.g. 5 in F major

'''
def num2pitch(num:int,alter='N',key=('N','C',4)):

    place_base=abs_position_in_octave(key(1),key(2))

    place_note=abs_position_in_octave(num,alter)

    shamt=place_note-place_base

    base_pitch=note2pitch(key)

    pitch=base_pitch * pow(1.05946309, shamt)

    return pitch


def write_pitch_to_file(pitch,f):
    f.write(str(pitch))
    f.write('\n')


def input_single_note(f_in,f_out):
    ins=input("Input note.e.g. F B 3 (b B 3) \n")
    alter, name, octave=ins.split()
    octave=int(octave)

    pitch=note2pitch(alter, name, octave)
    
    with open('f_out',mode='a') as f_out:
        write_pitch_to_file(pitch,f_out)


def input_song_key(f_in_name='simplified.txt'):
    key=input("input key: e.g. N F 4: normal F4")
    
    N_k,name_k,scale_k=key.split()
    scale_k=int(scale_k)

    note=[]
    with open(f_in_name,mode='r') as f_in:
        note.append(float(f_in.readline().split(',')))
    
    print(note)

#alter(N),name,octave(4), len(1), 



input_song_key()
