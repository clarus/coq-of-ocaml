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

Import Micheline.

(* ❌ Structure item `typext` not handled. *)
(* type_extension *)

(* ❌ Structure item `typext` not handled. *)
(* type_extension *)

(* ❌ Structure item `typext` not handled. *)
(* type_extension *)

Inductive prim : Set :=
| K_parameter : prim
| K_storage : prim
| K_code : prim
| D_False : prim
| D_Elt : prim
| D_Left : prim
| D_None : prim
| D_Pair : prim
| D_Right : prim
| D_Some : prim
| D_True : prim
| D_Unit : prim
| I_PACK : prim
| I_UNPACK : prim
| I_BLAKE2B : prim
| I_SHA256 : prim
| I_SHA512 : prim
| I_ABS : prim
| I_ADD : prim
| I_AMOUNT : prim
| I_AND : prim
| I_BALANCE : prim
| I_CAR : prim
| I_CDR : prim
| I_CHAIN_ID : prim
| I_CHECK_SIGNATURE : prim
| I_COMPARE : prim
| I_CONCAT : prim
| I_CONS : prim
| I_CREATE_ACCOUNT : prim
| I_CREATE_CONTRACT : prim
| I_IMPLICIT_ACCOUNT : prim
| I_DIP : prim
| I_DROP : prim
| I_DUP : prim
| I_EDIV : prim
| I_EMPTY_BIG_MAP : prim
| I_EMPTY_MAP : prim
| I_EMPTY_SET : prim
| I_EQ : prim
| I_EXEC : prim
| I_APPLY : prim
| I_FAILWITH : prim
| I_GE : prim
| I_GET : prim
| I_GT : prim
| I_HASH_KEY : prim
| I_IF : prim
| I_IF_CONS : prim
| I_IF_LEFT : prim
| I_IF_NONE : prim
| I_INT : prim
| I_LAMBDA : prim
| I_LE : prim
| I_LEFT : prim
| I_LOOP : prim
| I_LSL : prim
| I_LSR : prim
| I_LT : prim
| I_MAP : prim
| I_MEM : prim
| I_MUL : prim
| I_NEG : prim
| I_NEQ : prim
| I_NIL : prim
| I_NONE : prim
| I_NOT : prim
| I_NOW : prim
| I_OR : prim
| I_PAIR : prim
| I_PUSH : prim
| I_RIGHT : prim
| I_SIZE : prim
| I_SOME : prim
| I_SOURCE : prim
| I_SENDER : prim
| I_SELF : prim
| I_SLICE : prim
| I_STEPS_TO_QUOTA : prim
| I_SUB : prim
| I_SWAP : prim
| I_TRANSFER_TOKENS : prim
| I_SET_DELEGATE : prim
| I_UNIT : prim
| I_UPDATE : prim
| I_XOR : prim
| I_ITER : prim
| I_LOOP_LEFT : prim
| I_ADDRESS : prim
| I_CONTRACT : prim
| I_ISNAT : prim
| I_CAST : prim
| I_RENAME : prim
| I_DIG : prim
| I_DUG : prim
| T_bool : prim
| T_contract : prim
| T_int : prim
| T_key : prim
| T_key_hash : prim
| T_lambda : prim
| T_list : prim
| T_map : prim
| T_big_map : prim
| T_nat : prim
| T_option : prim
| T_or : prim
| T_pair : prim
| T_set : prim
| T_signature : prim
| T_string : prim
| T_bytes : prim
| T_mutez : prim
| T_timestamp : prim
| T_unit : prim
| T_operation : prim
| T_address : prim
| T_chain_id : prim.

