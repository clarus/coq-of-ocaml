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
Require Tezos.Alpha_context.
Require Tezos.Apply.
Require Tezos.Apply_results_mli. Module Apply_results := Apply_results_mli.
Require Tezos.Script_ir_translator_mli. Module Script_ir_translator := Script_ir_translator_mli.
Require Tezos.Script_typed_ir.
Require Tezos.Services_registration.

Definition block_header_data : Set := Alpha_context.Block_header.protocol_data.

Module block_header.
  Record record : Set := Build {
    shell : Block_header.shell_header;
    protocol_data : block_header_data }.
  Definition with_shell shell (r : record) :=
    Build shell r.(protocol_data).
  Definition with_protocol_data protocol_data (r : record) :=
    Build r.(shell) protocol_data.
End block_header.
Definition block_header := block_header.record.

Definition block_header_data_encoding
  : Data_encoding.encoding Alpha_context.Block_header.protocol_data :=
  Alpha_context.Block_header.protocol_data_encoding.

Definition block_header_metadata : Set := Apply_results.block_metadata.

Definition block_header_metadata_encoding
  : Data_encoding.encoding Apply_results.block_metadata :=
  Apply_results.block_metadata_encoding.

Inductive operation_data : Set :=
| Operation_data : Alpha_context.Operation.protocol_data -> operation_data.

Definition operation_data_encoding
  : Data_encoding.t Alpha_context.Operation.packed_protocol_data :=
  Alpha_context.Operation.protocol_data_encoding.

Inductive operation_receipt : Set :=
| Operation_metadata : Apply_results.operation_metadata -> operation_receipt
| No_operation_metadata : operation_receipt.

Definition operation_receipt_encoding
  : Data_encoding.t Apply_results.packed_operation_metadata :=
  Apply_results.operation_metadata_encoding.

Definition operation_data_and_receipt_encoding
  : Data_encoding.t
    (Alpha_context.Operation.packed_protocol_data *
      Apply_results.packed_operation_metadata) :=
  Apply_results.operation_data_and_metadata_encoding.

Module operation.
  Record record : Set := Build {
    shell : Operation.shell_header;
    protocol_data : operation_data }.
  Definition with_shell shell (r : record) :=
    Build shell r.(protocol_data).
  Definition with_protocol_data protocol_data (r : record) :=
    Build r.(shell) protocol_data.
End operation.
Definition operation := operation.record.

Definition acceptable_passes : Alpha_context.packed_operation -> list int :=
  Alpha_context.Operation.acceptable_passes.

Definition max_block_length : int :=
  Alpha_context.Block_header.max_header_length.

Definition max_operation_data_length : int :=
  Alpha_context.Constants.max_operation_data_length.

Definition validation_passes : list Updater.quota :=
  let max_anonymous_operations :=
    Pervasives.op_plus Alpha_context.Constants.max_revelations_per_block 100 in
  [
    {| Updater.quota.max_size := Pervasives.op_star 32 1024;
      Updater.quota.max_op := Some 32 |};
    {| Updater.quota.max_size := Pervasives.op_star 32 1024;
      Updater.quota.max_op := None |};
    {|
      Updater.quota.max_size := Pervasives.op_star max_anonymous_operations 1024;
      Updater.quota.max_op := Some max_anonymous_operations |};
    {| Updater.quota.max_size := Pervasives.op_star 512 1024;
      Updater.quota.max_op := None |}
  ].

Definition rpc_services : RPC_directory.directory Updater.rpc_context :=
  (* ❌ Sequences of instructions are ignored (operator ";") *)
  (* ❌ instruction_sequence ";" *)
  Services_registration.get_rpc_services tt.

Module ConstructorRecordNotations_validation_mode.
  Module validation_mode.
    Module Application.
      Record record {block_header baker block_delay : Set} : Set := {
        block_header : block_header;
        baker : baker;
        block_delay : block_delay }.
      Arguments record : clear implicits.
    End Application.
    Definition Application_skeleton := Application.record.
    
    Module Partial_application.
      Record record {block_header baker block_delay : Set} : Set := {
        block_header : block_header;
        baker : baker;
        block_delay : block_delay }.
      Arguments record : clear implicits.
    End Partial_application.
    Definition Partial_application_skeleton := Partial_application.record.
    
    Module Partial_construction.
      Record record {predecessor : Set} : Set := {
        predecessor : predecessor }.
      Arguments record : clear implicits.
    End Partial_construction.
    Definition Partial_construction_skeleton := Partial_construction.record.
    
    Module Full_construction.
      Record record {predecessor protocol_data baker block_delay : Set} : Set := {
        predecessor : predecessor;
        protocol_data : protocol_data;
        baker : baker;
        block_delay : block_delay }.
      Arguments record : clear implicits.
    End Full_construction.
    Definition Full_construction_skeleton := Full_construction.record.
  End validation_mode.
