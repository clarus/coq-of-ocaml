(** Generated by coq-of-ocaml *)
Require Import OCaml.OCaml.

Local Open Scope string_scope.
Local Open Scope Z_scope.
Local Open Scope type_scope.
Import ListNotations.

Unset Positivity Checking.
Unset Guard Checking.

Require Import Tezos.Environment.
Import Environment.Notations.

Module ConstructorRecordNotations_t.
  Module t.
    Module Limited.
      Record record {remaining : Set} : Set := {
        remaining : remaining }.
      Arguments record : clear implicits.
    End Limited.
    Definition Limited_skeleton := Limited.record.
  End t.
End ConstructorRecordNotations_t.
Import ConstructorRecordNotations_t.

Reserved Notation "'t.Limited".

Inductive t : Set :=
| Unaccounted : t
| Limited : 't.Limited -> t

where "'t.Limited" := (t.Limited_skeleton Z.t).

Module t.
  Include ConstructorRecordNotations_t.t.
  Definition Limited := 't.Limited.
End t.

Definition internal_gas : Set := Z.t.

Module cost.
  Record record : Set := Build {
    allocations : Z.t;
    steps : Z.t;
    reads : Z.t;
    writes : Z.t;
    bytes_read : Z.t;
    bytes_written : Z.t }.
  Definition with_allocations allocations (r : record) :=
    Build allocations r.(steps) r.(reads) r.(writes) r.(bytes_read)
      r.(bytes_written).
  Definition with_steps steps (r : record) :=
    Build r.(allocations) steps r.(reads) r.(writes) r.(bytes_read)
      r.(bytes_written).
  Definition with_reads reads (r : record) :=
    Build r.(allocations) r.(steps) reads r.(writes) r.(bytes_read)
      r.(bytes_written).
  Definition with_writes writes (r : record) :=
    Build r.(allocations) r.(steps) r.(reads) writes r.(bytes_read)
      r.(bytes_written).
  Definition with_bytes_read bytes_read (r : record) :=
    Build r.(allocations) r.(steps) r.(reads) r.(writes) bytes_read
      r.(bytes_written).
  Definition with_bytes_written bytes_written (r : record) :=
    Build r.(allocations) r.(steps) r.(reads) r.(writes) r.(bytes_read)
      bytes_written.
End cost.
Definition cost := cost.record.

Definition encoding : Data_encoding.encoding t :=
  Data_encoding.union None
    [
      Data_encoding.__case_value "Limited" None (Data_encoding.Tag 0)
        Data_encoding.z
        (fun function_parameter =>
          match function_parameter with
          | Limited {| t.Limited.remaining := remaining |} => Some remaining
          | _ => None
          end)
        (fun remaining => Limited {| t.Limited.remaining := remaining |});
      Data_encoding.__case_value "Unaccounted" None (Data_encoding.Tag 1)
        (Data_encoding.constant "unaccounted")
        (fun function_parameter =>
          match function_parameter with
          | Unaccounted => Some tt
          | _ => None
          end)
        (fun function_parameter =>
          let '_ := function_parameter in
          Unaccounted)
    ].

Definition pp (ppf : Format.formatter) (function_parameter : t) : unit :=
  match function_parameter with
  | Unaccounted =>
    Format.fprintf ppf
      (CamlinternalFormatBasics.Format
        (CamlinternalFormatBasics.String_literal "unaccounted"
          CamlinternalFormatBasics.End_of_format) "unaccounted")
  | Limited {| t.Limited.remaining := remaining |} =>
    Format.fprintf ppf
      (CamlinternalFormatBasics.Format
        (CamlinternalFormatBasics.String CamlinternalFormatBasics.No_padding
          (CamlinternalFormatBasics.String_literal " units remaining"
            CamlinternalFormatBasics.End_of_format)) "%s units remaining")
      (Z.to_string remaining)
  end.

Definition cost_encoding : Data_encoding.encoding cost :=
  Data_encoding.conv
    (fun function_parameter =>
      let '{|
        cost.allocations := allocations;
          cost.steps := steps;
          cost.reads := reads;
          cost.writes := writes;
          cost.bytes_read := bytes_read;
          cost.bytes_written := bytes_written
          |} := function_parameter in
      (allocations, steps, reads, writes, bytes_read, bytes_written))
    (fun function_parameter =>
      let '(allocations, steps, reads, writes, bytes_read, bytes_written) :=
        function_parameter in
      {| cost.allocations := allocations; cost.steps := steps;
        cost.reads := reads; cost.writes := writes;
        cost.bytes_read := bytes_read; cost.bytes_written := bytes_written |})
    None
    (Data_encoding.obj6
      (Data_encoding.req None None "allocations" Data_encoding.z)
      (Data_encoding.req None None "steps" Data_encoding.z)
      (Data_encoding.req None None "reads" Data_encoding.z)
      (Data_encoding.req None None "writes" Data_encoding.z)
      (Data_encoding.req None None "bytes_read" Data_encoding.z)
      (Data_encoding.req None None "bytes_written" Data_encoding.z)).

