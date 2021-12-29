from hspice3 import *
from signal3 import *

clk = "VCLK CLK GND! PULSE(0v 0.8v 4.9n 0.1n 0.1n 4.9n 10n)\n"
vdd = "* Vdd VDD 0 0.8\n"
gnd = "* Vgnd GND 0 0\n"

input_width = {"WRITE_E":1, "READ_E":1, "PEC":1, "SAE":1, "OP_SEL":1, "REG_A_SEL":1, "REG_B_SEL":1, "WRITE_SEL":1, "WL":16, "DIN":4, "COL_SEL":2, "MUL_SEL":1}
input_names = list(input_width.keys())
input_signals = {"WRITE_E":[], "READ_E":[], "PEC":[], "SAE":[], "OP_SEL":[], "REG_A_SEL":[], "REG_B_SEL":[], "WRITE_SEL":[], "WL":[], "DIN":[], "COL_SEL":[], "MUL_SEL":[]}

def process(A, B, input_signals):
    # ===========================================================
    # write A
    sram_write(input_signals, wl=1, din=A[0][0], sel=0, col_sel=1)
    sram_write(input_signals, wl=1, din=A[0][1], sel=0, col_sel=2)
    sram_write(input_signals, wl=2, din=A[1][0], sel=0, col_sel=1)
    sram_write(input_signals, wl=2, din=A[1][1], sel=0, col_sel=2)

    # write B
    sram_write(input_signals, wl=3, din=B[0][0], sel=0, col_sel=1)
    sram_write(input_signals, wl=3, din=B[1][0], sel=0, col_sel=2)
    # sram_write(input_signals, wl=4, din=B[0][1], sel=0, col_sel=1)
    # sram_write(input_signals, wl=4, din=B[1][1], sel=0, col_sel=2)
    read_and_write(input_signals, wl_wr=4, din=B[0][1], sel=0, col_sel=1, wl_rd=3, A=0, B=1)
    write_and_read(input_signals, wl_wr=4, din=B[1][1], sel=0, col_sel=2, wl_rd=1, A=1, B=0)

    # ===========================================================
    # A00 * B00 
    # A01 * B10

    # sram_read(input_signals, wl=1, A=1, B=0)
    calculate(input_signals, op_sel=1, mul_sel=0)

    # sram_write(input_signals, wl=5, din=0, sel=1, col_sel=3)
    # calculate_and_read(input_signals, op_sel=1, mul_sel=1, wl=4, A=0, B=1)
    # sram_write(input_signals, wl=6, din=0, sel=1, col_sel=3)

    calculate_and_write(input_signals, op_sel=1, mul_sel=1, wl=5, din=0, sel=1, col_sel=3)
    write_and_read(input_signals, wl_wr=6, din=0, sel=1, col_sel=3, wl_rd=4, A=0, B=1)

    # ===========================================================
    # A00 * B01
    # A01 * B11

    calculate(input_signals, op_sel=1, mul_sel=0)

    # sram_write(input_signals, wl=7, din=0, sel=1, col_sel=3)
    # calculate_and_read(input_signals, op_sel=1, mul_sel=1, wl=2, A=1, B=0)
    # sram_write(input_signals, wl=8, din=0, sel=1, col_sel=3)

    calculate_and_write(input_signals, op_sel=1, mul_sel=1, wl=7, din=0, sel=1, col_sel=3)
    write_and_read(input_signals, wl_wr=8, din=0, sel=1, col_sel=3, wl_rd=2, A=1, B=0)

    # ===========================================================
    # A10 * B01
    # A11 * B11

    calculate(input_signals, op_sel=1, mul_sel=0)

    # sram_write(input_signals, wl=9, din=0, sel=1, col_sel=3)
    # calculate_and_read(input_signals, op_sel=1, mul_sel=1, wl=3, A=0, B=1)
    # sram_write(input_signals, wl=10, din=0, sel=1, col_sel=3)

    calculate_and_write(input_signals, op_sel=1, mul_sel=1, wl=9, din=0, sel=1, col_sel=3)
    write_and_read(input_signals, wl_wr=10, din=0, sel=1, col_sel=3, wl_rd=3, A=0, B=1)

    # ===========================================================
    # A10 * B00
    # A11 * B10

    calculate(input_signals, op_sel=1, mul_sel=0)

    sram_write(input_signals, wl=11, din=0, sel=1, col_sel=3)
    calculate_and_read(input_signals, op_sel=1, mul_sel=1, wl=5, A=1, B=0)
    write_and_read(input_signals, wl_wr=12, din=0, sel=1, col_sel=3, wl_rd=6, A=0, B=1)

    # calculate_and_write(input_signals, op_sel=1, mul_sel=1, wl=11, din=0, sel=1, col_sel=3)
    # write_and_read(input_signals, wl_wr=12, din=0, sel=1, col_sel=3, wl_rd=5, A=1, B=0)


    # ===========================================================


    # A00 * B00 + A01 * B10

    calculate_and_read(input_signals, op_sel=0, wl=7, A=1, B=0)
    write_and_read(input_signals, wl_wr=13, din=0, sel=1, col_sel=3, wl_rd=8, A=0, B=1)

    # A00 * B01 + A01 * B11
    calculate_and_read(input_signals, op_sel=0, wl=11, A=1, B=0)
    write_and_read(input_signals, wl_wr=14, din=0, sel=1, col_sel=3, wl_rd=12, A=0, B=1)

    # A10 * B00 + A11 * B10
    calculate_and_read(input_signals, op_sel=0, wl=9, A=1, B=0)
    write_and_read(input_signals, wl_wr=15, din=0, sel=1, col_sel=3, wl_rd=10, A=0, B=1)
    
    # A10 * B01 + A11 * B11
    calculate(input_signals, op_sel=0)
    write_and_read(input_signals, wl_wr=16, din=0, sel=1, col_sel=3, wl_rd=13, A=0, B=0)

    # ===========================================================
    # Read C00 - C11

    # sram_read(input_signals, wl=13, A=0, B=0)
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
                tmp = generate_mult_signal(i, the_width, the_signal, mode='single', pulse_en='pulse', pulse='postive', delay=1, pulse_width=1, step=2.5)
            else:
                tmp = generate_mult_signal(i, the_width, the_signal, mode='default', step=2.5)
        else:
            if i == 'PEC':
                tmp = generate_single_signal(i, i, the_signal, mode='pulse', pulse='negative', delay=0, width=1, step=2.5)
            elif i == 'SAE':
                tmp = generate_single_signal(i, i, the_signal, mode='pulse', pulse='postive', delay=2, width=0.5, step=2.5)
            else:
                tmp = generate_single_signal(i, i, the_signal, mode='default', step=2.5)
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

    # case 1
    input_signals = {"WRITE_E":[], "READ_E":[], "PEC":[], "SAE":[], "OP_SEL":[], "REG_A_SEL":[], "REG_B_SEL":[], "WRITE_SEL":[], "WL":[], "DIN":[], "COL_SEL":[], "MUL_SEL":[]}

    A = [ [1, 2], [3, 4] ]
    B = [ [5, 6], [7, 8] ]
    the_signals = process(A, B, input_signals)
    content = output(the_signals)
    save(content, "./Vsource3_1.txt")
    
    
    # case 2
    input_signals = {"WRITE_E":[], "READ_E":[], "PEC":[], "SAE":[], "OP_SEL":[], "REG_A_SEL":[], "REG_B_SEL":[], "WRITE_SEL":[], "WL":[], "DIN":[], "COL_SEL":[], "MUL_SEL":[]}

    A = [ [10, 14], [15, 10] ]
    B = [ [7, 8], [5, 15] ]
    the_signals = process(A, B, input_signals)
    content = output(the_signals)
    save(content, "./Vsource3_2.txt")

    # case 3
    input_signals = {"WRITE_E":[], "READ_E":[], "PEC":[], "SAE":[], "OP_SEL":[], "REG_A_SEL":[], "REG_B_SEL":[], "WRITE_SEL":[], "WL":[], "DIN":[], "COL_SEL":[], "MUL_SEL":[]}

    A = [ [13, 2], [5, 11] ]
    B = [ [15, 14], [12, 15] ]
    the_signals = process(A, B, input_signals)
    content = output(the_signals)
    save(content, "./Vsource3_3.txt")

    # case 4
    input_signals = {"WRITE_E":[], "READ_E":[], "PEC":[], "SAE":[], "OP_SEL":[], "REG_A_SEL":[], "REG_B_SEL":[], "WRITE_SEL":[], "WL":[], "DIN":[], "COL_SEL":[], "MUL_SEL":[]}

    A = [ [15, 15], [15, 15] ]
    B = [ [15, 15], [15, 15] ]
    the_signals = process(A, B, input_signals)
    content = output(the_signals)
    save(content, "./Vsource3_4.txt")


    # case 5
    input_signals = {"WRITE_E":[], "READ_E":[], "PEC":[], "SAE":[], "OP_SEL":[], "REG_A_SEL":[], "REG_B_SEL":[], "WRITE_SEL":[], "WL":[], "DIN":[], "COL_SEL":[], "MUL_SEL":[]}

    A = [ [0, 0], [0, 0] ]
    B = [ [0, 0], [0, 0] ]
    the_signals = process(A, B, input_signals)
    content = output(the_signals)
    save(content, "./Vsource3_5.txt")

