module music_box2(
				input clk,
				input clr,
				output speaker
    );

//	reg[14:0] clkdivider;
//	initial begin
//		clkdivider = 25000000/443/2; // play 440hz A note
//	end
	wire[63:0] clkdivider;
	song_fsm sfsm(clk, clr, clkdivider);
	music msc(clk, clr, clkdivider, speaker);

endmodule


module song_fsm(
			input clk,
			input clr,
			output reg[63:0] clkdivider
    );

initial begin
	clk_div_pulse = 0;
	clk_div_count = 0;
	PS = State0;
end

// ***** 1 second clock divider *****
 reg[24:0] clk_div_count; // count up to 
 reg clk_div_pulse;
 
 always@(posedge clk) begin
		if(clr) begin
			clk_div_pulse <= 0;
			clk_div_count <= 0;
		end
		
		else if(clk_div_count >= 25'b1000000000000000000000000) begin
			clk_div_pulse <= 1;
			clk_div_count <= 0;
		end
		
		else begin
			clk_div_pulse <= 0;
			clk_div_count <= clk_div_count + 1;
		end
	end
 
 // *** Each state for a note ***
	parameter State0 = 0;	parameter State1 = 1;
	parameter State2 = 2; parameter State3 = 3; 
	parameter State4 = 4; parameter State5 = 5;
	parameter State6 = 6; parameter State7 = 7; 
	parameter State8 = 8;  	parameter State9 = 9; 
	parameter State10 = 10; parameter State11 = 11; 
	parameter State12 = 12; parameter State13 = 13; 
	parameter State14 = 14; parameter State15 = 15; 
	parameter State16 = 16; parameter State17 = 17; 
	parameter State18 = 18; parameter State19 = 19; 
	parameter State20 = 20; parameter State21 = 21; 
	parameter State22 = 22; parameter State23 = 23; 
	parameter State24 = 24; parameter State25 = 25; 
	parameter State26 = 26; parameter State27 = 27; 
	parameter State28 = 28; parameter State29 = 29; 
	parameter State30 = 30; parameter State31 = 31;
	
	parameter State32 = 32;	parameter State33 = 33;
	parameter State34 = 34;  parameter State35 = 35; 
	parameter State36 = 36;  parameter State37 = 37;
	parameter State38 = 38;  parameter State39 = 39; 
	parameter State40 = 40;  parameter State41 = 41; 
	parameter State42 = 42; parameter State43 = 43; 
	parameter State44 = 44; parameter State45 = 45; 
	parameter State46 = 46; parameter State47 = 47; 
	parameter State48 = 48; parameter State49 = 49; 
	parameter State50 = 50; parameter State51 = 51; 
	parameter State52 = 52; parameter State53 = 53; 
	parameter State54 = 54; parameter State55 = 55; 
	parameter State56 = 56; parameter State57 = 57; 
	parameter State58 = 58; parameter State59 = 59; 
	parameter State60 = 60; parameter State61 = 61; 
	
	parameter State62 = 62;	parameter State63 = 63;
	parameter State64 = 64;  parameter State65 = 65; 
	parameter State66 = 66;  parameter State67 = 67;
	parameter State68 = 68;  parameter State69 = 69; 
	parameter State70 = 70;  parameter State71 = 71; 
	parameter State72 = 72; parameter State73 = 73; 
	parameter State74 = 74; parameter State75 = 75; 
	parameter State76 = 76; parameter State77 = 77; 
	parameter State78 = 78; parameter State79 = 79; 
	parameter State80 = 80; parameter State81 = 81; 
	parameter State82 = 82; parameter State83 = 83; 
	parameter State84 = 84; parameter State85 = 85; 
	parameter State86 = 86; parameter State87 = 87; 
	parameter State88 = 88; parameter State89 = 89; 
	parameter State90 = 90; parameter State91 = 91; 
	
	parameter State92 = 92;	parameter State93 = 93;
	parameter State94 = 94;  parameter State95 = 95; 
	parameter State96 = 96;  parameter State97 = 97;
	parameter State98 = 98;  parameter State99 = 99; 
	parameter State100 = 100;  parameter State101 = 101; 
	parameter State102 = 102; parameter State103 = 103; 
	parameter State104 = 104; parameter State105 = 105; 
	parameter State106 = 106; parameter State107 = 107; 
	parameter State108 = 108; parameter State109 = 109; 
	parameter State110 = 110; parameter State111 = 111; 
	parameter State112 = 112; parameter State113 = 113; 
	parameter State114 = 114; parameter State115 = 115; 
	parameter State116 = 116; parameter State117 = 117; 
	parameter State118 = 118; parameter State119 = 119; 
	parameter State120 = 120; parameter State121 = 121; 
	
	parameter State122 = 122; parameter State123 = 123; 
	parameter State124 = 124; parameter State125 = 125; 
	parameter State126 = 126; parameter State127 = 127; 
	parameter State128 = 128; parameter State129 = 129; 
	parameter State130 = 130; parameter State131 = 131; 
	parameter State132 = 132; parameter State133 = 133; 
	parameter State134 = 134; parameter State135 = 135; 
	parameter State136 = 136; parameter State137 = 137; 
	parameter State138 = 138; parameter State139 = 139; 
	parameter State140 = 140; parameter State141 = 141;
	
	parameter State142 = 142; parameter State143 = 143; 
	parameter State144 = 144; parameter State145 = 145; 
	parameter State146 = 146; parameter State147 = 147; 
	parameter State148 = 148; parameter State149 = 149; 
	parameter State150 = 150; parameter State151 = 151; 
	parameter State152 = 152; parameter State153 = 153; 
	parameter State154 = 154; parameter State155 = 155; 
	parameter State156 = 156; parameter State157 = 157; 
	parameter State158 = 158; parameter State159 = 159; 
	parameter State160 = 160; parameter State161 = 161;
	
	parameter State162 = 162; parameter State163 = 163; 
	parameter State164 = 164; parameter State165 = 165; 
	parameter State166 = 166; parameter State167 = 167; 
	parameter State168 = 168; parameter State169 = 169; 
	parameter State170 = 170; parameter State171 = 171; 
	parameter State172 = 172; parameter State173 = 173; 
	parameter State174 = 174; parameter State175 = 175; 
	parameter State176 = 176; parameter State177 = 177; 
	parameter State178 = 178; parameter State179 = 179;
	parameter State180 = 180; parameter StatePause = 181;

	
	
	reg[8:0] PS;
	reg[8:0] NS;
	
	// Present state
	always@(posedge clk_div_pulse) begin
	if (clr)
		PS <= StatePause;
	else
		PS <= NS;
	end
	
	// Next state
	always@(PS) begin
	// A State for each note that will be played
		case(PS)
			State0 : NS = State1;
			State1 : NS = State2;
			State2 : NS = State3;
			State3 : NS = State4;
			State4 : NS = State5;
			State5 : NS = State6;
			State6 : NS = State7;
			State7 : NS = State8; 
			State8 : NS = State9;
			State9 : NS = State10;
			State10 : NS = State11;
			State11 : NS = State12;
			State12 : NS = State13;
			State13 : NS = State14;
			State14 : NS = State15; 
			State15 : NS = State16;
		   State16 : NS = State17;
			
			State17 : NS = State18;
			State18 : NS = State19;
			State19 : NS = State20;
			State20 : NS = State21;
			State21 : NS = State22;
			State22 : NS = State23;
			State23 : NS = State24;
			State24 : NS = State25; 
			State25 : NS = State26;
			State26 : NS = State27;
			State27 : NS = State28;
			State28 : NS = State29;
			State29 : NS = State30;
			State30 : NS = State31;
			State31 : NS = State32;
			State32 : NS = State33;
			
			State33 : NS = State34;
			State34 : NS = State35;
			State35 : NS = State36;
			State36 : NS = State37;
			State37 : NS = State38;
			State38 : NS = State39;
			State39 : NS = State40;
			State40 : NS = State41; 
			State41 : NS = State42;
			State42 : NS = State43;
			State43 : NS = State44;
			State44 : NS = State45;
			State45 : NS = State46;
			State46 : NS = State47;
			State47 : NS = State48;
			State48 : NS = State49;
			
			State49 : NS = State50;
			State50 : NS = State51;
			State51 : NS = State52;
			State52 : NS = State53;
			State53 : NS = State54;
			State54 : NS = State55;
			State55 : NS = State56;
			State56 : NS = State57; 
			State57 : NS = State58;
			State58 : NS = State59;
			State59 : NS = State60;
			State60 : NS = State61;
			State61 : NS = State62;
			State62 : NS = State63;
			State63 : NS = State64;
			State64 : NS = State65;
			
			State65 : NS = State66;
			State66 : NS = State67;
			State67 : NS = State68;
			State68 : NS = State69;
			State69 : NS = State70;
			State70 : NS = State71;
			State71 : NS = State72;
			State72 : NS = State73; 
			State73 : NS = State74;
			State74 : NS = State75;
			State75 : NS = State76;
			State76 : NS = State77;
			State77 : NS = State78;
			State78 : NS = State79;
			State79 : NS = State80;
			State80 : NS = State81;
			
			State81 : NS = State82;
			State82 : NS = State83;
			State83 : NS = State84;
			State84 : NS = State85;
			State85 : NS = State86;
			State86 : NS = State87;
			State87 : NS = State88;
			State88 : NS = State89; 
			State89 : NS = State90;
			State90 : NS = State91;
			State91 : NS = State92;
			State92 : NS = State93;
			State93 : NS = State94;
			State94 : NS = State95;
			State95 : NS = State96;
			State96 : NS = State97;
			State97 : NS = State98;
			State98 : NS = State99;
			State99 : NS = State100;
			State100 : NS = State101;
			
			State101 : NS = State102;
			State102 : NS = State103;
			State103 : NS = State104;
			State104 : NS = State105;
			State105 : NS = State106;
			State106 : NS = State107;
			State107 : NS = State108;
			State108 : NS = State109;
			State109 : NS = State110;
			State110 : NS = State111;
			State111 : NS = State112;
			State112 : NS = State113;
			
			State113 : NS = State114;
			State114 : NS = State115;
			State115 : NS = State116;
			State116 : NS = State117;
			State117 : NS = State118;
			State118 : NS = State119;
			State119 : NS = State120;
			State120 : NS = State121;
			State121 : NS = State122;
			State122 : NS = State123;
			State123 : NS = State124;
			State124 : NS = State125;
			
			State125 : NS = State126;
			State126 : NS = State127;
			State127 : NS = State128;
			State128 : NS = State129;
			State129 : NS = State130;
			State130 : NS = State131;
			State131 : NS = State132;
			State132 : NS = State133;
			State133 : NS = State134;
			State134 : NS = State135;
			State135 : NS = State136;
			State136 : NS = State137;
			
			State125 : NS = State126;
			State126 : NS = State127;
			State127 : NS = State128;
			State128 : NS = State129;
			State129 : NS = State130;
			State130 : NS = State131;
			State131 : NS = State132;
			State132 : NS = State133;
			State133 : NS = State134;
			State134 : NS = State135;
			State135 : NS = State136;
			State136 : NS = State137;
			
			State137 : NS = State138;
			State138 : NS = State139;
			State139 : NS = State140;
			State140 : NS = State141;
			State141 : NS = State142;
			State142 : NS = State143;
			State143 : NS = State144;
			State144 : NS = State145;
			State145 : NS = State146;
			State146 : NS = State147;
			State147 : NS = State148;
			State148 : NS = State149;
			
			State149 : NS = State150;
			State150 : NS = State151;
			State151 : NS = State152;
			State152 : NS = State153;
			State153 : NS = State154;
			State154 : NS = State155;
			State155 : NS = State156;
			State156 : NS = State157;
			State157 : NS = State158;
			State158 : NS = State159;
			State159 : NS = State160;
			State160 : NS = State161;
			
			State161 : NS = State162;
			State162 : NS = State163;
			State163 : NS = State164;
			State164 : NS = State165;
			State165 : NS = State166;
			State166 : NS = State167;
			State167 : NS = State168;
			State168 : NS = State169;
			State169 : NS = State170;
			State170 : NS = State171;
			State171 : NS = State172;
			State172 : NS = State173;
			
			State173 : NS = State174;
			State174 : NS = State175;
			State175 : NS = State176;
			State176 : NS = State177;
			State177 : NS = State178;
			State178 : NS = State179;
			State179 : NS = State180;
			State180 : NS = State0;
			
			default : NS = StatePause;
		endcase
	end
	
	// *** NOTES***
	parameter c_note = 100000000/131/2;
	parameter d_note = 100000000/147/2;
	parameter e_note = 100000000/165/2;
	parameter f_note = 100000000/175/2;
	parameter g_note = 100000000/196/2;
	parameter pause =  2;	
	// output
	always@(*) begin
		case(PS)
		 //Output come from formula 100000000/note_hz/2
			State0 : clkdivider = e_note;
			State1 : clkdivider = e_note;
			State2 : clkdivider = pause;
			State3 : clkdivider = e_note;
			State4 : clkdivider = e_note;
			State5 : clkdivider = pause;
			State6 : clkdivider = e_note;
			State7 : clkdivider = e_note;
			State8 : clkdivider = e_note;
			State9 : clkdivider = e_note;
			State10: clkdivider = pause;

			State11 : clkdivider = e_note;
			State12 : clkdivider = e_note;
			State13 : clkdivider = pause;
			State14 : clkdivider = e_note;
			State15 : clkdivider = e_note;
			State16 : clkdivider = pause;
			State17 : clkdivider = e_note;
			State18 : clkdivider = e_note;
			State19 : clkdivider = e_note;
			State20 : clkdivider = e_note;
			State21 : clkdivider = pause;

			State22 : clkdivider = e_note;
			State23 : clkdivider = e_note;
			State24 : clkdivider = pause;
			State25 : clkdivider = g_note;
			State26 : clkdivider = g_note;
			State27 : clkdivider = pause;
			State28 : clkdivider = c_note;
			State29 : clkdivider = c_note;
			State30 : clkdivider = pause;
			State31 : clkdivider = d_note;
			State32 : clkdivider = d_note;
			State33 : clkdivider = pause;

			State34 : clkdivider = e_note;
			State35 : clkdivider = e_note;
			State36 : clkdivider = e_note;
			State37 : clkdivider = e_note;
			State38 : clkdivider = e_note;
			State39 : clkdivider = e_note;
			State40 : clkdivider = e_note;
			State41 : clkdivider = e_note;
			State42 : clkdivider = pause;

			State43 : clkdivider = f_note;
			State44 : clkdivider = f_note;
			State45 : clkdivider = pause;
			State46 : clkdivider = f_note;
			State47 : clkdivider = f_note;
			State48 : clkdivider = pause;
			State50 : clkdivider = f_note;
			State51 : clkdivider = f_note;
			State52 : clkdivider = pause;
			State53 : clkdivider = f_note;
			State54 : clkdivider = f_note;
			State55 : clkdivider = pause;

			State56 : clkdivider = f_note;
			State57 : clkdivider = f_note;
			State58 : clkdivider = pause;
			State59 : clkdivider = e_note;
			State60 : clkdivider = e_note;
			State61 : clkdivider = pause;
			State62 : clkdivider = e_note;
			State63 : clkdivider = e_note;
			State64 : clkdivider = pause;
			State65 : clkdivider = e_note;
			State66 : clkdivider = pause;
			State67 : clkdivider = e_note;
			State68 : clkdivider = pause;

			State69 : clkdivider = e_note;
			State70 : clkdivider = e_note;
			State71 : clkdivider = pause;
			State72 : clkdivider = d_note;
			State73 : clkdivider = d_note;
			State74 : clkdivider = pause;
			State75 : clkdivider = d_note;
			State76 : clkdivider = d_note;
			State77 : clkdivider = pause;
			State78 : clkdivider = e_note;
			State79 : clkdivider = e_note;
			State80 : clkdivider = pause;

			State81 : clkdivider = d_note;
			State82 : clkdivider = d_note;
			State83 : clkdivider = d_note;
			State84 : clkdivider = d_note;
			State85 : clkdivider = pause;
			State86 : clkdivider = g_note;
			State87 : clkdivider = g_note;
			State88 : clkdivider = pause;
			State89 : clkdivider = pause;
			State90 : clkdivider = pause;

			// *** Second Part ***
			State91 : clkdivider = e_note;
			State92 : clkdivider = e_note;
			State93 : clkdivider = pause;
			State94 : clkdivider = e_note;
			State95 : clkdivider = e_note;
			State96 : clkdivider = pause;
			State97 : clkdivider = e_note;
			State98 : clkdivider = e_note;
			State99 : clkdivider = e_note;
			State100 : clkdivider = e_note; //Error here
			State101: clkdivider = pause;

			State102 : clkdivider = e_note;
			State103 : clkdivider = e_note;
			State104 : clkdivider = pause;
			State105 : clkdivider = e_note;
			State106 : clkdivider = e_note;
			State107 : clkdivider = pause;
			State108 : clkdivider = e_note;
			State109 : clkdivider = e_note;
			State110 : clkdivider = e_note;
			State111 : clkdivider = e_note;
			State112 : clkdivider = pause;

			State113 : clkdivider = e_note;
			State114 : clkdivider = e_note;
			State115 : clkdivider = pause;
			State116 : clkdivider = g_note;
			State117 : clkdivider = g_note;
			State118 : clkdivider = pause;
			State119 : clkdivider = c_note;
			State120 : clkdivider = c_note;
			State121 : clkdivider = pause;
			State122 : clkdivider = d_note;
			State123 : clkdivider = d_note;
			State124 : clkdivider = pause;

			State125 : clkdivider = e_note;
			State126 : clkdivider = e_note;
			State127 : clkdivider = e_note;
			State128 : clkdivider = e_note;
			State129 : clkdivider = e_note;
			State130 : clkdivider = e_note;
			State131 : clkdivider = e_note;
			State132 : clkdivider = e_note;
			State133 : clkdivider = pause;

			State134 : clkdivider = f_note;
			State135 : clkdivider = f_note;
			State136 : clkdivider = pause;
			State137 : clkdivider = f_note;
			State138 : clkdivider = f_note;
			State139 : clkdivider = pause;
			State140 : clkdivider = f_note;
			State141 : clkdivider = f_note;
			State142 : clkdivider = pause;
			State143 : clkdivider = f_note;
			State144 : clkdivider = f_note;
			State145 : clkdivider = pause;

			State146 : clkdivider = f_note;
			State147 : clkdivider = f_note;
			State148 : clkdivider = pause;
			State149 : clkdivider = e_note;
			State150 : clkdivider = e_note;
			State151 : clkdivider = pause;
			State152 : clkdivider = e_note;
			State153 : clkdivider = e_note;
			State154 : clkdivider = pause;
			State155 : clkdivider = e_note;
			State156 : clkdivider = pause;
			State157 : clkdivider = e_note;
			State158 : clkdivider = pause;

			State159 : clkdivider = g_note;
			State160 : clkdivider = g_note;
			State161 : clkdivider = pause;
			State162 : clkdivider = g_note;
			State163 : clkdivider = g_note;
			State164 : clkdivider = pause;
			State165 : clkdivider = f_note;
			State166 : clkdivider = f_note;
			State167 : clkdivider = pause;
			State168 : clkdivider = d_note;
			State169 : clkdivider = d_note;
			State170 : clkdivider = pause;

			State171 : clkdivider = c_note;
			State172 : clkdivider = c_note;
			State173 : clkdivider = c_note;
			State174 : clkdivider = c_note;
			State175 : clkdivider = c_note;
			State176 : clkdivider = c_note;
			State177 : clkdivider = c_note;
			State178 : clkdivider = c_note;
			State179 : clkdivider = pause;
			State180 : clkdivider = pause;
			default : clkdivider = 2; // Standby if not in the song
		endcase
	end


endmodule

module music(
    input clk,
    input clr,
    input [63:0] clkdivider,
    output reg speaker
    );
   
   
    initial begin
        speaker = 0;
    end
   
    // ***** PLAY THE NOTE ******
    reg [63:0] counter;
    always @(posedge clk)begin
        if(clr) begin
            counter <= 0;
            speaker <=0;
        end
        else if(counter >= clkdivider) begin
			counter <= 0;
			speaker <= ~speaker;
		end
		else begin
			counter <= counter+1;
			speaker <= speaker;
		end
	end

endmodule

// UCF FILE
/*
NET "clk" LOC = V10;
NET "clr" LOC = B8;

NET "clk" IOSTANDARD = LVCMOS33;
NET "clr" IOSTANDARD = LVCMOS33;

NET "speaker" LOC = P11;
NET "speaker" IOSTANDARD = LVCMOS33;
*/
