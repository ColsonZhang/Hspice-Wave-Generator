.INCLUDE "../../models/45nm/NMOS_VTL.inc"
.INCLUDE "../../models/45nm/PMOS_VTL.inc"

** Library name: Project
** Cell name: basic_inverter
** View name: schematic
.subckt basic_inverter gnd in out vdd
m0 out in gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 out in vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends basic_inverter
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_passgate
** View name: schematic
.subckt basic_passgate en_n en_p gnd in out vdd
m0 in en_p out gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 in en_n out vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends basic_passgate
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_TG_8bit
** View name: schematic
.subckt basic_TG_8bit en_n en_p gnd in<7> in<6> in<5> in<4> in<3> in<2> in<1> in<0> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> vdd
xi7 en_n en_p gnd in<4> out<4> vdd basic_passgate
xi6 en_n en_p gnd in<5> out<5> vdd basic_passgate
xi5 en_n en_p gnd in<6> out<6> vdd basic_passgate
xi4 en_n en_p gnd in<7> out<7> vdd basic_passgate
xi0 en_n en_p gnd in<3> out<3> vdd basic_passgate
xi1 en_n en_p gnd in<2> out<2> vdd basic_passgate
xi2 en_n en_p gnd in<1> out<1> vdd basic_passgate
xi3 en_n en_p gnd in<0> out<0> vdd basic_passgate
.ends basic_TG_8bit
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_mux_8bit
** View name: schematic
.subckt basic_mux_8bit a<7> a<6> a<5> a<4> a<3> a<2> a<1> a<0> b<7> b<6> b<5> b<4> b<3> b<2> b<1> b<0> en_p gnd out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> vdd
xi6 gnd en_p en_n vdd basic_inverter
xi4 en_n en_p gnd b<7> b<6> b<5> b<4> b<3> b<2> b<1> b<0> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> vdd basic_TG_8bit
xi5 en_p en_n gnd a<7> a<6> a<5> a<4> a<3> a<2> a<1> a<0> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> vdd basic_TG_8bit
.ends basic_mux_8bit
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_TG_9bit
** View name: schematic
.subckt basic_TG_9bit en_n en_p gnd in<7> in<6> in<5> in<4> in<3> in<2> in<1> in<0> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> vdd in<8> out<8>
xi8 en_n en_p gnd in<8> out<8> vdd basic_passgate
xi7 en_n en_p gnd in<4> out<4> vdd basic_passgate
xi6 en_n en_p gnd in<5> out<5> vdd basic_passgate
xi5 en_n en_p gnd in<6> out<6> vdd basic_passgate
xi4 en_n en_p gnd in<7> out<7> vdd basic_passgate
xi0 en_n en_p gnd in<3> out<3> vdd basic_passgate
xi1 en_n en_p gnd in<2> out<2> vdd basic_passgate
xi2 en_n en_p gnd in<1> out<1> vdd basic_passgate
xi3 en_n en_p gnd in<0> out<0> vdd basic_passgate
.ends basic_TG_9bit
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_mux_9bit
** View name: schematic
.subckt basic_mux_9bit a<7> a<6> a<5> a<4> a<3> a<2> a<1> a<0> b<7> b<6> b<5> b<4> b<3> b<2> b<1> b<0> en_p gnd out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> vdd a<8> b<8> out<8>
xi6 gnd en_p en_n vdd basic_inverter
xi4 en_n en_p gnd b<7> b<6> b<5> b<4> b<3> b<2> b<1> b<0> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> vdd b<8> out<8> basic_TG_9bit
xi5 en_p en_n gnd a<7> a<6> a<5> a<4> a<3> a<2> a<1> a<0> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> vdd a<8> out<8> basic_TG_9bit
.ends basic_mux_9bit
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_dff_2
** View name: schematic
.subckt basic_dff_2 clk gnd in out vdd
m20 clk_n clk gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m17 clk_p clk_n gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m15 net48 clk_n net50 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m13 net50 out gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m11 net36 clk_p net40 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m9 net40 net45 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m7 out net48 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 net45 net36 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 in clk_n net36 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 net45 clk_p net48 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m19 clk_n clk vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m18 clk_p clk_n vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m16 net48 clk_p net50 vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m14 net50 out vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m12 net36 clk_n net40 vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m10 net40 net45 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m8 out net48 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m5 net45 net36 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m2 in clk_p net36 vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m6 net45 clk_n net48 vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends basic_dff_2
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_dff_array8
** View name: schematic
.subckt basic_dff_array8 clk gnd in<7> in<6> in<5> in<4> in<3> in<2> in<1> in<0> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> vdd
xi0<7> clk gnd in<7> out<7> vdd basic_dff_2
xi0<6> clk gnd in<6> out<6> vdd basic_dff_2
xi0<5> clk gnd in<5> out<5> vdd basic_dff_2
xi0<4> clk gnd in<4> out<4> vdd basic_dff_2
xi0<3> clk gnd in<3> out<3> vdd basic_dff_2
xi0<2> clk gnd in<2> out<2> vdd basic_dff_2
xi0<1> clk gnd in<1> out<1> vdd basic_dff_2
xi0<0> clk gnd in<0> out<0> vdd basic_dff_2
.ends basic_dff_array8
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_and_2in
** View name: schematic
.subckt basic_and_2in a b gnd vdd z
m5 z net02 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=12.6e-15 AS=18.9e-15 PD=280e-9 PS=600e-9
m1 net15 b gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m0 net02 a net15 gnd NMOS_VTL L=50e-9 W=180e-9 AD=12.6e-15 AS=18.9e-15 PD=280e-9 PS=600e-9
m4 z net02 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m3 net02 b vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m2 net02 a vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends basic_and_2in
** End of subcircuit definition.

