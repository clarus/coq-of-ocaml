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
Require Tezos.Period_repr.
Require Tezos.Tez_repr.

Definition version_number_004 : string := "\000".

Definition version_number : string := "\001".

Definition proof_of_work_nonce_size : int := 8.

Definition nonce_length : int := 32.

Definition max_revelations_per_block : int := 32.

Definition max_proposals_per_delegate : int := 20.

Definition max_operation_data_length : int := Pervasives.op_star 16 1024.

Module fixed.
  Record record : Set := Build {
    proof_of_work_nonce_size : int;
    nonce_length : int;
    max_revelations_per_block : int;
    max_operation_data_length : int;
    max_proposals_per_delegate : int }.
  Definition with_proof_of_work_nonce_size proof_of_work_nonce_size
    (r : record) :=
    Build proof_of_work_nonce_size r.(nonce_length)
      r.(max_revelations_per_block) r.(max_operation_data_length)
      r.(max_proposals_per_delegate).
  Definition with_nonce_length nonce_length (r : record) :=
    Build r.(proof_of_work_nonce_size) nonce_length
      r.(max_revelations_per_block) r.(max_operation_data_length)
      r.(max_proposals_per_delegate).
  Definition with_max_revelations_per_block max_revelations_per_block
    (r : record) :=
    Build r.(proof_of_work_nonce_size) r.(nonce_length)
      max_revelations_per_block r.(max_operation_data_length)
      r.(max_proposals_per_delegate).
  Definition with_max_operation_data_length max_operation_data_length
    (r : record) :=
    Build r.(proof_of_work_nonce_size) r.(nonce_length)
      r.(max_revelations_per_block) max_operation_data_length
      r.(max_proposals_per_delegate).
  Definition with_max_proposals_per_delegate max_proposals_per_delegate
    (r : record) :=
    Build r.(proof_of_work_nonce_size) r.(nonce_length)
      r.(max_revelations_per_block) r.(max_operation_data_length)
      max_proposals_per_delegate.
End fixed.
Definition fixed := fixed.record.

Definition fixed_encoding : Data_encoding.encoding fixed :=
  Data_encoding.conv
    (fun c =>
      (c.(fixed.proof_of_work_nonce_size), c.(fixed.nonce_length),
        c.(fixed.max_revelations_per_block),
        c.(fixed.max_operation_data_length),
        c.(fixed.max_proposals_per_delegate)))
    (fun function_parameter =>
      let
        '(proof_of_work_nonce_size, nonce_length, max_revelations_per_block,
          max_operation_data_length, max_proposals_per_delegate) :=
        function_parameter in
      ({| fixed.proof_of_work_nonce_size := proof_of_work_nonce_size;
        fixed.nonce_length := nonce_length;
        fixed.max_revelations_per_block := max_revelations_per_block;
        fixed.max_operation_data_length := max_operation_data_length;
        fixed.max_proposals_per_delegate := max_proposals_per_delegate |}
        : fixed)) None
    (Data_encoding.obj5
      (Data_encoding.req None None "proof_of_work_nonce_size"
        Data_encoding.uint8)
      (Data_encoding.req None None "nonce_length" Data_encoding.uint8)
      (Data_encoding.req None None "max_revelations_per_block"
        Data_encoding.uint8)
      (Data_encoding.req None None "max_operation_data_length"
        Data_encoding.int31)
      (Data_encoding.req None None "max_proposals_per_delegate"
        Data_encoding.uint8)).

Definition __fixed_value : fixed :=
  ({| fixed.proof_of_work_nonce_size := proof_of_work_nonce_size;
    fixed.nonce_length := nonce_length;
    fixed.max_revelations_per_block := max_revelations_per_block;
    fixed.max_operation_data_length := max_operation_data_length;
    fixed.max_proposals_per_delegate := max_proposals_per_delegate |} : fixed).

