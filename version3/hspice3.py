

def step_describe(time, val, voltage=0.7):
    value = val*voltage
    the_str = "{}ns {}v  ".format(time, value)
    return the_str

def fill_describe(the_test_case, voltage=0.7, step=10):
    edge_delay = 0.1 # the falling/rising delay
    the_describe = "0ns 0v  "
    for i in range(len(the_test_case)):
        if i == 0:
            last_i = i
            if the_test_case[0] == 1:
                the_describe = the_describe + step_describe(edge_delay, 1, voltage)
            continue
        if the_test_case[last_i] == the_test_case[i]:
            last_i = i
            continue

        the_describe = the_describe + step_describe( step*i - edge_delay, abs(the_test_case[i]-1), voltage)
        the_describe = the_describe + step_describe( step*i , the_test_case[i], voltage)
        last_i = i

    return the_describe

def fill_describe_pulse(the_test_case, voltage=0.7, step=10, pulse="default", delay=0, width=5):
    edge_delay = 0.1 # the falling/rising delay
    # the_describe = "0ns 0v  "
    # the_describe = ""

    the_judge = 1
    if( pulse == "default") or ( pulse == "postive"):
        the_judge = 1
    else:
        the_judge = 0

    if delay == 0:
        if the_judge == the_test_case[0]:
            the_describe = ""
        else:
            the_describe = "0ns {}v ".format(abs(the_judge-1) * voltage)
    else:
        the_describe = "0ns {}v ".format(abs(the_judge-1) * voltage)
    
    for i in range(len(the_test_case)):
        if the_test_case[i] == the_judge :
            if (i != 0) or (delay !=0) :
                the_describe = the_describe + step_describe( step*i + delay - edge_delay, abs(the_test_case[i]-1), voltage)
            the_describe = the_describe + step_describe( step*i + delay, the_test_case[i], voltage)
            the_describe = the_describe + step_describe( step*i + delay + width - edge_delay, the_test_case[i], voltage)
            the_describe = the_describe + step_describe( step*i + delay + width , abs(the_test_case[i]-1), voltage)

    return the_describe


def vpwl_describe(test_case=[0, 1], voltage=0.7, step=10, index=1, name="signal" ):
    # the pwl template
    template = "V{} {} GND! pwl( {})"

    the_time_descirbe = fill_describe(test_case, voltage=voltage,step=step)
    the_vpwl = template.format(index, name, the_time_descirbe)
    return the_vpwl

def vpwl_describe_pulse(test_case=[0, 1], voltage=0.7, step=10, index=1, name="signal", pulse='postive', delay=0, width=5 ):
    # the pwl template
    template = "V{} {} GND! pwl( {})"

    the_time_descirbe = fill_describe_pulse(test_case, voltage=voltage,step=step, pulse=pulse, delay=delay, width=width)
    the_vpwl = template.format(index, name, the_time_descirbe)
    return the_vpwl


class SIGNAL():
    def __init__(self, index="signal", name="signal"):
        self.index = index
        self.name = name
        self.voltage = 0.8
        # self.step = 10
        self.signals = []
        self.mode = 'default'
        self.source = ""
    
    def updata_signals(self,signals,mode='default', step=10):
        self.signals = signals
        self.mode = mode
        self.step = step

    def updata_pulse(self, pulse='postive', delay=0, width=5):
        self.pulse = pulse 
        self.delay = delay 
        self.width = width 

    def generate_pwl(self):
        the_pwl = ""
        if self.mode == 'default':
            the_pwl = vpwl_describe(test_case=self.signals, voltage=self.voltage, step=self.step, index=self.index, name=self.name )
        elif self.mode == 'pulse':
            the_pwl = vpwl_describe_pulse(test_case=self.signals, voltage=self.voltage, step=self.step, index=self.index, name=self.name, pulse=self.pulse, delay=self.delay, width=self.width )
        self.source = the_pwl


class MULTI_SIGNAL():
    def __init__(self, name="signal", width=1):
        self.name = name
        self.width = width
        # self.step = 10
        self.mode = "default"
        self.signals = []
        self.subsignals = []
        self.instances = []
        self.sources = ""

    def updata_signals(self,signals, mode='default', pulse_en='default', pulse='postive', delay=0, pulse_width=5, step=10):
        self.signals = signals
        self.mode = mode
        self.step = step
        self.pulse_en = pulse_en
        self.pulse = pulse
        self.delay = delay
        self.pulse_width = pulse_width
        self.parse_signals()
        self.generate_instances()

    def parse_signals(self):
        the_subsignals = []
        for i in range(self.width):
            the_subsignals.append([])

        # for the normal signal, like the DIN<3:0>
        # just the binary of the DIN
        if(self.mode == 'default'):
            for s in self.signals:
                for i in range(self.width):
                    the_sig = (s & 1<<i)>>i
                    the_subsignals[i].append(the_sig)

        # for the WL<15:0>
        # 0 : none of wl is sellected
        # 1 : the WL<0>
        # 16: the WL<15>
        elif (self.mode == 'single'):
            for s in self.signals:
                for i in range(self.width):
                    the_sig = 0
                    if (s-1) == i :
                        the_sig =1 
                    the_subsignals[i].append(the_sig)

        self.subsignals = the_subsignals


    def generate_instances(self):
        the_instances = []
        for i in range(self.width):
            the_index = self.name + str(i)
            the_name = "{}<{}>".format(self.name, i)
            the_instance = SIGNAL(index=the_index, name=the_name)
            the_instances.append(the_instance)
        self.instances = the_instances

    def generate_pwl(self):
        the_sources = ""
        for cnt,instance in enumerate(self.instances):
            instance.updata_signals(self.subsignals[cnt], self.pulse_en, self.step)
            instance.updata_pulse(self.pulse, self.delay, self.pulse_width)
            instance.generate_pwl()
            the_sources = the_sources + instance.source + "\n"
        self.sources = the_sources
        


def generate_mult_signal(name, width, signals, mode='default', pulse_en='default', pulse='postive', delay=0, pulse_width=5, step=10):
    the_multsignal = MULTI_SIGNAL( name, width )
    the_multsignal.updata_signals(signals, mode, pulse_en=pulse_en, pulse=pulse, delay=delay, pulse_width=pulse_width, step=step)
    the_multsignal.generate_pwl()
    return the_multsignal.sources


def generate_single_signal(name, index, signals, mode='default', pulse='postive', delay=0, width=5,  step=10):
    the_single_signal = SIGNAL(index, name)
    the_single_signal.updata_signals(signals, mode, step)
    the_single_signal.updata_pulse(pulse, delay, width)
    the_single_signal.generate_pwl()
    return the_single_signal.source