** Library name: Project
** Cell name: sram_sa
** View name: schematic
.subckt sram_sa bl blb gnd sae vdd
m2 net21 sae gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 bl blb net21 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 blb bl net21 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 bl blb vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m4 blb bl vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends sram_sa
** End of subcircuit definition.

** Library name: Project
** Cell name: sram_precharge
** View name: schematic
.subckt sram_precharge bl blb pre vdd
m2 blb pre bl vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m1 bl pre vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m0 blb pre vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends sram_precharge
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_nor_2in
** View name: schematic
.subckt basic_nor_2in gnd in1 in2 out vdd
m2 out in1 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 out in2 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 out in1 net27 vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m4 net27 in2 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends basic_nor_2in
** End of subcircuit definition.

** Library name: Project
** Cell name: sram_read_driver
** View name: schematic
.subckt sram_read_driver bl blb en gnd out vdd
xi4 gnd out out_n vdd basic_inverter
xi3 gnd out_n out vdd basic_inverter
xi2 gnd net13 net14 vdd basic_inverter
m0 out_n net15 gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m4 out_n net14 vdd vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
xi1 gnd bl en net15 vdd basic_nor_2in
xi0 gnd blb en net13 vdd basic_nor_2in
.ends sram_read_driver
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_inverter_2
** View name: schematic
.subckt basic_inverter_2 gnd in out vdd
m0 out in gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m4 out in vdd vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
.ends basic_inverter_2
** End of subcircuit definition.

** Library name: Project
** Cell name: sram_read_unit
** View name: schematic
.subckt sram_read_unit bl blb dout gnd read_e_b vdd
xi0 bl blb read_e_b gnd net1 vdd sram_read_driver
xi6 gnd net1 dout vdd basic_inverter_2
.ends sram_read_unit
** End of subcircuit definition.

** Library name: Project
** Cell name: sram_write_driver
** View name: schematic
.subckt sram_write_driver bl blb gnd in vdd
m1 bl blb gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 blb in gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 bl blb vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m4 blb in vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends sram_write_driver
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_passgate_2
** View name: schematic
.subckt basic_passgate_2 en_n en_p gnd in out vdd
m0 in en_p out gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m4 in en_n out vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
.ends basic_passgate_2
** End of subcircuit definition.

** Library name: Project
** Cell name: sram_write_unit
** View name: schematic
.subckt sram_write_unit bl blb din gnd vdd wr_en_n wr_en_p
xi0 net7 net2 gnd din vdd sram_write_driver
xi1 wr_en_n wr_en_p gnd net2 blb vdd basic_passgate_2
xi2 wr_en_n wr_en_p gnd net7 bl vdd basic_passgate_2
.ends sram_write_unit
** End of subcircuit definition.

** Library name: Project
** Cell name: sram_bitcell
** View name: schematic
.subckt sram_bitcell bl blb gnd vdd wl
m3 blb wl qb gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 bl wl q gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 q qb gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 qb q gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 q qb vdd vdd PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 qb q vdd vdd PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends sram_bitcell
** End of subcircuit definition.