Module parametric.
  Record record : Set := Build {
    preserved_cycles : int;
    blocks_per_cycle : int32;
    blocks_per_commitment : int32;
    blocks_per_roll_snapshot : int32;
    blocks_per_voting_period : int32;
    time_between_blocks : list Period_repr.t;
    endorsers_per_block : int;
    hard_gas_limit_per_operation : Z.t;
    hard_gas_limit_per_block : Z.t;
    proof_of_work_threshold : int64;
    tokens_per_roll : Tez_repr.t;
    michelson_maximum_type_size : int;
    seed_nonce_revelation_tip : Tez_repr.t;
    origination_size : int;
    block_security_deposit : Tez_repr.t;
    endorsement_security_deposit : Tez_repr.t;
    block_reward : Tez_repr.t;
    endorsement_reward : Tez_repr.t;
    cost_per_byte : Tez_repr.t;
    hard_storage_limit_per_operation : Z.t;
    test_chain_duration : int64;
    quorum_min : int32;
    quorum_max : int32;
    min_proposal_quorum : int32;
    initial_endorsers : int;
    delay_per_missing_endorsement : Period_repr.t }.
  Definition with_preserved_cycles preserved_cycles (r : record) :=
    Build preserved_cycles r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_blocks_per_cycle blocks_per_cycle (r : record) :=
    Build r.(preserved_cycles) blocks_per_cycle r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_blocks_per_commitment blocks_per_commitment (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) blocks_per_commitment
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_blocks_per_roll_snapshot blocks_per_roll_snapshot
    (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      blocks_per_roll_snapshot r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_blocks_per_voting_period blocks_per_voting_period
    (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) blocks_per_voting_period
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_time_between_blocks time_between_blocks (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      time_between_blocks r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_endorsers_per_block endorsers_per_block (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) endorsers_per_block
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_hard_gas_limit_per_operation hard_gas_limit_per_operation
    (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      hard_gas_limit_per_operation r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_hard_gas_limit_per_block hard_gas_limit_per_block
    (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) hard_gas_limit_per_block
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_proof_of_work_threshold proof_of_work_threshold
    (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      proof_of_work_threshold r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_tokens_per_roll tokens_per_roll (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) tokens_per_roll
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_michelson_maximum_type_size michelson_maximum_type_size
    (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      michelson_maximum_type_size r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_seed_nonce_revelation_tip seed_nonce_revelation_tip
    (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) seed_nonce_revelation_tip
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_origination_size origination_size (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      origination_size r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_block_security_deposit block_security_deposit (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) block_security_deposit
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_endorsement_security_deposit endorsement_security_deposit
    (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      endorsement_security_deposit r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_block_reward block_reward (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) block_reward r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_endorsement_reward endorsement_reward (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) endorsement_reward
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      r.(delay_per_missing_endorsement).
  Definition with_cost_per_byte cost_per_byte (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      cost_per_byte r.(hard_storage_limit_per_operation) r.(test_chain_duration)
      r.(quorum_min) r.(quorum_max) r.(min_proposal_quorum)
      r.(initial_endorsers) r.(delay_per_missing_endorsement).
  Definition with_hard_storage_limit_per_operation
    hard_storage_limit_per_operation (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) hard_storage_limit_per_operation r.(test_chain_duration)
      r.(quorum_min) r.(quorum_max) r.(min_proposal_quorum)
      r.(initial_endorsers) r.(delay_per_missing_endorsement).
  Definition with_test_chain_duration test_chain_duration (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation) test_chain_duration
      r.(quorum_min) r.(quorum_max) r.(min_proposal_quorum)
      r.(initial_endorsers) r.(delay_per_missing_endorsement).
  Definition with_quorum_min quorum_min (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) quorum_min r.(quorum_max) r.(min_proposal_quorum)
      r.(initial_endorsers) r.(delay_per_missing_endorsement).
  Definition with_quorum_max quorum_max (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) quorum_max r.(min_proposal_quorum)
      r.(initial_endorsers) r.(delay_per_missing_endorsement).
  Definition with_min_proposal_quorum min_proposal_quorum (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max) min_proposal_quorum
      r.(initial_endorsers) r.(delay_per_missing_endorsement).
  Definition with_initial_endorsers initial_endorsers (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) initial_endorsers
      r.(delay_per_missing_endorsement).
  Definition with_delay_per_missing_endorsement delay_per_missing_endorsement
    (r : record) :=
    Build r.(preserved_cycles) r.(blocks_per_cycle) r.(blocks_per_commitment)
      r.(blocks_per_roll_snapshot) r.(blocks_per_voting_period)
      r.(time_between_blocks) r.(endorsers_per_block)
      r.(hard_gas_limit_per_operation) r.(hard_gas_limit_per_block)
      r.(proof_of_work_threshold) r.(tokens_per_roll)
      r.(michelson_maximum_type_size) r.(seed_nonce_revelation_tip)
      r.(origination_size) r.(block_security_deposit)
      r.(endorsement_security_deposit) r.(block_reward) r.(endorsement_reward)
      r.(cost_per_byte) r.(hard_storage_limit_per_operation)
      r.(test_chain_duration) r.(quorum_min) r.(quorum_max)
      r.(min_proposal_quorum) r.(initial_endorsers)
      delay_per_missing_endorsement.
End parametric.
Definition parametric := parametric.record.

Definition parametric_encoding : Data_encoding.encoding parametric :=
  Data_encoding.conv
    (fun c =>
      ((c.(parametric.preserved_cycles), c.(parametric.blocks_per_cycle),
        c.(parametric.blocks_per_commitment),
        c.(parametric.blocks_per_roll_snapshot),
        c.(parametric.blocks_per_voting_period),
        c.(parametric.time_between_blocks), c.(parametric.endorsers_per_block),
        c.(parametric.hard_gas_limit_per_operation),
        c.(parametric.hard_gas_limit_per_block)),
        ((c.(parametric.proof_of_work_threshold),
          c.(parametric.tokens_per_roll),
          c.(parametric.michelson_maximum_type_size),
          c.(parametric.seed_nonce_revelation_tip),
          c.(parametric.origination_size),
          c.(parametric.block_security_deposit),
          c.(parametric.endorsement_security_deposit),
          c.(parametric.block_reward)),
          (c.(parametric.endorsement_reward), c.(parametric.cost_per_byte),
            c.(parametric.hard_storage_limit_per_operation),
            c.(parametric.test_chain_duration), c.(parametric.quorum_min),
            c.(parametric.quorum_max), c.(parametric.min_proposal_quorum),
            c.(parametric.initial_endorsers),
            c.(parametric.delay_per_missing_endorsement)))))
    (fun function_parameter =>
      let
        '((preserved_cycles, blocks_per_cycle, blocks_per_commitment,
          blocks_per_roll_snapshot, blocks_per_voting_period,
          time_between_blocks, endorsers_per_block,
          hard_gas_limit_per_operation, hard_gas_limit_per_block),
          ((proof_of_work_threshold, tokens_per_roll,
            michelson_maximum_type_size, seed_nonce_revelation_tip,
            origination_size, block_security_deposit,
            endorsement_security_deposit, block_reward),
            (endorsement_reward, cost_per_byte,
              hard_storage_limit_per_operation, test_chain_duration, quorum_min,
              quorum_max, min_proposal_quorum, initial_endorsers,
              delay_per_missing_endorsement))) := function_parameter in
      ({| parametric.preserved_cycles := preserved_cycles;
        parametric.blocks_per_cycle := blocks_per_cycle;
        parametric.blocks_per_commitment := blocks_per_commitment;
        parametric.blocks_per_roll_snapshot := blocks_per_roll_snapshot;
        parametric.blocks_per_voting_period := blocks_per_voting_period;
        parametric.time_between_blocks := time_between_blocks;
        parametric.endorsers_per_block := endorsers_per_block;
        parametric.hard_gas_limit_per_operation := hard_gas_limit_per_operation;
        parametric.hard_gas_limit_per_block := hard_gas_limit_per_block;
        parametric.proof_of_work_threshold := proof_of_work_threshold;
        parametric.tokens_per_roll := tokens_per_roll;
        parametric.michelson_maximum_type_size := michelson_maximum_type_size;
        parametric.seed_nonce_revelation_tip := seed_nonce_revelation_tip;
        parametric.origination_size := origination_size;
        parametric.block_security_deposit := block_security_deposit;
        parametric.endorsement_security_deposit := endorsement_security_deposit;
        parametric.block_reward := block_reward;
        parametric.endorsement_reward := endorsement_reward;
        parametric.cost_per_byte := cost_per_byte;
        parametric.hard_storage_limit_per_operation :=
          hard_storage_limit_per_operation;
        parametric.test_chain_duration := test_chain_duration;
        parametric.quorum_min := quorum_min;
        parametric.quorum_max := quorum_max;
        parametric.min_proposal_quorum := min_proposal_quorum;
        parametric.initial_endorsers := initial_endorsers;
        parametric.delay_per_missing_endorsement :=
          delay_per_missing_endorsement |} : parametric)) None
    (Data_encoding.merge_objs
      (Data_encoding.obj9
        (Data_encoding.req None None "preserved_cycles" Data_encoding.uint8)
        (Data_encoding.req None None "blocks_per_cycle"
          Data_encoding.__int32_value)
        (Data_encoding.req None None "blocks_per_commitment"
          Data_encoding.__int32_value)
        (Data_encoding.req None None "blocks_per_roll_snapshot"
          Data_encoding.__int32_value)
        (Data_encoding.req None None "blocks_per_voting_period"
          Data_encoding.__int32_value)
        (Data_encoding.req None None "time_between_blocks"
          (Data_encoding.__list_value None Period_repr.encoding))
        (Data_encoding.req None None "endorsers_per_block" Data_encoding.uint16)
        (Data_encoding.req None None "hard_gas_limit_per_operation"
          Data_encoding.z)
        (Data_encoding.req None None "hard_gas_limit_per_block" Data_encoding.z))
      (Data_encoding.merge_objs
        (Data_encoding.obj8
          (Data_encoding.req None None "proof_of_work_threshold"
            Data_encoding.__int64_value)
          (Data_encoding.req None None "tokens_per_roll" Tez_repr.encoding)
          (Data_encoding.req None None "michelson_maximum_type_size"
            Data_encoding.uint16)
          (Data_encoding.req None None "seed_nonce_revelation_tip"
            Tez_repr.encoding)
          (Data_encoding.req None None "origination_size" Data_encoding.int31)
          (Data_encoding.req None None "block_security_deposit"
            Tez_repr.encoding)
          (Data_encoding.req None None "endorsement_security_deposit"
            Tez_repr.encoding)
          (Data_encoding.req None None "block_reward" Tez_repr.encoding))
        (Data_encoding.obj9
          (Data_encoding.req None None "endorsement_reward" Tez_repr.encoding)
          (Data_encoding.req None None "cost_per_byte" Tez_repr.encoding)
          (Data_encoding.req None None "hard_storage_limit_per_operation"
            Data_encoding.z)
          (Data_encoding.req None None "test_chain_duration"
            Data_encoding.__int64_value)
          (Data_encoding.req None None "quorum_min" Data_encoding.__int32_value)
          (Data_encoding.req None None "quorum_max" Data_encoding.__int32_value)
          (Data_encoding.req None None "min_proposal_quorum"
            Data_encoding.__int32_value)
          (Data_encoding.req None None "initial_endorsers" Data_encoding.uint16)
          (Data_encoding.req None None "delay_per_missing_endorsement"
            Period_repr.encoding)))).

Module t.
  Record record : Set := Build {
    fixed : fixed;
    parametric : parametric }.
  Definition with_fixed fixed (r : record) :=
    Build fixed r.(parametric).
  Definition with_parametric parametric (r : record) :=
    Build r.(fixed) parametric.
End t.
Definition t := t.record.

Definition encoding : Data_encoding.encoding t :=
  Data_encoding.conv
    (fun function_parameter =>
      let '{| t.fixed := __fixed_value; t.parametric := __parametric_value |} :=
        function_parameter in
      (__fixed_value, __parametric_value))
    (fun function_parameter =>
      let '(__fixed_value, __parametric_value) := function_parameter in
      ({| t.fixed := __fixed_value; t.parametric := __parametric_value |} : t))
    None (Data_encoding.merge_objs fixed_encoding parametric_encoding).
