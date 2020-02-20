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
Require Tezos.Blinded_public_key_hash.
Require Tezos.Commitment_repr.
Require Tezos.Raw_context.
Require Tezos.Tez_repr.

Parameter init :
  Raw_context.t -> list Commitment_repr.t ->
  Lwt.t (Error_monad.tzresult Raw_context.t).

Parameter get_opt :
  Raw_context.t -> Blinded_public_key_hash.t ->
  Lwt.t (Error_monad.tzresult (option Tez_repr.t)).

Parameter delete :
  Raw_context.t -> Blinded_public_key_hash.t ->
  Lwt.t (Error_monad.tzresult Raw_context.t).