** Library name: Project
** Cell name: sram_array_10row_1col
** View name: schematic
.subckt sram_array_10row_1col bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl
xi0<9> bl<9> blb<9> gnd vdd wl sram_bitcell
xi0<8> bl<8> blb<8> gnd vdd wl sram_bitcell
xi0<7> bl<7> blb<7> gnd vdd wl sram_bitcell
xi0<6> bl<6> blb<6> gnd vdd wl sram_bitcell
xi0<5> bl<5> blb<5> gnd vdd wl sram_bitcell
xi0<4> bl<4> blb<4> gnd vdd wl sram_bitcell
xi0<3> bl<3> blb<3> gnd vdd wl sram_bitcell
xi0<2> bl<2> blb<2> gnd vdd wl sram_bitcell
xi0<1> bl<1> blb<1> gnd vdd wl sram_bitcell
xi0<0> bl<0> blb<0> gnd vdd wl sram_bitcell
.ends sram_array_10row_1col
** End of subcircuit definition.

** Library name: Project
** Cell name: sram_array_10row_16col
** View name: schematic
.subckt sram_array_10row_16col bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0>
xi0<15> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<15> sram_array_10row_1col
xi0<14> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<14> sram_array_10row_1col
xi0<13> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<13> sram_array_10row_1col
xi0<12> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<12> sram_array_10row_1col
xi0<11> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<11> sram_array_10row_1col
xi0<10> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<10> sram_array_10row_1col
xi0<9> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<9> sram_array_10row_1col
xi0<8> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<8> sram_array_10row_1col
xi0<7> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<7> sram_array_10row_1col
xi0<6> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<6> sram_array_10row_1col
xi0<5> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<5> sram_array_10row_1col
xi0<4> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<4> sram_array_10row_1col
xi0<3> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<3> sram_array_10row_1col
xi0<2> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<2> sram_array_10row_1col
xi0<1> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<1> sram_array_10row_1col
xi0<0> bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<0> sram_array_10row_1col
.ends sram_array_10row_16col
** End of subcircuit definition.

