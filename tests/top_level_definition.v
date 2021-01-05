Require Import CoqOfOCaml.CoqOfOCaml.
Require Import CoqOfOCaml.Settings.

(** Init function; without side-effects in Coq *)
Definition init_module : unit :=
  let '_ := Z.add 1 1 in
  let '_ := CoqOfOCaml.Stdlib.ignore 2 in
  tt.

Module M.
  (** Init function; without side-effects in Coq *)
  Definition init_module : unit := CoqOfOCaml.Stdlib.ignore (Z.add 1 1).
End M.