Definition valid_case (name : string) : bool :=
  let is_lower (function_parameter : ascii) : bool :=
    match function_parameter with
    |
      ("_" % char | "a" % char | "b" % char | "c" % char | "d" % char |
      "e" % char | "f" % char | "g" % char | "h" % char | "i" % char |
      "j" % char | "k" % char | "l" % char | "m" % char | "n" % char |
      "o" % char | "p" % char | "q" % char | "r" % char | "s" % char |
      "t" % char | "u" % char | "v" % char | "w" % char | "x" % char |
      "y" % char | "z" % char) => true
    | _ => false
    end in
  let is_upper (function_parameter : ascii) : bool :=
    match function_parameter with
    |
      ("_" % char | "A" % char | "B" % char | "C" % char | "D" % char |
      "E" % char | "F" % char | "G" % char | "H" % char | "I" % char |
      "J" % char | "K" % char | "L" % char | "M" % char | "N" % char |
      "O" % char | "P" % char | "Q" % char | "R" % char | "S" % char |
      "T" % char | "U" % char | "V" % char | "W" % char | "X" % char |
      "Y" % char | "Z" % char) => true
    | _ => false
    end in
  let fix for_all
    (__a_value : (|Compare.Int|).(Compare.S.t))
    (__b_value : (|Compare.Int|).(Compare.S.t))
    (f : (|Compare.Int|).(Compare.S.t) -> bool) {struct __a_value} : bool :=
    Pervasives.op_pipepipe
      ((|Compare.Int|).(Compare.S.op_gt) __a_value __b_value)
      (Pervasives.op_andand (f __a_value)
        (for_all (Pervasives.op_plus __a_value 1) __b_value f)) in
  let len := String.length name in
  Pervasives.op_andand ((|Compare.Int|).(Compare.S.op_ltgt) len 0)
    (Pervasives.op_andand
      ((|Compare.Char|).(Compare.S.op_ltgt) (String.get name 0) "_" % char)
      (Pervasives.op_pipepipe
        (Pervasives.op_andand (is_upper (String.get name 0))
          (for_all 1 (Pervasives.op_minus len 1)
            (fun i => is_upper (String.get name i))))
        (Pervasives.op_pipepipe
          (Pervasives.op_andand (is_upper (String.get name 0))
            (for_all 1 (Pervasives.op_minus len 1)
              (fun i => is_lower (String.get name i))))
          (Pervasives.op_andand (is_lower (String.get name 0))
            (for_all 1 (Pervasives.op_minus len 1)
              (fun i => is_lower (String.get name i))))))).

