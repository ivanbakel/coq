(************************************************************************)
(*         *   The Coq Proof Assistant / The Coq Development Team       *)
(*  v      *         Copyright INRIA, CNRS and contributors             *)
(* <O___,, * (see version control and CREDITS file for authors & dates) *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)
(**************************************************************************)
(*                                                                        *)
(* Omega: a solver of quantifier-free problems in Presburger Arithmetic   *)
(*                                                                        *)
(* Pierre Crégut (CNET, Lannion, France)                                  *)
(*                                                                        *)
(**************************************************************************)

(* We import what is necessary for Omega *)
Require Export ZArith_base.
Require Export OmegaLemmas.
Require Export PreOmega.
Require Import Lia.

Declare ML Module "omega_plugin".

Hint Resolve Z.le_refl Z.add_comm Z.add_assoc Z.mul_comm Z.mul_assoc Z.add_0_l
  Z.add_0_r Z.mul_1_l Z.add_opp_diag_l Z.add_opp_diag_r Z.mul_add_distr_r
  Z.mul_add_distr_l: zarith.

Require Export Zhints.

Hint Extern 10 (_ = _ :>nat) => abstract lia: zarith.
Hint Extern 10 (_ <= _) => abstract lia: zarith.
Hint Extern 10 (_ < _) => abstract lia: zarith.
Hint Extern 10 (_ >= _) => abstract lia: zarith.
Hint Extern 10 (_ > _) => abstract lia: zarith.

Hint Extern 10 (_ <> _ :>nat) => abstract lia: zarith.
Hint Extern 10 (~ _ <= _) => abstract lia: zarith.
Hint Extern 10 (~ _ < _) => abstract lia: zarith.
Hint Extern 10 (~ _ >= _) => abstract lia: zarith.
Hint Extern 10 (~ _ > _) => abstract lia: zarith.

Hint Extern 10 (_ = _ :>Z) => abstract lia: zarith.
Hint Extern 10 (_ <= _)%Z => abstract lia: zarith.
Hint Extern 10 (_ < _)%Z => abstract lia: zarith.
Hint Extern 10 (_ >= _)%Z => abstract lia: zarith.
Hint Extern 10 (_ > _)%Z => abstract lia: zarith.

Hint Extern 10 (_ <> _ :>Z) => abstract lia: zarith.
Hint Extern 10 (~ (_ <= _)%Z) => abstract lia: zarith.
Hint Extern 10 (~ (_ < _)%Z) => abstract lia: zarith.
Hint Extern 10 (~ (_ >= _)%Z) => abstract lia: zarith.
Hint Extern 10 (~ (_ > _)%Z) => abstract lia: zarith.

Hint Extern 10 False => abstract lia: zarith.
