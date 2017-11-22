# Copyright 2016 the V8 project authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# Use this to run several variants of the tests.
ALL_VARIANT_FLAGS = {
  "default": [[]],
  "stress": [["--stress-opt", "--always-opt"]],
  # TODO(6792): Write protected code has been temporary added to the below
  # variant until the feature has been enabled (or staged) by default.
  "stress_incremental_marking":  [["--stress-incremental-marking", "--write-protect-code-memory"]],
  # No optimization means disable all optimizations. OptimizeFunctionOnNextCall
  # would not force optimization too. It turns into a Nop. Please see
  # https://chromium-review.googlesource.com/c/452620/ for more discussion.
  "nooptimization": [["--noopt"]],
  "stress_asm_wasm": [["--validate-asm", "--stress-validate-asm", "--suppress-asm-messages"]],
  "wasm_traps": [["--wasm_trap_handler", "--invoke-weak-callbacks"]],
}

# FAST_VARIANTS implies no --always-opt.
FAST_VARIANT_FLAGS = {
  "default": [[]],
  "stress": [["--stress-opt"]],
  # TODO(6792): Write protected code has been temporary added to the below
  # variant until the feature has been enabled (or staged) by default.
  "stress_incremental_marking":  [["--stress-incremental-marking", "--write-protect-code-memory"]],
  # No optimization means disable all optimizations. OptimizeFunctionOnNextCall
  # would not force optimization too. It turns into a Nop. Please see
  # https://chromium-review.googlesource.com/c/452620/ for more discussion.
  "nooptimization": [["--noopt"]],
  "stress_asm_wasm": [["--validate-asm", "--stress-validate-asm", "--suppress-asm-messages"]],
  "wasm_traps": [["--wasm_trap_handler", "--invoke-weak-callbacks"]],
}

ALL_VARIANTS = set(["default", "stress", "stress_incremental_marking",
                    "nooptimization", "stress_asm_wasm", "wasm_traps"])