End ConstructorRecordNotations_validation_mode.
Import ConstructorRecordNotations_validation_mode.

Reserved Notation "'validation_mode.Application".
Reserved Notation "'validation_mode.Partial_application".
Reserved Notation "'validation_mode.Partial_construction".
Reserved Notation "'validation_mode.Full_construction".

Inductive validation_mode : Set :=
| Application : 'validation_mode.Application -> validation_mode
| Partial_application : 'validation_mode.Partial_application -> validation_mode
| Partial_construction :
  'validation_mode.Partial_construction -> validation_mode
| Full_construction : 'validation_mode.Full_construction -> validation_mode

where "'validation_mode.Application" :=
  (validation_mode.Application_skeleton Alpha_context.Block_header.t
    Alpha_context.public_key_hash Alpha_context.Period.t)
and "'validation_mode.Partial_application" :=
  (validation_mode.Partial_application_skeleton Alpha_context.Block_header.t
    Alpha_context.public_key_hash Alpha_context.Period.t)
and "'validation_mode.Partial_construction" :=
  (validation_mode.Partial_construction_skeleton (|Block_hash|).(S.HASH.t))
and "'validation_mode.Full_construction" :=
  (validation_mode.Full_construction_skeleton (|Block_hash|).(S.HASH.t)
    Alpha_context.Block_header.contents Alpha_context.public_key_hash
    Alpha_context.Period.t).

Module validation_mode.
  Include ConstructorRecordNotations_validation_mode.validation_mode.
  Definition Application := 'validation_mode.Application.
  Definition Partial_application := 'validation_mode.Partial_application.
  Definition Partial_construction := 'validation_mode.Partial_construction.
  Definition Full_construction := 'validation_mode.Full_construction.
End validation_mode.

Module validation_state.
  Record record : Set := Build {
    mode : validation_mode;
    chain_id : (|Chain_id|).(S.HASH.t);
    ctxt : Alpha_context.t;
    op_count : int }.
  Definition with_mode mode (r : record) :=
    Build mode r.(chain_id) r.(ctxt) r.(op_count).
  Definition with_chain_id chain_id (r : record) :=
    Build r.(mode) chain_id r.(ctxt) r.(op_count).
  Definition with_ctxt ctxt (r : record) :=
    Build r.(mode) r.(chain_id) ctxt r.(op_count).
  Definition with_op_count op_count (r : record) :=
    Build r.(mode) r.(chain_id) r.(ctxt) op_count.
End validation_state.
Definition validation_state := validation_state.record.

Definition current_context (function_parameter : validation_state)
  : Lwt.t (Error_monad.tzresult Context.t) :=
  let '{| validation_state.ctxt := ctxt |} := function_parameter in
  Error_monad.__return
    (Alpha_context.finalize None ctxt).(Updater.validation_result.context).

Definition begin_partial_application
  (chain_id : (|Chain_id|).(S.HASH.t)) (ctxt : Context.t)
  (predecessor_timestamp : Time.t)
  (predecessor_fitness : Alpha_context.Fitness.t)
  (block_header : Alpha_context.Block_header.t)
  : Lwt.t (Error_monad.tzresult validation_state) :=
  let level :=
    block_header.(block_header.shell).(Block_header.shell_header.level) in
  let fitness := predecessor_fitness in
  let timestamp :=
    block_header.(block_header.shell).(Block_header.shell_header.timestamp) in
  let=? ctxt :=
    Alpha_context.prepare ctxt level predecessor_timestamp timestamp fitness in
  let=? '(ctxt, baker, block_delay) :=
    Apply.begin_application ctxt chain_id block_header predecessor_timestamp in
  let mode :=
    Partial_application
      {| validation_mode.Partial_application.block_header := block_header;
        validation_mode.Partial_application.baker :=
          (|Signature.Public_key|).(S.SPublic_key.__hash_value) baker;
        validation_mode.Partial_application.block_delay := block_delay |} in
  Error_monad.__return
    {| validation_state.mode := mode; validation_state.chain_id := chain_id;
      validation_state.ctxt := ctxt; validation_state.op_count := 0 |}.

