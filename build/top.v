module Decoder(
  input  [2:0] io_in,
  output [7:0] io_out
);
  wire [1:0] _io_out_T_1 = 3'h1 == io_in ? 2'h2 : 2'h1; // @[Mux.scala 81:58]
  wire [2:0] _io_out_T_3 = 3'h2 == io_in ? 3'h4 : {{1'd0}, _io_out_T_1}; // @[Mux.scala 81:58]
  wire [3:0] _io_out_T_5 = 3'h3 == io_in ? 4'h8 : {{1'd0}, _io_out_T_3}; // @[Mux.scala 81:58]
  wire [4:0] _io_out_T_7 = 3'h4 == io_in ? 5'h10 : {{1'd0}, _io_out_T_5}; // @[Mux.scala 81:58]
  wire [5:0] _io_out_T_9 = 3'h5 == io_in ? 6'h20 : {{1'd0}, _io_out_T_7}; // @[Mux.scala 81:58]
  wire [6:0] _io_out_T_11 = 3'h6 == io_in ? 7'h40 : {{1'd0}, _io_out_T_9}; // @[Mux.scala 81:58]
  assign io_out = 3'h7 == io_in ? 8'h80 : {{1'd0}, _io_out_T_11}; // @[Mux.scala 81:58]
endmodule
module top(
  input        clock,
  input        reset,
  input  [2:0] io_in,
  output [7:0] io_out
);
  wire [2:0] decoder_io_in; // @[main.scala 15:23]
  wire [7:0] decoder_io_out; // @[main.scala 15:23]
  Decoder decoder ( // @[main.scala 15:23]
    .io_in(decoder_io_in),
    .io_out(decoder_io_out)
  );
  assign io_out = decoder_io_out; // @[main.scala 17:10]
  assign decoder_io_in = io_in; // @[main.scala 16:17]
endmodule
