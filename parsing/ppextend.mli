(************************************************************************)
(*         *   The Coq Proof Assistant / The Coq Development Team       *)
(*  v      *   INRIA, CNRS and contributors - Copyright 1999-2019       *)
(* <O___,, *       (see CREDITS file for the list of authors)           *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

open Constrexpr
open Notation_gram

(** {6 Pretty-print. } *)

type ppbox =
  | PpHB of int
  | PpHOVB of int
  | PpHVB of int
  | PpVB of int

type ppcut =
  | PpBrk of int * int
  | PpFnl

val ppcmd_of_box : ppbox -> Pp.t -> Pp.t

val ppcmd_of_cut : ppcut -> Pp.t

(** {6 Printing rules for notations} *)

(** Declare and look for the printing rule for symbolic notations *)
type unparsing =
  | UnpMetaVar of int * parenRelation
  | UnpBinderMetaVar of int * parenRelation
  | UnpListMetaVar of int * parenRelation * unparsing list
  | UnpBinderListMetaVar of int * bool * unparsing list
  | UnpTerminal of string
  | UnpBox of ppbox * unparsing Loc.located list
  | UnpCut of ppcut

type unparsing_rule = unparsing list * precedence
type extra_unparsing_rules = (string * string) list

val unparsing_eq : unparsing -> unparsing -> bool

val declare_generic_notation_printing_rules : notation -> reserved:bool -> extra:extra_unparsing_rules -> unparsing_rule -> unit
val declare_specific_notation_printing_rules : specific_notation -> extra:extra_unparsing_rules -> unparsing_rule -> unit
val has_generic_notation_printing_rule : notation -> bool
val find_generic_notation_printing_rule : notation -> unparsing_rule * bool * extra_unparsing_rules
val find_specific_notation_printing_rule : specific_notation -> unparsing_rule * extra_unparsing_rules
val find_notation_printing_rule : notation_with_optional_scope option -> notation -> unparsing_rule
val find_notation_extra_printing_rules : notation_with_optional_scope option -> notation -> extra_unparsing_rules
val add_notation_extra_printing_rule : notation -> string -> string -> unit
