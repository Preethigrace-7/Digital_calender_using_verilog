`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:44:35 07/14/2023 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
// Code your design here
module DigitalCalendar (
  input wire clk,  
  input wire reset, 
  output wire [6:0] year,   // 7-bit output for year (0-99)
  output wire [4:0] month,  // 4-bit output for month (1-12)
  output wire [4:0] day     // 5-bit output for day (1-31)
);

  reg [6:0] count_year;   
  reg [4:0] count_month;  
  reg [4:0] count_day;    

  always @(posedge clk or posedge reset) 
	 begin//1
    if (reset) 
	 begin
      count_year <= 7'd1;    // Initialize year counter to 1
      count_month <= 5'd1;   // Initialize month counter to 1
      count_day <= 5'd1;     // Initialize day counter to 1
    end 
	 else 
		begin
/*if(count_year/400==0 || (count_year/4==0 && count_year/100 !=0))
begin
if(count_month==2)
			begin
			if (count_day == 5'd29) 
				begin
				count_day <= 5'd1;   
				if (count_month == 4'd12) 
					begin
					count_month <= 5'd1;   
					count_year <= count_year + 7'd1;   
					end 
				else 
					begin
					count_month <= count_month + 5'd1;   
					end
            end
			else 
				begin
				count_day <= count_day + 5'd1;   
				end
		   end
end
else*/
begin
//for 31days 
		if(count_month<=7 && count_month%2 !=0 || count_month>7 && count_month%2 == 0)
			begin
			if (count_day == 5'd31) 
				begin
				count_day <= 5'd1;   
				if (count_month == 4'd12) 
					begin
					count_month <= 5'd1;   
					count_year <= count_year + 7'd1;   
					end 
				else 
					begin
					count_month <= count_month + 5'd1;   
					end
            end
			else 
				begin
				count_day <= count_day + 5'd1;   
				end
		   end

//for feb 28 days

else if(count_month==2)
			begin
			if (count_day == 5'd28) 
				begin
				count_day <= 5'd1;   
				if (count_month == 4'd12) 
					begin
					count_month <= 5'd1;   
					count_year <= count_year + 7'd1;   
					end 
				else 
					begin
					count_month <= count_month + 5'd1;   
					end
            end
			else 
				begin
				count_day <= count_day + 5'd1;   
				end
		   end
		
//for 30days
else if(count_month<=7 && count_month%2 ==0 || count_month>7 && count_month%2 != 0)
			begin
			if (count_day == 5'd30) 
				begin
				count_day <= 5'd1;   
				if (count_month == 4'd12) 
					begin
					count_month <= 5'd1;   
					count_year <= count_year + 7'd1;   
					end 
				else 
					begin
					count_month <= count_month + 5'd1;  
					end
            end
			else 
				begin
				count_day <= count_day + 5'd1;  
				end
		   end				
end
end
end
  assign year = count_year;
  assign month = count_month;
  assign day = count_day;

endmodule

