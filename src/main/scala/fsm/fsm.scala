package fsm

import chisel3._
import chisel3.util._
import chisel3.stage._

class FSM extends Module {
  val io = IO(new Bundle {
    val in  = Input(Bool())
    val out = Output(Bool())
  })

  val s0 :: s1 :: s2 :: s3 :: Nil = Enum(4)

  val state = Wire(UInt(2.W))
  val next_state = Wire(UInt(2.W))

  state := RegNext(next_state, s0)

  next_state := Mux(io.in, MuxCase(s0, Array((state === s0) -> s1,
                                                     (state === s1) -> s2,
                                                     (state === s2) -> s2,
                                                     (state === s3) -> s1)),
                                   MuxCase(s0, Array((state === s0) -> s0,
                                                     (state === s1) -> s0,
                                                     (state === s2) -> s3,
                                                     (state === s3) -> s0)))

  io.out := RegNext((state === s3) & io.in, 0.B)
}