Definition pp_cost (ppf : Format.formatter) (function_parameter : cost)
  : unit :=
  let '{|
    cost.allocations := allocations;
      cost.steps := steps;
      cost.reads := reads;
      cost.writes := writes;
      cost.bytes_read := bytes_read;
      cost.bytes_written := bytes_written
      |} := function_parameter in
  Format.fprintf ppf
    (CamlinternalFormatBasics.Format
      (CamlinternalFormatBasics.String_literal "(steps: "
        (CamlinternalFormatBasics.String CamlinternalFormatBasics.No_padding
          (CamlinternalFormatBasics.String_literal ", allocs: "
            (CamlinternalFormatBasics.String CamlinternalFormatBasics.No_padding
              (CamlinternalFormatBasics.String_literal ", reads: "
                (CamlinternalFormatBasics.String
                  CamlinternalFormatBasics.No_padding
                  (CamlinternalFormatBasics.String_literal " ("
                    (CamlinternalFormatBasics.String
                      CamlinternalFormatBasics.No_padding
                      (CamlinternalFormatBasics.String_literal
                        " bytes), writes: "
                        (CamlinternalFormatBasics.String
                          CamlinternalFormatBasics.No_padding
                          (CamlinternalFormatBasics.String_literal " ("
                            (CamlinternalFormatBasics.String
                              CamlinternalFormatBasics.No_padding
                              (CamlinternalFormatBasics.String_literal
                                " bytes))"
                                CamlinternalFormatBasics.End_of_format)))))))))))))
      "(steps: %s, allocs: %s, reads: %s (%s bytes), writes: %s (%s bytes))")
    (Z.to_string steps) (Z.to_string allocations) (Z.to_string reads)
    (Z.to_string bytes_read) (Z.to_string writes) (Z.to_string bytes_written).

(* ❌ Structure item `typext` not handled. *)
(* type_extension *)

(* ❌ Structure item `typext` not handled. *)
(* type_extension *)

Definition allocation_weight : Z.t := Z.of_int 2.

Definition step_weight : Z.t := Z.of_int 1.

Definition read_base_weight : Z.t := Z.of_int 100.

Definition write_base_weight : Z.t := Z.of_int 160.

Definition byte_read_weight : Z.t := Z.of_int 10.

Definition byte_written_weight : Z.t := Z.of_int 15.

Definition rescaling_bits : int := 7.

Definition rescaling_mask : Z.t :=
  Z.sub (Z.shift_left Z.one rescaling_bits) Z.one.

Definition scale (z : Z.t) : Z.t := Z.shift_left z rescaling_bits.

Definition rescale (z : Z.t) : Z.t := Z.shift_right z rescaling_bits.

Definition cost_to_internal_gas (cost : cost) : internal_gas :=
  Z.add
    (Z.add (Z.mul cost.(cost.allocations) allocation_weight)
      (Z.mul cost.(cost.steps) step_weight))
    (Z.add
      (Z.add (Z.mul cost.(cost.reads) read_base_weight)
        (Z.mul cost.(cost.writes) write_base_weight))
      (Z.add (Z.mul cost.(cost.bytes_read) byte_read_weight)
        (Z.mul cost.(cost.bytes_written) byte_written_weight))).

Definition internal_gas_to_gas (__internal_gas_value : Z.t)
  : Z.t * internal_gas :=
  let gas := rescale __internal_gas_value in
  let rest := Z.logand __internal_gas_value rescaling_mask in
  (gas, rest).