Definition begin_application
  (chain_id : (|Chain_id|).(S.HASH.t)) (ctxt : Context.t)
  (predecessor_timestamp : Time.t)
  (predecessor_fitness : Alpha_context.Fitness.t)
  (block_header : Alpha_context.Block_header.t)
  : Lwt.t (Error_monad.tzresult validation_state) :=
  let level :=
    block_header.(block_header.shell).(Block_header.shell_header.level) in
  let fitness := predecessor_fitness in
  let timestamp :=
    block_header.(block_header.shell).(Block_header.shell_header.timestamp) in
  let=? ctxt :=
    Alpha_context.prepare ctxt level predecessor_timestamp timestamp fitness in
  let=? '(ctxt, baker, block_delay) :=
    Apply.begin_application ctxt chain_id block_header predecessor_timestamp in
  let mode :=
    Application
      {| validation_mode.Application.block_header := block_header;
        validation_mode.Application.baker :=
          (|Signature.Public_key|).(S.SPublic_key.__hash_value) baker;
        validation_mode.Application.block_delay := block_delay |} in
  Error_monad.__return
    {| validation_state.mode := mode; validation_state.chain_id := chain_id;
      validation_state.ctxt := ctxt; validation_state.op_count := 0 |}.

Definition begin_construction
  (chain_id : (|Chain_id|).(S.HASH.t)) (ctxt : Context.t)
  (predecessor_timestamp : Time.t) (pred_level : int32)
  (pred_fitness : Alpha_context.Fitness.t)
  (predecessor : (|Block_hash|).(S.HASH.t)) (timestamp : Time.t)
  (protocol_data : option block_header_data) (function_parameter : unit)
  : Lwt.t (Error_monad.tzresult validation_state) :=
  let '_ := function_parameter in
  let level := Int32.succ pred_level in
  let fitness := pred_fitness in
  let=? ctxt :=
    Alpha_context.prepare ctxt level predecessor_timestamp timestamp fitness in
  let=? '(mode, ctxt) :=
    match protocol_data with
    | None =>
      let=? ctxt := Apply.begin_partial_construction ctxt in
      let mode :=
        Partial_construction
          {| validation_mode.Partial_construction.predecessor := predecessor |}
        in
      Error_monad.__return (mode, ctxt)
    | Some proto_header =>
      let=? '(ctxt, protocol_data, baker, block_delay) :=
        Apply.begin_full_construction ctxt predecessor_timestamp
          proto_header.(Alpha_context.Block_header.protocol_data.contents) in
      let mode :=
        let baker := (|Signature.Public_key|).(S.SPublic_key.__hash_value) baker
          in
        Full_construction
          {| validation_mode.Full_construction.predecessor := predecessor;
            validation_mode.Full_construction.protocol_data := protocol_data;
            validation_mode.Full_construction.baker := baker;
            validation_mode.Full_construction.block_delay := block_delay |} in
      Error_monad.__return (mode, ctxt)
    end in
  Error_monad.__return
    {| validation_state.mode := mode; validation_state.chain_id := chain_id;
      validation_state.ctxt := ctxt; validation_state.op_count := 0 |}.