Definition string_of_prim (function_parameter : prim) : string :=
  match function_parameter with
  | K_parameter => "parameter"
  | K_storage => "storage"
  | K_code => "code"
  | D_False => "False"
  | D_Elt => "Elt"
  | D_Left => "Left"
  | D_None => "None"
  | D_Pair => "Pair"
  | D_Right => "Right"
  | D_Some => "Some"
  | D_True => "True"
  | D_Unit => "Unit"
  | I_PACK => "PACK"
  | I_UNPACK => "UNPACK"
  | I_BLAKE2B => "BLAKE2B"
  | I_SHA256 => "SHA256"
  | I_SHA512 => "SHA512"
  | I_ABS => "ABS"
  | I_ADD => "ADD"
  | I_AMOUNT => "AMOUNT"
  | I_AND => "AND"
  | I_BALANCE => "BALANCE"
  | I_CAR => "CAR"
  | I_CDR => "CDR"
  | I_CHAIN_ID => "CHAIN_ID"
  | I_CHECK_SIGNATURE => "CHECK_SIGNATURE"
  | I_COMPARE => "COMPARE"
  | I_CONCAT => "CONCAT"
  | I_CONS => "CONS"
  | I_CREATE_ACCOUNT => "CREATE_ACCOUNT"
  | I_CREATE_CONTRACT => "CREATE_CONTRACT"
  | I_IMPLICIT_ACCOUNT => "IMPLICIT_ACCOUNT"
  | I_DIP => "DIP"
  | I_DROP => "DROP"
  | I_DUP => "DUP"
  | I_EDIV => "EDIV"
  | I_EMPTY_BIG_MAP => "EMPTY_BIG_MAP"
  | I_EMPTY_MAP => "EMPTY_MAP"
  | I_EMPTY_SET => "EMPTY_SET"
  | I_EQ => "EQ"
  | I_EXEC => "EXEC"
  | I_APPLY => "APPLY"
  | I_FAILWITH => "FAILWITH"
  | I_GE => "GE"
  | I_GET => "GET"
  | I_GT => "GT"
  | I_HASH_KEY => "HASH_KEY"
  | I_IF => "IF"
  | I_IF_CONS => "IF_CONS"
  | I_IF_LEFT => "IF_LEFT"
  | I_IF_NONE => "IF_NONE"
  | I_INT => "INT"
  | I_LAMBDA => "LAMBDA"
  | I_LE => "LE"
  | I_LEFT => "LEFT"
  | I_LOOP => "LOOP"
  | I_LSL => "LSL"
  | I_LSR => "LSR"
  | I_LT => "LT"
  | I_MAP => "MAP"
  | I_MEM => "MEM"
  | I_MUL => "MUL"
  | I_NEG => "NEG"
  | I_NEQ => "NEQ"
  | I_NIL => "NIL"
  | I_NONE => "NONE"
  | I_NOT => "NOT"
  | I_NOW => "NOW"
  | I_OR => "OR"
  | I_PAIR => "PAIR"
  | I_PUSH => "PUSH"
  | I_RIGHT => "RIGHT"
  | I_SIZE => "SIZE"
  | I_SOME => "SOME"
  | I_SOURCE => "SOURCE"
  | I_SENDER => "SENDER"
  | I_SELF => "SELF"
  | I_SLICE => "SLICE"
  | I_STEPS_TO_QUOTA => "STEPS_TO_QUOTA"
  | I_SUB => "SUB"
  | I_SWAP => "SWAP"
  | I_TRANSFER_TOKENS => "TRANSFER_TOKENS"
  | I_SET_DELEGATE => "SET_DELEGATE"
  | I_UNIT => "UNIT"
  | I_UPDATE => "UPDATE"
  | I_XOR => "XOR"
  | I_ITER => "ITER"
  | I_LOOP_LEFT => "LOOP_LEFT"
  | I_ADDRESS => "ADDRESS"
  | I_CONTRACT => "CONTRACT"
  | I_ISNAT => "ISNAT"
  | I_CAST => "CAST"
  | I_RENAME => "RENAME"
  | I_DIG => "DIG"
  | I_DUG => "DUG"
  | T_bool => "bool"
  | T_contract => "contract"
  | T_int => "int"
  | T_key => "key"
  | T_key_hash => "key_hash"
  | T_lambda => "lambda"
  | T_list => "list"
  | T_map => "map"
  | T_big_map => "big_map"
  | T_nat => "nat"
  | T_option => "option"
  | T_or => "or"
  | T_pair => "pair"
  | T_set => "set"
  | T_signature => "signature"
  | T_string => "string"
  | T_bytes => "bytes"
  | T_mutez => "mutez"
  | T_timestamp => "timestamp"
  | T_unit => "unit"
  | T_operation => "operation"
  | T_address => "address"
  | T_chain_id => "chain_id"
  end.

