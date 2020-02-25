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

Parameter depends_on_me : unit -> unit.

Parameter t : forall (key : Set), Set.

Parameter pp : forall {key : Set}, Format.formatter -> t key -> unit.

Parameter build_directory : forall {key : Set}, t key -> RPC_directory.t key.

Parameter create : forall {key : Set}, unit -> t key.

Parameter register_value : forall {a key : Set},
  t key -> (key -> Lwt.t (Error_monad.tzresult (option a))) ->
  Data_encoding.t a -> unit.

Parameter register_named_subcontext : forall {key : Set},
  t key -> list string -> t key.

Module ConstructorRecordNotations_args.
  Module args.
    Module One.
      Record record {rpc_arg encoding compare : Set} : Set := {
        rpc_arg : rpc_arg;
        encoding : encoding;
        compare : compare }.
      Arguments record : clear implicits.
    End One.
    Definition One_skeleton := One.record.
  End args.
End ConstructorRecordNotations_args.
Import ConstructorRecordNotations_args.

Reserved Notation "'args.One".

Inductive args : Set :=
| One : forall {a : Set}, 'args.One a -> args
| Pair : args -> args -> args

where "'args.One" := (fun (t_a : Set) =>
  args.One_skeleton (RPC_arg.t t_a) (Data_encoding.t t_a) (t_a -> t_a -> int)).

Module args.
  Include ConstructorRecordNotations_args.args.
  Definition One := 'args.One.
End args.

Parameter register_indexed_subcontext : forall {arg key sub_key : Set},
  t key -> (key -> Lwt.t (Error_monad.tzresult (list arg))) -> args -> t sub_key.

Parameter pack : forall {a key sub_key : Set}, args -> key -> a -> sub_key.

Parameter unpack : forall {a key sub_key : Set}, args -> sub_key -> key * a.

Module INDEX.
  Record signature {t : Set} : Set := {
    t := t;
    path_length : int;
    to_path : t -> list string -> list string;
    of_path : list string -> option t;
    rpc_arg : RPC_arg.t t;
    encoding : Data_encoding.t t;
    compare : t -> t -> int;
  }.
  Arguments signature : clear implicits.
End INDEX.
