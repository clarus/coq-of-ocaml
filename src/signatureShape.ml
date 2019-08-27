type t = item list
and item =
  | Module of Name.t * t
  | Name of Name.t

let rec of_signature (signature : Types.signature) : t =
  let rec of_signature_item (signature_item : Types.signature_item) : item option =
    match signature_item with
    | Sig_value (ident, _) | Sig_type (ident, _, _) -> Some (Name (Name.of_ident ident))
    | Sig_typext _ | Sig_modtype _ | Sig_class _ | Sig_class_type _ -> None
    | Sig_module (ident, module_declaration, _) ->
      let name = Name.of_ident ident in
      begin match module_declaration.md_type with
      | Mty_signature signature -> Some (Module (name, of_signature signature))
      | _ -> None
      end in
  signature |> Util.List.filter_map of_signature_item

let rec are_equal (shape1 : t) (shape2 : t) : bool =
  List.length shape1 = List.length shape2 &&
  let compare_items = fun item1 item2 ->
    match (item1, item2) with
    | (Module (name1, _) | Name name1), (Module (name2, _) | Name name2) ->
      String.compare name1 name2 in
  let shape1 = shape1 |> List.sort compare_items in
  let shape2 = shape2 |> List.sort compare_items in
  List.for_all2
    (fun item1 item2 ->
      match (item1, item2) with
      | Module (name1, shape1), Module (name2, shape2) -> name1 = name2 && are_equal shape1 shape2
      | Name name1, Name name2 -> name1 = name2
      | Module _, Name _ | Name _, Module _ -> false
    )
    shape1
    shape2