Definition prim_of_string (function_parameter : string)
  : Error_monad.tzresult prim :=
  match function_parameter with
  | "parameter" => Error_monad.ok K_parameter
  | "storage" => Error_monad.ok K_storage
  | "code" => Error_monad.ok K_code
  | "False" => Error_monad.ok D_False
  | "Elt" => Error_monad.ok D_Elt
  | "Left" => Error_monad.ok D_Left
  | "None" => Error_monad.ok D_None
  | "Pair" => Error_monad.ok D_Pair
  | "Right" => Error_monad.ok D_Right
  | "Some" => Error_monad.ok D_Some
  | "True" => Error_monad.ok D_True
  | "Unit" => Error_monad.ok D_Unit
  | "PACK" => Error_monad.ok I_PACK
  | "UNPACK" => Error_monad.ok I_UNPACK
  | "BLAKE2B" => Error_monad.ok I_BLAKE2B
  | "SHA256" => Error_monad.ok I_SHA256
  | "SHA512" => Error_monad.ok I_SHA512
  | "ABS" => Error_monad.ok I_ABS
  | "ADD" => Error_monad.ok I_ADD
  | "AMOUNT" => Error_monad.ok I_AMOUNT
  | "AND" => Error_monad.ok I_AND
  | "BALANCE" => Error_monad.ok I_BALANCE
  | "CAR" => Error_monad.ok I_CAR
  | "CDR" => Error_monad.ok I_CDR
  | "CHAIN_ID" => Error_monad.ok I_CHAIN_ID
  | "CHECK_SIGNATURE" => Error_monad.ok I_CHECK_SIGNATURE
  | "COMPARE" => Error_monad.ok I_COMPARE
  | "CONCAT" => Error_monad.ok I_CONCAT
  | "CONS" => Error_monad.ok I_CONS
  | "CREATE_ACCOUNT" => Error_monad.ok I_CREATE_ACCOUNT
  | "CREATE_CONTRACT" => Error_monad.ok I_CREATE_CONTRACT
  | "IMPLICIT_ACCOUNT" => Error_monad.ok I_IMPLICIT_ACCOUNT
  | "DIP" => Error_monad.ok I_DIP
  | "DROP" => Error_monad.ok I_DROP
  | "DUP" => Error_monad.ok I_DUP
  | "EDIV" => Error_monad.ok I_EDIV
  | "EMPTY_BIG_MAP" => Error_monad.ok I_EMPTY_BIG_MAP
  | "EMPTY_MAP" => Error_monad.ok I_EMPTY_MAP
  | "EMPTY_SET" => Error_monad.ok I_EMPTY_SET
  | "EQ" => Error_monad.ok I_EQ
  | "EXEC" => Error_monad.ok I_EXEC
  | "APPLY" => Error_monad.ok I_APPLY
  | "FAILWITH" => Error_monad.ok I_FAILWITH
  | "GE" => Error_monad.ok I_GE
  | "GET" => Error_monad.ok I_GET
  | "GT" => Error_monad.ok I_GT
  | "HASH_KEY" => Error_monad.ok I_HASH_KEY
  | "IF" => Error_monad.ok I_IF
  | "IF_CONS" => Error_monad.ok I_IF_CONS
  | "IF_LEFT" => Error_monad.ok I_IF_LEFT
  | "IF_NONE" => Error_monad.ok I_IF_NONE
  | "INT" => Error_monad.ok I_INT
  | "LAMBDA" => Error_monad.ok I_LAMBDA
  | "LE" => Error_monad.ok I_LE
  | "LEFT" => Error_monad.ok I_LEFT
  | "LOOP" => Error_monad.ok I_LOOP
  | "LSL" => Error_monad.ok I_LSL
  | "LSR" => Error_monad.ok I_LSR
  | "LT" => Error_monad.ok I_LT
  | "MAP" => Error_monad.ok I_MAP
  | "MEM" => Error_monad.ok I_MEM
  | "MUL" => Error_monad.ok I_MUL
  | "NEG" => Error_monad.ok I_NEG
  | "NEQ" => Error_monad.ok I_NEQ
  | "NIL" => Error_monad.ok I_NIL
  | "NONE" => Error_monad.ok I_NONE
  | "NOT" => Error_monad.ok I_NOT
  | "NOW" => Error_monad.ok I_NOW
  | "OR" => Error_monad.ok I_OR
  | "PAIR" => Error_monad.ok I_PAIR
  | "PUSH" => Error_monad.ok I_PUSH
  | "RIGHT" => Error_monad.ok I_RIGHT
  | "SIZE" => Error_monad.ok I_SIZE
  | "SOME" => Error_monad.ok I_SOME
  | "SOURCE" => Error_monad.ok I_SOURCE
  | "SENDER" => Error_monad.ok I_SENDER
  | "SELF" => Error_monad.ok I_SELF
  | "SLICE" => Error_monad.ok I_SLICE
  | "STEPS_TO_QUOTA" => Error_monad.ok I_STEPS_TO_QUOTA
  | "SUB" => Error_monad.ok I_SUB
  | "SWAP" => Error_monad.ok I_SWAP
  | "TRANSFER_TOKENS" => Error_monad.ok I_TRANSFER_TOKENS
  | "SET_DELEGATE" => Error_monad.ok I_SET_DELEGATE
  | "UNIT" => Error_monad.ok I_UNIT
  | "UPDATE" => Error_monad.ok I_UPDATE
  | "XOR" => Error_monad.ok I_XOR
  | "ITER" => Error_monad.ok I_ITER
  | "LOOP_LEFT" => Error_monad.ok I_LOOP_LEFT
  | "ADDRESS" => Error_monad.ok I_ADDRESS
  | "CONTRACT" => Error_monad.ok I_CONTRACT
  | "ISNAT" => Error_monad.ok I_ISNAT
  | "CAST" => Error_monad.ok I_CAST
  | "RENAME" => Error_monad.ok I_RENAME
  | "DIG" => Error_monad.ok I_DIG
  | "DUG" => Error_monad.ok I_DUG
  | "bool" => Error_monad.ok T_bool
  | "contract" => Error_monad.ok T_contract
  | "int" => Error_monad.ok T_int
  | "key" => Error_monad.ok T_key
  | "key_hash" => Error_monad.ok T_key_hash
  | "lambda" => Error_monad.ok T_lambda
  | "list" => Error_monad.ok T_list
  | "map" => Error_monad.ok T_map
  | "big_map" => Error_monad.ok T_big_map
  | "nat" => Error_monad.ok T_nat
  | "option" => Error_monad.ok T_option
  | "or" => Error_monad.ok T_or
  | "pair" => Error_monad.ok T_pair
  | "set" => Error_monad.ok T_set
  | "signature" => Error_monad.ok T_signature
  | "string" => Error_monad.ok T_string
  | "bytes" => Error_monad.ok T_bytes
  | "mutez" => Error_monad.ok T_mutez
  | "timestamp" => Error_monad.ok T_timestamp
  | "unit" => Error_monad.ok T_unit
  | "operation" => Error_monad.ok T_operation
  | "address" => Error_monad.ok T_address
  | "chain_id" => Error_monad.ok T_chain_id
  | n =>
    if valid_case n then
      Error_monad.__error_value extensible_type_value
    else
      Error_monad.__error_value extensible_type_value
  end.

