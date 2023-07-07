circuit top :
  module Decoder :
    output io : { flip in : UInt<3>, out : UInt<8>}

    node _io_out_T = eq(UInt<1>("h1"), io.in) @[Mux.scala 81:61]
    node _io_out_T_1 = mux(_io_out_T, UInt<2>("h2"), UInt<1>("h1")) @[Mux.scala 81:58]
    node _io_out_T_2 = eq(UInt<2>("h2"), io.in) @[Mux.scala 81:61]
    node _io_out_T_3 = mux(_io_out_T_2, UInt<3>("h4"), _io_out_T_1) @[Mux.scala 81:58]
    node _io_out_T_4 = eq(UInt<2>("h3"), io.in) @[Mux.scala 81:61]
    node _io_out_T_5 = mux(_io_out_T_4, UInt<4>("h8"), _io_out_T_3) @[Mux.scala 81:58]
    node _io_out_T_6 = eq(UInt<3>("h4"), io.in) @[Mux.scala 81:61]
    node _io_out_T_7 = mux(_io_out_T_6, UInt<5>("h10"), _io_out_T_5) @[Mux.scala 81:58]
    node _io_out_T_8 = eq(UInt<3>("h5"), io.in) @[Mux.scala 81:61]
    node _io_out_T_9 = mux(_io_out_T_8, UInt<6>("h20"), _io_out_T_7) @[Mux.scala 81:58]
    node _io_out_T_10 = eq(UInt<3>("h6"), io.in) @[Mux.scala 81:61]
    node _io_out_T_11 = mux(_io_out_T_10, UInt<7>("h40"), _io_out_T_9) @[Mux.scala 81:58]
    node _io_out_T_12 = eq(UInt<3>("h7"), io.in) @[Mux.scala 81:61]
    node _io_out_T_13 = mux(_io_out_T_12, UInt<8>("h80"), _io_out_T_11) @[Mux.scala 81:58]
    io.out <= _io_out_T_13 @[decoder.scala 13:10]

  module top :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<3>, out : UInt<8>}

    inst decoder of Decoder @[main.scala 15:23]
    decoder.io.in <= io.in @[main.scala 16:17]
    io.out <= decoder.io.out @[main.scala 17:10]

