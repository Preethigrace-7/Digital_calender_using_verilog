`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:45:18 07/14/2023
// Design Name:   DigitalCalendar
// Module Name:   E:/Digital_calender_MP/tb.v
// Project Name:  Digital_calender_MP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DigitalCalendar
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DigitalCalendar_TB;

  reg clk;
  reg reset;
  wire [6:0] year;
  wire [4:0] month;
  wire [4:0] day;

  DigitalCalendar dut (
    .clk(clk),
    .reset(reset),
    .year(year),
    .month(month),
    .day(day)
  );

    initial clk= 0;
    always #5 clk = ~clk;  

    initial begin
        reset = 1;
        #10;
        reset = 0; 
		  #100;
		  clk = 1;
		  #10;
		  reset=1;
		  #20;
		  reset=0;
		  #20;
    end

endmodule