Definition prims_of_strings (expr : Micheline.canonical string)
  : Error_monad.tzresult (Micheline.canonical prim) :=
  let fix convert
    (function_parameter : Micheline.node Micheline.canonical_location string)
    {struct function_parameter}
    : Error_monad.tzresult (Micheline.node Micheline.canonical_location prim) :=
    match function_parameter with
    | Micheline.Int l x => Error_monad.ok (Micheline.Int l x)
    | Micheline.String l x => Error_monad.ok (Micheline.String l x)
    | Micheline.Bytes l x => Error_monad.ok (Micheline.Bytes l x)
    | Micheline.Prim loc prim args annot =>
      let? prim :=
        Error_monad.record_trace extensible_type_value (prim_of_string prim) in
      let? args :=
        List.fold_left
          (fun acc =>
            fun arg =>
              let? args := acc in
              let? arg := convert arg in
              Error_monad.ok (cons arg args)) (Error_monad.ok nil) args in
      Error_monad.ok (Micheline.Prim 0 prim (List.rev args) annot)
    | Micheline.Seq _ args =>
      let? args :=
        List.fold_left
          (fun acc =>
            fun arg =>
              let? args := acc in
              let? arg := convert arg in
              Error_monad.ok (cons arg args)) (Error_monad.ok nil) args in
      Error_monad.ok (Micheline.Seq 0 (List.rev args))
    end in
  let? expr := convert (Micheline.root expr) in
  Error_monad.ok (Micheline.strip_locations expr).

Definition strings_of_prims (expr : Micheline.canonical prim)
  : Micheline.canonical string :=
  let fix convert (function_parameter : Micheline.node int prim)
    {struct function_parameter} : Micheline.node int string :=
    match function_parameter with
    | Micheline.Int l x => Micheline.Int l x
    | Micheline.String l x => Micheline.String l x
    | Micheline.Bytes l x => Micheline.Bytes l x
    | Micheline.Prim _ prim args annot =>
      let prim := string_of_prim prim in
      let args := List.map convert args in
      Micheline.Prim 0 prim args annot
    | Micheline.Seq _ args =>
      let args := List.map convert args in
      Micheline.Seq 0 args
    end in
  Micheline.strip_locations (convert (Micheline.root expr)).

