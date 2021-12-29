


def sram_write(input_signals, wl=0, din=0, sel=0):
    input_names = list(input_signals.keys())
    
    for i in input_names:
        if(i == 'WRITE_E'):
            input_signals[i].append( 1 )
        elif i == 'WL':
            input_signals[i].append( wl )
        elif i == 'DIN':
            input_signals[i].append( din )
        elif i == 'WRITE_SEL':
            input_signals[i].append( sel )
        elif i == 'PEC':
            input_signals[i].append( 1 )
        else:
            input_signals[i].append( 0 )


def sram_read(input_signals, wl=0, A=0, B=0 ):
    input_names = list(input_signals.keys())
    
    for i in input_names:
        if i == 'READ_E':
            input_signals[i].append( 1 )
        elif i == 'WL':
            input_signals[i].append( wl )
        elif i == 'PEC':
            input_signals[i].append( 0 )
        elif i == 'SAE':
            input_signals[i].append( 1 )
        elif i == 'REG_A_SEL':
            input_signals[i].append( A )
        elif i == 'REG_B_SEL':
            input_signals[i].append( B )
        else:
            input_signals[i].append( 0 )

def calculate(input_signals, op_sel=0):
    input_names = list(input_signals.keys())
    for i in input_names:
        if i == 'OP_SEL':
            input_signals[i].append( op_sel )
        elif i == 'PEC':
            input_signals[i].append( 1 )
        else:
            input_signals[i].append( 0 )


def alu_add(input_signals, wl_A=9, wl_B=10, wl_WB=9):

    # load A and B
    sram_read(input_signals, wl=wl_A, A=1, B=0)
    sram_read(input_signals, wl=wl_B, A=0, B=1)

    # calculate A + B
    calculate(input_signals, op_sel=0)

    # write back
    sram_write(input_signals, wl=wl_WB, din=0, sel=1)


def alu_mult(input_signals, wl_A=1, wl_B=5, wl_WB=9):

    # load A00 and B00
    sram_read(input_signals, wl=wl_A, A=1, B=0)
    sram_read(input_signals, wl=wl_B, A=0, B=1)

    # calculate A00 * B00
    calculate(input_signals, op_sel=1)

    # write back
    sram_write(input_signals, wl=wl_WB, din=0, sel=1)


