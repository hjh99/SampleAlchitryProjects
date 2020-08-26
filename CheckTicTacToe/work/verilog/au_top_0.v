/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_btn_cond_out;
  reg [1-1:0] M_btn_cond_in;
  button_conditioner_2 btn_cond (
    .clk(clk),
    .in(M_btn_cond_in),
    .out(M_btn_cond_out)
  );
  wire [1-1:0] M_button_pressed_out;
  reg [1-1:0] M_button_pressed_in;
  edge_detector_3 button_pressed (
    .clk(clk),
    .in(M_button_pressed_in),
    .out(M_button_pressed_out)
  );
  wire [16-1:0] M_checkfsm_out;
  wire [8-1:0] M_checkfsm_debug;
  reg [1-1:0] M_checkfsm_rst;
  reg [9-1:0] M_checkfsm_user;
  checktest_4 checkfsm (
    .clk(clk),
    .rst(M_checkfsm_rst),
    .user(M_checkfsm_user),
    .out(M_checkfsm_out),
    .debug(M_checkfsm_debug)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_btn_cond_in = io_button[0+0-:1];
    M_button_pressed_in = M_btn_cond_out;
    M_checkfsm_rst = M_button_pressed_out;
    M_checkfsm_user[0+7-:8] = io_dip[0+7-:8];
    M_checkfsm_user[8+0-:1] = io_dip[8+0+0-:1];
    io_led[0+7-:8] = M_checkfsm_out[0+7-:8];
    io_led[8+7-:8] = M_checkfsm_out[8+7-:8];
    io_led[16+7-:8] = M_checkfsm_debug;
  end
endmodule
