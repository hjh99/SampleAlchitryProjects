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
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_2 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_3 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [16-1:0] M_dec_ctr_digits;
  reg [1-1:0] M_dec_ctr_inc;
  multi_dec_ctr_4 dec_ctr (
    .clk(clk),
    .rst(rst),
    .inc(M_dec_ctr_inc),
    .digits(M_dec_ctr_digits)
  );
  wire [1-1:0] M_ctr_value;
  counter_5 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = {3'h0, io_button};
    usb_tx = usb_rx;
    M_edge_detector_in = M_ctr_value;
    M_dec_ctr_inc = M_edge_detector_out;
    M_seg_values = M_dec_ctr_digits;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    io_led = io_dip;
  end
endmodule
