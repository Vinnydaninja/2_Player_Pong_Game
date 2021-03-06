`timescale 1ns / 1ps

//******************************************************************//
//  File Name:  AISO.v                                              //
//                                                                  //
//  Created by Vince Nguyen on September 19th, 2019.                //
//  Revised by Vince Nguyen on October 15th, 2019.                  //
//  Copyright © 2019 Vince Nguyen.  All rights reserved.            //
//                                                                  //
//                                                                  //
//  This file is an asynchronous in, synchronous out (AISO) module  //
//  that will synchronously reset all other modules to a known      //
//  state whenever the input "rst" is asserted.                     //
//******************************************************************//


module AISO(
    input   clk,
    input   rst,
    output  Reset_S
    );
    
    reg    Qok, Qmeta;
    
    assign  Reset_S = ~Qok;
    
    always @(posedge clk, posedge rst)
        if(rst)
            Qmeta <= 1'b0;
        else
            Qmeta <= 1'b1;
    
    always @(posedge clk)
        Qok <= Qmeta;
endmodule
