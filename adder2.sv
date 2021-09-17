module adder2 ( input Clk, Reset_Clear, Run_Accumulate, 
					input [9:0] SW,
				output logic [9:0] LED,
				output logic [6:0] HEX0, 
										 HEX1, 
										 HEX2, 
										 HEX3, 
										 HEX4,
										 HEX5,
				output logic [16:0] OP1, Output, S_output, OP2//output added for test purposes, might have to be deleted
										 );

		// Declare temporary values used by other modules
		logic Reset_h, Run_h;
		logic Load;
		logic [16:0] In, Out;
		logic [16:0] S;
		logic [16:0] extended_SW;
		
		//assign extended_SW = {6'b000000, SW}; //uncomment this when working with the fpga board
		
		//uncomment this block when working with the test bench

		assign extended_SW = 16'h0003; 
		assign OP1 = extended_SW;
		assign Output = Out;
		assign S_output = S;
		assign OP2 = 16'h0003;
		//assign Out = 16'h0003;
		
		// Misc logic that inverts button presses and ORs the Load and Run signal
		always_comb	
		begin
				Reset_h = ~Reset_Clear;
				Run_h = ~Run_Accumulate;

		end
		
		// Control unit allows the register to load once, and not during full duration of button press
		control run_once ( .*, .Reset(Reset_h), .Run(Run_h), .Run_O(Load));
		
		// Router is mux that puts either sum of A and B or B into register
		router route ( .R(Load), .A_In(extended_SW[15:0]), .B_In(S[16:0]), .Q_Out(In[16:0]) );
		
		// Regist unit that holds value of one operator
		reg_17 reg_unit	( .*, .Reset(Reset_h), .Load(Load), .D(In[16:0]), .Data_Out(Out[16:0]));

		// Addition unit

//		ripple_adder adder		(.A(extended_SW[15:0]), .B(Out[15:0]), .cin(1'b0), .cout(S[16]), .S(S[15:0]) );//this one should work
		ripple_adder adder		(.A(extended_SW[15:0]), .B(OP2[15:0]), .cin(1'b0), .cout(S[16]), .S(S[15:0]) );//dummy
		
		//lookahead_adder adderla	(.A(extended_SW[15:0]), .B(Out[15:0]), .cin(1'b0), .cout(S[16]), .S(S[15:0]) );
//		lookahead_adder adderla	(.A(extended_SW[15:0]), .B(OP2[15:0]), .cin(1'b0), .cout(S[16]), .S(S[15:0]) );//dummy
		
//		select_adder adders	(.A(extended_SW[15:0]), .B(Out[15:0]), .cin(1'b0), .cout(S[16]), .S(S[15:0]) );
//select_adder adders	(.A(extended_SW[15:0]), .B(OP2[15:0]), .cin(1'b0), .cout(S[16]), .Sum(S[15:0]) );//dummy


		// Hex units that display contents of SW and register R in hex
		HexDriver		AHex0 (
								.In0(SW[3:0]),
								.Out0(HEX0) );
								
		HexDriver		AHex1 (
								.In0(SW[7:4]),
								.Out0(HEX1) );
								
		HexDriver		BHex0 (
								.In0(Out[3:0]),
								.Out0(HEX2) );
								
		HexDriver		BHex1 (
								.In0(Out[7:4]),
								.Out0(HEX3) );
		
		HexDriver		BHex2 (
								.In0(Out[11:8]),
								.Out0(HEX4) );
								
		HexDriver		BHex3 (
								.In0(Out[15:12]),
								.Out0(HEX5) );
								
		
		assign LED[1:0] = SW[9:8];
		assign LED[9] = Out[16];
		assign LED[8:2] = 7'h00;
		
endmodule 