** Library name: Project
** Cell name: sram_subcore
** View name: schematic
.subckt sram_subcore datain<9> datain<8> datain<7> datain<6> datain<5> datain<4> datain<3> datain<2> datain<1> datain<0> dout<9> dout<8> dout<7> dout<6> dout<5> dout<4> dout<3> dout<2> dout<1> dout<0> gnd pre read_e_b sae vdd wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> wr_h_n wr_h_p wr_l_n wr_l_p
xi2<9> bl<9> blb<9> gnd sae vdd sram_sa
xi2<8> bl<8> blb<8> gnd sae vdd sram_sa
xi2<7> bl<7> blb<7> gnd sae vdd sram_sa
xi2<6> bl<6> blb<6> gnd sae vdd sram_sa
xi2<5> bl<5> blb<5> gnd sae vdd sram_sa
xi2<4> bl<4> blb<4> gnd sae vdd sram_sa
xi2<3> bl<3> blb<3> gnd sae vdd sram_sa
xi2<2> bl<2> blb<2> gnd sae vdd sram_sa
xi2<1> bl<1> blb<1> gnd sae vdd sram_sa
xi2<0> bl<0> blb<0> gnd sae vdd sram_sa
xi3<9> bl<9> blb<9> pre vdd sram_precharge
xi3<8> bl<8> blb<8> pre vdd sram_precharge
xi3<7> bl<7> blb<7> pre vdd sram_precharge
xi3<6> bl<6> blb<6> pre vdd sram_precharge
xi3<5> bl<5> blb<5> pre vdd sram_precharge
xi3<4> bl<4> blb<4> pre vdd sram_precharge
xi3<3> bl<3> blb<3> pre vdd sram_precharge
xi3<2> bl<2> blb<2> pre vdd sram_precharge
xi3<1> bl<1> blb<1> pre vdd sram_precharge
xi3<0> bl<0> blb<0> pre vdd sram_precharge
xi10<9> bl<9> blb<9> dout<9> gnd read_e_b vdd sram_read_unit
xi10<8> bl<8> blb<8> dout<8> gnd read_e_b vdd sram_read_unit
xi10<7> bl<7> blb<7> dout<7> gnd read_e_b vdd sram_read_unit
xi10<6> bl<6> blb<6> dout<6> gnd read_e_b vdd sram_read_unit
xi10<5> bl<5> blb<5> dout<5> gnd read_e_b vdd sram_read_unit
xi10<4> bl<4> blb<4> dout<4> gnd read_e_b vdd sram_read_unit
xi10<3> bl<3> blb<3> dout<3> gnd read_e_b vdd sram_read_unit
xi10<2> bl<2> blb<2> dout<2> gnd read_e_b vdd sram_read_unit
xi10<1> bl<1> blb<1> dout<1> gnd read_e_b vdd sram_read_unit
xi10<0> bl<0> blb<0> dout<0> gnd read_e_b vdd sram_read_unit
xi9<9> bl<9> blb<9> datain<9> gnd vdd wr_h_n wr_h_p sram_write_unit
xi9<8> bl<8> blb<8> datain<8> gnd vdd wr_h_n wr_h_p sram_write_unit
xi9<7> bl<7> blb<7> datain<7> gnd vdd wr_h_n wr_h_p sram_write_unit
xi9<6> bl<6> blb<6> datain<6> gnd vdd wr_h_n wr_h_p sram_write_unit
xi9<5> bl<5> blb<5> datain<5> gnd vdd wr_h_n wr_h_p sram_write_unit
xi9<4> bl<4> blb<4> datain<4> gnd vdd wr_h_n wr_h_p sram_write_unit
xi9<3> bl<3> blb<3> datain<3> gnd vdd wr_l_n wr_l_p sram_write_unit
xi9<2> bl<2> blb<2> datain<2> gnd vdd wr_l_n wr_l_p sram_write_unit
xi9<1> bl<1> blb<1> datain<1> gnd vdd wr_l_n wr_l_p sram_write_unit
xi9<0> bl<0> blb<0> datain<0> gnd vdd wr_l_n wr_l_p sram_write_unit
xi0 bl<9> bl<8> bl<7> bl<6> bl<5> bl<4> bl<3> bl<2> bl<1> bl<0> blb<9> blb<8> blb<7> blb<6> blb<5> blb<4> blb<3> blb<2> blb<1> blb<0> gnd vdd wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> sram_array_10row_16col
.ends sram_subcore
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_buffer
** View name: schematic
.subckt basic_buffer gnd in sn sp vdd
m1 sp sn gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 sn in gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 sp sn vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m4 sn in vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends basic_buffer
** End of subcircuit definition.

** Library name: Project
** Cell name: sram_core_3
** View name: schematic
.subckt sram_core_3 col_sel<1> col_sel<0> datain<9> datain<8> datain<7> datain<6> datain<5> datain<4> datain<3> datain<2> datain<1> datain<0> dout<9> dout<8> dout<7> dout<6> dout<5> dout<4> dout<3> dout<2> dout<1> dout<0> gnd pre read_e sae vdd wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> wr_e
xi8 wr_e col_sel<0> gnd vdd wr_l basic_and_2in
xi13 wr_e col_sel<1> gnd vdd wr_h basic_and_2in
xi12 datain<9> datain<8> datain<7> datain<6> datain<5> datain<4> datain<3> datain<2> datain<1> datain<0> dout<9> dout<8> dout<7> dout<6> dout<5> dout<4> dout<3> dout<2> dout<1> dout<0> gnd pre read_e_b sae vdd wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> wr_h_n wr_h_p wr_l_n wr_l_p sram_subcore
xi11 gnd wr_l wr_l_n wr_l_p vdd basic_buffer
xi4 gnd wr_h wr_h_n wr_h_p vdd basic_buffer
xi5 gnd read_e read_e_b vdd basic_inverter
.ends sram_core_3
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_TG_4bit
** View name: schematic
.subckt basic_TG_4bit en_n en_p gnd in<3> in<2> in<1> in<0> out<3> out<2> out<1> out<0> vdd
xi3 en_n en_p gnd in<0> out<0> vdd basic_passgate
xi2 en_n en_p gnd in<1> out<1> vdd basic_passgate
xi1 en_n en_p gnd in<2> out<2> vdd basic_passgate
xi0 en_n en_p gnd in<3> out<3> vdd basic_passgate
.ends basic_TG_4bit
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_dff_array9
** View name: schematic
.subckt basic_dff_array9 clk gnd in<8> in<7> in<6> in<5> in<4> in<3> in<2> in<1> in<0> out<8> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> vdd
xi0<8> clk gnd in<8> out<8> vdd basic_dff_2
xi0<7> clk gnd in<7> out<7> vdd basic_dff_2
xi0<6> clk gnd in<6> out<6> vdd basic_dff_2
xi0<5> clk gnd in<5> out<5> vdd basic_dff_2
xi0<4> clk gnd in<4> out<4> vdd basic_dff_2
xi0<3> clk gnd in<3> out<3> vdd basic_dff_2
xi0<2> clk gnd in<2> out<2> vdd basic_dff_2
xi0<1> clk gnd in<1> out<1> vdd basic_dff_2
xi0<0> clk gnd in<0> out<0> vdd basic_dff_2
.ends basic_dff_array9
** End of subcircuit definition.

