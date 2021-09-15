module testbench();

	timeunit 10ns;
	timeprecision 1ns;
	
	logic [15:0] A;
	logic [15:0] B;
	logic [15:0] Sum_RC;
	logic CO_RC;
	
	
	
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
		
	end
	

endmodule 