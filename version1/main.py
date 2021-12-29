from hspice import *
from signal import *

clk = "VCLK CLK GND! PULSE(0v 0.8v 4.9n 0.1n 0.1n 4.9n 10n)\n"
vdd = "* Vdd VDD 0 0.8\n"
gnd = "* Vgnd GND 0 0\n"

input_width = {"WRITE_E":1, "READ_E":1, "PEC":1, "SAE":1, "OP_SEL":1, "REG_A_SEL":1, "REG_B_SEL":1, "WRITE_SEL":1, "WL":16, "DIN":4}
input_names = list(input_width.keys())
input_signals = {"WRITE_E":[], "READ_E":[], "PEC":[], "SAE":[], "OP_SEL":[], "REG_A_SEL":[], "REG_B_SEL":[], "WRITE_SEL":[], "WL":[], "DIN":[]}

def process(input_signals):
    # ===========================================================
    A = [ [1, 2], [3, 4] ]
    B = [ [5, 6], [7, 8] ]

    # write A
    sram_write(input_signals, wl=1, din=A[0][0], sel=0)
    sram_write(input_signals, wl=2, din=A[0][1], sel=0)
    sram_write(input_signals, wl=3, din=A[1][0], sel=0)
    sram_write(input_signals, wl=4, din=A[1][1], sel=0)

    # write B
    sram_write(input_signals, wl=5, din=B[0][0], sel=0)
    sram_write(input_signals, wl=6, din=B[0][1], sel=0)
    sram_write(input_signals, wl=7, din=B[1][0], sel=0)
    sram_write(input_signals, wl=8, din=B[1][1], sel=0)

    # ===========================================================
    # C00

    alu_mult(input_signals, wl_A=1, wl_B=5, wl_WB=9)
    alu_mult(input_signals, wl_A=2, wl_B=7, wl_WB=10)
    alu_add( input_signals, wl_A=9, wl_B=10, wl_WB=9)

    # ===========================================================
    # C01

    alu_mult(input_signals, wl_A=1, wl_B=6, wl_WB=10)
    alu_mult(input_signals, wl_A=2, wl_B=8, wl_WB=11)
    alu_add( input_signals, wl_A=10, wl_B=11, wl_WB=10)


    # ===========================================================
    # C10

    alu_mult(input_signals, wl_A=3, wl_B=5, wl_WB=11)
    alu_mult(input_signals, wl_A=4, wl_B=7, wl_WB=12)
    alu_add( input_signals, wl_A=11, wl_B=12, wl_WB=11)

    # ===========================================================
    # C11

    alu_mult(input_signals, wl_A=3, wl_B=6, wl_WB=12)
    alu_mult(input_signals, wl_A=4, wl_B=8, wl_WB=13)
    alu_add( input_signals, wl_A=12, wl_B=13, wl_WB=12)

    # ===========================================================
    # Read C00 - C11

    sram_read(input_signals, wl=9, A=0, B=0)
    sram_read(input_signals, wl=10, A=0, B=0)
    sram_read(input_signals, wl=11, A=0, B=0)
    sram_read(input_signals, wl=12, A=0, B=0)

    return input_signals

def output(input_signals):
    generate_sources = {}

    for i in input_names:
        the_width = input_width[i]
        the_signal = input_signals[i]
        if the_width > 1 :
            if i == 'WL':
                tmp = generate_mult_signal(i, the_width, the_signal, mode='single', pulse_en='pulse', pulse='postive', delay=2, pulse_width=2)
            else:
                tmp = generate_mult_signal(i, the_width, the_signal, mode='default')
        else:
            if i == 'PEC':
                tmp = generate_single_signal(i, i, the_signal, mode='pulse', pulse='negative', delay=0, width=2)
            elif i == 'SAE':
                tmp = generate_single_signal(i, i, the_signal, mode='pulse', pulse='postive', delay=4, width=2)
            else:
                tmp = generate_single_signal(i, i, the_signal, mode='default')
        generate_sources[i] = tmp

    total_sources = ""
    for i in input_names:
        total_sources = total_sources + generate_sources[i] + "\n\n"

    total_sources = total_sources + clk + vdd + gnd

    return total_sources

def save(content,filename="./Vsource.txt"):
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(content)

if __name__ == '__main__':
    the_signals = process(input_signals)
    content = output(the_signals)
    # print(content)
    save(content, "./Vsource.txt")
