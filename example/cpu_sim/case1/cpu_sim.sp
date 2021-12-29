** Generated for: hspiceD
** Generated on: Dec 27 02:25:31 2021
** Design library name: Project
** Design cell name: cpu_core_sim6
** Design view name: schematic

.include '../netlist/cpu_core_5.sp'
.include '../source/Vsource3_1.txt'

.PROBE TRAN
+    V(sae)
+    V(pec)
+    I(v1)
+    V(write_e)
+    V(sram_o<8>)
+    V(sram_o<7>)
+    V(sram_o<6>)
+    V(sram_o<5>)
+    V(sram_o<4>)
+    V(sram_o<3>)
+    V(sram_o<2>)
+    V(sram_o<1>)
+    V(sram_o<0>)
+    V(read_e)
+    V(din<3>)
+    V(din<2>)
+    V(din<1>)
+    V(din<0>)
+    V(clk)
.TRAN 10e-12 490e-9 START=0.0

.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
+    HIER_DELIM=0


** Library name: Project
** Cell name: cpu_core_sim6
** View name: schematic
xi7 clk col_sel<1> col_sel<0> din<3> din<2> din<1> din<0> gnd mul_sel op_sel pec read_e reg_a_sel reg_b_sel sae sram_o<9> sram_o<8> sram_o<7> sram_o<6> sram_o<5> sram_o<4> sram_o<3> sram_o<2> sram_o<1> sram_o<0> vdd wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> write_e write_sel cpu_core_5
v1 vdd gnd DC=800e-3
v0 gnd 0 DC=0
c0<9> sram_o<9> gnd 100e-15
c0<8> sram_o<8> gnd 100e-15
c0<7> sram_o<7> gnd 100e-15
c0<6> sram_o<6> gnd 100e-15
c0<5> sram_o<5> gnd 100e-15
c0<4> sram_o<4> gnd 100e-15
c0<3> sram_o<3> gnd 100e-15
c0<2> sram_o<2> gnd 100e-15
c0<1> sram_o<1> gnd 100e-15
c0<0> sram_o<0> gnd 100e-15


.END
