(** Generated by coq-of-ocaml *)
Require Import OCaml.OCaml.

Local Open Scope string_scope.
Local Open Scope Z_scope.
Local Open Scope type_scope.
Import ListNotations.

Unset Positivity Checking.
Unset Guard Checking.

Require Import Tezos.Environment.

Parameter t : Set.

Definition voting_period := t.

Parameter encoding : Data_encoding.t voting_period.

Parameter rpc_arg : RPC_arg.arg voting_period.

Parameter pp : Format.formatter -> voting_period -> unit.

Parameter Included_S : {_ : unit & Compare.S.signature voting_period}.

Definition op_eq := (|Included_S|).(Compare.S.op_eq).

Definition op_ltgt := (|Included_S|).(Compare.S.op_ltgt).

Definition op_lt := (|Included_S|).(Compare.S.op_lt).

Definition op_lteq := (|Included_S|).(Compare.S.op_lteq).

Definition op_gteq := (|Included_S|).(Compare.S.op_gteq).

Definition op_gt := (|Included_S|).(Compare.S.op_gt).

Definition compare := (|Included_S|).(Compare.S.compare).

Definition equal := (|Included_S|).(Compare.S.equal).

Definition max := (|Included_S|).(Compare.S.max).

Definition min := (|Included_S|).(Compare.S.min).

Parameter to_int32 : voting_period -> int32.

Parameter of_int32_exn : int32 -> voting_period.

Parameter root : voting_period.

Parameter succ : voting_period -> voting_period.

Inductive kind : Set :=
| Proposal : kind
| Testing_vote : kind
| Testing : kind
| Promotion_vote : kind.

Parameter kind_encoding : Data_encoding.t kind.