** Library name: EE213Lab45nm
** Cell name: full_adder
** View name: schematic
.subckt full_adder aa bb cin cout gnd s vdd
m29 s net35 gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m31 cout net54 gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m23 net34 cin gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m22 net34 aa gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m21 net34 bb gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m20 net35 net54 net34 gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m19 net40 aa gnd gnd NMOS_VTL L=50e-9 W=270e-9 AD=28.35e-15 AS=28.35e-15 PD=480e-9 PS=480e-9 M=1
m18 net39 bb net40 gnd NMOS_VTL L=50e-9 W=270e-9 AD=28.35e-15 AS=28.35e-15 PD=480e-9 PS=480e-9 M=1
m17 net35 cin net39 gnd NMOS_VTL L=50e-9 W=270e-9 AD=28.35e-15 AS=28.35e-15 PD=480e-9 PS=480e-9 M=1
m9 net41 bb gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m8 net54 aa net41 gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m5 net3 bb gnd gnd NMOS_VTL L=50e-9 W=630e-9 AD=66.15e-15 AS=66.15e-15 PD=840e-9 PS=840e-9 M=1
m4 net3 aa gnd gnd NMOS_VTL L=50e-9 W=630e-9 AD=66.15e-15 AS=66.15e-15 PD=840e-9 PS=840e-9 M=1
m1 net54 cin net3 gnd NMOS_VTL L=50e-9 W=630e-9 AD=66.15e-15 AS=66.15e-15 PD=840e-9 PS=840e-9 M=1
m27 s net35 vdd vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
m30 cout net54 vdd vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
m16 net35 cin net38 vdd PMOS_VTL L=50e-9 W=540e-9 AD=56.7e-15 AS=56.7e-15 PD=750e-9 PS=750e-9 M=1
m15 net38 bb net37 vdd PMOS_VTL L=50e-9 W=540e-9 AD=56.7e-15 AS=56.7e-15 PD=750e-9 PS=750e-9 M=1
m14 net37 aa vdd vdd PMOS_VTL L=50e-9 W=540e-9 AD=56.7e-15 AS=56.7e-15 PD=750e-9 PS=750e-9 M=1
m13 net35 net54 net22 vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
m12 net22 cin vdd vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
m11 net22 bb vdd vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
m10 net22 aa vdd vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
m7 net034 bb vdd vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
m6 net54 aa net034 vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
m3 net54 cin net42 vdd PMOS_VTL L=50e-9 W=1.26e-6 AD=132.3e-15 AS=132.3e-15 PD=1.47e-6 PS=1.47e-6 M=1
m0 net42 aa vdd vdd PMOS_VTL L=50e-9 W=1.26e-6 AD=132.3e-15 AS=132.3e-15 PD=1.47e-6 PS=1.47e-6 M=1
m2 net42 bb vdd vdd PMOS_VTL L=50e-9 W=1.26e-6 AD=132.3e-15 AS=132.3e-15 PD=1.47e-6 PS=1.47e-6 M=1
.ends full_adder
** End of subcircuit definition.