Definition prim_encoding : Data_encoding.encoding prim :=
  (let arg := Data_encoding.def "michelson.v1.primitives" in
  fun eta => arg None None eta)
    (Data_encoding.string_enum
      [
        ("parameter", K_parameter);
        ("storage", K_storage);
        ("code", K_code);
        ("False", D_False);
        ("Elt", D_Elt);
        ("Left", D_Left);
        ("None", D_None);
        ("Pair", D_Pair);
        ("Right", D_Right);
        ("Some", D_Some);
        ("True", D_True);
        ("Unit", D_Unit);
        ("PACK", I_PACK);
        ("UNPACK", I_UNPACK);
        ("BLAKE2B", I_BLAKE2B);
        ("SHA256", I_SHA256);
        ("SHA512", I_SHA512);
        ("ABS", I_ABS);
        ("ADD", I_ADD);
        ("AMOUNT", I_AMOUNT);
        ("AND", I_AND);
        ("BALANCE", I_BALANCE);
        ("CAR", I_CAR);
        ("CDR", I_CDR);
        ("CHECK_SIGNATURE", I_CHECK_SIGNATURE);
        ("COMPARE", I_COMPARE);
        ("CONCAT", I_CONCAT);
        ("CONS", I_CONS);
        ("CREATE_ACCOUNT", I_CREATE_ACCOUNT);
        ("CREATE_CONTRACT", I_CREATE_CONTRACT);
        ("IMPLICIT_ACCOUNT", I_IMPLICIT_ACCOUNT);
        ("DIP", I_DIP);
        ("DROP", I_DROP);
        ("DUP", I_DUP);
        ("EDIV", I_EDIV);
        ("EMPTY_MAP", I_EMPTY_MAP);
        ("EMPTY_SET", I_EMPTY_SET);
        ("EQ", I_EQ);
        ("EXEC", I_EXEC);
        ("FAILWITH", I_FAILWITH);
        ("GE", I_GE);
        ("GET", I_GET);
        ("GT", I_GT);
        ("HASH_KEY", I_HASH_KEY);
        ("IF", I_IF);
        ("IF_CONS", I_IF_CONS);
        ("IF_LEFT", I_IF_LEFT);
        ("IF_NONE", I_IF_NONE);
        ("INT", I_INT);
        ("LAMBDA", I_LAMBDA);
        ("LE", I_LE);
        ("LEFT", I_LEFT);
        ("LOOP", I_LOOP);
        ("LSL", I_LSL);
        ("LSR", I_LSR);
        ("LT", I_LT);
        ("MAP", I_MAP);
        ("MEM", I_MEM);
        ("MUL", I_MUL);
        ("NEG", I_NEG);
        ("NEQ", I_NEQ);
        ("NIL", I_NIL);
        ("NONE", I_NONE);
        ("NOT", I_NOT);
        ("NOW", I_NOW);
        ("OR", I_OR);
        ("PAIR", I_PAIR);
        ("PUSH", I_PUSH);
        ("RIGHT", I_RIGHT);
        ("SIZE", I_SIZE);
        ("SOME", I_SOME);
        ("SOURCE", I_SOURCE);
        ("SENDER", I_SENDER);
        ("SELF", I_SELF);
        ("STEPS_TO_QUOTA", I_STEPS_TO_QUOTA);
        ("SUB", I_SUB);
        ("SWAP", I_SWAP);
        ("TRANSFER_TOKENS", I_TRANSFER_TOKENS);
        ("SET_DELEGATE", I_SET_DELEGATE);
        ("UNIT", I_UNIT);
        ("UPDATE", I_UPDATE);
        ("XOR", I_XOR);
        ("ITER", I_ITER);
        ("LOOP_LEFT", I_LOOP_LEFT);
        ("ADDRESS", I_ADDRESS);
        ("CONTRACT", I_CONTRACT);
        ("ISNAT", I_ISNAT);
        ("CAST", I_CAST);
        ("RENAME", I_RENAME);
        ("bool", T_bool);
        ("contract", T_contract);
        ("int", T_int);
        ("key", T_key);
        ("key_hash", T_key_hash);
        ("lambda", T_lambda);
        ("list", T_list);
        ("map", T_map);
        ("big_map", T_big_map);
        ("nat", T_nat);
        ("option", T_option);
        ("or", T_or);
        ("pair", T_pair);
        ("set", T_set);
        ("signature", T_signature);
        ("string", T_string);
        ("bytes", T_bytes);
        ("mutez", T_mutez);
        ("timestamp", T_timestamp);
        ("unit", T_unit);
        ("operation", T_operation);
        ("address", T_address);
        ("SLICE", I_SLICE);
        ("DIG", I_DIG);
        ("DUG", I_DUG);
        ("EMPTY_BIG_MAP", I_EMPTY_BIG_MAP);
        ("APPLY", I_APPLY);
        ("chain_id", T_chain_id);
        ("CHAIN_ID", I_CHAIN_ID)
      ]).

(* ❌ Top-level evaluations are ignored *)
(* top_level_evaluation *)