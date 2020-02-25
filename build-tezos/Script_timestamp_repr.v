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
Require Tezos.Script_int_repr.
Require Tezos.Time_repr.

Definition t : Set := Z.t.

Definition compare : Z.t -> Z.t -> int := Z.compare.

Definition of_int64 : int64 -> Z.t := Z.of_int64.

Definition of_string (x : string) : option Z.t :=
  match Time_repr.of_notation x with
  | None =>
    (* ❌ Try-with are not handled *)
    try (Some (Z.of_string x))
  | Some time => Some (of_int64 (Time_repr.to_seconds time))
  end.

Definition to_notation (x : Z.t) : option string :=
  (* ❌ Try-with are not handled *)
  try
    (let notation := Time_repr.to_notation (Time.of_seconds (Z.to_int64 x)) in
    if String.equal notation "out_of_range" then
      None
    else
      Some notation).

Definition to_num_str : Z.t -> string := Z.to_string.

Definition to_string (x : Z.t) : string :=
  match to_notation x with
  | None => to_num_str x
  | Some s => s
  end.

Definition diff (x : Z.t) (y : Z.t) : Script_int_repr.num :=
  Script_int_repr.of_zint (Z.sub x y).

Definition sub_delta (__t_value : Z.t) (delta : Script_int_repr.num) : Z.t :=
  Z.sub __t_value (Script_int_repr.to_zint delta).

Definition add_delta (__t_value : Z.t) (delta : Script_int_repr.num) : Z.t :=
  Z.add __t_value (Script_int_repr.to_zint delta).

Definition to_zint {A : Set} (x : A) : A := x.

Definition of_zint {A : Set} (x : A) : A := x.
