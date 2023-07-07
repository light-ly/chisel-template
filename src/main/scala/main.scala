package top

import chisel3._
import chisel3.util._
import chisel3.stage._

import decoder._

class top extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(3.W))
    val out = Output(UInt(8.W))
  })
  
  val decoder = Module(new Decoder)
  decoder.io.in := io.in
  io.out := decoder.io.out
}

object topMain extends App {
  (new ChiselStage).emitVerilog(new top, args)
}
