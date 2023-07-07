package decoder

import chisel3._
import chisel3.util._
import chisel3.stage._

class Decoder extends RawModule {
  val io = IO(new Bundle {
    val in = Input(UInt(3.W))
    val out = Output(UInt(8.W))
  })

  io.out := MuxLookup(io.in, "b00000000".U, Array(0.U -> "b00000001".U,
                                                  1.U -> "b00000010".U,
                                                  2.U -> "b00000100".U,
                                                  3.U -> "b00001000".U,
                                                  4.U -> "b00010000".U,
                                                  5.U -> "b00100000".U,
                                                  6.U -> "b01000000".U,
                                                  7.U -> "b10000000".U))
}