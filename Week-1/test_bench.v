`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 06:21:09 PM
// Design Name: 
// Module Name: test_bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_bench(

    );
    reg above_25_0, above_30_0, low_level_0;
    reg above_25_1, above_30_1, low_level_1;
    reg select_vat_1;
    wire buzzer;
    
    buzzer_controller buzzer_1(buzzer,
        above_25_0, above_30_0, low_level_0,
        above_25_1, above_30_1, low_level_1,
        select_vat_1);
        
        initial
            begin
            above_25_0 = 1'b1;
            above_30_0 = 1'b0;
            low_level_0 = 1'b0;
            above_25_1 = 1'b1;
            above_30_1 = 1'b0;
            low_level_1 = 1'b0;
            select_vat_1 = 1'b0;
            
            #20 above_25_0 = 1'b0;
            
            #20 above_30_0 = 1'b1;
                above_25_0 = 1'b1;
            #20 select_vat_1 = 1'b1;
            #20 $finish;
            end
    
endmodule