Definition apply_operation (function_parameter : validation_state)
  : Alpha_context.packed_operation ->
  Lwt.t (Error_monad.tzresult (validation_state * operation_receipt)) :=
  let
    '{|
      validation_state.mode := mode;
        validation_state.chain_id := chain_id;
        validation_state.ctxt := ctxt;
        validation_state.op_count := op_count
        |} as data := function_parameter in
  fun operation =>
    match
      (mode,
        match mode with
        | Partial_application _ =>
          Pervasives.not
            (List.__exists ((|Compare.Int|).(Compare.S.equal) 0)
              (Alpha_context.Operation.acceptable_passes operation))
        | _ => false
        end) with
    | (Partial_application _, true) =>
      let op_count := Pervasives.op_plus op_count 1 in
      Error_monad.__return
        ((validation_state.with_op_count op_count
          (validation_state.with_ctxt ctxt data)), No_operation_metadata)
    | (_, _) =>
      let '{|
        operation.shell := shell;
          operation.protocol_data := Operation_data protocol_data
          |} := operation in
      let operation :=
        {| Alpha_context.operation.shell := shell;
          Alpha_context.operation.protocol_data := protocol_data |} in
      let '(predecessor, baker) :=
        match mode with
        |
          (Partial_application {|
            validation_mode.Partial_application.block_header := {|
              block_header.shell := {|
                Block_header.shell_header.predecessor := predecessor
                  |}
                |};
              validation_mode.Partial_application.baker := baker
              |} |
          Application {|
            validation_mode.Application.block_header := {|
              block_header.shell := {|
                Block_header.shell_header.predecessor := predecessor
                  |}
                |};
              validation_mode.Application.baker := baker
              |} |
          Full_construction {|
            validation_mode.Full_construction.predecessor := predecessor;
              validation_mode.Full_construction.baker := baker
              |}) => (predecessor, baker)
        |
          Partial_construction {|
            validation_mode.Partial_construction.predecessor := predecessor
              |} =>
          (predecessor, (|Signature.Public_key_hash|).(S.SPublic_key_hash.zero))
        end in
      let=? '(ctxt, __result_value) :=
        Apply.apply_operation ctxt chain_id Script_ir_translator.Optimized
          predecessor baker (Alpha_context.Operation.__hash_value operation)
          operation in
      let op_count := Pervasives.op_plus op_count 1 in
      Error_monad.__return
        ((validation_state.with_op_count op_count
          (validation_state.with_ctxt ctxt data)),
          (Operation_metadata __result_value))
    end.

Definition finalize_block (function_parameter : validation_state)
  : Lwt.t
    (Error_monad.tzresult
      (Updater.validation_result * Apply_results.block_metadata)) :=
  let '{|
    validation_state.mode := mode;
      validation_state.ctxt := ctxt;
      validation_state.op_count := op_count
      |} := function_parameter in
  match mode with
  | Partial_construction _ =>
    let level := Alpha_context.Level.current ctxt in
    let=? voting_period_kind := Alpha_context.Vote.get_current_period_kind ctxt
      in
    let baker := (|Signature.Public_key_hash|).(S.SPublic_key_hash.zero) in
    let=? ctxt :=
      (|Signature.Public_key_hash|).(S.SPublic_key_hash.Map).(S.INDEXES_Map.fold)
        (fun delegate =>
          fun deposit =>
            fun ctxt =>
              let=? ctxt := ctxt in
              Alpha_context.Delegate.freeze_deposit ctxt delegate deposit)
        (Alpha_context.get_deposits ctxt) (Error_monad.__return ctxt) in
    let ctxt := Alpha_context.finalize None ctxt in
    Error_monad.__return
      (ctxt,
        {| Apply_results.block_metadata.baker := baker;
          Apply_results.block_metadata.level := level;
          Apply_results.block_metadata.voting_period_kind := voting_period_kind;
          Apply_results.block_metadata.nonce_hash := None;
          Apply_results.block_metadata.consumed_gas := Z.zero;
          Apply_results.block_metadata.deactivated := nil;
          Apply_results.block_metadata.balance_updates := nil |})
  |
    Partial_application {|
      validation_mode.Partial_application.block_header := block_header;
        validation_mode.Partial_application.baker := baker;
        validation_mode.Partial_application.block_delay := block_delay
        |} =>
    let level := Alpha_context.Level.current ctxt in
    let included_endorsements := Alpha_context.included_endorsements ctxt in
    let=? '_ :=
      Apply.check_minimum_endorsements ctxt
        block_header.(block_header.protocol_data).(Alpha_context.Block_header.protocol_data.contents)
        block_delay included_endorsements in
    let=? voting_period_kind := Alpha_context.Vote.get_current_period_kind ctxt
      in
    let ctxt := Alpha_context.finalize None ctxt in
    Error_monad.__return
      (ctxt,
        {| Apply_results.block_metadata.baker := baker;
          Apply_results.block_metadata.level := level;
          Apply_results.block_metadata.voting_period_kind := voting_period_kind;
          Apply_results.block_metadata.nonce_hash := None;
          Apply_results.block_metadata.consumed_gas := Z.zero;
          Apply_results.block_metadata.deactivated := nil;
          Apply_results.block_metadata.balance_updates := nil |})
  |
    (Application {|
      validation_mode.Application.block_header := {|
        block_header.protocol_data := {|
          Alpha_context.Block_header.protocol_data.contents := protocol_data
            |}
          |};
        validation_mode.Application.baker := baker;
        validation_mode.Application.block_delay := block_delay
        |} |
    Full_construction {|
      validation_mode.Full_construction.protocol_data := protocol_data;
        validation_mode.Full_construction.baker := baker;
        validation_mode.Full_construction.block_delay := block_delay
        |}) =>
    let=? '(ctxt, receipt) :=
      Apply.finalize_application ctxt protocol_data baker block_delay in
    let level := Alpha_context.Level.current ctxt in
    let priority := protocol_data.(Alpha_context.Block_header.contents.priority)
      in
    let raw_level :=
      Alpha_context.Raw_level.to_int32 level.(Alpha_context.Level.t.level) in
    let fitness := Alpha_context.Fitness.current ctxt in
    let commit_message :=
      Format.asprintf
        (CamlinternalFormatBasics.Format
          (CamlinternalFormatBasics.String_literal "lvl "
            (CamlinternalFormatBasics.Int32 CamlinternalFormatBasics.Int_d
              CamlinternalFormatBasics.No_padding
              CamlinternalFormatBasics.No_precision
              (CamlinternalFormatBasics.String_literal ", fit 1:"
                (CamlinternalFormatBasics.Int64 CamlinternalFormatBasics.Int_d
                  CamlinternalFormatBasics.No_padding
                  CamlinternalFormatBasics.No_precision
                  (CamlinternalFormatBasics.String_literal ", prio "
                    (CamlinternalFormatBasics.Int CamlinternalFormatBasics.Int_d
                      CamlinternalFormatBasics.No_padding
                      CamlinternalFormatBasics.No_precision
                      (CamlinternalFormatBasics.String_literal ", "
                        (CamlinternalFormatBasics.Int
                          CamlinternalFormatBasics.Int_d
                          CamlinternalFormatBasics.No_padding
                          CamlinternalFormatBasics.No_precision
                          (CamlinternalFormatBasics.String_literal " ops"
                            CamlinternalFormatBasics.End_of_format)))))))))
          "lvl %ld, fit 1:%Ld, prio %d, %d ops") raw_level fitness priority
        op_count in
    let ctxt := Alpha_context.finalize (Some commit_message) ctxt in
    Error_monad.__return (ctxt, receipt)
  end.