** Library name: Project
** Cell name: full_adder_4bit
** View name: schematic
.subckt full_adder_4bit a<3> a<2> a<1> a<0> b<3> b<2> b<1> b<0> cin cout gnd s<3> s<2> s<1> s<0> vdd
xi4 a<0> b<0> cin net8 gnd s<0> vdd full_adder
xi3 a<3> b<3> net6 cout gnd s<3> vdd full_adder
xi2 a<2> b<2> net7 net6 gnd s<2> vdd full_adder
xi1 a<1> b<1> net8 net7 gnd s<1> vdd full_adder
.ends full_adder_4bit
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_TG_5bit
** View name: schematic
.subckt basic_TG_5bit en_n en_p gnd in<3> in<2> in<1> in<0> out<3> out<2> out<1> out<0> vdd in<4> out<4>
xi4 en_n en_p gnd in<4> out<4> vdd basic_passgate
xi3 en_n en_p gnd in<0> out<0> vdd basic_passgate
xi2 en_n en_p gnd in<1> out<1> vdd basic_passgate
xi1 en_n en_p gnd in<2> out<2> vdd basic_passgate
xi0 en_n en_p gnd in<3> out<3> vdd basic_passgate
.ends basic_TG_5bit
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_mux_5bit
** View name: schematic
.subckt basic_mux_5bit a<3> a<2> a<1> a<0> b<3> b<2> b<1> b<0> en_p gnd out<3> out<2> out<1> out<0> vdd a<4> b<4> out<4>
xi6 gnd en_p en_n vdd basic_inverter
xi4 en_n en_p gnd b<3> b<2> b<1> b<0> out<3> out<2> out<1> out<0> vdd b<4> out<4> basic_TG_5bit
xi5 en_p en_n gnd a<3> a<2> a<1> a<0> out<3> out<2> out<1> out<0> vdd a<4> out<4> basic_TG_5bit
.ends basic_mux_5bit
** End of subcircuit definition.

** Library name: EE213Lab45nm
** Cell name: half_adder
** View name: schematic
.subckt half_adder aa bb cout gnd s vdd
m12 s net56 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 net56 bb net63 vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
m4 net63 aa vdd vdd PMOS_VTL L=50e-9 W=360e-9 AD=37.8e-15 AS=37.8e-15 PD=570e-9 PS=570e-9 M=1
m3 net56 net51 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 cout net51 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m7 net51 bb vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m0 net51 aa vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m13 s net56 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m11 net55 bb gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m10 net55 aa gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m6 net56 net51 net55 gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m2 cout net51 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m9 net64 bb gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m8 net51 aa net64 gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends half_adder
** End of subcircuit definition.

** Library name: Project
** Cell name: adder_4bit
** View name: schematic
.subckt adder_4bit a<3> a<2> a<1> a<0> b<3> b<2> b<1> b<0> cout gnd s<3> s<2> s<1> s<0> vdd
xi0 a<0> b<0> net8 gnd s<0> vdd half_adder
xi3 a<3> b<3> net6 cout gnd s<3> vdd full_adder
xi2 a<2> b<2> net7 net6 gnd s<2> vdd full_adder
xi1 a<1> b<1> net8 net7 gnd s<1> vdd full_adder
.ends adder_4bit
** End of subcircuit definition.

** Library name: Project
** Cell name: CSA_8bt_8bit
** View name: schematic
.subckt CSA_8bt_8bit a<7> a<6> a<5> a<4> a<3> a<2> a<1> a<0> b<7> b<6> b<5> b<4> b<3> b<2> b<1> b<0> gnd s<8> s<7> s<6> s<5> s<4> s<3> s<2> s<1> s<0> vdd
xi1 a<7> a<6> a<5> a<4> b<7> b<6> b<5> b<4> vdd s1<8> gnd s1<7> s1<6> s1<5> s1<4> vdd full_adder_4bit
xi0 a<7> a<6> a<5> a<4> b<7> b<6> b<5> b<4> gnd s0<8> gnd s0<7> s0<6> s0<5> s0<4> vdd full_adder_4bit
xi3 s0<7> s0<6> s0<5> s0<4> s1<7> s1<6> s1<5> s1<4> cout gnd s<7> s<6> s<5> s<4> vdd s0<8> s1<8> s<8> basic_mux_5bit
xi2 a<3> a<2> a<1> a<0> b<3> b<2> b<1> b<0> cout gnd s<3> s<2> s<1> s<0> vdd adder_4bit
.ends CSA_8bt_8bit
** End of subcircuit definition.

