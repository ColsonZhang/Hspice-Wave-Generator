


def sram_write(input_signals, wl=0, din=0, sel=0, col_sel=0):
    input_names = list(input_signals.keys())
    
    for i in input_names:
        if(i == 'WRITE_E'):
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
        elif i == 'WL':
            input_signals[i].append( wl )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
        elif i == 'DIN':
            input_signals[i].append( din )
            input_signals[i].append( din )
            input_signals[i].append( din )
            input_signals[i].append( din )
        elif i == 'WRITE_SEL':
            input_signals[i].append( sel )
            input_signals[i].append( sel )
            input_signals[i].append( sel )
            input_signals[i].append( sel )
        elif i == "COL_SEL":
            input_signals[i].append( col_sel )
            input_signals[i].append( col_sel )
            input_signals[i].append( col_sel )
            input_signals[i].append( col_sel )
        elif i == 'PEC':
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
        else:
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )


def sram_read(input_signals, wl=0, A=0, B=0 ):
    input_names = list(input_signals.keys())
    
    for i in input_names:
        if i == 'READ_E':
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
        elif i == 'WL':
            input_signals[i].append( wl )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
        elif i == 'PEC':
            input_signals[i].append( 0 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
        elif i == 'SAE':
            input_signals[i].append( 1 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
        elif i == 'REG_A_SEL':
            input_signals[i].append( A )
            input_signals[i].append( A )
            input_signals[i].append( A )
            input_signals[i].append( A )
        elif i == 'REG_B_SEL':
            input_signals[i].append( B )
            input_signals[i].append( B )
            input_signals[i].append( B )
            input_signals[i].append( B )
        else:
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )

def calculate(input_signals, op_sel=0, mul_sel=0):
    input_names = list(input_signals.keys())
    for i in input_names:
        if i == 'OP_SEL':
            input_signals[i].append( op_sel )
            input_signals[i].append( op_sel )
            input_signals[i].append( op_sel )
            input_signals[i].append( op_sel )
        elif i == 'MUL_SEL':
            input_signals[i].append( mul_sel )
            input_signals[i].append( mul_sel )
            input_signals[i].append( mul_sel )
            input_signals[i].append( mul_sel )
        elif i == 'PEC':
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
        else:
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )

def calculate_and_read(input_signals, op_sel=0, mul_sel=0, wl=0, A=0, B=0 ):
    input_names = list(input_signals.keys())
    for i in input_names:
        if i == 'OP_SEL':
            input_signals[i].append( op_sel )
            input_signals[i].append( op_sel )
            input_signals[i].append( op_sel )
            input_signals[i].append( op_sel )
        elif i == 'MUL_SEL':
            input_signals[i].append( mul_sel )
            input_signals[i].append( mul_sel )
            input_signals[i].append( mul_sel )
            input_signals[i].append( mul_sel )
        elif i == 'PEC':
            input_signals[i].append( 0 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
        elif i == 'READ_E':
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
        elif i == 'SAE':
            input_signals[i].append( 1 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            
        elif i == 'WL':
            input_signals[i].append( wl )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
        elif i == 'REG_A_SEL':
            input_signals[i].append( A )
            input_signals[i].append( A )
            input_signals[i].append( A )
            input_signals[i].append( A )
        elif i == 'REG_B_SEL':
            input_signals[i].append( B )
            input_signals[i].append( B )
            input_signals[i].append( B )
            input_signals[i].append( B )
        else:
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )


def calculate_and_write(input_signals, op_sel=0, mul_sel=0, wl=0, din=0, sel=0, col_sel=0 ):
    input_names = list(input_signals.keys())
    for i in input_names:
        if i == 'OP_SEL':
            input_signals[i].append( op_sel )
            input_signals[i].append( op_sel )
            input_signals[i].append( op_sel )
            input_signals[i].append( op_sel )
        elif i == 'MUL_SEL':
            input_signals[i].append( mul_sel )
            input_signals[i].append( mul_sel )
            input_signals[i].append( mul_sel )
            input_signals[i].append( mul_sel )
            
        elif i == 'WL':
            input_signals[i].append( wl )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )

        elif(i == 'WRITE_E'):
            input_signals[i].append( 1 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )

        elif i == 'DIN':
            input_signals[i].append( din )
            input_signals[i].append( din )
            input_signals[i].append( din )
            input_signals[i].append( din )
        elif i == 'WRITE_SEL':
            input_signals[i].append( sel )
            input_signals[i].append( sel )
            input_signals[i].append( sel )
            input_signals[i].append( sel )
        elif i == "COL_SEL":
            input_signals[i].append( col_sel )
            input_signals[i].append( col_sel )
            input_signals[i].append( col_sel )
            input_signals[i].append( col_sel )

        elif i == 'PEC':
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
        else:
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )

def write_and_read(input_signals, wl_wr=0, din=0, sel=0, col_sel=0, wl_rd=0, A=0, B=0):
    input_names = list(input_signals.keys())
    
    for i in input_names:
        if(i == 'WRITE_E'):
            input_signals[i].append( 1 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
        elif i == 'READ_E':
            input_signals[i].append( 0 )
            input_signals[i].append( 1 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )

        elif i == 'WL':
            input_signals[i].append( wl_wr )
            input_signals[i].append( wl_rd )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
        
        elif i == 'DIN':
            input_signals[i].append( din )
            input_signals[i].append( din )
            input_signals[i].append( din )
            input_signals[i].append( din )
        elif i == 'WRITE_SEL':
            input_signals[i].append( sel )
            input_signals[i].append( sel )
            input_signals[i].append( sel )
            input_signals[i].append( sel )
        elif i == "COL_SEL":
            input_signals[i].append( col_sel )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )

        elif i == 'PEC':
            input_signals[i].append( 1 )
            input_signals[i].append( 0 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
        elif i == 'SAE':
            input_signals[i].append( 0 )
            input_signals[i].append( 1 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
        elif i == 'REG_A_SEL':
            input_signals[i].append( A )
            input_signals[i].append( A )
            input_signals[i].append( A )
            input_signals[i].append( A )
        elif i == 'REG_B_SEL':
            input_signals[i].append( B )
            input_signals[i].append( B )
            input_signals[i].append( B )
            input_signals[i].append( B )
        else:
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )

def read_and_write(input_signals, wl_wr=0, din=0, sel=0, col_sel=0, wl_rd=0, A=0, B=0):
    input_names = list(input_signals.keys())
    
    for i in input_names:
        if(i == 'WRITE_E'):
            input_signals[i].append( 0 )
            input_signals[i].append( 1 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
        elif i == 'READ_E':
            input_signals[i].append( 1 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )

        elif i == 'WL':
            input_signals[i].append( wl_rd )
            input_signals[i].append( wl_wr )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
        
        elif i == 'DIN':
            input_signals[i].append( din )
            input_signals[i].append( din )
            input_signals[i].append( din )
            input_signals[i].append( din )
        elif i == 'WRITE_SEL':
            input_signals[i].append( sel )
            input_signals[i].append( sel )
            input_signals[i].append( sel )
            input_signals[i].append( sel )
        elif i == "COL_SEL":
            input_signals[i].append( 0 )
            input_signals[i].append( col_sel )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )

        elif i == 'PEC':
            input_signals[i].append( 0 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
            input_signals[i].append( 1 )
        elif i == 'SAE':
            input_signals[i].append( 1 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
        elif i == 'REG_A_SEL':
            input_signals[i].append( A )
            input_signals[i].append( A )
            input_signals[i].append( A )
            input_signals[i].append( A )
        elif i == 'REG_B_SEL':
            input_signals[i].append( B )
            input_signals[i].append( B )
            input_signals[i].append( B )
            input_signals[i].append( B )
        else:
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )
            input_signals[i].append( 0 )

# def write_and_read(input_signals, wl_wr=0, din=0, sel=0, col_sel=0, wl_rd=0, A=0, B=0):
#     input_names = list(input_signals.keys())
    
#     for i in input_names:
#         if(i == 'WRITE_E'):
#             input_signals[i].append( 0 )
#             input_signals[i].append( 1 )
#         elif i == 'READ_E':
#             input_signals[i].append( 1 )
#             input_signals[i].append( 0 )

#         elif i == 'WL':
#             input_signals[i].append( wl_rd )
#             input_signals[i].append( wl_wr )
        
#         elif i == 'DIN':
#             input_signals[i].append( din )
#             input_signals[i].append( din )
#         elif i == 'WRITE_SEL':
#             input_signals[i].append( sel )
#             input_signals[i].append( sel )
#         elif i == "COL_SEL":
#             input_signals[i].append( col_sel )
#             input_signals[i].append( col_sel )

#         elif i == 'PEC':
#             input_signals[i].append( 0 )
#             input_signals[i].append( 1 )
#         elif i == 'SAE':
#             input_signals[i].append( 1 )
#             input_signals[i].append( 0 )
#         elif i == 'REG_A_SEL':
#             input_signals[i].append( A )
#             input_signals[i].append( A )
#         elif i == 'REG_B_SEL':
#             input_signals[i].append( B )
#             input_signals[i].append( B )
#         else:
#             input_signals[i].append( 0 )
#             input_signals[i].append( 0 )



def alu_add(input_signals, wl_A=9, wl_B=10, wl_WB=9):

    # load A and B
    sram_read(input_signals, wl=wl_A, A=1, B=0)
    sram_read(input_signals, wl=wl_B, A=0, B=1)

    # calculate A + B
    calculate(input_signals, op_sel=0)

    # write back
    sram_write(input_signals, wl=wl_WB, din=0, sel=1, col_sel=3)


def alu_mult(input_signals, wl_A=1, wl_B=5, wl_WB=9, mul_sel=0):

    # load A00 and B00
    sram_read(input_signals, wl=wl_A, A=1, B=0)
    sram_read(input_signals, wl=wl_B, A=0, B=1)

    # calculate A00 * B00
    calculate(input_signals, op_sel=1, mul_sel= mul_sel)

    # write back
    sram_write(input_signals, wl=wl_WB, din=0, sel=1, col_sel=3)

def alu_mult_single_read(input_signals, wl_AB=1, A=0, B=0, wl_WB=9, mul_sel=0):

    sram_read(input_signals, wl=wl_AB, A=A, B=B)
    # calculate A00 * B00
    calculate(input_signals, op_sel=1, mul_sel= mul_sel)

    # write back
    sram_write(input_signals, wl=wl_WB, din=0, sel=1, col_sel=3)


def alu_mult_wo_read(input_signals, wl_WB=9, mul_sel=0):

    # calculate A00 * B00
    calculate(input_signals, op_sel=1, mul_sel= mul_sel)

    # write back
    sram_write(input_signals, wl=wl_WB, din=0, sel=1, col_sel=3)