Definition compare_operations
  (op1 : Alpha_context.packed_operation) (op2 : Alpha_context.packed_operation)
  : int :=
  let 'Alpha_context.Operation_data op1 :=
    op1.(Alpha_context.packed_operation.protocol_data) in
  let 'Alpha_context.Operation_data op2 :=
    op2.(Alpha_context.packed_operation.protocol_data) in
  match
    (op1.(Alpha_context.protocol_data.contents),
      op2.(Alpha_context.protocol_data.contents)) with
  |
    (Alpha_context.Single (Alpha_context.Endorsement _),
      Alpha_context.Single (Alpha_context.Endorsement _)) => 0
  | (_, Alpha_context.Single (Alpha_context.Endorsement _)) => 1
  | (Alpha_context.Single (Alpha_context.Endorsement _), _) => (-1)
  |
    (Alpha_context.Single (Alpha_context.Seed_nonce_revelation _),
      Alpha_context.Single (Alpha_context.Seed_nonce_revelation _)) => 0
  | (_, Alpha_context.Single (Alpha_context.Seed_nonce_revelation _)) => 1
  | (Alpha_context.Single (Alpha_context.Seed_nonce_revelation _), _) => (-1)
  |
    (Alpha_context.Single (Alpha_context.Double_endorsement_evidence _),
      Alpha_context.Single (Alpha_context.Double_endorsement_evidence _)) => 0
  | (_, Alpha_context.Single (Alpha_context.Double_endorsement_evidence _)) => 1
  | (Alpha_context.Single (Alpha_context.Double_endorsement_evidence _), _) =>
    (-1)
  |
    (Alpha_context.Single (Alpha_context.Double_baking_evidence _),
      Alpha_context.Single (Alpha_context.Double_baking_evidence _)) => 0
  | (_, Alpha_context.Single (Alpha_context.Double_baking_evidence _)) => 1
  | (Alpha_context.Single (Alpha_context.Double_baking_evidence _), _) => (-1)
  |
    (Alpha_context.Single (Alpha_context.Activate_account _),
      Alpha_context.Single (Alpha_context.Activate_account _)) => 0
  | (_, Alpha_context.Single (Alpha_context.Activate_account _)) => 1
  | (Alpha_context.Single (Alpha_context.Activate_account _), _) => (-1)
  |
    (Alpha_context.Single (Alpha_context.Proposals _),
      Alpha_context.Single (Alpha_context.Proposals _)) => 0
  | (_, Alpha_context.Single (Alpha_context.Proposals _)) => 1
  | (Alpha_context.Single (Alpha_context.Proposals _), _) => (-1)
  |
    (Alpha_context.Single (Alpha_context.Ballot _),
      Alpha_context.Single (Alpha_context.Ballot _)) => 0
  | (_, Alpha_context.Single (Alpha_context.Ballot _)) => 1
  | (Alpha_context.Single (Alpha_context.Ballot _), _) => (-1)
  |
    (Alpha_context.Single (Alpha_context.Manager_operation op1),
      Alpha_context.Single (Alpha_context.Manager_operation op2)) =>
    Z.compare op1.(Alpha_context.contents.Manager_operation.counter)
      op2.(Alpha_context.contents.Manager_operation.counter)
  |
    (Alpha_context.Cons (Alpha_context.Manager_operation op1) _,
      Alpha_context.Single (Alpha_context.Manager_operation op2)) =>
    Z.compare op1.(Alpha_context.contents.Manager_operation.counter)
      op2.(Alpha_context.contents.Manager_operation.counter)
  |
    (Alpha_context.Single (Alpha_context.Manager_operation op1),
      Alpha_context.Cons (Alpha_context.Manager_operation op2) _) =>
    Z.compare op1.(Alpha_context.contents.Manager_operation.counter)
      op2.(Alpha_context.contents.Manager_operation.counter)
  |
    (Alpha_context.Cons (Alpha_context.Manager_operation op1) _,
      Alpha_context.Cons (Alpha_context.Manager_operation op2) _) =>
    Z.compare op1.(Alpha_context.contents.Manager_operation.counter)
      op2.(Alpha_context.contents.Manager_operation.counter)
  end.