** Library name: Project
** Cell name: basic_mux_4bit
** View name: schematic
.subckt basic_mux_4bit a<3> a<2> a<1> a<0> b<3> b<2> b<1> b<0> en_p gnd out<3> out<2> out<1> out<0> vdd
xi6 gnd en_p en_n vdd basic_inverter
xi4 en_n en_p gnd b<3> b<2> b<1> b<0> out<3> out<2> out<1> out<0> vdd basic_TG_4bit
xi5 en_p en_n gnd a<3> a<2> a<1> a<0> out<3> out<2> out<1> out<0> vdd basic_TG_4bit
.ends basic_mux_4bit
** End of subcircuit definition.

** Library name: Project
** Cell name: Multiplier_4bit_4bit
** View name: schematic
.subckt Multiplier_4bit_4bit a<3> a<2> a<1> a<0> b<3> b<2> b<1> b<0> gnd p<7> p<6> p<5> p<4> p<3> p<2> p<1> p<0> vdd
xi26 net2 net3 net1 p<7> gnd p<6> vdd full_adder
xi25 net4 net8 net5 net1 gnd p<5> vdd full_adder
xi23 net21 net13 cout10 net12 gnd p<3> vdd full_adder
xi22 net20 net10 cout11 net8 gnd net9 vdd full_adder
xi21 net6 net7 cout12 net3 gnd net4 vdd full_adder
xi19 net26 net17 cout00 cout10 gnd p<2> vdd full_adder
xi18 net22 net14 cout01 cout11 gnd net21 vdd full_adder
xi17 net23 net11 cout02 cout12 gnd net20 vdd full_adder
xi16 a<0> b<3> gnd vdd net13 basic_and_2in
xi15 a<1> b<3> gnd vdd net10 basic_and_2in
xi14 a<2> b<3> gnd vdd net7 basic_and_2in
xi13 a<3> b<3> gnd vdd net2 basic_and_2in
xi12 a<0> b<2> gnd vdd net17 basic_and_2in
xi11 a<1> b<2> gnd vdd net14 basic_and_2in
xi10 a<2> b<2> gnd vdd net11 basic_and_2in
xi9 a<3> b<2> gnd vdd net6 basic_and_2in
xi8 a<0> b<1> gnd vdd net19 basic_and_2in
xi7 a<1> b<1> gnd vdd net18 basic_and_2in
xi6 a<2> b<1> gnd vdd net16 basic_and_2in
xi5 a<3> b<1> gnd vdd net23 basic_and_2in
xi4 a<0> b<0> gnd vdd p<0> basic_and_2in
xi3 a<1> b<0> gnd vdd net24 basic_and_2in
xi2 a<2> b<0> gnd vdd net25 basic_and_2in
xi1 a<3> b<0> gnd vdd net15 basic_and_2in
xi29 net15 net16 cout02 gnd net22 vdd half_adder
xi28 net25 net18 cout01 gnd net26 vdd half_adder
xi27 net24 net19 cout00 gnd p<1> vdd half_adder
xi30 net9 net12 net5 gnd p<4> vdd half_adder
.ends Multiplier_4bit_4bit
** End of subcircuit definition.

