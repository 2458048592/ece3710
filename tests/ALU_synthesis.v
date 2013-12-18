////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.49d
//  \   \         Application: netgen
//  /   /         Filename: ALU_synthesis.v
// /___/   /\     Timestamp: Tue Sep 10 15:10:33 2013
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim ALU.ngc ALU_synthesis.v 
// Device	: xc6slx16-3-csg324
// Input file	: ALU.ngc
// Output file	: C:\Users\Phil\ece3710-16bitALU\netgen\synthesis\ALU_synthesis.v
// # of Modules	: 1
// Design Name	: ALU
// Xilinx        : C:\Xilinx\14.4\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module ALU_syn (
  c, C, L, F, Z, N, a, b, op, y
);
  input c;
  output C;
  output L;
  output F;
  output Z;
  output N;
  input [15 : 0] a;
  input [15 : 0] b;
  input [7 : 0] op;
  output [15 : 0] y;
  wire a_14_IBUF_0;
  wire a_13_IBUF_1;
  wire a_12_IBUF_2;
  wire a_11_IBUF_3;
  wire a_10_IBUF_4;
  wire a_9_IBUF_5;
  wire a_8_IBUF_6;
  wire a_7_IBUF_7;
  wire a_6_IBUF_8;
  wire a_5_IBUF_9;
  wire a_4_IBUF_10;
  wire a_3_IBUF_11;
  wire a_2_IBUF_12;
  wire a_1_IBUF_13;
  wire a_0_IBUF_14;
  wire b_15_IBUF_15;
  wire b_14_IBUF_16;
  wire b_13_IBUF_17;
  wire b_12_IBUF_18;
  wire b_11_IBUF_19;
  wire b_10_IBUF_20;
  wire b_9_IBUF_21;
  wire b_8_IBUF_22;
  wire b_7_IBUF_23;
  wire b_6_IBUF_24;
  wire b_5_IBUF_25;
  wire b_4_IBUF_26;
  wire b_3_IBUF_27;
  wire b_2_IBUF_28;
  wire b_1_IBUF_29;
  wire b_0_IBUF_30;
  wire op_7_IBUF_31;
  wire op_6_IBUF_32;
  wire op_5_IBUF_33;
  wire op_4_IBUF_34;
  wire op_3_IBUF_35;
  wire op_2_IBUF_36;
  wire op_1_IBUF_37;
  wire op_0_IBUF_38;
  wire c_IBUF_39;
  wire \a[15]_b[15]_sub_18_OUT<15> ;
  wire \a[15]_b[15]_sub_18_OUT<14> ;
  wire \a[15]_b[15]_sub_18_OUT<13> ;
  wire \a[15]_b[15]_sub_18_OUT<12> ;
  wire \a[15]_b[15]_sub_18_OUT<11> ;
  wire \a[15]_b[15]_sub_18_OUT<10> ;
  wire \a[15]_b[15]_sub_18_OUT<9> ;
  wire \a[15]_b[15]_sub_18_OUT<8> ;
  wire \a[15]_b[15]_sub_18_OUT<7> ;
  wire \a[15]_b[15]_sub_18_OUT<6> ;
  wire \a[15]_b[15]_sub_18_OUT<5> ;
  wire \a[15]_b[15]_sub_18_OUT<4> ;
  wire \a[15]_b[15]_sub_18_OUT<3> ;
  wire \a[15]_b[15]_sub_18_OUT<2> ;
  wire \a[15]_b[15]_sub_18_OUT<1> ;
  wire \a[15]_b[15]_sub_18_OUT<0> ;
  wire \a[15]_b[15]_sub_18_OUT<16> ;
  wire \a[15]_b[15]_add_0_OUT<15> ;
  wire \a[15]_b[15]_add_0_OUT<14> ;
  wire \a[15]_b[15]_add_0_OUT<13> ;
  wire \a[15]_b[15]_add_0_OUT<12> ;
  wire \a[15]_b[15]_add_0_OUT<11> ;
  wire \a[15]_b[15]_add_0_OUT<10> ;
  wire \a[15]_b[15]_add_0_OUT<9> ;
  wire \a[15]_b[15]_add_0_OUT<8> ;
  wire \a[15]_b[15]_add_0_OUT<7> ;
  wire \a[15]_b[15]_add_0_OUT<6> ;
  wire \a[15]_b[15]_add_0_OUT<5> ;
  wire \a[15]_b[15]_add_0_OUT<4> ;
  wire \a[15]_b[15]_add_0_OUT<3> ;
  wire \a[15]_b[15]_add_0_OUT<2> ;
  wire \a[15]_b[15]_add_0_OUT<1> ;
  wire \a[15]_b[15]_add_0_OUT<0> ;
  wire \a[15]_b[15]_add_0_OUT<16> ;
  wire y_15_OBUF_123;
  wire y_14_OBUF_124;
  wire y_13_OBUF_125;
  wire y_12_OBUF_126;
  wire y_11_OBUF_127;
  wire y_10_OBUF_128;
  wire y_9_OBUF_129;
  wire y_8_OBUF_130;
  wire y_7_OBUF_131;
  wire y_6_OBUF_132;
  wire y_5_OBUF_133;
  wire y_4_OBUF_134;
  wire y_3_OBUF_135;
  wire y_2_OBUF_136;
  wire y_1_OBUF_137;
  wire y_0_OBUF_138;
  wire L_OBUF_139;
  wire _n0168;
  wire \op[7]_PWR_1_o_equal_60_o ;
  wire \op[7]_PWR_1_o_equal_62_o ;
  wire \op[7]_PWR_1_o_equal_63_o ;
  wire \op[7]_PWR_1_o_equal_64_o ;
  wire \op[7]_PWR_1_o_equal_65_o ;
  wire \op[7]_GND_1_o_equal_46_o ;
  wire \op[7]_GND_1_o_equal_59_o ;
  wire \op[7]_GND_1_o_equal_47_o ;
  wire \op[7]_GND_1_o_equal_57_o ;
  wire \op[7]_GND_1_o_equal_58_o ;
  wire \op[7]_GND_1_o_equal_56_o ;
  wire _n0173_152;
  wire _n0196_153;
  wire _n0188_154;
  wire N_OBUF_155;
  wire F_OBUF_156;
  wire \op[7]_reduce_or_72_o ;
  wire C_OBUF_158;
  wire Z_OBUF_159;
  wire N0;
  wire N1;
  wire Sh4;
  wire Sh5;
  wire Sh6;
  wire Sh7;
  wire Sh10;
  wire Sh11;
  wire Sh12;
  wire Sh13;
  wire Sh15;
  wire Sh33;
  wire Sh34;
  wire Sh35;
  wire Sh72;
  wire Sh73;
  wire Sh77;
  wire Sh79;
  wire Sh100;
  wire Sh101;
  wire Sh102;
  wire Sh103;
  wire Sh104;
  wire Sh105;
  wire Sh106;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi_215 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lut<0>_216 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_cy<0>_217 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi1_218 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lut<1>_219 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_cy<1>_220 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi2_221 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lut<2>_222 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_cy<2>_223 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi3_224 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lut<3>_225 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_cy<3>_226 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi4_227 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lut<4>_228 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_cy<4>_229 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi5_230 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lut<5>_231 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_cy<5>_232 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi6_233 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_lut<6>_234 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_cy<6>_235 ;
  wire \Mcompar_a[15]_b[15]_LessThan_34_o_cy<7>_236 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<0>_237 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<0>_238 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<1>_239 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<1>_240 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<2>_241 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<2>_242 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<3>_243 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<3>_244 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<4>_245 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<4>_246 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<5>_247 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<5>_248 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<6>_249 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<6>_250 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<7>_251 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<7>_252 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<8>_253 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<8>_254 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<9>_255 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<9>_256 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<10>_257 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<10>_258 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<11>_259 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<11>_260 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<12>_261 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<12>_262 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<13>_263 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<13>_264 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<14>_265 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<14>_266 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_lut<15>_267 ;
  wire \Msub_a[15]_b[15]_sub_18_OUT_cy<15>_268 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<0>_269 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<0>_270 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<1>_271 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<1>_272 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<2>_273 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<2>_274 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<3>_275 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<3>_276 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<4>_277 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<4>_278 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<5>_279 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<5>_280 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<6>_281 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<6>_282 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<7>_283 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<7>_284 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<8>_285 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<8>_286 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<9>_287 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<9>_288 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<10>_289 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<10>_290 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<11>_291 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<11>_292 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<12>_293 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<12>_294 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<13>_295 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<13>_296 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<14>_297 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<14>_298 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<15>_299 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_cy<15>_300 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi_365 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lut<0>_366 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_cy<0>_367 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi1_368 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lut<1>_369 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_cy<1>_370 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi2_371 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lut<2>_372 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_cy<2>_373 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi3_374 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lut<3>_375 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_cy<3>_376 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi4_377 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lut<4>_378 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_cy<4>_379 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi5_380 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lut<5>_381 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_cy<5>_382 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi6_383 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_lut<6>_384 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_cy<6>_385 ;
  wire \Mcompar_b[15]_a[15]_LessThan_28_o_cy<7>_386 ;
  wire \y<14>1_387 ;
  wire Mmux__n0172151;
  wire \y<14>2_389 ;
  wire _n01731;
  wire \op[7]_PWR_1_o_equal_60_o<7>1_391 ;
  wire Sh127;
  wire Sh210;
  wire Sh1101;
  wire Sh631_395;
  wire Sh1071;
  wire Sh1231;
  wire Sh1241;
  wire Sh1091;
  wire Sh129;
  wire Sh36;
  wire Sh1092;
  wire \op[7]_PWR_1_o_equal_61_o<7>1 ;
  wire _n01882;
  wire \y<12>1_405 ;
  wire \y<14>4 ;
  wire \y<1>2_407 ;
  wire \y<6>2_408 ;
  wire \y<7>3_409 ;
  wire \y<5>3_410 ;
  wire \y<1>3 ;
  wire \y<2>2 ;
  wire \y<15>4_413 ;
  wire \y<1>5 ;
  wire N8;
  wire out;
  wire out1_417;
  wire Mmux_Z1;
  wire Mmux_Z11_419;
  wire Mmux_Z12_420;
  wire Mmux_Z13_421;
  wire Mmux_Z14_422;
  wire Mmux_Z15_423;
  wire Mmux_Z16_424;
  wire N10;
  wire N12;
  wire F3_427;
  wire F4_428;
  wire F5_429;
  wire F6_430;
  wire F7_431;
  wire F8_432;
  wire \y<3>3 ;
  wire \y<3>5_434 ;
  wire \y<3>6_435 ;
  wire \y<3>7_436 ;
  wire \y<3>8_437 ;
  wire \y<3>9 ;
  wire \y<3>11_439 ;
  wire \y<3>12_440 ;
  wire \y<3>13_441 ;
  wire \y<4>4_442 ;
  wire \y<4>5_443 ;
  wire \y<4>8_444 ;
  wire \y<4>9_445 ;
  wire \y<11>2_446 ;
  wire \y<11>5_447 ;
  wire \y<11>6_448 ;
  wire \y<11>8_449 ;
  wire \y<11>9_450 ;
  wire \y<7>1_451 ;
  wire \y<7>2_452 ;
  wire \y<7>4 ;
  wire \y<7>7_454 ;
  wire \y<7>8 ;
  wire \y<7>11_456 ;
  wire \y<12>2 ;
  wire \y<12>4_458 ;
  wire \y<12>5_459 ;
  wire \y<12>6 ;
  wire \y<12>10 ;
  wire \y<5>2_462 ;
  wire \y<5>4 ;
  wire \y<5>6_464 ;
  wire \y<5>7 ;
  wire \y<5>9_466 ;
  wire \y<5>10_467 ;
  wire \y<5>11 ;
  wire \y<1>1_469 ;
  wire \y<1>4_470 ;
  wire \y<1>6 ;
  wire \y<1>10 ;
  wire \y<1>11_473 ;
  wire \y<2>1_474 ;
  wire \y<2>3_475 ;
  wire \y<2>4_476 ;
  wire \y<2>8_477 ;
  wire \y<2>9_478 ;
  wire N14;
  wire \y<15>1_480 ;
  wire \y<15>2_481 ;
  wire \y<15>3_482 ;
  wire \y<15>5_483 ;
  wire \y<15>6_484 ;
  wire \y<15>7_485 ;
  wire \y<15>8_486 ;
  wire \y<15>9_487 ;
  wire \y<9>1_488 ;
  wire \y<9>2_489 ;
  wire \y<9>3_490 ;
  wire \y<9>4_491 ;
  wire \y<9>7_492 ;
  wire \y<9>8_493 ;
  wire \y<10>1_494 ;
  wire \y<10>2_495 ;
  wire \y<10>3_496 ;
  wire \y<10>4_497 ;
  wire \y<10>7_498 ;
  wire \y<10>8_499 ;
  wire N16;
  wire \y<14>3 ;
  wire \y<14>7_502 ;
  wire \y<14>9_503 ;
  wire \y<14>10_504 ;
  wire \y<14>11_505 ;
  wire \y<14>12 ;
  wire \y<6>4_507 ;
  wire \y<6>9_508 ;
  wire \y<6>12_509 ;
  wire N18;
  wire N20;
  wire N22;
  wire \y<13>1_513 ;
  wire \y<13>2_514 ;
  wire \y<13>3_515 ;
  wire \y<13>4_516 ;
  wire \y<13>7_517 ;
  wire \y<13>11_518 ;
  wire \y<13>12_519 ;
  wire \y<2>21_520 ;
  wire \y<2>22_521 ;
  wire \y<2>23 ;
  wire N24;
  wire \y<0>1_524 ;
  wire \y<0>2_525 ;
  wire \y<0>6_526 ;
  wire \y<0>8_527 ;
  wire \y<0>9_528 ;
  wire \y<0>10_529 ;
  wire \y<0>11_530 ;
  wire \y<8>3_531 ;
  wire \y<8>4_532 ;
  wire \y<8>5_533 ;
  wire \y<8>6_534 ;
  wire \y<8>7_535 ;
  wire \y<8>8_536 ;
  wire \y<8>9_537 ;
  wire N26;
  wire \y<1>33_539 ;
  wire \Madd_a[15]_b[15]_add_0_OUT_lut<15>1_602 ;
  wire \Msub__n0139_lut<15>1_603 ;
  wire \Msub__n0139_lut<15>2_604 ;
  wire \Madd_GND_1_o_c_add_12_OUT_xor<16>_rt_605 ;
  wire N28;
  wire N30;
  wire N32;
  wire N34;
  wire N36;
  wire N38;
  wire N40;
  wire N42;
  wire N44;
  wire N46;
  wire N48;
  wire N50;
  wire N52;
  wire N54;
  wire N56;
  wire N58;
  wire N60;
  wire N62;
  wire N64;
  wire N66;
  wire N68;
  wire N70;
  wire N72;
  wire N74;
  wire N76;
  wire N78;
  wire N80;
  wire N82;
  wire N83;
  wire N84;
  wire N85;
  wire N86;
  wire N87;
  wire N88;
  wire N89;
  wire [15 : 0] _n0139;
  wire [16 : 0] GND_1_o_c_add_12_OUT;
  wire [15 : 0] n0125;
  wire [14 : 0] Msub__n0139_lut;
  wire [14 : 0] Msub__n0139_cy;
  wire [15 : 0] Madd_GND_1_o_c_add_12_OUT_lut;
  wire [15 : 0] Madd_GND_1_o_c_add_12_OUT_cy;
  wire [15 : 0] Madd_n0125_lut;
  wire [15 : 0] Madd_n0125_cy;
  VCC   XST_VCC (
    .P(N0)
  );
  GND   XST_GND (
    .G(N1)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<0>  (
    .I0(a_0_IBUF_14),
    .I1(b_0_IBUF_30),
    .O(Msub__n0139_lut[0])
  );
  MUXCY   \Msub__n0139_cy<0>  (
    .CI(N0),
    .DI(a_0_IBUF_14),
    .S(Msub__n0139_lut[0]),
    .O(Msub__n0139_cy[0])
  );
  XORCY   \Msub__n0139_xor<0>  (
    .CI(N0),
    .LI(Msub__n0139_lut[0]),
    .O(_n0139[15])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<1>  (
    .I0(a_1_IBUF_13),
    .I1(b_1_IBUF_29),
    .O(Msub__n0139_lut[1])
  );
  MUXCY   \Msub__n0139_cy<1>  (
    .CI(Msub__n0139_cy[0]),
    .DI(a_1_IBUF_13),
    .S(Msub__n0139_lut[1]),
    .O(Msub__n0139_cy[1])
  );
  XORCY   \Msub__n0139_xor<1>  (
    .CI(Msub__n0139_cy[0]),
    .LI(Msub__n0139_lut[1]),
    .O(_n0139[14])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<2>  (
    .I0(a_2_IBUF_12),
    .I1(b_2_IBUF_28),
    .O(Msub__n0139_lut[2])
  );
  MUXCY   \Msub__n0139_cy<2>  (
    .CI(Msub__n0139_cy[1]),
    .DI(a_2_IBUF_12),
    .S(Msub__n0139_lut[2]),
    .O(Msub__n0139_cy[2])
  );
  XORCY   \Msub__n0139_xor<2>  (
    .CI(Msub__n0139_cy[1]),
    .LI(Msub__n0139_lut[2]),
    .O(_n0139[13])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<3>  (
    .I0(a_3_IBUF_11),
    .I1(b_3_IBUF_27),
    .O(Msub__n0139_lut[3])
  );
  MUXCY   \Msub__n0139_cy<3>  (
    .CI(Msub__n0139_cy[2]),
    .DI(a_3_IBUF_11),
    .S(Msub__n0139_lut[3]),
    .O(Msub__n0139_cy[3])
  );
  XORCY   \Msub__n0139_xor<3>  (
    .CI(Msub__n0139_cy[2]),
    .LI(Msub__n0139_lut[3]),
    .O(_n0139[12])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<4>  (
    .I0(a_4_IBUF_10),
    .I1(b_4_IBUF_26),
    .O(Msub__n0139_lut[4])
  );
  MUXCY   \Msub__n0139_cy<4>  (
    .CI(Msub__n0139_cy[3]),
    .DI(a_4_IBUF_10),
    .S(Msub__n0139_lut[4]),
    .O(Msub__n0139_cy[4])
  );
  XORCY   \Msub__n0139_xor<4>  (
    .CI(Msub__n0139_cy[3]),
    .LI(Msub__n0139_lut[4]),
    .O(_n0139[11])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<5>  (
    .I0(a_5_IBUF_9),
    .I1(b_5_IBUF_25),
    .O(Msub__n0139_lut[5])
  );
  MUXCY   \Msub__n0139_cy<5>  (
    .CI(Msub__n0139_cy[4]),
    .DI(a_5_IBUF_9),
    .S(Msub__n0139_lut[5]),
    .O(Msub__n0139_cy[5])
  );
  XORCY   \Msub__n0139_xor<5>  (
    .CI(Msub__n0139_cy[4]),
    .LI(Msub__n0139_lut[5]),
    .O(_n0139[10])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<6>  (
    .I0(a_6_IBUF_8),
    .I1(b_6_IBUF_24),
    .O(Msub__n0139_lut[6])
  );
  MUXCY   \Msub__n0139_cy<6>  (
    .CI(Msub__n0139_cy[5]),
    .DI(a_6_IBUF_8),
    .S(Msub__n0139_lut[6]),
    .O(Msub__n0139_cy[6])
  );
  XORCY   \Msub__n0139_xor<6>  (
    .CI(Msub__n0139_cy[5]),
    .LI(Msub__n0139_lut[6]),
    .O(_n0139[9])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<7>  (
    .I0(a_7_IBUF_7),
    .I1(b_7_IBUF_23),
    .O(Msub__n0139_lut[7])
  );
  MUXCY   \Msub__n0139_cy<7>  (
    .CI(Msub__n0139_cy[6]),
    .DI(a_7_IBUF_7),
    .S(Msub__n0139_lut[7]),
    .O(Msub__n0139_cy[7])
  );
  XORCY   \Msub__n0139_xor<7>  (
    .CI(Msub__n0139_cy[6]),
    .LI(Msub__n0139_lut[7]),
    .O(_n0139[8])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<8>  (
    .I0(a_8_IBUF_6),
    .I1(b_8_IBUF_22),
    .O(Msub__n0139_lut[8])
  );
  MUXCY   \Msub__n0139_cy<8>  (
    .CI(Msub__n0139_cy[7]),
    .DI(a_8_IBUF_6),
    .S(Msub__n0139_lut[8]),
    .O(Msub__n0139_cy[8])
  );
  XORCY   \Msub__n0139_xor<8>  (
    .CI(Msub__n0139_cy[7]),
    .LI(Msub__n0139_lut[8]),
    .O(_n0139[7])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<9>  (
    .I0(a_9_IBUF_5),
    .I1(b_9_IBUF_21),
    .O(Msub__n0139_lut[9])
  );
  MUXCY   \Msub__n0139_cy<9>  (
    .CI(Msub__n0139_cy[8]),
    .DI(a_9_IBUF_5),
    .S(Msub__n0139_lut[9]),
    .O(Msub__n0139_cy[9])
  );
  XORCY   \Msub__n0139_xor<9>  (
    .CI(Msub__n0139_cy[8]),
    .LI(Msub__n0139_lut[9]),
    .O(_n0139[6])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<10>  (
    .I0(a_10_IBUF_4),
    .I1(b_10_IBUF_20),
    .O(Msub__n0139_lut[10])
  );
  MUXCY   \Msub__n0139_cy<10>  (
    .CI(Msub__n0139_cy[9]),
    .DI(a_10_IBUF_4),
    .S(Msub__n0139_lut[10]),
    .O(Msub__n0139_cy[10])
  );
  XORCY   \Msub__n0139_xor<10>  (
    .CI(Msub__n0139_cy[9]),
    .LI(Msub__n0139_lut[10]),
    .O(_n0139[5])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<11>  (
    .I0(a_11_IBUF_3),
    .I1(b_11_IBUF_19),
    .O(Msub__n0139_lut[11])
  );
  MUXCY   \Msub__n0139_cy<11>  (
    .CI(Msub__n0139_cy[10]),
    .DI(a_11_IBUF_3),
    .S(Msub__n0139_lut[11]),
    .O(Msub__n0139_cy[11])
  );
  XORCY   \Msub__n0139_xor<11>  (
    .CI(Msub__n0139_cy[10]),
    .LI(Msub__n0139_lut[11]),
    .O(_n0139[4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<12>  (
    .I0(a_12_IBUF_2),
    .I1(b_12_IBUF_18),
    .O(Msub__n0139_lut[12])
  );
  MUXCY   \Msub__n0139_cy<12>  (
    .CI(Msub__n0139_cy[11]),
    .DI(a_12_IBUF_2),
    .S(Msub__n0139_lut[12]),
    .O(Msub__n0139_cy[12])
  );
  XORCY   \Msub__n0139_xor<12>  (
    .CI(Msub__n0139_cy[11]),
    .LI(Msub__n0139_lut[12]),
    .O(_n0139[3])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<13>  (
    .I0(a_13_IBUF_1),
    .I1(b_13_IBUF_17),
    .O(Msub__n0139_lut[13])
  );
  MUXCY   \Msub__n0139_cy<13>  (
    .CI(Msub__n0139_cy[12]),
    .DI(a_13_IBUF_1),
    .S(Msub__n0139_lut[13]),
    .O(Msub__n0139_cy[13])
  );
  XORCY   \Msub__n0139_xor<13>  (
    .CI(Msub__n0139_cy[12]),
    .LI(Msub__n0139_lut[13]),
    .O(_n0139[2])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<14>  (
    .I0(a_14_IBUF_0),
    .I1(b_14_IBUF_16),
    .O(Msub__n0139_lut[14])
  );
  MUXCY   \Msub__n0139_cy<14>  (
    .CI(Msub__n0139_cy[13]),
    .DI(a_14_IBUF_0),
    .S(Msub__n0139_lut[14]),
    .O(Msub__n0139_cy[14])
  );
  XORCY   \Msub__n0139_xor<14>  (
    .CI(Msub__n0139_cy[13]),
    .LI(Msub__n0139_lut[14]),
    .O(_n0139[1])
  );
  XORCY   \Msub__n0139_xor<15>  (
    .CI(Msub__n0139_cy[14]),
    .LI(\Msub__n0139_lut<15>1_603 ),
    .O(_n0139[0])
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi  (
    .I0(a_1_IBUF_13),
    .I1(a_0_IBUF_14),
    .I2(b_0_IBUF_30),
    .I3(b_1_IBUF_29),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi_215 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lut<0>  (
    .I0(b_0_IBUF_30),
    .I1(a_0_IBUF_14),
    .I2(b_1_IBUF_29),
    .I3(a_1_IBUF_13),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<0>_216 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_34_o_cy<0>  (
    .CI(N0),
    .DI(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi_215 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<0>_216 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<0>_217 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi1  (
    .I0(a_3_IBUF_11),
    .I1(a_2_IBUF_12),
    .I2(b_2_IBUF_28),
    .I3(b_3_IBUF_27),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi1_218 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lut<1>  (
    .I0(b_2_IBUF_28),
    .I1(a_2_IBUF_12),
    .I2(b_3_IBUF_27),
    .I3(a_3_IBUF_11),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<1>_219 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_34_o_cy<1>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<0>_217 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi1_218 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<1>_219 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<1>_220 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi2  (
    .I0(a_5_IBUF_9),
    .I1(a_4_IBUF_10),
    .I2(b_4_IBUF_26),
    .I3(b_5_IBUF_25),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi2_221 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lut<2>  (
    .I0(b_4_IBUF_26),
    .I1(a_4_IBUF_10),
    .I2(b_5_IBUF_25),
    .I3(a_5_IBUF_9),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<2>_222 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_34_o_cy<2>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<1>_220 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi2_221 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<2>_222 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<2>_223 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi3  (
    .I0(a_7_IBUF_7),
    .I1(a_6_IBUF_8),
    .I2(b_6_IBUF_24),
    .I3(b_7_IBUF_23),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi3_224 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lut<3>  (
    .I0(b_6_IBUF_24),
    .I1(a_6_IBUF_8),
    .I2(b_7_IBUF_23),
    .I3(a_7_IBUF_7),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<3>_225 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_34_o_cy<3>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<2>_223 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi3_224 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<3>_225 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<3>_226 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi4  (
    .I0(a_9_IBUF_5),
    .I1(a_8_IBUF_6),
    .I2(b_8_IBUF_22),
    .I3(b_9_IBUF_21),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi4_227 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lut<4>  (
    .I0(b_8_IBUF_22),
    .I1(a_8_IBUF_6),
    .I2(b_9_IBUF_21),
    .I3(a_9_IBUF_5),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<4>_228 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_34_o_cy<4>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<3>_226 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi4_227 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<4>_228 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<4>_229 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi5  (
    .I0(a_11_IBUF_3),
    .I1(a_10_IBUF_4),
    .I2(b_10_IBUF_20),
    .I3(b_11_IBUF_19),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi5_230 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lut<5>  (
    .I0(b_10_IBUF_20),
    .I1(a_10_IBUF_4),
    .I2(b_11_IBUF_19),
    .I3(a_11_IBUF_3),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<5>_231 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_34_o_cy<5>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<4>_229 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi5_230 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<5>_231 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<5>_232 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lutdi6  (
    .I0(a_13_IBUF_1),
    .I1(a_12_IBUF_2),
    .I2(b_12_IBUF_18),
    .I3(b_13_IBUF_17),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi6_233 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_lut<6>  (
    .I0(b_12_IBUF_18),
    .I1(a_12_IBUF_2),
    .I2(b_13_IBUF_17),
    .I3(a_13_IBUF_1),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<6>_234 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_34_o_cy<6>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<5>_232 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_34_o_lutdi6_233 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_34_o_lut<6>_234 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<6>_235 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<0>  (
    .I0(a_0_IBUF_14),
    .I1(b_0_IBUF_30),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<0>_237 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<0>  (
    .CI(N0),
    .DI(a_0_IBUF_14),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<0>_237 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<0>_238 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<0>  (
    .CI(N0),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<0>_237 ),
    .O(\a[15]_b[15]_sub_18_OUT<0> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<1>  (
    .I0(a_1_IBUF_13),
    .I1(b_1_IBUF_29),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<1>_239 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<1>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<0>_238 ),
    .DI(a_1_IBUF_13),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<1>_239 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<1>_240 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<1>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<0>_238 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<1>_239 ),
    .O(\a[15]_b[15]_sub_18_OUT<1> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<2>  (
    .I0(a_2_IBUF_12),
    .I1(b_2_IBUF_28),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<2>_241 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<2>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<1>_240 ),
    .DI(a_2_IBUF_12),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<2>_241 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<2>_242 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<2>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<1>_240 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<2>_241 ),
    .O(\a[15]_b[15]_sub_18_OUT<2> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<3>  (
    .I0(a_3_IBUF_11),
    .I1(b_3_IBUF_27),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<3>_243 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<3>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<2>_242 ),
    .DI(a_3_IBUF_11),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<3>_243 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<3>_244 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<3>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<2>_242 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<3>_243 ),
    .O(\a[15]_b[15]_sub_18_OUT<3> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<4>  (
    .I0(a_4_IBUF_10),
    .I1(b_4_IBUF_26),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<4>_245 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<4>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<3>_244 ),
    .DI(a_4_IBUF_10),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<4>_245 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<4>_246 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<4>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<3>_244 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<4>_245 ),
    .O(\a[15]_b[15]_sub_18_OUT<4> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<5>  (
    .I0(a_5_IBUF_9),
    .I1(b_5_IBUF_25),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<5>_247 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<5>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<4>_246 ),
    .DI(a_5_IBUF_9),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<5>_247 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<5>_248 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<5>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<4>_246 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<5>_247 ),
    .O(\a[15]_b[15]_sub_18_OUT<5> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<6>  (
    .I0(a_6_IBUF_8),
    .I1(b_6_IBUF_24),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<6>_249 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<6>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<5>_248 ),
    .DI(a_6_IBUF_8),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<6>_249 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<6>_250 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<6>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<5>_248 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<6>_249 ),
    .O(\a[15]_b[15]_sub_18_OUT<6> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<7>  (
    .I0(a_7_IBUF_7),
    .I1(b_7_IBUF_23),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<7>_251 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<7>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<6>_250 ),
    .DI(a_7_IBUF_7),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<7>_251 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<7>_252 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<7>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<6>_250 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<7>_251 ),
    .O(\a[15]_b[15]_sub_18_OUT<7> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<8>  (
    .I0(a_8_IBUF_6),
    .I1(b_8_IBUF_22),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<8>_253 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<8>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<7>_252 ),
    .DI(a_8_IBUF_6),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<8>_253 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<8>_254 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<8>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<7>_252 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<8>_253 ),
    .O(\a[15]_b[15]_sub_18_OUT<8> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<9>  (
    .I0(a_9_IBUF_5),
    .I1(b_9_IBUF_21),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<9>_255 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<9>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<8>_254 ),
    .DI(a_9_IBUF_5),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<9>_255 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<9>_256 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<9>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<8>_254 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<9>_255 ),
    .O(\a[15]_b[15]_sub_18_OUT<9> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<10>  (
    .I0(a_10_IBUF_4),
    .I1(b_10_IBUF_20),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<10>_257 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<10>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<9>_256 ),
    .DI(a_10_IBUF_4),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<10>_257 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<10>_258 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<10>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<9>_256 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<10>_257 ),
    .O(\a[15]_b[15]_sub_18_OUT<10> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<11>  (
    .I0(a_11_IBUF_3),
    .I1(b_11_IBUF_19),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<11>_259 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<11>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<10>_258 ),
    .DI(a_11_IBUF_3),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<11>_259 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<11>_260 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<11>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<10>_258 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<11>_259 ),
    .O(\a[15]_b[15]_sub_18_OUT<11> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<12>  (
    .I0(a_12_IBUF_2),
    .I1(b_12_IBUF_18),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<12>_261 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<12>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<11>_260 ),
    .DI(a_12_IBUF_2),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<12>_261 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<12>_262 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<12>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<11>_260 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<12>_261 ),
    .O(\a[15]_b[15]_sub_18_OUT<12> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<13>  (
    .I0(a_13_IBUF_1),
    .I1(b_13_IBUF_17),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<13>_263 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<13>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<12>_262 ),
    .DI(a_13_IBUF_1),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<13>_263 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<13>_264 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<13>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<12>_262 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<13>_263 ),
    .O(\a[15]_b[15]_sub_18_OUT<13> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<14>  (
    .I0(a_14_IBUF_0),
    .I1(b_14_IBUF_16),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<14>_265 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<14>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<13>_264 ),
    .DI(a_14_IBUF_0),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<14>_265 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<14>_266 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<14>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<13>_264 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<14>_265 ),
    .O(\a[15]_b[15]_sub_18_OUT<14> )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_a[15]_b[15]_sub_18_OUT_lut<15>  (
    .I0(Sh79),
    .I1(b_15_IBUF_15),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_lut<15>_267 )
  );
  MUXCY   \Msub_a[15]_b[15]_sub_18_OUT_cy<15>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<14>_266 ),
    .DI(Sh79),
    .S(\Msub_a[15]_b[15]_sub_18_OUT_lut<15>_267 ),
    .O(\Msub_a[15]_b[15]_sub_18_OUT_cy<15>_268 )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<15>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<14>_266 ),
    .LI(\Msub_a[15]_b[15]_sub_18_OUT_lut<15>_267 ),
    .O(\a[15]_b[15]_sub_18_OUT<15> )
  );
  XORCY   \Msub_a[15]_b[15]_sub_18_OUT_xor<16>  (
    .CI(\Msub_a[15]_b[15]_sub_18_OUT_cy<15>_268 ),
    .LI(\Msub__n0139_lut<15>2_604 ),
    .O(\a[15]_b[15]_sub_18_OUT<16> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<0>  (
    .I0(a_0_IBUF_14),
    .I1(b_0_IBUF_30),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<0>_269 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<0>  (
    .CI(N1),
    .DI(a_0_IBUF_14),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<0>_269 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<0>_270 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<0>  (
    .CI(N1),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<0>_269 ),
    .O(\a[15]_b[15]_add_0_OUT<0> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<1>  (
    .I0(a_1_IBUF_13),
    .I1(b_1_IBUF_29),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<1>_271 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<1>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<0>_270 ),
    .DI(a_1_IBUF_13),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<1>_271 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<1>_272 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<1>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<0>_270 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<1>_271 ),
    .O(\a[15]_b[15]_add_0_OUT<1> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<2>  (
    .I0(a_2_IBUF_12),
    .I1(b_2_IBUF_28),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<2>_273 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<2>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<1>_272 ),
    .DI(a_2_IBUF_12),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<2>_273 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<2>_274 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<2>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<1>_272 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<2>_273 ),
    .O(\a[15]_b[15]_add_0_OUT<2> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<3>  (
    .I0(a_3_IBUF_11),
    .I1(b_3_IBUF_27),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<3>_275 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<3>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<2>_274 ),
    .DI(a_3_IBUF_11),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<3>_275 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<3>_276 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<3>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<2>_274 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<3>_275 ),
    .O(\a[15]_b[15]_add_0_OUT<3> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<4>  (
    .I0(a_4_IBUF_10),
    .I1(b_4_IBUF_26),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<4>_277 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<4>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<3>_276 ),
    .DI(a_4_IBUF_10),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<4>_277 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<4>_278 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<4>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<3>_276 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<4>_277 ),
    .O(\a[15]_b[15]_add_0_OUT<4> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<5>  (
    .I0(a_5_IBUF_9),
    .I1(b_5_IBUF_25),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<5>_279 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<5>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<4>_278 ),
    .DI(a_5_IBUF_9),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<5>_279 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<5>_280 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<5>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<4>_278 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<5>_279 ),
    .O(\a[15]_b[15]_add_0_OUT<5> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<6>  (
    .I0(a_6_IBUF_8),
    .I1(b_6_IBUF_24),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<6>_281 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<6>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<5>_280 ),
    .DI(a_6_IBUF_8),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<6>_281 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<6>_282 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<6>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<5>_280 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<6>_281 ),
    .O(\a[15]_b[15]_add_0_OUT<6> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<7>  (
    .I0(a_7_IBUF_7),
    .I1(b_7_IBUF_23),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<7>_283 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<7>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<6>_282 ),
    .DI(a_7_IBUF_7),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<7>_283 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<7>_284 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<7>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<6>_282 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<7>_283 ),
    .O(\a[15]_b[15]_add_0_OUT<7> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<8>  (
    .I0(a_8_IBUF_6),
    .I1(b_8_IBUF_22),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<8>_285 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<8>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<7>_284 ),
    .DI(a_8_IBUF_6),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<8>_285 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<8>_286 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<8>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<7>_284 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<8>_285 ),
    .O(\a[15]_b[15]_add_0_OUT<8> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<9>  (
    .I0(a_9_IBUF_5),
    .I1(b_9_IBUF_21),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<9>_287 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<9>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<8>_286 ),
    .DI(a_9_IBUF_5),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<9>_287 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<9>_288 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<9>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<8>_286 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<9>_287 ),
    .O(\a[15]_b[15]_add_0_OUT<9> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<10>  (
    .I0(a_10_IBUF_4),
    .I1(b_10_IBUF_20),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<10>_289 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<10>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<9>_288 ),
    .DI(a_10_IBUF_4),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<10>_289 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<10>_290 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<10>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<9>_288 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<10>_289 ),
    .O(\a[15]_b[15]_add_0_OUT<10> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<11>  (
    .I0(a_11_IBUF_3),
    .I1(b_11_IBUF_19),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<11>_291 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<11>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<10>_290 ),
    .DI(a_11_IBUF_3),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<11>_291 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<11>_292 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<11>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<10>_290 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<11>_291 ),
    .O(\a[15]_b[15]_add_0_OUT<11> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<12>  (
    .I0(a_12_IBUF_2),
    .I1(b_12_IBUF_18),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<12>_293 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<12>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<11>_292 ),
    .DI(a_12_IBUF_2),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<12>_293 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<12>_294 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<12>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<11>_292 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<12>_293 ),
    .O(\a[15]_b[15]_add_0_OUT<12> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<13>  (
    .I0(a_13_IBUF_1),
    .I1(b_13_IBUF_17),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<13>_295 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<13>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<12>_294 ),
    .DI(a_13_IBUF_1),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<13>_295 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<13>_296 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<13>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<12>_294 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<13>_295 ),
    .O(\a[15]_b[15]_add_0_OUT<13> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<14>  (
    .I0(a_14_IBUF_0),
    .I1(b_14_IBUF_16),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<14>_297 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<14>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<13>_296 ),
    .DI(a_14_IBUF_0),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<14>_297 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<14>_298 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<14>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<13>_296 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<14>_297 ),
    .O(\a[15]_b[15]_add_0_OUT<14> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<15>  (
    .I0(Sh79),
    .I1(b_15_IBUF_15),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<15>_299 )
  );
  MUXCY   \Madd_a[15]_b[15]_add_0_OUT_cy<15>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<14>_298 ),
    .DI(Sh79),
    .S(\Madd_a[15]_b[15]_add_0_OUT_lut<15>1_602 ),
    .O(\Madd_a[15]_b[15]_add_0_OUT_cy<15>_300 )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<15>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<14>_298 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<15>1_602 ),
    .O(\a[15]_b[15]_add_0_OUT<15> )
  );
  XORCY   \Madd_a[15]_b[15]_add_0_OUT_xor<16>  (
    .CI(\Madd_a[15]_b[15]_add_0_OUT_cy<15>_300 ),
    .LI(\Madd_a[15]_b[15]_add_0_OUT_lut<15>_299 ),
    .O(\a[15]_b[15]_add_0_OUT<16> )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<0>  (
    .I0(b_0_IBUF_30),
    .I1(a_0_IBUF_14),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[0])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<0>  (
    .CI(N1),
    .DI(b_0_IBUF_30),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[0]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[0])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<0>  (
    .CI(N1),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[0]),
    .O(GND_1_o_c_add_12_OUT[0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<1>  (
    .I0(b_1_IBUF_29),
    .I1(a_1_IBUF_13),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[1])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<1>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[0]),
    .DI(b_1_IBUF_29),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[1]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[1])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<1>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[0]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[1]),
    .O(GND_1_o_c_add_12_OUT[1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<2>  (
    .I0(b_2_IBUF_28),
    .I1(a_2_IBUF_12),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[2])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<2>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[1]),
    .DI(b_2_IBUF_28),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[2]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[2])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<2>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[1]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[2]),
    .O(GND_1_o_c_add_12_OUT[2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<3>  (
    .I0(b_3_IBUF_27),
    .I1(a_3_IBUF_11),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[3])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<3>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[2]),
    .DI(b_3_IBUF_27),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[3]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[3])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<3>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[2]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[3]),
    .O(GND_1_o_c_add_12_OUT[3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<4>  (
    .I0(b_4_IBUF_26),
    .I1(a_4_IBUF_10),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[4])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<4>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[3]),
    .DI(b_4_IBUF_26),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[4]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[4])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<4>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[3]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[4]),
    .O(GND_1_o_c_add_12_OUT[4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<5>  (
    .I0(b_5_IBUF_25),
    .I1(a_5_IBUF_9),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[5])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<5>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[4]),
    .DI(b_5_IBUF_25),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[5]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[5])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<5>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[4]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[5]),
    .O(GND_1_o_c_add_12_OUT[5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<6>  (
    .I0(b_6_IBUF_24),
    .I1(a_6_IBUF_8),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[6])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<6>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[5]),
    .DI(b_6_IBUF_24),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[6]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[6])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<6>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[5]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[6]),
    .O(GND_1_o_c_add_12_OUT[6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<7>  (
    .I0(b_7_IBUF_23),
    .I1(a_7_IBUF_7),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[7])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<7>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[6]),
    .DI(b_7_IBUF_23),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[7]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[7])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<7>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[6]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[7]),
    .O(GND_1_o_c_add_12_OUT[7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<8>  (
    .I0(b_8_IBUF_22),
    .I1(a_8_IBUF_6),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[8])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<8>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[7]),
    .DI(b_8_IBUF_22),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[8]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[8])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<8>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[7]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[8]),
    .O(GND_1_o_c_add_12_OUT[8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<9>  (
    .I0(b_9_IBUF_21),
    .I1(a_9_IBUF_5),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[9])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<9>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[8]),
    .DI(b_9_IBUF_21),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[9]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[9])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<9>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[8]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[9]),
    .O(GND_1_o_c_add_12_OUT[9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<10>  (
    .I0(b_10_IBUF_20),
    .I1(a_10_IBUF_4),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[10])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<10>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[9]),
    .DI(b_10_IBUF_20),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[10]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[10])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<10>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[9]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[10]),
    .O(GND_1_o_c_add_12_OUT[10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<11>  (
    .I0(b_11_IBUF_19),
    .I1(a_11_IBUF_3),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[11])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<11>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[10]),
    .DI(b_11_IBUF_19),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[11]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[11])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<11>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[10]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[11]),
    .O(GND_1_o_c_add_12_OUT[11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<12>  (
    .I0(b_12_IBUF_18),
    .I1(a_12_IBUF_2),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[12])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<12>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[11]),
    .DI(b_12_IBUF_18),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[12]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[12])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<12>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[11]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[12]),
    .O(GND_1_o_c_add_12_OUT[12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<13>  (
    .I0(b_13_IBUF_17),
    .I1(a_13_IBUF_1),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[13])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<13>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[12]),
    .DI(b_13_IBUF_17),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[13]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[13])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<13>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[12]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[13]),
    .O(GND_1_o_c_add_12_OUT[13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<14>  (
    .I0(b_14_IBUF_16),
    .I1(a_14_IBUF_0),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[14])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<14>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[13]),
    .DI(b_14_IBUF_16),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[14]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[14])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<14>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[13]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[14]),
    .O(GND_1_o_c_add_12_OUT[14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_GND_1_o_c_add_12_OUT_lut<15>  (
    .I0(b_15_IBUF_15),
    .I1(Sh79),
    .O(Madd_GND_1_o_c_add_12_OUT_lut[15])
  );
  MUXCY   \Madd_GND_1_o_c_add_12_OUT_cy<15>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[14]),
    .DI(b_15_IBUF_15),
    .S(Madd_GND_1_o_c_add_12_OUT_lut[15]),
    .O(Madd_GND_1_o_c_add_12_OUT_cy[15])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<15>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[14]),
    .LI(Madd_GND_1_o_c_add_12_OUT_lut[15]),
    .O(GND_1_o_c_add_12_OUT[15])
  );
  XORCY   \Madd_GND_1_o_c_add_12_OUT_xor<16>  (
    .CI(Madd_GND_1_o_c_add_12_OUT_cy[15]),
    .LI(\Madd_GND_1_o_c_add_12_OUT_xor<16>_rt_605 ),
    .O(GND_1_o_c_add_12_OUT[16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<0>  (
    .I0(a_0_IBUF_14),
    .I1(b_0_IBUF_30),
    .O(Madd_n0125_lut[0])
  );
  MUXCY   \Madd_n0125_cy<0>  (
    .CI(N1),
    .DI(a_0_IBUF_14),
    .S(Madd_n0125_lut[0]),
    .O(Madd_n0125_cy[0])
  );
  XORCY   \Madd_n0125_xor<0>  (
    .CI(N1),
    .LI(Madd_n0125_lut[0]),
    .O(n0125[0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<1>  (
    .I0(a_1_IBUF_13),
    .I1(b_1_IBUF_29),
    .O(Madd_n0125_lut[1])
  );
  MUXCY   \Madd_n0125_cy<1>  (
    .CI(Madd_n0125_cy[0]),
    .DI(a_1_IBUF_13),
    .S(Madd_n0125_lut[1]),
    .O(Madd_n0125_cy[1])
  );
  XORCY   \Madd_n0125_xor<1>  (
    .CI(Madd_n0125_cy[0]),
    .LI(Madd_n0125_lut[1]),
    .O(n0125[1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<2>  (
    .I0(a_2_IBUF_12),
    .I1(b_2_IBUF_28),
    .O(Madd_n0125_lut[2])
  );
  MUXCY   \Madd_n0125_cy<2>  (
    .CI(Madd_n0125_cy[1]),
    .DI(a_2_IBUF_12),
    .S(Madd_n0125_lut[2]),
    .O(Madd_n0125_cy[2])
  );
  XORCY   \Madd_n0125_xor<2>  (
    .CI(Madd_n0125_cy[1]),
    .LI(Madd_n0125_lut[2]),
    .O(n0125[2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<3>  (
    .I0(a_3_IBUF_11),
    .I1(b_3_IBUF_27),
    .O(Madd_n0125_lut[3])
  );
  MUXCY   \Madd_n0125_cy<3>  (
    .CI(Madd_n0125_cy[2]),
    .DI(a_3_IBUF_11),
    .S(Madd_n0125_lut[3]),
    .O(Madd_n0125_cy[3])
  );
  XORCY   \Madd_n0125_xor<3>  (
    .CI(Madd_n0125_cy[2]),
    .LI(Madd_n0125_lut[3]),
    .O(n0125[3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<4>  (
    .I0(a_4_IBUF_10),
    .I1(b_4_IBUF_26),
    .O(Madd_n0125_lut[4])
  );
  MUXCY   \Madd_n0125_cy<4>  (
    .CI(Madd_n0125_cy[3]),
    .DI(a_4_IBUF_10),
    .S(Madd_n0125_lut[4]),
    .O(Madd_n0125_cy[4])
  );
  XORCY   \Madd_n0125_xor<4>  (
    .CI(Madd_n0125_cy[3]),
    .LI(Madd_n0125_lut[4]),
    .O(n0125[4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<5>  (
    .I0(a_5_IBUF_9),
    .I1(b_5_IBUF_25),
    .O(Madd_n0125_lut[5])
  );
  MUXCY   \Madd_n0125_cy<5>  (
    .CI(Madd_n0125_cy[4]),
    .DI(a_5_IBUF_9),
    .S(Madd_n0125_lut[5]),
    .O(Madd_n0125_cy[5])
  );
  XORCY   \Madd_n0125_xor<5>  (
    .CI(Madd_n0125_cy[4]),
    .LI(Madd_n0125_lut[5]),
    .O(n0125[5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<6>  (
    .I0(a_6_IBUF_8),
    .I1(b_6_IBUF_24),
    .O(Madd_n0125_lut[6])
  );
  MUXCY   \Madd_n0125_cy<6>  (
    .CI(Madd_n0125_cy[5]),
    .DI(a_6_IBUF_8),
    .S(Madd_n0125_lut[6]),
    .O(Madd_n0125_cy[6])
  );
  XORCY   \Madd_n0125_xor<6>  (
    .CI(Madd_n0125_cy[5]),
    .LI(Madd_n0125_lut[6]),
    .O(n0125[6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<7>  (
    .I0(a_7_IBUF_7),
    .I1(b_7_IBUF_23),
    .O(Madd_n0125_lut[7])
  );
  MUXCY   \Madd_n0125_cy<7>  (
    .CI(Madd_n0125_cy[6]),
    .DI(a_7_IBUF_7),
    .S(Madd_n0125_lut[7]),
    .O(Madd_n0125_cy[7])
  );
  XORCY   \Madd_n0125_xor<7>  (
    .CI(Madd_n0125_cy[6]),
    .LI(Madd_n0125_lut[7]),
    .O(n0125[7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<8>  (
    .I0(a_8_IBUF_6),
    .I1(b_8_IBUF_22),
    .O(Madd_n0125_lut[8])
  );
  MUXCY   \Madd_n0125_cy<8>  (
    .CI(Madd_n0125_cy[7]),
    .DI(a_8_IBUF_6),
    .S(Madd_n0125_lut[8]),
    .O(Madd_n0125_cy[8])
  );
  XORCY   \Madd_n0125_xor<8>  (
    .CI(Madd_n0125_cy[7]),
    .LI(Madd_n0125_lut[8]),
    .O(n0125[8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<9>  (
    .I0(a_9_IBUF_5),
    .I1(b_9_IBUF_21),
    .O(Madd_n0125_lut[9])
  );
  MUXCY   \Madd_n0125_cy<9>  (
    .CI(Madd_n0125_cy[8]),
    .DI(a_9_IBUF_5),
    .S(Madd_n0125_lut[9]),
    .O(Madd_n0125_cy[9])
  );
  XORCY   \Madd_n0125_xor<9>  (
    .CI(Madd_n0125_cy[8]),
    .LI(Madd_n0125_lut[9]),
    .O(n0125[9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<10>  (
    .I0(a_10_IBUF_4),
    .I1(b_10_IBUF_20),
    .O(Madd_n0125_lut[10])
  );
  MUXCY   \Madd_n0125_cy<10>  (
    .CI(Madd_n0125_cy[9]),
    .DI(a_10_IBUF_4),
    .S(Madd_n0125_lut[10]),
    .O(Madd_n0125_cy[10])
  );
  XORCY   \Madd_n0125_xor<10>  (
    .CI(Madd_n0125_cy[9]),
    .LI(Madd_n0125_lut[10]),
    .O(n0125[10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<11>  (
    .I0(a_11_IBUF_3),
    .I1(b_11_IBUF_19),
    .O(Madd_n0125_lut[11])
  );
  MUXCY   \Madd_n0125_cy<11>  (
    .CI(Madd_n0125_cy[10]),
    .DI(a_11_IBUF_3),
    .S(Madd_n0125_lut[11]),
    .O(Madd_n0125_cy[11])
  );
  XORCY   \Madd_n0125_xor<11>  (
    .CI(Madd_n0125_cy[10]),
    .LI(Madd_n0125_lut[11]),
    .O(n0125[11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<12>  (
    .I0(a_12_IBUF_2),
    .I1(b_12_IBUF_18),
    .O(Madd_n0125_lut[12])
  );
  MUXCY   \Madd_n0125_cy<12>  (
    .CI(Madd_n0125_cy[11]),
    .DI(a_12_IBUF_2),
    .S(Madd_n0125_lut[12]),
    .O(Madd_n0125_cy[12])
  );
  XORCY   \Madd_n0125_xor<12>  (
    .CI(Madd_n0125_cy[11]),
    .LI(Madd_n0125_lut[12]),
    .O(n0125[12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<13>  (
    .I0(a_13_IBUF_1),
    .I1(b_13_IBUF_17),
    .O(Madd_n0125_lut[13])
  );
  MUXCY   \Madd_n0125_cy<13>  (
    .CI(Madd_n0125_cy[12]),
    .DI(a_13_IBUF_1),
    .S(Madd_n0125_lut[13]),
    .O(Madd_n0125_cy[13])
  );
  XORCY   \Madd_n0125_xor<13>  (
    .CI(Madd_n0125_cy[12]),
    .LI(Madd_n0125_lut[13]),
    .O(n0125[13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<14>  (
    .I0(a_14_IBUF_0),
    .I1(b_14_IBUF_16),
    .O(Madd_n0125_lut[14])
  );
  MUXCY   \Madd_n0125_cy<14>  (
    .CI(Madd_n0125_cy[13]),
    .DI(a_14_IBUF_0),
    .S(Madd_n0125_lut[14]),
    .O(Madd_n0125_cy[14])
  );
  XORCY   \Madd_n0125_xor<14>  (
    .CI(Madd_n0125_cy[13]),
    .LI(Madd_n0125_lut[14]),
    .O(n0125[14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0125_lut<15>  (
    .I0(Sh79),
    .I1(b_15_IBUF_15),
    .O(Madd_n0125_lut[15])
  );
  MUXCY   \Madd_n0125_cy<15>  (
    .CI(Madd_n0125_cy[14]),
    .DI(Sh79),
    .S(Madd_n0125_lut[15]),
    .O(Madd_n0125_cy[15])
  );
  XORCY   \Madd_n0125_xor<15>  (
    .CI(Madd_n0125_cy[14]),
    .LI(Madd_n0125_lut[15]),
    .O(n0125[15])
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi  (
    .I0(a_1_IBUF_13),
    .I1(a_0_IBUF_14),
    .I2(b_0_IBUF_30),
    .I3(b_1_IBUF_29),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi_365 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lut<0>  (
    .I0(b_0_IBUF_30),
    .I1(a_0_IBUF_14),
    .I2(b_1_IBUF_29),
    .I3(a_1_IBUF_13),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<0>_366 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_28_o_cy<0>  (
    .CI(N0),
    .DI(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi_365 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<0>_366 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<0>_367 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi1  (
    .I0(a_3_IBUF_11),
    .I1(a_2_IBUF_12),
    .I2(b_2_IBUF_28),
    .I3(b_3_IBUF_27),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi1_368 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lut<1>  (
    .I0(b_2_IBUF_28),
    .I1(a_2_IBUF_12),
    .I2(b_3_IBUF_27),
    .I3(a_3_IBUF_11),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<1>_369 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_28_o_cy<1>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<0>_367 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi1_368 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<1>_369 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<1>_370 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi2  (
    .I0(a_5_IBUF_9),
    .I1(a_4_IBUF_10),
    .I2(b_4_IBUF_26),
    .I3(b_5_IBUF_25),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi2_371 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lut<2>  (
    .I0(b_4_IBUF_26),
    .I1(a_4_IBUF_10),
    .I2(b_5_IBUF_25),
    .I3(a_5_IBUF_9),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<2>_372 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_28_o_cy<2>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<1>_370 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi2_371 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<2>_372 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<2>_373 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi3  (
    .I0(a_7_IBUF_7),
    .I1(a_6_IBUF_8),
    .I2(b_6_IBUF_24),
    .I3(b_7_IBUF_23),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi3_374 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lut<3>  (
    .I0(b_6_IBUF_24),
    .I1(a_6_IBUF_8),
    .I2(b_7_IBUF_23),
    .I3(a_7_IBUF_7),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<3>_375 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_28_o_cy<3>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<2>_373 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi3_374 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<3>_375 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<3>_376 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi4  (
    .I0(a_9_IBUF_5),
    .I1(a_8_IBUF_6),
    .I2(b_8_IBUF_22),
    .I3(b_9_IBUF_21),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi4_377 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lut<4>  (
    .I0(b_8_IBUF_22),
    .I1(a_8_IBUF_6),
    .I2(b_9_IBUF_21),
    .I3(a_9_IBUF_5),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<4>_378 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_28_o_cy<4>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<3>_376 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi4_377 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<4>_378 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<4>_379 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi5  (
    .I0(a_11_IBUF_3),
    .I1(a_10_IBUF_4),
    .I2(b_10_IBUF_20),
    .I3(b_11_IBUF_19),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi5_380 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lut<5>  (
    .I0(b_10_IBUF_20),
    .I1(a_10_IBUF_4),
    .I2(b_11_IBUF_19),
    .I3(a_11_IBUF_3),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<5>_381 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_28_o_cy<5>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<4>_379 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi5_380 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<5>_381 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<5>_382 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lutdi6  (
    .I0(a_13_IBUF_1),
    .I1(a_12_IBUF_2),
    .I2(b_12_IBUF_18),
    .I3(b_13_IBUF_17),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi6_383 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_lut<6>  (
    .I0(b_12_IBUF_18),
    .I1(a_12_IBUF_2),
    .I2(b_13_IBUF_17),
    .I3(a_13_IBUF_1),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<6>_384 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_28_o_cy<6>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<5>_382 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_28_o_lutdi6_383 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_28_o_lut<6>_384 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<6>_385 )
  );
  LUT4 #(
    .INIT ( 16'h0040 ))
  \op[7]_GND_1_o_equal_46_o<7>1  (
    .I0(op_7_IBUF_31),
    .I1(op_6_IBUF_32),
    .I2(op_5_IBUF_33),
    .I3(op_4_IBUF_34),
    .O(\op[7]_GND_1_o_equal_46_o )
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  Sh151 (
    .I0(b_1_IBUF_29),
    .I1(b_0_IBUF_30),
    .I2(Sh79),
    .O(Sh15)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux__n01721511 (
    .I0(b_2_IBUF_28),
    .I1(Sh72),
    .I2(Sh12),
    .O(Mmux__n0172151)
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \op[7]_PWR_1_o_equal_60_o<7>11  (
    .I0(op_7_IBUF_31),
    .I1(op_1_IBUF_37),
    .I2(op_2_IBUF_36),
    .O(\op[7]_PWR_1_o_equal_60_o<7>1_391 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Sh1271 (
    .I0(b_1_IBUF_29),
    .I1(a_1_IBUF_13),
    .I2(a_3_IBUF_11),
    .O(Sh127)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Sh2101 (
    .I0(b_1_IBUF_29),
    .I1(a_3_IBUF_11),
    .I2(a_5_IBUF_9),
    .O(Sh210)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Sh11011 (
    .I0(b_1_IBUF_29),
    .I1(a_14_IBUF_0),
    .I2(a_12_IBUF_2),
    .O(Sh1101)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Sh10711 (
    .I0(b_1_IBUF_29),
    .I1(a_11_IBUF_3),
    .I2(a_9_IBUF_5),
    .O(Sh1071)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Sh10911 (
    .I0(b_1_IBUF_29),
    .I1(a_12_IBUF_2),
    .I2(a_10_IBUF_4),
    .O(Sh1091)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Sh1291 (
    .I0(b_1_IBUF_29),
    .I1(a_2_IBUF_12),
    .I2(a_4_IBUF_10),
    .O(Sh129)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Sh361 (
    .I0(b_1_IBUF_29),
    .I1(a_4_IBUF_10),
    .I2(a_6_IBUF_8),
    .O(Sh36)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Sh10921 (
    .I0(b_1_IBUF_29),
    .I1(a_13_IBUF_1),
    .I2(a_11_IBUF_3),
    .O(Sh1092)
  );
  LUT4 #(
    .INIT ( 16'h0040 ))
  \op[7]_PWR_1_o_equal_61_o<7>11  (
    .I0(op_1_IBUF_37),
    .I1(_n01731),
    .I2(op_7_IBUF_31),
    .I3(op_2_IBUF_36),
    .O(\op[7]_PWR_1_o_equal_61_o<7>1 )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  _n018821 (
    .I0(op_6_IBUF_32),
    .I1(op_7_IBUF_31),
    .I2(op_4_IBUF_34),
    .O(_n01882)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \y<15>41  (
    .I0(_n0188_154),
    .I1(\a[15]_b[15]_add_0_OUT<15> ),
    .I2(_n0196_153),
    .I3(\a[15]_b[15]_sub_18_OUT<15> ),
    .O(\y<15>4_413 )
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  \y<1>51  (
    .I0(b_2_IBUF_28),
    .I1(b_3_IBUF_27),
    .I2(\y<14>1_387 ),
    .O(\y<1>5 )
  );
  LUT5 #(
    .INIT ( 32'h00004000 ))
  Mmux_L11 (
    .I0(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<7>_236 ),
    .I1(op_6_IBUF_32),
    .I2(op_7_IBUF_31),
    .I3(op_5_IBUF_33),
    .I4(op_4_IBUF_34),
    .O(L_OBUF_139)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  _n017311 (
    .I0(op_3_IBUF_35),
    .I1(op_6_IBUF_32),
    .I2(op_4_IBUF_34),
    .I3(op_5_IBUF_33),
    .O(_n01731)
  );
  LUT5 #(
    .INIT ( 32'h00100000 ))
  \op[7]_GND_1_o_equal_57_o<7>1  (
    .I0(op_2_IBUF_36),
    .I1(op_7_IBUF_31),
    .I2(op_1_IBUF_37),
    .I3(op_0_IBUF_38),
    .I4(_n01731),
    .O(\op[7]_GND_1_o_equal_57_o )
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  Sh341 (
    .I0(b_1_IBUF_29),
    .I1(b_0_IBUF_30),
    .I2(a_1_IBUF_13),
    .I3(a_2_IBUF_12),
    .I4(a_0_IBUF_14),
    .O(Sh34)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh1001 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_3_IBUF_11),
    .I3(a_1_IBUF_13),
    .I4(a_2_IBUF_12),
    .I5(a_4_IBUF_10),
    .O(Sh100)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh107 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_11_IBUF_3),
    .I3(a_13_IBUF_1),
    .I4(a_12_IBUF_2),
    .I5(a_10_IBUF_4),
    .O(Sh10)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh1011 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_4_IBUF_10),
    .I3(a_2_IBUF_12),
    .I4(a_3_IBUF_11),
    .I5(a_5_IBUF_9),
    .O(Sh101)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh1021 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_5_IBUF_9),
    .I3(a_3_IBUF_11),
    .I4(a_4_IBUF_10),
    .I5(a_6_IBUF_8),
    .O(Sh102)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  Sh331 (
    .I0(b_1_IBUF_29),
    .I1(b_0_IBUF_30),
    .I2(a_1_IBUF_13),
    .I3(a_0_IBUF_14),
    .O(Sh33)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh351 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_2_IBUF_12),
    .I3(a_0_IBUF_14),
    .I4(a_1_IBUF_13),
    .I5(a_3_IBUF_11),
    .O(Sh35)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh731 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_10_IBUF_4),
    .I3(a_12_IBUF_2),
    .I4(a_11_IBUF_3),
    .I5(a_9_IBUF_5),
    .O(Sh73)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh721 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_9_IBUF_5),
    .I3(a_11_IBUF_3),
    .I4(a_10_IBUF_4),
    .I5(a_8_IBUF_6),
    .O(Sh72)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh1031 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_6_IBUF_8),
    .I3(a_4_IBUF_10),
    .I4(a_5_IBUF_9),
    .I5(a_7_IBUF_7),
    .O(Sh103)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh1041 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_7_IBUF_7),
    .I3(a_5_IBUF_9),
    .I4(a_6_IBUF_8),
    .I5(a_8_IBUF_6),
    .O(Sh104)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh1051 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_8_IBUF_6),
    .I3(a_6_IBUF_8),
    .I4(a_7_IBUF_7),
    .I5(a_9_IBUF_5),
    .O(Sh105)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh1061 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_9_IBUF_5),
    .I3(a_7_IBUF_7),
    .I4(a_8_IBUF_6),
    .I5(a_10_IBUF_4),
    .O(Sh106)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh51 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_6_IBUF_8),
    .I3(a_8_IBUF_6),
    .I4(a_7_IBUF_7),
    .I5(a_5_IBUF_9),
    .O(Sh5)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh71 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_8_IBUF_6),
    .I3(a_10_IBUF_4),
    .I4(a_9_IBUF_5),
    .I5(a_7_IBUF_7),
    .O(Sh7)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh61 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_7_IBUF_7),
    .I3(a_9_IBUF_5),
    .I4(a_8_IBUF_6),
    .I5(a_6_IBUF_8),
    .O(Sh6)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000040 ))
  \op[7]_PWR_1_o_equal_62_o<7>1  (
    .I0(op_0_IBUF_38),
    .I1(\op[7]_PWR_1_o_equal_60_o<7>1_391 ),
    .I2(op_3_IBUF_35),
    .I3(op_6_IBUF_32),
    .I4(op_4_IBUF_34),
    .I5(op_5_IBUF_33),
    .O(\op[7]_PWR_1_o_equal_62_o )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000080 ))
  \op[7]_PWR_1_o_equal_65_o<7>1  (
    .I0(op_0_IBUF_38),
    .I1(\op[7]_PWR_1_o_equal_60_o<7>1_391 ),
    .I2(op_3_IBUF_35),
    .I3(op_6_IBUF_32),
    .I4(op_4_IBUF_34),
    .I5(op_5_IBUF_33),
    .O(\op[7]_PWR_1_o_equal_65_o )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh121 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_13_IBUF_1),
    .I3(Sh79),
    .I4(a_14_IBUF_0),
    .I5(a_12_IBUF_2),
    .O(Sh12)
  );
  LUT5 #(
    .INIT ( 32'h57550200 ))
  Sh12311 (
    .I0(b_2_IBUF_28),
    .I1(b_1_IBUF_29),
    .I2(b_0_IBUF_30),
    .I3(a_0_IBUF_14),
    .I4(Sh100),
    .O(Sh1231)
  );
  LUT5 #(
    .INIT ( 32'h08000000 ))
  \op[7]_GND_1_o_equal_47_o<7>1  (
    .I0(op_1_IBUF_37),
    .I1(op_2_IBUF_36),
    .I2(op_7_IBUF_31),
    .I3(op_0_IBUF_38),
    .I4(_n01731),
    .O(\op[7]_GND_1_o_equal_47_o )
  );
  LUT5 #(
    .INIT ( 32'h00004000 ))
  \op[7]_GND_1_o_equal_58_o<7>1  (
    .I0(op_2_IBUF_36),
    .I1(_n01731),
    .I2(op_1_IBUF_37),
    .I3(op_0_IBUF_38),
    .I4(op_7_IBUF_31),
    .O(\op[7]_GND_1_o_equal_58_o )
  );
  LUT5 #(
    .INIT ( 32'h00100000 ))
  \op[7]_GND_1_o_equal_56_o<7>1  (
    .I0(op_1_IBUF_37),
    .I1(op_2_IBUF_36),
    .I2(op_0_IBUF_38),
    .I3(op_7_IBUF_31),
    .I4(_n01731),
    .O(\op[7]_GND_1_o_equal_56_o )
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  Sh131 (
    .I0(b_1_IBUF_29),
    .I1(b_0_IBUF_30),
    .I2(a_14_IBUF_0),
    .I3(a_13_IBUF_1),
    .I4(Sh79),
    .O(Sh13)
  );
  LUT5 #(
    .INIT ( 32'hFEAE5404 ))
  Sh771 (
    .I0(b_1_IBUF_29),
    .I1(a_13_IBUF_1),
    .I2(b_0_IBUF_30),
    .I3(a_14_IBUF_0),
    .I4(Sh79),
    .O(Sh77)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh111 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_12_IBUF_2),
    .I3(a_14_IBUF_0),
    .I4(a_13_IBUF_1),
    .I5(a_11_IBUF_3),
    .O(Sh11)
  );
  LUT6 #(
    .INIT ( 64'hFFFFF888F888F888 ))
  C_SW0 (
    .I0(_n0196_153),
    .I1(\a[15]_b[15]_sub_18_OUT<16> ),
    .I2(_n0173_152),
    .I3(GND_1_o_c_add_12_OUT[16]),
    .I4(\a[15]_b[15]_add_0_OUT<16> ),
    .I5(_n0188_154),
    .O(N8)
  );
  LUT5 #(
    .INIT ( 32'hFFFFEA48 ))
  C_332 (
    .I0(Madd_n0125_cy[15]),
    .I1(\op[7]_GND_1_o_equal_47_o ),
    .I2(c_IBUF_39),
    .I3(\op[7]_GND_1_o_equal_46_o ),
    .I4(N8),
    .O(C_OBUF_158)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  out1 (
    .I0(b_7_IBUF_23),
    .I1(b_6_IBUF_24),
    .I2(b_9_IBUF_21),
    .I3(b_8_IBUF_22),
    .I4(b_11_IBUF_19),
    .I5(b_10_IBUF_20),
    .O(out)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  out3 (
    .I0(b_13_IBUF_17),
    .I1(b_12_IBUF_18),
    .I2(b_15_IBUF_15),
    .I3(b_14_IBUF_16),
    .I4(b_5_IBUF_25),
    .I5(b_4_IBUF_26),
    .O(out1_417)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  out4 (
    .I0(out),
    .I1(out1_417),
    .O(_n0168)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  Mmux_Z11 (
    .I0(_n0139[8]),
    .I1(_n0139[9]),
    .I2(_n0139[7]),
    .I3(_n0139[6]),
    .I4(_n0139[5]),
    .I5(_n0139[4]),
    .O(Mmux_Z1)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  Mmux_Z12 (
    .I0(_n0139[14]),
    .I1(_n0139[15]),
    .I2(_n0139[13]),
    .I3(_n0139[12]),
    .I4(_n0139[11]),
    .I5(_n0139[10]),
    .O(Mmux_Z11_419)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  Mmux_Z13 (
    .I0(_n0139[2]),
    .I1(_n0139[3]),
    .O(Mmux_Z12_420)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000080 ))
  Mmux_Z14 (
    .I0(Mmux_Z12_420),
    .I1(Mmux_Z1),
    .I2(Mmux_Z11_419),
    .I3(_n0139[1]),
    .I4(_n0139[0]),
    .I5(\op[7]_reduce_or_72_o ),
    .O(Mmux_Z13_421)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  Mmux_Z15 (
    .I0(y_5_OBUF_133),
    .I1(y_4_OBUF_134),
    .I2(y_7_OBUF_131),
    .I3(y_8_OBUF_130),
    .I4(y_11_OBUF_127),
    .I5(y_12_OBUF_126),
    .O(Mmux_Z14_422)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  Mmux_Z16 (
    .I0(y_15_OBUF_123),
    .I1(y_14_OBUF_124),
    .I2(y_6_OBUF_132),
    .I3(y_0_OBUF_138),
    .I4(y_3_OBUF_135),
    .I5(y_13_OBUF_125),
    .O(Mmux_Z15_423)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  Mmux_Z17 (
    .I0(y_9_OBUF_129),
    .I1(y_2_OBUF_136),
    .I2(y_10_OBUF_128),
    .O(Mmux_Z16_424)
  );
  LUT5 #(
    .INIT ( 32'hFFFF0080 ))
  Mmux_Z18 (
    .I0(Mmux_Z15_423),
    .I1(Mmux_Z16_424),
    .I2(Mmux_Z14_422),
    .I3(y_1_OBUF_137),
    .I4(Mmux_Z13_421),
    .O(Z_OBUF_159)
  );
  LUT4 #(
    .INIT ( 16'hBFFF ))
  Mmux_N1_SW0 (
    .I0(op_2_IBUF_36),
    .I1(op_3_IBUF_35),
    .I2(op_1_IBUF_37),
    .I3(op_0_IBUF_38),
    .O(N10)
  );
  LUT6 #(
    .INIT ( 64'h1000000010000001 ))
  Mmux_N1 (
    .I0(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<7>_386 ),
    .I1(op_6_IBUF_32),
    .I2(op_7_IBUF_31),
    .I3(op_5_IBUF_33),
    .I4(op_4_IBUF_34),
    .I5(N10),
    .O(N_OBUF_155)
  );
  LUT3 #(
    .INIT ( 8'hF7 ))
  out2_SW0 (
    .I0(op_1_IBUF_37),
    .I1(op_0_IBUF_38),
    .I2(op_2_IBUF_36),
    .O(N12)
  );
  LUT6 #(
    .INIT ( 64'hFF5FFF5F5FFE5FFF ))
  out2 (
    .I0(op_7_IBUF_31),
    .I1(N12),
    .I2(op_5_IBUF_33),
    .I3(op_4_IBUF_34),
    .I4(op_3_IBUF_35),
    .I5(op_6_IBUF_32),
    .O(\op[7]_reduce_or_72_o )
  );
  LUT6 #(
    .INIT ( 64'h22F222F2FFFF22F2 ))
  F4 (
    .I0(\op[7]_GND_1_o_equal_47_o ),
    .I1(n0125[15]),
    .I2(F3_427),
    .I3(GND_1_o_c_add_12_OUT[15]),
    .I4(_n0188_154),
    .I5(\a[15]_b[15]_add_0_OUT<15> ),
    .O(F4_428)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  F5 (
    .I0(\a[15]_b[15]_sub_18_OUT<13> ),
    .I1(\a[15]_b[15]_sub_18_OUT<12> ),
    .I2(\a[15]_b[15]_sub_18_OUT<11> ),
    .I3(\a[15]_b[15]_sub_18_OUT<10> ),
    .I4(\a[15]_b[15]_sub_18_OUT<9> ),
    .I5(\a[15]_b[15]_sub_18_OUT<8> ),
    .O(F5_429)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  F6 (
    .I0(\a[15]_b[15]_sub_18_OUT<14> ),
    .I1(\a[15]_b[15]_sub_18_OUT<1> ),
    .I2(\a[15]_b[15]_sub_18_OUT<0> ),
    .O(F6_430)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  F7 (
    .I0(\a[15]_b[15]_sub_18_OUT<7> ),
    .I1(\a[15]_b[15]_sub_18_OUT<6> ),
    .I2(\a[15]_b[15]_sub_18_OUT<5> ),
    .I3(\a[15]_b[15]_sub_18_OUT<4> ),
    .I4(\a[15]_b[15]_sub_18_OUT<3> ),
    .I5(\a[15]_b[15]_sub_18_OUT<2> ),
    .O(F7_431)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF22222220 ))
  F8 (
    .I0(_n0196_153),
    .I1(\a[15]_b[15]_sub_18_OUT<15> ),
    .I2(F6_430),
    .I3(F7_431),
    .I4(F5_429),
    .I5(F4_428),
    .O(F8_432)
  );
  LUT6 #(
    .INIT ( 64'h5545544411011000 ))
  \y<3>5  (
    .I0(b_2_IBUF_28),
    .I1(b_3_IBUF_27),
    .I2(b_0_IBUF_30),
    .I3(Sh36),
    .I4(Sh210),
    .I5(Sh11),
    .O(\y<3>6_435 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \y<3>6  (
    .I0(a_2_IBUF_12),
    .I1(\op[7]_PWR_1_o_equal_60_o ),
    .I2(a_3_IBUF_11),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .O(\y<3>7_436 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<3>7  (
    .I0(\y<2>23 ),
    .I1(\y<3>6_435 ),
    .I2(\y<5>3_410 ),
    .I3(a_4_IBUF_10),
    .I4(\op[7]_PWR_1_o_equal_62_o ),
    .I5(\y<3>7_436 ),
    .O(\y<3>8_437 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF88F888F888F8 ))
  \y<3>8  (
    .I0(n0125[3]),
    .I1(\y<14>2_389 ),
    .I2(\op[7]_GND_1_o_equal_59_o ),
    .I3(a_3_IBUF_11),
    .I4(_n0188_154),
    .I5(\a[15]_b[15]_add_0_OUT<3> ),
    .O(\y<3>9 )
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  \y<3>10  (
    .I0(\op[7]_GND_1_o_equal_57_o ),
    .I1(a_3_IBUF_11),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_58_o ),
    .O(\y<3>11_439 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  \y<3>13  (
    .I0(b_3_IBUF_27),
    .I1(\y<3>11_439 ),
    .I2(\op[7]_PWR_1_o_equal_63_o ),
    .I3(\y<3>12_440 ),
    .I4(\a[15]_b[15]_sub_18_OUT<3> ),
    .I5(_n0196_153),
    .O(\y<3>13_441 )
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  \y<4>4  (
    .I0(b_3_IBUF_27),
    .I1(b_2_IBUF_28),
    .I2(Sh72),
    .I3(Sh4),
    .I4(Sh12),
    .O(\y<4>4_442 )
  );
  LUT5 #(
    .INIT ( 32'hFF080808 ))
  \y<4>8  (
    .I0(\y<14>1_387 ),
    .I1(Sh1231),
    .I2(b_3_IBUF_27),
    .I3(\a[15]_b[15]_add_0_OUT<4> ),
    .I4(_n0188_154),
    .O(\y<4>8_444 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF544454445444 ))
  \y<4>9  (
    .I0(a_4_IBUF_10),
    .I1(\op[7]_GND_1_o_equal_59_o ),
    .I2(\op[7]_GND_1_o_equal_58_o ),
    .I3(b_4_IBUF_26),
    .I4(n0125[4]),
    .I5(\y<14>2_389 ),
    .O(\y<4>9_445 )
  );
  LUT4 #(
    .INIT ( 16'h5540 ))
  \y<11>2  (
    .I0(a_11_IBUF_3),
    .I1(\op[7]_GND_1_o_equal_58_o ),
    .I2(b_11_IBUF_19),
    .I3(\op[7]_GND_1_o_equal_59_o ),
    .O(\y<11>2_446 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \y<11>6  (
    .I0(_n0188_154),
    .I1(\a[15]_b[15]_add_0_OUT<11> ),
    .I2(n0125[11]),
    .I3(\y<14>2_389 ),
    .O(\y<11>6_448 )
  );
  LUT5 #(
    .INIT ( 32'hEAEAFFEA ))
  \y<11>8  (
    .I0(\y<14>4 ),
    .I1(a_12_IBUF_2),
    .I2(\op[7]_PWR_1_o_equal_62_o ),
    .I3(_n0139[4]),
    .I4(\op[7]_reduce_or_72_o ),
    .O(\y<11>8_449 )
  );
  LUT6 #(
    .INIT ( 64'h2222200020002000 ))
  \y<11>9  (
    .I0(b_2_IBUF_28),
    .I1(b_3_IBUF_27),
    .I2(\y<14>1_387 ),
    .I3(Sh103),
    .I4(\op[7]_PWR_1_o_equal_63_o ),
    .I5(Sh15),
    .O(\y<11>9_450 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF544454445444 ))
  \y<7>1  (
    .I0(a_7_IBUF_7),
    .I1(\op[7]_GND_1_o_equal_59_o ),
    .I2(\op[7]_GND_1_o_equal_58_o ),
    .I3(b_7_IBUF_23),
    .I4(n0125[7]),
    .I5(\y<14>2_389 ),
    .O(\y<7>1_451 )
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  \y<7>2  (
    .I0(\y<7>1_451 ),
    .I1(_n0188_154),
    .I2(\a[15]_b[15]_add_0_OUT<7> ),
    .I3(_n0196_153),
    .I4(\a[15]_b[15]_sub_18_OUT<7> ),
    .O(\y<7>2_452 )
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \y<7>3  (
    .I0(a_8_IBUF_6),
    .I1(\op[7]_PWR_1_o_equal_62_o ),
    .I2(\y<7>3_409 ),
    .O(\y<7>4 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFEEE ))
  \y<7>11  (
    .I0(\y<7>2_452 ),
    .I1(\y<7>4 ),
    .I2(_n0173_152),
    .I3(GND_1_o_c_add_12_OUT[7]),
    .I4(\y<7>8 ),
    .I5(\y<7>11_456 ),
    .O(y_7_OBUF_131)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \y<12>1  (
    .I0(_n0173_152),
    .I1(GND_1_o_c_add_12_OUT[12]),
    .I2(_n0196_153),
    .I3(\a[15]_b[15]_sub_18_OUT<12> ),
    .O(\y<12>2 )
  );
  LUT5 #(
    .INIT ( 32'hFEAE5404 ))
  \y<12>4  (
    .I0(b_3_IBUF_27),
    .I1(\y<12>4_458 ),
    .I2(b_2_IBUF_28),
    .I3(Sh104),
    .I4(Sh1231),
    .O(\y<12>5_459 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFF888F888F888 ))
  \y<12>5  (
    .I0(_n0188_154),
    .I1(\a[15]_b[15]_add_0_OUT<12> ),
    .I2(n0125[12]),
    .I3(\y<14>2_389 ),
    .I4(\y<14>1_387 ),
    .I5(\y<12>5_459 ),
    .O(\y<12>6 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \y<5>2  (
    .I0(b_3_IBUF_27),
    .I1(b_2_IBUF_28),
    .O(\y<5>2_462 )
  );
  LUT6 #(
    .INIT ( 64'hAAAA200020002000 ))
  \y<5>3  (
    .I0(\y<5>2_462 ),
    .I1(_n0168),
    .I2(Sh77),
    .I3(\op[7]_PWR_1_o_equal_65_o ),
    .I4(Sh13),
    .I5(\op[7]_PWR_1_o_equal_63_o ),
    .O(\y<5>4 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \y<5>6  (
    .I0(b_2_IBUF_28),
    .I1(Sh5),
    .I2(Sh73),
    .O(\y<5>7 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \y<5>8  (
    .I0(a_4_IBUF_10),
    .I1(\op[7]_PWR_1_o_equal_60_o ),
    .I2(b_5_IBUF_25),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .O(\y<5>9_466 )
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  \y<5>9  (
    .I0(\op[7]_GND_1_o_equal_57_o ),
    .I1(b_5_IBUF_25),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_58_o ),
    .O(\y<5>10_467 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFEAFFFF5540 ))
  \y<5>10  (
    .I0(a_5_IBUF_9),
    .I1(b_5_IBUF_25),
    .I2(\op[7]_GND_1_o_equal_58_o ),
    .I3(\op[7]_GND_1_o_equal_59_o ),
    .I4(\y<5>9_466 ),
    .I5(\y<5>10_467 ),
    .O(\y<5>11 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \y<1>1  (
    .I0(_n0188_154),
    .I1(\a[15]_b[15]_add_0_OUT<1> ),
    .I2(n0125[1]),
    .I3(\y<14>2_389 ),
    .O(\y<1>1_469 )
  );
  LUT5 #(
    .INIT ( 32'hAA8AA888 ))
  \y<1>2  (
    .I0(a_1_IBUF_13),
    .I1(\op[7]_GND_1_o_equal_57_o ),
    .I2(b_1_IBUF_29),
    .I3(\op[7]_GND_1_o_equal_56_o ),
    .I4(\op[7]_GND_1_o_equal_58_o ),
    .O(\y<1>4_470 )
  );
  LUT6 #(
    .INIT ( 64'hFFF8FFF8FFFFFFF8 ))
  \y<1>4  (
    .I0(a_2_IBUF_12),
    .I1(\op[7]_PWR_1_o_equal_62_o ),
    .I2(\y<1>1_469 ),
    .I3(\y<1>4_470 ),
    .I4(_n0139[14]),
    .I5(\op[7]_reduce_or_72_o ),
    .O(\y<1>6 )
  );
  LUT6 #(
    .INIT ( 64'h5545544411011000 ))
  \y<1>8  (
    .I0(b_3_IBUF_27),
    .I1(b_2_IBUF_28),
    .I2(b_0_IBUF_30),
    .I3(Sh129),
    .I4(Sh127),
    .I5(Sh5),
    .O(\y<1>10 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \y<2>1  (
    .I0(_n0188_154),
    .I1(\a[15]_b[15]_add_0_OUT<2> ),
    .I2(n0125[2]),
    .I3(\y<14>2_389 ),
    .O(\y<2>1_474 )
  );
  LUT5 #(
    .INIT ( 32'hAA8AA888 ))
  \y<2>3  (
    .I0(a_2_IBUF_12),
    .I1(\op[7]_GND_1_o_equal_57_o ),
    .I2(b_2_IBUF_28),
    .I3(\op[7]_GND_1_o_equal_56_o ),
    .I4(\op[7]_GND_1_o_equal_58_o ),
    .O(\y<2>3_475 )
  );
  LUT6 #(
    .INIT ( 64'hFFF8FFF8FFFFFFF8 ))
  \y<2>4  (
    .I0(a_3_IBUF_11),
    .I1(\op[7]_PWR_1_o_equal_62_o ),
    .I2(\y<2>1_474 ),
    .I3(\y<2>3_475 ),
    .I4(_n0139[13]),
    .I5(\op[7]_reduce_or_72_o ),
    .O(\y<2>4_476 )
  );
  LUT6 #(
    .INIT ( 64'h5545544411011000 ))
  \y<2>8  (
    .I0(b_3_IBUF_27),
    .I1(b_2_IBUF_28),
    .I2(b_0_IBUF_30),
    .I3(Sh210),
    .I4(Sh129),
    .I5(Sh6),
    .O(\y<2>8_477 )
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  _n0173_SW0 (
    .I0(op_1_IBUF_37),
    .I1(op_0_IBUF_38),
    .I2(op_2_IBUF_36),
    .O(N14)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \y<15>1  (
    .I0(b_1_IBUF_29),
    .I1(Sh79),
    .I2(a_13_IBUF_1),
    .O(\y<15>1_480 )
  );
  LUT5 #(
    .INIT ( 32'hFEAE5404 ))
  \y<15>2  (
    .I0(b_3_IBUF_27),
    .I1(\y<15>1_480 ),
    .I2(b_0_IBUF_30),
    .I3(Sh1101),
    .I4(Sh103),
    .O(\y<15>2_481 )
  );
  LUT5 #(
    .INIT ( 32'h22200200 ))
  \y<15>3  (
    .I0(\op[7]_PWR_1_o_equal_61_o<7>1 ),
    .I1(op_0_IBUF_38),
    .I2(b_2_IBUF_28),
    .I3(\y<15>2_481 ),
    .I4(Sh631_395),
    .O(\y<15>3_482 )
  );
  LUT5 #(
    .INIT ( 32'hFFFEFEFE ))
  \y<15>4  (
    .I0(\op[7]_PWR_1_o_equal_64_o ),
    .I1(\op[7]_GND_1_o_equal_57_o ),
    .I2(\op[7]_PWR_1_o_equal_65_o ),
    .I3(b_15_IBUF_15),
    .I4(\op[7]_GND_1_o_equal_56_o ),
    .O(\y<15>5_483 )
  );
  LUT5 #(
    .INIT ( 32'hFFF88F88 ))
  \y<15>5  (
    .I0(n0125[15]),
    .I1(\y<14>2_389 ),
    .I2(Sh79),
    .I3(\op[7]_GND_1_o_equal_59_o ),
    .I4(\y<15>5_483 ),
    .O(\y<15>6_484 )
  );
  LUT5 #(
    .INIT ( 32'hEAEAFFEA ))
  \y<15>8  (
    .I0(\y<15>7_485 ),
    .I1(\op[7]_PWR_1_o_equal_63_o ),
    .I2(\y<15>8_486 ),
    .I3(_n0139[0]),
    .I4(\op[7]_reduce_or_72_o ),
    .O(\y<15>9_487 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFEEE ))
  \y<15>9  (
    .I0(\y<15>3_482 ),
    .I1(\y<15>9_487 ),
    .I2(_n0173_152),
    .I3(GND_1_o_c_add_12_OUT[15]),
    .I4(\y<15>4_413 ),
    .I5(\y<15>6_484 ),
    .O(y_15_OBUF_123)
  );
  LUT6 #(
    .INIT ( 64'hFFFF544454445444 ))
  \y<9>1  (
    .I0(a_9_IBUF_5),
    .I1(\op[7]_GND_1_o_equal_59_o ),
    .I2(\op[7]_GND_1_o_equal_58_o ),
    .I3(b_9_IBUF_21),
    .I4(n0125[9]),
    .I5(\y<14>2_389 ),
    .O(\y<9>1_488 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \y<9>2  (
    .I0(_n0188_154),
    .I1(\a[15]_b[15]_add_0_OUT<9> ),
    .O(\y<9>2_489 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<9>3  (
    .I0(_n0196_153),
    .I1(\a[15]_b[15]_sub_18_OUT<9> ),
    .I2(\y<9>1_488 ),
    .I3(_n0173_152),
    .I4(GND_1_o_c_add_12_OUT[9]),
    .I5(\y<9>2_489 ),
    .O(\y<9>3_490 )
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \y<9>4  (
    .I0(a_10_IBUF_4),
    .I1(\op[7]_PWR_1_o_equal_62_o ),
    .I2(\y<7>3_409 ),
    .O(\y<9>4_491 )
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  \y<9>7  (
    .I0(b_3_IBUF_27),
    .I1(b_2_IBUF_28),
    .I2(Sh101),
    .I3(Sh105),
    .I4(Sh33),
    .O(\y<9>7_492 )
  );
  LUT5 #(
    .INIT ( 32'hFEFEFFFE ))
  \y<9>9  (
    .I0(\y<9>4_491 ),
    .I1(\y<9>8_493 ),
    .I2(\y<9>3_490 ),
    .I3(\y<1>3 ),
    .I4(b_3_IBUF_27),
    .O(y_9_OBUF_129)
  );
  LUT6 #(
    .INIT ( 64'hFFFF544454445444 ))
  \y<10>1  (
    .I0(a_10_IBUF_4),
    .I1(\op[7]_GND_1_o_equal_59_o ),
    .I2(\op[7]_GND_1_o_equal_58_o ),
    .I3(b_10_IBUF_20),
    .I4(n0125[10]),
    .I5(\y<14>2_389 ),
    .O(\y<10>1_494 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \y<10>2  (
    .I0(_n0188_154),
    .I1(\a[15]_b[15]_add_0_OUT<10> ),
    .O(\y<10>2_495 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<10>3  (
    .I0(_n0196_153),
    .I1(\a[15]_b[15]_sub_18_OUT<10> ),
    .I2(\y<10>1_494 ),
    .I3(_n0173_152),
    .I4(GND_1_o_c_add_12_OUT[10]),
    .I5(\y<10>2_495 ),
    .O(\y<10>3_496 )
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \y<10>4  (
    .I0(a_11_IBUF_3),
    .I1(\op[7]_PWR_1_o_equal_62_o ),
    .I2(\y<7>3_409 ),
    .O(\y<10>4_497 )
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  \y<10>7  (
    .I0(b_3_IBUF_27),
    .I1(b_2_IBUF_28),
    .I2(Sh102),
    .I3(Sh106),
    .I4(Sh34),
    .O(\y<10>7_498 )
  );
  LUT5 #(
    .INIT ( 32'hFEFEFFFE ))
  \y<10>9  (
    .I0(\y<10>4_497 ),
    .I1(\y<10>8_499 ),
    .I2(\y<10>3_496 ),
    .I3(\y<2>2 ),
    .I4(b_3_IBUF_27),
    .O(y_10_OBUF_128)
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \y<14>2_SW0  (
    .I0(op_0_IBUF_38),
    .I1(op_1_IBUF_37),
    .O(N16)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFAAAAAEAA ))
  \y<14>2  (
    .I0(\op[7]_GND_1_o_equal_46_o ),
    .I1(_n01731),
    .I2(op_7_IBUF_31),
    .I3(op_2_IBUF_36),
    .I4(N16),
    .I5(\op[7]_GND_1_o_equal_47_o ),
    .O(\y<14>2_389 )
  );
  LUT4 #(
    .INIT ( 16'h5540 ))
  \y<14>1  (
    .I0(a_14_IBUF_0),
    .I1(\op[7]_GND_1_o_equal_58_o ),
    .I2(b_14_IBUF_16),
    .I3(\op[7]_GND_1_o_equal_59_o ),
    .O(\y<14>3 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \y<14>7  (
    .I0(_n0188_154),
    .I1(\a[15]_b[15]_add_0_OUT<14> ),
    .I2(n0125[14]),
    .I3(\y<14>2_389 ),
    .O(\y<14>9_503 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \y<14>9  (
    .I0(b_2_IBUF_28),
    .I1(b_3_IBUF_27),
    .I2(Sh106),
    .I3(Sh34),
    .I4(Sh102),
    .I5(\y<14>10_504 ),
    .O(\y<14>11_505 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<14>10  (
    .I0(\op[7]_PWR_1_o_equal_62_o ),
    .I1(Sh79),
    .I2(\y<14>4 ),
    .I3(\y<14>1_387 ),
    .I4(\y<14>11_505 ),
    .I5(\y<14>9_503 ),
    .O(\y<14>12 )
  );
  LUT5 #(
    .INIT ( 32'hEAEAFFEA ))
  \y<6>4  (
    .I0(\y<5>3_410 ),
    .I1(a_7_IBUF_7),
    .I2(\op[7]_PWR_1_o_equal_62_o ),
    .I3(_n0139[9]),
    .I4(\op[7]_reduce_or_72_o ),
    .O(\y<6>4_507 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Sh631_SW0 (
    .I0(b_1_IBUF_29),
    .I1(a_10_IBUF_4),
    .I2(a_8_IBUF_6),
    .O(N18)
  );
  LUT5 #(
    .INIT ( 32'hFEAE5404 ))
  Sh631 (
    .I0(b_3_IBUF_27),
    .I1(Sh1071),
    .I2(b_0_IBUF_30),
    .I3(N18),
    .I4(Sh35),
    .O(Sh631_395)
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  _n0196_SW0 (
    .I0(op_1_IBUF_37),
    .I1(op_0_IBUF_38),
    .I2(op_2_IBUF_36),
    .O(N20)
  );
  LUT6 #(
    .INIT ( 64'h1000100010011000 ))
  _n0196 (
    .I0(op_6_IBUF_32),
    .I1(op_5_IBUF_33),
    .I2(op_7_IBUF_31),
    .I3(op_4_IBUF_34),
    .I4(op_3_IBUF_35),
    .I5(N20),
    .O(_n0196_153)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \op[7]_GND_1_o_equal_59_o<7>_SW0  (
    .I0(op_2_IBUF_36),
    .I1(op_1_IBUF_37),
    .I2(op_0_IBUF_38),
    .O(N22)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000040 ))
  \op[7]_GND_1_o_equal_59_o<7>  (
    .I0(op_7_IBUF_31),
    .I1(N22),
    .I2(op_3_IBUF_35),
    .I3(op_6_IBUF_32),
    .I4(op_5_IBUF_33),
    .I5(op_4_IBUF_34),
    .O(\op[7]_GND_1_o_equal_59_o )
  );
  LUT6 #(
    .INIT ( 64'h4545050544400400 ))
  \y<13>3  (
    .I0(b_3_IBUF_27),
    .I1(\y<14>1_387 ),
    .I2(b_2_IBUF_28),
    .I3(\y<13>2_514 ),
    .I4(Sh105),
    .I5(\y<13>1_513 ),
    .O(\y<13>3_515 )
  );
  LUT4 #(
    .INIT ( 16'h5540 ))
  \y<13>4  (
    .I0(a_13_IBUF_1),
    .I1(\op[7]_GND_1_o_equal_58_o ),
    .I2(b_13_IBUF_17),
    .I3(\op[7]_GND_1_o_equal_59_o ),
    .O(\y<13>4_516 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \y<13>11  (
    .I0(Sh1241),
    .I1(b_3_IBUF_27),
    .O(\y<13>11_518 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFF888F888F888 ))
  \y<13>12  (
    .I0(_n0188_154),
    .I1(\a[15]_b[15]_add_0_OUT<13> ),
    .I2(n0125[13]),
    .I3(\y<14>2_389 ),
    .I4(\y<14>1_387 ),
    .I5(\y<13>11_518 ),
    .O(\y<13>12_519 )
  );
  LUT6 #(
    .INIT ( 64'h00800080AAA00080 ))
  \y<2>21  (
    .I0(Sh79),
    .I1(\op[7]_PWR_1_o_equal_63_o ),
    .I2(b_0_IBUF_30),
    .I3(b_1_IBUF_29),
    .I4(\op[7]_PWR_1_o_equal_65_o ),
    .I5(_n0168),
    .O(\y<2>21_520 )
  );
  LUT6 #(
    .INIT ( 64'h0404040400000400 ))
  \y<2>22  (
    .I0(b_1_IBUF_29),
    .I1(a_14_IBUF_0),
    .I2(b_0_IBUF_30),
    .I3(\op[7]_PWR_1_o_equal_65_o ),
    .I4(_n0168),
    .I5(\op[7]_PWR_1_o_equal_63_o ),
    .O(\y<2>22_521 )
  );
  LUT5 #(
    .INIT ( 32'hFDA8A8A8 ))
  \y<2>24  (
    .I0(b_2_IBUF_28),
    .I1(\y<2>21_520 ),
    .I2(\y<2>22_521 ),
    .I3(\y<2>23 ),
    .I4(Sh10),
    .O(\y<2>2 )
  );
  LUT3 #(
    .INIT ( 8'h27 ))
  \y<6>2_SW0  (
    .I0(b_0_IBUF_30),
    .I1(Sh79),
    .I2(a_14_IBUF_0),
    .O(N24)
  );
  LUT6 #(
    .INIT ( 64'h202F000F20220002 ))
  \y<6>2  (
    .I0(\op[7]_PWR_1_o_equal_65_o ),
    .I1(_n0168),
    .I2(b_1_IBUF_29),
    .I3(N24),
    .I4(Sh79),
    .I5(\op[7]_PWR_1_o_equal_63_o ),
    .O(\y<6>2_408 )
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \y<0>1  (
    .I0(b_0_IBUF_30),
    .I1(\op[7]_GND_1_o_equal_56_o ),
    .I2(\op[7]_GND_1_o_equal_57_o ),
    .O(\y<0>1_524 )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAA20202220 ))
  \y<0>2  (
    .I0(a_0_IBUF_14),
    .I1(b_0_IBUF_30),
    .I2(\op[7]_GND_1_o_equal_58_o ),
    .I3(\y<1>5 ),
    .I4(b_1_IBUF_29),
    .I5(\y<0>1_524 ),
    .O(\y<0>2_525 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<0>9  (
    .I0(_n0188_154),
    .I1(\a[15]_b[15]_add_0_OUT<0> ),
    .I2(\y<1>2_407 ),
    .I3(n0125[0]),
    .I4(\y<14>2_389 ),
    .I5(\y<0>8_527 ),
    .O(\y<0>9_528 )
  );
  LUT5 #(
    .INIT ( 32'hFEAE5404 ))
  \y<0>10  (
    .I0(b_0_IBUF_30),
    .I1(a_0_IBUF_14),
    .I2(b_1_IBUF_29),
    .I3(a_2_IBUF_12),
    .I4(Sh127),
    .O(\y<0>10_529 )
  );
  LUT6 #(
    .INIT ( 64'hAA8AA88822022000 ))
  \y<0>11  (
    .I0(\y<2>23 ),
    .I1(b_3_IBUF_27),
    .I2(b_2_IBUF_28),
    .I3(Sh4),
    .I4(\y<0>10_529 ),
    .I5(Mmux__n0172151),
    .O(\y<0>11_530 )
  );
  LUT5 #(
    .INIT ( 32'hEAEAFFEA ))
  \y<8>3  (
    .I0(\y<7>3_409 ),
    .I1(a_9_IBUF_5),
    .I2(\op[7]_PWR_1_o_equal_62_o ),
    .I3(_n0139[7]),
    .I4(\op[7]_reduce_or_72_o ),
    .O(\y<8>3_531 )
  );
  LUT4 #(
    .INIT ( 16'h0040 ))
  \y<8>4  (
    .I0(b_1_IBUF_29),
    .I1(b_3_IBUF_27),
    .I2(a_0_IBUF_14),
    .I3(b_0_IBUF_30),
    .O(\y<8>4_532 )
  );
  LUT5 #(
    .INIT ( 32'h77325510 ))
  \y<8>5  (
    .I0(b_2_IBUF_28),
    .I1(b_3_IBUF_27),
    .I2(Sh104),
    .I3(\y<8>4_532 ),
    .I4(Sh100),
    .O(\y<8>5_533 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFF888F888F888 ))
  \y<8>6  (
    .I0(_n0188_154),
    .I1(\a[15]_b[15]_add_0_OUT<8> ),
    .I2(n0125[8]),
    .I3(\y<14>2_389 ),
    .I4(\y<14>1_387 ),
    .I5(\y<8>5_533 ),
    .O(\y<8>6_534 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \y<8>7  (
    .I0(a_7_IBUF_7),
    .I1(\op[7]_PWR_1_o_equal_60_o ),
    .I2(b_8_IBUF_22),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .O(\y<8>7_535 )
  );
  LUT4 #(
    .INIT ( 16'hFBEA ))
  \y<8>8  (
    .I0(\op[7]_GND_1_o_equal_57_o ),
    .I1(b_8_IBUF_22),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_58_o ),
    .O(\y<8>8_536 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFEAFFFF5540 ))
  \y<8>9  (
    .I0(a_8_IBUF_6),
    .I1(b_8_IBUF_22),
    .I2(\op[7]_GND_1_o_equal_58_o ),
    .I3(\op[7]_GND_1_o_equal_59_o ),
    .I4(\y<8>7_535 ),
    .I5(\y<8>8_536 ),
    .O(\y<8>9_537 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  _n0188_SW0 (
    .I0(op_1_IBUF_37),
    .I1(op_0_IBUF_38),
    .O(N26)
  );
  LUT6 #(
    .INIT ( 64'h00200020FFFF0020 ))
  _n0188 (
    .I0(op_2_IBUF_36),
    .I1(N26),
    .I2(_n01731),
    .I3(op_7_IBUF_31),
    .I4(_n01882),
    .I5(op_5_IBUF_33),
    .O(_n0188_154)
  );
  LUT6 #(
    .INIT ( 64'hEAEAEEEA40404440 ))
  \y<1>34  (
    .I0(b_2_IBUF_28),
    .I1(Sh73),
    .I2(\op[7]_PWR_1_o_equal_63_o ),
    .I3(\op[7]_PWR_1_o_equal_65_o ),
    .I4(_n0168),
    .I5(\y<1>33_539 ),
    .O(\y<1>3 )
  );
  IBUF   a_15_IBUF (
    .I(a[15]),
    .O(Sh79)
  );
  IBUF   a_14_IBUF (
    .I(a[14]),
    .O(a_14_IBUF_0)
  );
  IBUF   a_13_IBUF (
    .I(a[13]),
    .O(a_13_IBUF_1)
  );
  IBUF   a_12_IBUF (
    .I(a[12]),
    .O(a_12_IBUF_2)
  );
  IBUF   a_11_IBUF (
    .I(a[11]),
    .O(a_11_IBUF_3)
  );
  IBUF   a_10_IBUF (
    .I(a[10]),
    .O(a_10_IBUF_4)
  );
  IBUF   a_9_IBUF (
    .I(a[9]),
    .O(a_9_IBUF_5)
  );
  IBUF   a_8_IBUF (
    .I(a[8]),
    .O(a_8_IBUF_6)
  );
  IBUF   a_7_IBUF (
    .I(a[7]),
    .O(a_7_IBUF_7)
  );
  IBUF   a_6_IBUF (
    .I(a[6]),
    .O(a_6_IBUF_8)
  );
  IBUF   a_5_IBUF (
    .I(a[5]),
    .O(a_5_IBUF_9)
  );
  IBUF   a_4_IBUF (
    .I(a[4]),
    .O(a_4_IBUF_10)
  );
  IBUF   a_3_IBUF (
    .I(a[3]),
    .O(a_3_IBUF_11)
  );
  IBUF   a_2_IBUF (
    .I(a[2]),
    .O(a_2_IBUF_12)
  );
  IBUF   a_1_IBUF (
    .I(a[1]),
    .O(a_1_IBUF_13)
  );
  IBUF   a_0_IBUF (
    .I(a[0]),
    .O(a_0_IBUF_14)
  );
  IBUF   b_15_IBUF (
    .I(b[15]),
    .O(b_15_IBUF_15)
  );
  IBUF   b_14_IBUF (
    .I(b[14]),
    .O(b_14_IBUF_16)
  );
  IBUF   b_13_IBUF (
    .I(b[13]),
    .O(b_13_IBUF_17)
  );
  IBUF   b_12_IBUF (
    .I(b[12]),
    .O(b_12_IBUF_18)
  );
  IBUF   b_11_IBUF (
    .I(b[11]),
    .O(b_11_IBUF_19)
  );
  IBUF   b_10_IBUF (
    .I(b[10]),
    .O(b_10_IBUF_20)
  );
  IBUF   b_9_IBUF (
    .I(b[9]),
    .O(b_9_IBUF_21)
  );
  IBUF   b_8_IBUF (
    .I(b[8]),
    .O(b_8_IBUF_22)
  );
  IBUF   b_7_IBUF (
    .I(b[7]),
    .O(b_7_IBUF_23)
  );
  IBUF   b_6_IBUF (
    .I(b[6]),
    .O(b_6_IBUF_24)
  );
  IBUF   b_5_IBUF (
    .I(b[5]),
    .O(b_5_IBUF_25)
  );
  IBUF   b_4_IBUF (
    .I(b[4]),
    .O(b_4_IBUF_26)
  );
  IBUF   b_3_IBUF (
    .I(b[3]),
    .O(b_3_IBUF_27)
  );
  IBUF   b_2_IBUF (
    .I(b[2]),
    .O(b_2_IBUF_28)
  );
  IBUF   b_1_IBUF (
    .I(b[1]),
    .O(b_1_IBUF_29)
  );
  IBUF   b_0_IBUF (
    .I(b[0]),
    .O(b_0_IBUF_30)
  );
  IBUF   op_7_IBUF (
    .I(op[7]),
    .O(op_7_IBUF_31)
  );
  IBUF   op_6_IBUF (
    .I(op[6]),
    .O(op_6_IBUF_32)
  );
  IBUF   op_5_IBUF (
    .I(op[5]),
    .O(op_5_IBUF_33)
  );
  IBUF   op_4_IBUF (
    .I(op[4]),
    .O(op_4_IBUF_34)
  );
  IBUF   op_3_IBUF (
    .I(op[3]),
    .O(op_3_IBUF_35)
  );
  IBUF   op_2_IBUF (
    .I(op[2]),
    .O(op_2_IBUF_36)
  );
  IBUF   op_1_IBUF (
    .I(op[1]),
    .O(op_1_IBUF_37)
  );
  IBUF   op_0_IBUF (
    .I(op[0]),
    .O(op_0_IBUF_38)
  );
  IBUF   c_IBUF (
    .I(c),
    .O(c_IBUF_39)
  );
  OBUF   y_15_OBUF (
    .I(y_15_OBUF_123),
    .O(y[15])
  );
  OBUF   y_14_OBUF (
    .I(y_14_OBUF_124),
    .O(y[14])
  );
  OBUF   y_13_OBUF (
    .I(y_13_OBUF_125),
    .O(y[13])
  );
  OBUF   y_12_OBUF (
    .I(y_12_OBUF_126),
    .O(y[12])
  );
  OBUF   y_11_OBUF (
    .I(y_11_OBUF_127),
    .O(y[11])
  );
  OBUF   y_10_OBUF (
    .I(y_10_OBUF_128),
    .O(y[10])
  );
  OBUF   y_9_OBUF (
    .I(y_9_OBUF_129),
    .O(y[9])
  );
  OBUF   y_8_OBUF (
    .I(y_8_OBUF_130),
    .O(y[8])
  );
  OBUF   y_7_OBUF (
    .I(y_7_OBUF_131),
    .O(y[7])
  );
  OBUF   y_6_OBUF (
    .I(y_6_OBUF_132),
    .O(y[6])
  );
  OBUF   y_5_OBUF (
    .I(y_5_OBUF_133),
    .O(y[5])
  );
  OBUF   y_4_OBUF (
    .I(y_4_OBUF_134),
    .O(y[4])
  );
  OBUF   y_3_OBUF (
    .I(y_3_OBUF_135),
    .O(y[3])
  );
  OBUF   y_2_OBUF (
    .I(y_2_OBUF_136),
    .O(y[2])
  );
  OBUF   y_1_OBUF (
    .I(y_1_OBUF_137),
    .O(y[1])
  );
  OBUF   y_0_OBUF (
    .I(y_0_OBUF_138),
    .O(y[0])
  );
  OBUF   C_OBUF (
    .I(C_OBUF_158),
    .O(C)
  );
  OBUF   L_OBUF (
    .I(L_OBUF_139),
    .O(L)
  );
  OBUF   F_OBUF (
    .I(F_OBUF_156),
    .O(F)
  );
  OBUF   Z_OBUF (
    .I(Z_OBUF_159),
    .O(Z)
  );
  OBUF   N_OBUF (
    .I(N_OBUF_155),
    .O(N)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_a[15]_b[15]_add_0_OUT_lut<15>1  (
    .I0(Sh79),
    .I1(b_15_IBUF_15),
    .O(\Madd_a[15]_b[15]_add_0_OUT_lut<15>1_602 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<15>1  (
    .I0(Sh79),
    .I1(b_15_IBUF_15),
    .O(\Msub__n0139_lut<15>1_603 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub__n0139_lut<15>2  (
    .I0(Sh79),
    .I1(b_15_IBUF_15),
    .O(\Msub__n0139_lut<15>2_604 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_GND_1_o_c_add_12_OUT_xor<16>_rt  (
    .I0(c_IBUF_39),
    .O(\Madd_GND_1_o_c_add_12_OUT_xor<16>_rt_605 )
  );
  LUT5 #(
    .INIT ( 32'hFFFEFEFE ))
  \y<4>10_SW0  (
    .I0(\y<4>9_445 ),
    .I1(\y<5>3_410 ),
    .I2(\y<4>8_444 ),
    .I3(a_5_IBUF_9),
    .I4(\op[7]_PWR_1_o_equal_62_o ),
    .O(N28)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<4>10  (
    .I0(GND_1_o_c_add_12_OUT[4]),
    .I1(_n0173_152),
    .I2(\y<4>5_443 ),
    .I3(_n0196_153),
    .I4(\a[15]_b[15]_sub_18_OUT<4> ),
    .I5(N28),
    .O(y_4_OBUF_134)
  );
  LUT5 #(
    .INIT ( 32'hFFFEFEFE ))
  \y<12>12_SW0  (
    .I0(\y<12>6 ),
    .I1(\y<14>4 ),
    .I2(\y<12>2 ),
    .I3(a_13_IBUF_1),
    .I4(\op[7]_PWR_1_o_equal_62_o ),
    .O(N30)
  );
  LUT6 #(
    .INIT ( 64'hFFF8FFF8FFFFFFF8 ))
  \y<12>12  (
    .I0(\y<12>1_405 ),
    .I1(Sh12),
    .I2(\y<12>10 ),
    .I3(N30),
    .I4(_n0139[3]),
    .I5(\op[7]_reduce_or_72_o ),
    .O(y_12_OBUF_126)
  );
  LUT4 #(
    .INIT ( 16'hABAA ))
  \y<14>14_SW0  (
    .I0(\y<14>7_502 ),
    .I1(b_2_IBUF_28),
    .I2(b_3_IBUF_27),
    .I3(\y<6>2_408 ),
    .O(N32)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<14>14  (
    .I0(GND_1_o_c_add_12_OUT[14]),
    .I1(_n0173_152),
    .I2(\y<14>12 ),
    .I3(_n0196_153),
    .I4(\a[15]_b[15]_sub_18_OUT<14> ),
    .I5(N32),
    .O(y_14_OBUF_124)
  );
  LUT5 #(
    .INIT ( 32'hFFFEFEFE ))
  \y<13>13_SW0  (
    .I0(\y<13>7_517 ),
    .I1(\y<14>4 ),
    .I2(\y<13>3_515 ),
    .I3(a_14_IBUF_0),
    .I4(\op[7]_PWR_1_o_equal_62_o ),
    .O(N34)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<13>13  (
    .I0(GND_1_o_c_add_12_OUT[13]),
    .I1(_n0173_152),
    .I2(\y<13>12_519 ),
    .I3(_n0196_153),
    .I4(\a[15]_b[15]_sub_18_OUT<13> ),
    .I5(N34),
    .O(y_13_OBUF_125)
  );
  LUT5 #(
    .INIT ( 32'hFFFEFEFE ))
  \y<8>11_SW0  (
    .I0(\y<8>6_534 ),
    .I1(\y<8>9_537 ),
    .I2(\y<8>3_531 ),
    .I3(_n0196_153),
    .I4(\a[15]_b[15]_sub_18_OUT<8> ),
    .O(N36)
  );
  LUT6 #(
    .INIT ( 64'hFFFFAEAAAEAAAEAA ))
  \y<8>11  (
    .I0(N36),
    .I1(Mmux__n0172151),
    .I2(b_3_IBUF_27),
    .I3(\y<2>23 ),
    .I4(GND_1_o_c_add_12_OUT[8]),
    .I5(_n0173_152),
    .O(y_8_OBUF_130)
  );
  LUT5 #(
    .INIT ( 32'hBF0B2F02 ))
  \Mcompar_a[15]_b[15]_LessThan_34_o_cy<7>  (
    .I0(a_14_IBUF_0),
    .I1(b_14_IBUF_16),
    .I2(b_15_IBUF_15),
    .I3(Sh79),
    .I4(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<6>_235 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_34_o_cy<7>_236 )
  );
  LUT5 #(
    .INIT ( 32'hBF0B2F02 ))
  \Mcompar_b[15]_a[15]_LessThan_28_o_cy<7>  (
    .I0(a_14_IBUF_0),
    .I1(b_14_IBUF_16),
    .I2(Sh79),
    .I3(b_15_IBUF_15),
    .I4(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<6>_385 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_28_o_cy<7>_386 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF88F888F888F8 ))
  \y<4>5_SW0  (
    .I0(a_3_IBUF_11),
    .I1(\op[7]_PWR_1_o_equal_60_o ),
    .I2(_n0139[11]),
    .I3(\op[7]_reduce_or_72_o ),
    .I4(\y<2>23 ),
    .I5(\y<4>4_442 ),
    .O(N38)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFEEA2EE80 ))
  \y<4>5  (
    .I0(a_4_IBUF_10),
    .I1(b_4_IBUF_26),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .I4(\op[7]_GND_1_o_equal_58_o ),
    .I5(N38),
    .O(\y<4>5_443 )
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  \y<11>5_SW0  (
    .I0(\y<11>2_446 ),
    .I1(\op[7]_PWR_1_o_equal_60_o ),
    .I2(a_10_IBUF_4),
    .I3(\y<12>1_405 ),
    .I4(Sh11),
    .O(N40)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFEEA2EE80 ))
  \y<11>5  (
    .I0(a_11_IBUF_3),
    .I1(b_11_IBUF_19),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .I4(\op[7]_GND_1_o_equal_58_o ),
    .I5(N40),
    .O(\y<11>5_447 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF88F888F888F8 ))
  \y<7>7_SW0  (
    .I0(a_6_IBUF_8),
    .I1(\op[7]_PWR_1_o_equal_60_o ),
    .I2(_n0139[8]),
    .I3(\op[7]_reduce_or_72_o ),
    .I4(\op[7]_PWR_1_o_equal_63_o ),
    .I5(\y<7>7_454 ),
    .O(N42)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFEEA2EE80 ))
  \y<7>7  (
    .I0(a_7_IBUF_7),
    .I1(b_7_IBUF_23),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .I4(\op[7]_GND_1_o_equal_58_o ),
    .I5(N42),
    .O(\y<7>8 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF88F888F888F8 ))
  \y<9>8_SW0  (
    .I0(a_8_IBUF_6),
    .I1(\op[7]_PWR_1_o_equal_60_o ),
    .I2(_n0139[6]),
    .I3(\op[7]_reduce_or_72_o ),
    .I4(\y<14>1_387 ),
    .I5(\y<9>7_492 ),
    .O(N44)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFEEA2EE80 ))
  \y<9>8  (
    .I0(a_9_IBUF_5),
    .I1(b_9_IBUF_21),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .I4(\op[7]_GND_1_o_equal_58_o ),
    .I5(N44),
    .O(\y<9>8_493 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF88F888F888F8 ))
  \y<10>8_SW0  (
    .I0(a_9_IBUF_5),
    .I1(\op[7]_PWR_1_o_equal_60_o ),
    .I2(_n0139[5]),
    .I3(\op[7]_reduce_or_72_o ),
    .I4(\y<10>7_498 ),
    .I5(\y<14>1_387 ),
    .O(N46)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFEEA2EE80 ))
  \y<10>8  (
    .I0(a_10_IBUF_4),
    .I1(b_10_IBUF_20),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .I4(\op[7]_GND_1_o_equal_58_o ),
    .I5(N46),
    .O(\y<10>8_499 )
  );
  LUT5 #(
    .INIT ( 32'hEAEAFFEA ))
  \y<14>5_SW0  (
    .I0(\y<14>3 ),
    .I1(a_13_IBUF_1),
    .I2(\op[7]_PWR_1_o_equal_60_o ),
    .I3(_n0139[1]),
    .I4(\op[7]_reduce_or_72_o ),
    .O(N48)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFEEA2EE80 ))
  \y<14>5  (
    .I0(a_14_IBUF_0),
    .I1(b_14_IBUF_16),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .I4(\op[7]_GND_1_o_equal_58_o ),
    .I5(N48),
    .O(\y<14>7_502 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFEEA2EE80 ))
  \y<6>9  (
    .I0(a_6_IBUF_8),
    .I1(b_6_IBUF_24),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .I4(\op[7]_GND_1_o_equal_58_o ),
    .I5(N50),
    .O(\y<6>9_508 )
  );
  LUT5 #(
    .INIT ( 32'hEAEAFFEA ))
  \y<13>7_SW0  (
    .I0(\y<13>4_516 ),
    .I1(a_12_IBUF_2),
    .I2(\op[7]_PWR_1_o_equal_60_o ),
    .I3(_n0139[2]),
    .I4(\op[7]_reduce_or_72_o ),
    .O(N52)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFEEA2EE80 ))
  \y<13>7  (
    .I0(a_13_IBUF_1),
    .I1(b_13_IBUF_17),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .I4(\op[7]_GND_1_o_equal_58_o ),
    .I5(N52),
    .O(\y<13>7_517 )
  );
  LUT6 #(
    .INIT ( 64'h5555555551404040 ))
  \y<3>4  (
    .I0(b_3_IBUF_27),
    .I1(b_2_IBUF_28),
    .I2(N54),
    .I3(Sh35),
    .I4(\y<14>1_387 ),
    .I5(\y<3>3 ),
    .O(\y<3>5_434 )
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  \y<1>9_SW0  (
    .I0(\y<1>2_407 ),
    .I1(a_0_IBUF_14),
    .I2(\op[7]_PWR_1_o_equal_60_o ),
    .I3(\y<1>10 ),
    .I4(\y<2>23 ),
    .O(N56)
  );
  LUT6 #(
    .INIT ( 64'hFFFFBB33FFFFAA20 ))
  \y<1>9  (
    .I0(b_1_IBUF_29),
    .I1(a_1_IBUF_13),
    .I2(\op[7]_GND_1_o_equal_58_o ),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .I4(N56),
    .I5(\op[7]_GND_1_o_equal_59_o ),
    .O(\y<1>11_473 )
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  \y<2>9_SW0  (
    .I0(\y<1>2_407 ),
    .I1(a_1_IBUF_13),
    .I2(\op[7]_PWR_1_o_equal_60_o ),
    .I3(\y<2>23 ),
    .I4(\y<2>8_477 ),
    .O(N58)
  );
  LUT6 #(
    .INIT ( 64'hFFFFBB33FFFFAA20 ))
  \y<2>9  (
    .I0(b_2_IBUF_28),
    .I1(a_2_IBUF_12),
    .I2(\op[7]_GND_1_o_equal_58_o ),
    .I3(\op[7]_GND_1_o_equal_57_o ),
    .I4(N58),
    .I5(\op[7]_GND_1_o_equal_59_o ),
    .O(\y<2>9_478 )
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  \y<6>13_SW0  (
    .I0(\y<6>9_508 ),
    .I1(GND_1_o_c_add_12_OUT[6]),
    .I2(_n0173_152),
    .I3(_n0196_153),
    .I4(\a[15]_b[15]_sub_18_OUT<6> ),
    .O(N60)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFBFBBAEAA ))
  \y<6>13  (
    .I0(\y<6>4_507 ),
    .I1(b_3_IBUF_27),
    .I2(b_2_IBUF_28),
    .I3(\y<6>2_408 ),
    .I4(\y<6>12_509 ),
    .I5(N60),
    .O(y_6_OBUF_132)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \y<3>15_SW0  (
    .I0(\y<3>5_434 ),
    .I1(\y<3>8_437 ),
    .I2(\y<3>9 ),
    .O(N62)
  );
  LUT6 #(
    .INIT ( 64'hFFF8FFF8FFFFFFF8 ))
  \y<3>15  (
    .I0(GND_1_o_c_add_12_OUT[3]),
    .I1(_n0173_152),
    .I2(\y<3>13_441 ),
    .I3(N62),
    .I4(_n0139[12]),
    .I5(\op[7]_reduce_or_72_o ),
    .O(y_3_OBUF_135)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFEEE ))
  \y<11>10_SW0  (
    .I0(\y<11>5_447 ),
    .I1(\y<11>6_448 ),
    .I2(_n0196_153),
    .I3(\a[15]_b[15]_sub_18_OUT<11> ),
    .I4(\y<11>8_449 ),
    .I5(\y<11>9_450 ),
    .O(N64)
  );
  LUT6 #(
    .INIT ( 64'hFFFFAEAAAEAAAEAA ))
  \y<11>10  (
    .I0(N64),
    .I1(Sh631_395),
    .I2(b_2_IBUF_28),
    .I3(\y<14>1_387 ),
    .I4(GND_1_o_c_add_12_OUT[11]),
    .I5(_n0173_152),
    .O(y_11_OBUF_127)
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  \y<5>5_SW0  (
    .I0(\y<5>4 ),
    .I1(a_6_IBUF_8),
    .I2(\op[7]_PWR_1_o_equal_62_o ),
    .I3(n0125[5]),
    .I4(\y<14>2_389 ),
    .O(N66)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<5>5  (
    .I0(GND_1_o_c_add_12_OUT[5]),
    .I1(_n0173_152),
    .I2(\y<5>3_410 ),
    .I3(_n0188_154),
    .I4(\a[15]_b[15]_add_0_OUT<5> ),
    .I5(N66),
    .O(\y<5>6_464 )
  );
  LUT6 #(
    .INIT ( 64'hFFF8FFF8FFFFFFF8 ))
  \y<5>12_SW0  (
    .I0(_n0196_153),
    .I1(\a[15]_b[15]_sub_18_OUT<5> ),
    .I2(\y<5>11 ),
    .I3(\y<5>6_464 ),
    .I4(_n0139[10]),
    .I5(\op[7]_reduce_or_72_o ),
    .O(N68)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF55404040 ))
  \y<5>12  (
    .I0(b_3_IBUF_27),
    .I1(Sh1241),
    .I2(\y<14>1_387 ),
    .I3(\y<2>23 ),
    .I4(\y<5>7 ),
    .I5(N68),
    .O(y_5_OBUF_133)
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  \y<1>11_SW0  (
    .I0(\y<1>6 ),
    .I1(_n0196_153),
    .I2(\a[15]_b[15]_sub_18_OUT<1> ),
    .I3(b_3_IBUF_27),
    .I4(\y<1>3 ),
    .O(N70)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<1>11  (
    .I0(GND_1_o_c_add_12_OUT[1]),
    .I1(_n0173_152),
    .I2(\y<1>11_473 ),
    .I3(Sh33),
    .I4(\y<1>5 ),
    .I5(N70),
    .O(y_1_OBUF_137)
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  \y<2>11_SW0  (
    .I0(\y<2>9_478 ),
    .I1(_n0196_153),
    .I2(\a[15]_b[15]_sub_18_OUT<2> ),
    .I3(b_3_IBUF_27),
    .I4(\y<2>2 ),
    .O(N72)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<2>11  (
    .I0(GND_1_o_c_add_12_OUT[2]),
    .I1(_n0173_152),
    .I2(\y<2>4_476 ),
    .I3(Sh34),
    .I4(\y<1>5 ),
    .I5(N72),
    .O(y_2_OBUF_136)
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \y<0>6_SW0  (
    .I0(b_0_IBUF_30),
    .I1(\op[7]_GND_1_o_equal_58_o ),
    .I2(\op[7]_GND_1_o_equal_59_o ),
    .O(N74)
  );
  LUT6 #(
    .INIT ( 64'hFFFF2F222F222F22 ))
  \y<0>6  (
    .I0(_n0139[15]),
    .I1(\op[7]_reduce_or_72_o ),
    .I2(a_0_IBUF_14),
    .I3(N74),
    .I4(\op[7]_PWR_1_o_equal_62_o ),
    .I5(a_1_IBUF_13),
    .O(\y<0>6_526 )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \y<0>12_SW0  (
    .I0(\y<0>2_525 ),
    .I1(\y<0>6_526 ),
    .I2(\y<0>9_528 ),
    .O(N76)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF8F8F8 ))
  \y<0>12  (
    .I0(GND_1_o_c_add_12_OUT[0]),
    .I1(_n0173_152),
    .I2(\y<0>11_530 ),
    .I3(_n0196_153),
    .I4(\a[15]_b[15]_sub_18_OUT<0> ),
    .I5(N76),
    .O(y_0_OBUF_138)
  );
  LUT6 #(
    .INIT ( 64'h4020402040214020 ))
  _n0173 (
    .I0(op_7_IBUF_31),
    .I1(op_6_IBUF_32),
    .I2(op_5_IBUF_33),
    .I3(op_4_IBUF_34),
    .I4(N14),
    .I5(op_3_IBUF_35),
    .O(_n0173_152)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh41 (
    .I0(b_0_IBUF_30),
    .I1(b_1_IBUF_29),
    .I2(a_5_IBUF_9),
    .I3(a_7_IBUF_7),
    .I4(a_6_IBUF_8),
    .I5(a_4_IBUF_10),
    .O(Sh4)
  );
  LUT6 #(
    .INIT ( 64'hFFFFD8A8D8A8D8A8 ))
  \y<15>6  (
    .I0(b_15_IBUF_15),
    .I1(\op[7]_GND_1_o_equal_57_o ),
    .I2(\op[7]_GND_1_o_equal_58_o ),
    .I3(Sh79),
    .I4(a_14_IBUF_0),
    .I5(\op[7]_PWR_1_o_equal_60_o ),
    .O(\y<15>7_485 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000004 ))
  \op[7]_PWR_1_o_equal_60_o<7>1  (
    .I0(op_3_IBUF_35),
    .I1(\op[7]_PWR_1_o_equal_60_o<7>1_391 ),
    .I2(op_6_IBUF_32),
    .I3(op_4_IBUF_34),
    .I4(op_5_IBUF_33),
    .I5(op_0_IBUF_38),
    .O(\op[7]_PWR_1_o_equal_60_o )
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  Sh12411 (
    .I0(b_2_IBUF_28),
    .I1(b_1_IBUF_29),
    .I2(b_0_IBUF_30),
    .I3(a_1_IBUF_13),
    .I4(a_0_IBUF_14),
    .I5(Sh101),
    .O(Sh1241)
  );
  LUT5 #(
    .INIT ( 32'h00004000 ))
  \op[7]_PWR_1_o_equal_63_o<7>1  (
    .I0(op_1_IBUF_37),
    .I1(op_0_IBUF_38),
    .I2(_n01731),
    .I3(op_7_IBUF_31),
    .I4(op_2_IBUF_36),
    .O(\op[7]_PWR_1_o_equal_63_o )
  );
  LUT4 #(
    .INIT ( 16'h8880 ))
  \y<1>21  (
    .I0(\op[7]_PWR_1_o_equal_65_o ),
    .I1(Sh79),
    .I2(out),
    .I3(out1_417),
    .O(\y<1>2_407 )
  );
  LUT5 #(
    .INIT ( 32'h88888880 ))
  \y<7>31  (
    .I0(\op[7]_PWR_1_o_equal_65_o ),
    .I1(Sh79),
    .I2(out),
    .I3(out1_417),
    .I4(b_3_IBUF_27),
    .O(\y<7>3_409 )
  );
  LUT6 #(
    .INIT ( 64'h8888888088808880 ))
  \y<5>31  (
    .I0(\op[7]_PWR_1_o_equal_65_o ),
    .I1(Sh79),
    .I2(out),
    .I3(out1_417),
    .I4(b_2_IBUF_28),
    .I5(b_3_IBUF_27),
    .O(\y<5>3_410 )
  );
  LUT6 #(
    .INIT ( 64'h8888888888888880 ))
  \y<14>41  (
    .I0(\op[7]_PWR_1_o_equal_65_o ),
    .I1(Sh79),
    .I2(out),
    .I3(out1_417),
    .I4(b_2_IBUF_28),
    .I5(b_3_IBUF_27),
    .O(\y<14>4 )
  );
  LUT6 #(
    .INIT ( 64'h1010101110101010 ))
  \y<12>11  (
    .I0(b_2_IBUF_28),
    .I1(b_3_IBUF_27),
    .I2(\op[7]_PWR_1_o_equal_63_o ),
    .I3(out),
    .I4(out1_417),
    .I5(\op[7]_PWR_1_o_equal_65_o ),
    .O(\y<12>1_405 )
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  F3 (
    .I0(op_4_IBUF_34),
    .I1(op_6_IBUF_32),
    .I2(op_7_IBUF_31),
    .I3(op_5_IBUF_33),
    .O(F3_427)
  );
  LUT6 #(
    .INIT ( 64'h0000000020000000 ))
  \y<3>2  (
    .I0(a_3_IBUF_11),
    .I1(op_2_IBUF_36),
    .I2(_n01731),
    .I3(op_1_IBUF_37),
    .I4(op_0_IBUF_38),
    .I5(op_7_IBUF_31),
    .O(\y<3>3 )
  );
  LUT4 #(
    .INIT ( 16'h0040 ))
  \y<3>12  (
    .I0(b_1_IBUF_29),
    .I1(b_2_IBUF_28),
    .I2(Sh79),
    .I3(b_0_IBUF_30),
    .O(\y<3>12_440 )
  );
  LUT5 #(
    .INIT ( 32'h00100000 ))
  \y<7>6  (
    .I0(b_2_IBUF_28),
    .I1(b_1_IBUF_29),
    .I2(b_3_IBUF_27),
    .I3(b_0_IBUF_30),
    .I4(Sh79),
    .O(\y<7>7_454 )
  );
  LUT5 #(
    .INIT ( 32'hFEAE5404 ))
  \y<12>3  (
    .I0(b_0_IBUF_30),
    .I1(a_12_IBUF_2),
    .I2(b_1_IBUF_29),
    .I3(a_10_IBUF_4),
    .I4(Sh1071),
    .O(\y<12>4_458 )
  );
  LUT5 #(
    .INIT ( 32'h00010000 ))
  \y<15>7  (
    .I0(b_3_IBUF_27),
    .I1(b_2_IBUF_28),
    .I2(b_1_IBUF_29),
    .I3(b_0_IBUF_30),
    .I4(Sh79),
    .O(\y<15>8_486 )
  );
  LUT5 #(
    .INIT ( 32'hFEAE5404 ))
  \y<14>8  (
    .I0(b_0_IBUF_30),
    .I1(a_14_IBUF_0),
    .I2(b_1_IBUF_29),
    .I3(a_12_IBUF_2),
    .I4(Sh1092),
    .O(\y<14>10_504 )
  );
  LUT6 #(
    .INIT ( 64'h888888888888F888 ))
  \y<13>1  (
    .I0(Sh13),
    .I1(\op[7]_PWR_1_o_equal_63_o ),
    .I2(\op[7]_PWR_1_o_equal_65_o ),
    .I3(Sh77),
    .I4(out),
    .I5(out1_417),
    .O(\y<13>1_513 )
  );
  LUT5 #(
    .INIT ( 32'hFEAE5404 ))
  \y<13>2  (
    .I0(b_0_IBUF_30),
    .I1(a_13_IBUF_1),
    .I2(b_1_IBUF_29),
    .I3(a_11_IBUF_3),
    .I4(Sh1091),
    .O(\y<13>2_514 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000080 ))
  \y<0>8  (
    .I0(op_1_IBUF_37),
    .I1(b_0_IBUF_30),
    .I2(_n01731),
    .I3(op_2_IBUF_36),
    .I4(op_7_IBUF_31),
    .I5(op_0_IBUF_38),
    .O(\y<0>8_527 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFF80FF80FF80 ))
  F9_SW0 (
    .I0(GND_1_o_c_add_12_OUT[15]),
    .I1(_n01882),
    .I2(op_5_IBUF_33),
    .I3(\y<15>4_413 ),
    .I4(\op[7]_GND_1_o_equal_47_o ),
    .I5(n0125[15]),
    .O(N78)
  );
  LUT6 #(
    .INIT ( 64'hDB995311CA884200 ))
  F9 (
    .I0(Sh79),
    .I1(b_15_IBUF_15),
    .I2(\a[15]_b[15]_sub_18_OUT<15> ),
    .I3(_n0196_153),
    .I4(F8_432),
    .I5(N78),
    .O(F_OBUF_156)
  );
  LUT6 #(
    .INIT ( 64'hFFFF544454445444 ))
  \y<6>9_SW0_SW0  (
    .I0(a_6_IBUF_8),
    .I1(\op[7]_GND_1_o_equal_59_o ),
    .I2(b_6_IBUF_24),
    .I3(\op[7]_GND_1_o_equal_58_o ),
    .I4(\y<14>2_389 ),
    .I5(n0125[6]),
    .O(N80)
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  \y<6>9_SW0  (
    .I0(N80),
    .I1(_n0188_154),
    .I2(\a[15]_b[15]_add_0_OUT<6> ),
    .I3(a_5_IBUF_9),
    .I4(\op[7]_PWR_1_o_equal_60_o ),
    .O(N50)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000040 ))
  \op[7]_PWR_1_o_equal_64_o<7>1  (
    .I0(op_3_IBUF_35),
    .I1(\op[7]_PWR_1_o_equal_60_o<7>1_391 ),
    .I2(op_0_IBUF_38),
    .I3(op_6_IBUF_32),
    .I4(op_4_IBUF_34),
    .I5(op_5_IBUF_33),
    .O(\op[7]_PWR_1_o_equal_64_o )
  );
  LUT4 #(
    .INIT ( 16'hABAA ))
  \y<3>11  (
    .I0(\op[7]_PWR_1_o_equal_63_o ),
    .I1(out),
    .I2(out1_417),
    .I3(\op[7]_PWR_1_o_equal_65_o ),
    .O(\y<2>23 )
  );
  LUT5 #(
    .INIT ( 32'hAAAA0008 ))
  \y<3>4_SW0  (
    .I0(Sh7),
    .I1(\op[7]_PWR_1_o_equal_65_o ),
    .I2(out),
    .I3(out1_417),
    .I4(\op[7]_PWR_1_o_equal_63_o ),
    .O(N54)
  );
  LUT6 #(
    .INIT ( 64'h5755555502000000 ))
  \y<14>11  (
    .I0(op_0_IBUF_38),
    .I1(out),
    .I2(out1_417),
    .I3(_n01731),
    .I4(\op[7]_PWR_1_o_equal_60_o<7>1_391 ),
    .I5(\op[7]_PWR_1_o_equal_61_o<7>1 ),
    .O(\y<14>1_387 )
  );
  MUXF7   \y<12>9  (
    .I0(N82),
    .I1(N83),
    .S(a_12_IBUF_2),
    .O(\y<12>10 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFA8FFA8FFA8 ))
  \y<12>9_F  (
    .I0(b_12_IBUF_18),
    .I1(\op[7]_GND_1_o_equal_58_o ),
    .I2(\op[7]_GND_1_o_equal_57_o ),
    .I3(\op[7]_GND_1_o_equal_59_o ),
    .I4(\op[7]_PWR_1_o_equal_60_o ),
    .I5(a_11_IBUF_3),
    .O(N82)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFBEAFBEAFBEA ))
  \y<12>9_G  (
    .I0(\op[7]_GND_1_o_equal_57_o ),
    .I1(b_12_IBUF_18),
    .I2(\op[7]_GND_1_o_equal_56_o ),
    .I3(\op[7]_GND_1_o_equal_58_o ),
    .I4(\op[7]_PWR_1_o_equal_60_o ),
    .I5(a_11_IBUF_3),
    .O(N83)
  );
  MUXF7   \y<7>10  (
    .I0(N84),
    .I1(N85),
    .S(b_2_IBUF_28),
    .O(\y<7>11_456 )
  );
  LUT5 #(
    .INIT ( 32'h55404040 ))
  \y<7>10_F  (
    .I0(b_3_IBUF_27),
    .I1(Sh103),
    .I2(\y<14>1_387 ),
    .I3(\y<2>23 ),
    .I4(Sh7),
    .O(N84)
  );
  LUT5 #(
    .INIT ( 32'h55404040 ))
  \y<7>10_G  (
    .I0(b_3_IBUF_27),
    .I1(Sh35),
    .I2(\y<14>1_387 ),
    .I3(\y<2>23 ),
    .I4(Sh11),
    .O(N85)
  );
  MUXF7   \y<6>12  (
    .I0(N86),
    .I1(N87),
    .S(b_2_IBUF_28),
    .O(\y<6>12_509 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFAA20AA20AA20 ))
  \y<6>12_F  (
    .I0(Sh6),
    .I1(_n0168),
    .I2(\op[7]_PWR_1_o_equal_65_o ),
    .I3(\op[7]_PWR_1_o_equal_63_o ),
    .I4(\y<14>1_387 ),
    .I5(Sh102),
    .O(N86)
  );
  LUT6 #(
    .INIT ( 64'hFFFFAA20AA20AA20 ))
  \y<6>12_G  (
    .I0(Sh10),
    .I1(_n0168),
    .I2(\op[7]_PWR_1_o_equal_65_o ),
    .I3(\op[7]_PWR_1_o_equal_63_o ),
    .I4(\y<14>1_387 ),
    .I5(Sh34),
    .O(N87)
  );
  MUXF7   \y<1>33  (
    .I0(N88),
    .I1(N89),
    .S(b_0_IBUF_30),
    .O(\y<1>33_539 )
  );
  LUT6 #(
    .INIT ( 64'hF4F4F40000F40000 ))
  \y<1>33_F  (
    .I0(_n0168),
    .I1(\op[7]_PWR_1_o_equal_65_o ),
    .I2(\op[7]_PWR_1_o_equal_63_o ),
    .I3(b_1_IBUF_29),
    .I4(a_13_IBUF_1),
    .I5(Sh79),
    .O(N88)
  );
  LUT6 #(
    .INIT ( 64'h44E400E044440040 ))
  \y<1>33_G  (
    .I0(b_1_IBUF_29),
    .I1(a_14_IBUF_0),
    .I2(\op[7]_PWR_1_o_equal_65_o ),
    .I3(_n0168),
    .I4(\op[7]_PWR_1_o_equal_63_o ),
    .I5(Sh79),
    .O(N89)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