Definition consume_raw
  (block_gas : Z.t) (operation_gas : t) (__internal_gas_value : Z.t)
  (cost : cost) : Error_monad.tzresult (Z.t * t * Z.t) :=
  match operation_gas with
  | Unaccounted => Error_monad.ok (block_gas, Unaccounted, __internal_gas_value)
  | Limited {| t.Limited.remaining := remaining |} =>
    let cost_internal_gas := cost_to_internal_gas cost in
    let total_internal_gas := Z.add cost_internal_gas __internal_gas_value in
    let '(gas, rest) := internal_gas_to_gas total_internal_gas in
    if (|Compare.Z|).(Compare.S.op_gt) gas Z.zero then
      let remaining := Z.sub remaining gas in
      let block_remaining := Z.sub block_gas gas in
      if (|Compare.Z|).(Compare.S.op_lt) remaining Z.zero then
        Error_monad.__error_value extensible_type_value
      else
        if (|Compare.Z|).(Compare.S.op_lt) block_remaining Z.zero then
          Error_monad.__error_value extensible_type_value
        else
          Error_monad.ok
            (block_remaining, (Limited {| t.Limited.remaining := remaining |}),
              rest)
    else
      Error_monad.ok (block_gas, operation_gas, total_internal_gas)
  end.

Definition check_enough_raw
  (block_gas : Z.t) (operation_gas : t) (__internal_gas_value : Z.t)
  (cost : cost) : Error_monad.tzresult unit :=
  Error_monad.op_gtpipequestion
    (consume_raw block_gas operation_gas __internal_gas_value cost)
    (fun function_parameter =>
      let '(_block_remainig, _remaining, _internal_gas) := function_parameter in
      tt).

Definition internal_gas_zero : internal_gas := Z.zero.

Definition alloc_cost (n : int) : cost :=
  {| cost.allocations := scale (Z.of_int (Pervasives.op_plus n 1));
    cost.steps := Z.zero; cost.reads := Z.zero; cost.writes := Z.zero;
    cost.bytes_read := Z.zero; cost.bytes_written := Z.zero |}.

Definition alloc_bytes_cost (n : int) : cost :=
  alloc_cost (Pervasives.op_div (Pervasives.op_plus n 7) 8).

Definition alloc_bits_cost (n : int) : cost :=
  alloc_cost (Pervasives.op_div (Pervasives.op_plus n 63) 64).

Definition atomic_step_cost (n : int) : cost :=
  {| cost.allocations := Z.zero;
    cost.steps := Z.of_int (Pervasives.op_star 2 n); cost.reads := Z.zero;
    cost.writes := Z.zero; cost.bytes_read := Z.zero;
    cost.bytes_written := Z.zero |}.

Definition step_cost (n : int) : cost :=
  {| cost.allocations := Z.zero; cost.steps := scale (Z.of_int n);
    cost.reads := Z.zero; cost.writes := Z.zero; cost.bytes_read := Z.zero;
    cost.bytes_written := Z.zero |}.

Definition free : cost :=
  {| cost.allocations := Z.zero; cost.steps := Z.zero; cost.reads := Z.zero;
    cost.writes := Z.zero; cost.bytes_read := Z.zero;
    cost.bytes_written := Z.zero |}.

Definition read_bytes_cost (n : Z.t) : cost :=
  {| cost.allocations := Z.zero; cost.steps := Z.zero;
    cost.reads := scale Z.one; cost.writes := Z.zero;
    cost.bytes_read := scale n; cost.bytes_written := Z.zero |}.

Definition write_bytes_cost (n : Z.t) : cost :=
  {| cost.allocations := Z.zero; cost.steps := Z.zero; cost.reads := Z.zero;
    cost.writes := Z.one; cost.bytes_read := Z.zero;
    cost.bytes_written := scale n |}.

Definition op_plusat (x : cost) (y : cost) : cost :=
  {| cost.allocations := Z.add x.(cost.allocations) y.(cost.allocations);
    cost.steps := Z.add x.(cost.steps) y.(cost.steps);
    cost.reads := Z.add x.(cost.reads) y.(cost.reads);
    cost.writes := Z.add x.(cost.writes) y.(cost.writes);
    cost.bytes_read := Z.add x.(cost.bytes_read) y.(cost.bytes_read);
    cost.bytes_written := Z.add x.(cost.bytes_written) y.(cost.bytes_written) |}.

Definition op_starat (x : int) (y : cost) : cost :=
  {| cost.allocations := Z.mul (Z.of_int x) y.(cost.allocations);
    cost.steps := Z.mul (Z.of_int x) y.(cost.steps);
    cost.reads := Z.mul (Z.of_int x) y.(cost.reads);
    cost.writes := Z.mul (Z.of_int x) y.(cost.writes);
    cost.bytes_read := Z.mul (Z.of_int x) y.(cost.bytes_read);
    cost.bytes_written := Z.mul (Z.of_int x) y.(cost.bytes_written) |}.

Definition alloc_mbytes_cost (n : int) : cost :=
  op_plusat (alloc_cost 12) (alloc_bytes_cost n).

(* ❌ Top-level evaluations are ignored *)
(* top_level_evaluation *)