** Library name: Project
** Cell name: cpu_core_5
** View name: schematic
.subckt cpu_core_5 clk col_sel<1> col_sel<0> din<3> din<2> din<1> din<0> gnd mul_sel op_sel pec read_e reg_a_sel reg_b_sel sae sram_o<9> sram_o<8> sram_o<7> sram_o<6> sram_o<5> sram_o<4> sram_o<3> sram_o<2> sram_o<1> sram_o<0> vdd wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> write_e write_sel
xi17 a<7> a<6> a<5> a<4> a<3> a<2> a<1> a<0> sram_o<7> sram_o<6> sram_o<5> sram_o<4> sram_o<3> sram_o<2> sram_o<1> sram_o<0> reg_a_sel gnd net07<0> net07<1> net07<2> net07<3> net07<4> net07<5> net07<6> net07<7> vdd basic_mux_8bit
xi18 b<7> b<6> b<5> b<4> b<3> b<2> b<1> b<0> sram_o<7> sram_o<6> sram_o<5> sram_o<4> sram_o<3> sram_o<2> sram_o<1> sram_o<0> reg_b_sel gnd net08<0> net08<1> net08<2> net08<3> net08<4> net08<5> net08<6> net08<7> vdd basic_mux_8bit
xi24 din<3> din<2> din<1> din<0> din<3> din<2> din<1> din<0> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> write_sel gnd sel_in<7> sel_in<6> sel_in<5> sel_in<4> sel_in<3> sel_in<2> sel_in<1> sel_in<0> vdd gnd out<8> sel_in<8> basic_mux_9bit
xi2 s<7> s<6> s<5> s<4> s<3> s<2> s<1> s<0> p<7> p<6> p<5> p<4> p<3> p<2> p<1> p<0> op_sel gnd alu_out<7> alu_out<6> alu_out<5> alu_out<4> alu_out<3> alu_out<2> alu_out<1> alu_out<0> vdd s<8> gnd alu_out<8> basic_mux_9bit
xi20 clk gnd net07<0> net07<1> net07<2> net07<3> net07<4> net07<5> net07<6> net07<7> a<7> a<6> a<5> a<4> a<3> a<2> a<1> a<0> vdd basic_dff_array8
xi22 clk gnd net08<0> net08<1> net08<2> net08<3> net08<4> net08<5> net08<6> net08<7> b<7> b<6> b<5> b<4> b<3> b<2> b<1> b<0> vdd basic_dff_array8
xi23 col_sel<1> col_sel<0> gnd sel_in<8> sel_in<7> sel_in<6> sel_in<5> sel_in<4> sel_in<3> sel_in<2> sel_in<1> sel_in<0> sram_o<9> sram_o<8> sram_o<7> sram_o<6> sram_o<5> sram_o<4> sram_o<3> sram_o<2> sram_o<1> sram_o<0> gnd pec read_e sae vdd wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> write_e sram_core_3
xi11 op_sel nsel_add gnd a<3> a<2> a<1> a<0> out_a<3> out_a<2> out_a<1> out_a<0> vdd basic_TG_4bit
xi14 op_sel nsel_add gnd b<7> b<6> b<5> b<4> out_b<7> out_b<6> out_b<5> out_b<4> vdd basic_TG_4bit
xi13 op_sel nsel_add gnd b<3> b<2> b<1> b<0> out_b<3> out_b<2> out_b<1> out_b<0> vdd basic_TG_4bit
xi12 op_sel nsel_add gnd a<7> a<6> a<5> a<4> out_a<7> out_a<6> out_a<5> out_a<4> vdd basic_TG_4bit
xi6 nsel_mul op_sel gnd net4<0> net4<1> net4<2> net4<3> net3<0> net3<1> net3<2> net3<3> vdd basic_TG_4bit
xi4 nsel_mul op_sel gnd net2<0> net2<1> net2<2> net2<3> net1<0> net1<1> net1<2> net1<3> vdd basic_TG_4bit
xi21 clk gnd alu_out<8> alu_out<7> alu_out<6> alu_out<5> alu_out<4> alu_out<3> alu_out<2> alu_out<1> alu_out<0> out<8> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> vdd basic_dff_array9
xi1 out_a<7> out_a<6> out_a<5> out_a<4> out_a<3> out_a<2> out_a<1> out_a<0> out_b<7> out_b<6> out_b<5> out_b<4> out_b<3> out_b<2> out_b<1> out_b<0> gnd s<8> s<7> s<6> s<5> s<4> s<3> s<2> s<1> s<0> vdd CSA_8bt_8bit
m1<3> net3<0> nsel_mul gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1<2> net3<1> nsel_mul gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1<1> net3<2> nsel_mul gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1<0> net3<3> nsel_mul gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0<3> net1<0> nsel_mul gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0<2> net1<1> nsel_mul gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0<1> net1<2> nsel_mul gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0<0> net1<3> nsel_mul gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
xi9 b<3> b<2> b<1> b<0> b<7> b<6> b<5> b<4> mul_sel gnd net4<0> net4<1> net4<2> net4<3> vdd basic_mux_4bit
xi8 a<3> a<2> a<1> a<0> a<7> a<6> a<5> a<4> mul_sel gnd net2<0> net2<1> net2<2> net2<3> vdd basic_mux_4bit
xi0 net1<0> net1<1> net1<2> net1<3> net3<0> net3<1> net3<2> net3<3> gnd p<7> p<6> p<5> p<4> p<3> p<2> p<1> p<0> vdd Multiplier_4bit_4bit
xi3 gnd op_sel nsel_add vdd basic_inverter
xi10 gnd op_sel nsel_mul vdd basic_inverter
.ends cpu_core_5
** End of subcircuit definition.