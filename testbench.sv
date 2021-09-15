module testbench();

	timeunit 10ns;
	timeprecision 1ns;
	
	logic Clk, Reset_Clear, Run_Accumulate; 
	logic [9:0] SW; //Not neccessary since for test benches, SW will be hardwired
	logic [9:0] LED;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [16:0] OP1, Output, S_output, OP2; // might have to remove these later
	
	adder2 adder2_0(.*);
	
	always begin : CLOCK_GENERATION
	#1 Clk = ~Clk;
	end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

	
//Begin the testing
initial begin: RIPPLE_ADDER
	
Reset_Clear = 0;
Run_Accumulate = 0;
	
//#22 Reset_Clear = 1;
//
//#22 Reset_Clear = 0;

#22 Run_Accumulate = 1;

#22 Run_Accumulate = 0;

#22 Run_Accumulate = 1;

#22 Run_Accumulate = 0;

//#22 Reset_Clear = 1;
//
//#22 Reset_Clear = 0;

#22 Run_Accumulate = 1;

#22 Run_Accumulate = 0;

#22 Run_Accumulate = 1;

#22 Run_Accumulate = 0;
	
<<<<<<< HEAD
	
	
=======
	
	ripple_adder RA (.A(A), .B(B), .Sum(Sum_RC),  .CO(CO_RC));
		
	//Begin the testing
	initial begin
	
	
		A = 16'h3333;
		B = 16'h4444;
		$display(Sum_RC); 
		
		#30
		A = 16'h1111;
		B = 16'h2222;
		$display(Sum_RC); 
>>>>>>> cd72b12243db2d3626ba75f4045ada2426ba1108
		
	end
	

endmodule 