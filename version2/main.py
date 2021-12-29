from hspice import *
from signal2 import *

clk = "VCLK CLK GND! PULSE(0v 0.8v 4.9n 0.1n 0.1n 4.9n 10n)\n"
vdd = "* Vdd VDD 0 0.8\n"
gnd = "* Vgnd GND 0 0\n"

input_width = {"WRITE_E":1, "READ_E":1, "PEC":1, "SAE":1, "OP_SEL":1, "REG_A_SEL":1, "REG_B_SEL":1, "WRITE_SEL":1, "WL":16, "DIN":4, "COL_SEL":2, "MUL_SEL":1}
input_names = list(input_width.keys())
input_signals = {"WRITE_E":[], "READ_E":[], "PEC":[], "SAE":[], "OP_SEL":[], "REG_A_SEL":[], "REG_B_SEL":[], "WRITE_SEL":[], "WL":[], "DIN":[], "COL_SEL":[], "MUL_SEL":[]}

def process(input_signals):
    # ===========================================================
    A = [ [13, 2], [5, 11] ]
    B = [ [15, 14], [12, 15] ]

    # write A
    sram_write(input_signals, wl=1, din=A[0][0], sel=0, col_sel=1)
    sram_write(input_signals, wl=1, din=A[0][1], sel=0, col_sel=2)
    sram_write(input_signals, wl=2, din=A[1][0], sel=0, col_sel=1)
    sram_write(input_signals, wl=2, din=A[1][1], sel=0, col_sel=2)

    # write B
    sram_write(input_signals, wl=3, din=B[0][0], sel=0, col_sel=1)
    sram_write(input_signals, wl=3, din=B[1][0], sel=0, col_sel=2)
    sram_write(input_signals, wl=4, din=B[0][1], sel=0, col_sel=1)
    sram_write(input_signals, wl=4, din=B[1][1], sel=0, col_sel=2)

    # ===========================================================
    # A00 * B00 
    # A01 * B10

    alu_mult(input_signals, wl_A=1, wl_B=3, wl_WB=5, mul_sel=0)
    alu_mult_wo_read(input_signals, wl_WB=6, mul_sel=1)

    # ===========================================================
    # A00 * B01
    # A01 * B11

    alu_mult_single_read(input_signals, wl_AB=4, A=0, B=1, wl_WB=7, mul_sel=0)
    alu_mult_wo_read(input_signals, wl_WB=8, mul_sel=1)


    # ===========================================================
    # A10 * B01
    # A11 * B11

    alu_mult_single_read(input_signals, wl_AB=2, A=1, B=0, wl_WB=9, mul_sel=0)
    alu_mult_wo_read(input_signals, wl_WB=10, mul_sel=1)

    # ===========================================================
    # A10 * B00
    # A11 * B10

    alu_mult_single_read(input_signals, wl_AB=3, A=0, B=1, wl_WB=11, mul_sel=0)
    alu_mult_wo_read(input_signals, wl_WB=12, mul_sel=1)

    # ===========================================================
    # A00 * B00 + A01 * B10
    alu_add( input_signals, wl_A=5, wl_B=6, wl_WB=13)
    # A00 * B01 + A01 * B11
    alu_add( input_signals, wl_A=7, wl_B=8, wl_WB=14)
    # A10 * B00 + A11 * B10
    alu_add( input_signals, wl_A=11, wl_B=12, wl_WB=15)
    # A10 * B01 + A11 * B11
    alu_add( input_signals, wl_A=9, wl_B=10, wl_WB=16)

    # ===========================================================
    # Read C00 - C11

    sram_read(input_signals, wl=13, A=0, B=0)
    sram_read(input_signals, wl=14, A=0, B=0)
    sram_read(input_signals, wl=15, A=0, B=0)
    sram_read(input_signals, wl=16, A=0, B=0)

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

def output2(input_signals):
    generate_sources = {}

    for i in input_names:
        the_width = input_width[i]
        the_signal = input_signals[i]
        if the_width > 1 :
            if i == 'WL':
                tmp = generate_mult_signal(i, the_width, the_signal, mode='single', pulse_en='pulse', pulse='postive', delay=1, pulse_width=1)
            else:
                tmp = generate_mult_signal(i, the_width, the_signal, mode='default')
        else:
            if i == 'PEC':
                tmp = generate_single_signal(i, i, the_signal, mode='pulse', pulse='negative', delay=0, width=1)
            elif i == 'SAE':
                tmp = generate_single_signal(i, i, the_signal, mode='pulse', pulse='postive', delay=2, width=1)
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
    content = output2(the_signals)
    # print(content)
    save(content, "./Vsource2_3.txt")