Definition init (ctxt : Context.t) (block_header : Block_header.shell_header)
  : Lwt.t (Error_monad.tzresult Updater.validation_result) :=
  let level := block_header.(Block_header.shell_header.level) in
  let fitness := block_header.(Block_header.shell_header.fitness) in
  let timestamp := block_header.(Block_header.shell_header.timestamp) in
  let typecheck (ctxt : Alpha_context.context) (script : Alpha_context.Script.t)
    : Lwt.t
      (Error_monad.tzresult
        ((Alpha_context.Script.t * option Alpha_context.Contract.big_map_diff) *
          Alpha_context.context)) :=
    let=? '(Script_ir_translator.Ex_script parsed_script, ctxt) :=
      Script_ir_translator.parse_script None ctxt false script in
    let 'existT _ __Ex_script_'b [parsed_script, ctxt] :=
      existT (A := Set)
        (fun __Ex_script_'b =>
          [Script_typed_ir.script __Ex_script_'b ** Alpha_context.context]) _
        [parsed_script, ctxt] in
    let=? '(storage, big_map_diff, ctxt) :=
      Script_ir_translator.extract_big_map_diff ctxt
        Script_ir_translator.Optimized false Script_ir_translator.no_big_map_id
        Script_ir_translator.no_big_map_id
        parsed_script.(Script_typed_ir.script.storage_type)
        parsed_script.(Script_typed_ir.script.storage) in
    let=? '(storage, ctxt) :=
      Script_ir_translator.unparse_data ctxt Script_ir_translator.Optimized
        parsed_script.(Script_typed_ir.script.storage_type) storage in
    let storage :=
      Alpha_context.Script.__lazy_expr_value (Micheline.strip_locations storage)
      in
    Error_monad.__return
      (((Alpha_context.Script.t.with_storage storage script), big_map_diff),
        ctxt) in
  let=? ctxt :=
    Alpha_context.prepare_first_block ctxt typecheck level timestamp fitness in
  Error_monad.__return (Alpha_context.finalize None ctxt).
