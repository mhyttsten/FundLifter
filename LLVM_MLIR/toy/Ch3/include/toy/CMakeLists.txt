mlir_tablegen(${SUBPROJECT_SRC_DIR} -gen-op-decls Ops.td Ops.h.inc)
mlir_tablegen(${SUBPROJECT_SRC_DIR} -gen-op-defs  Ops.td Ops.cpp.inc)

add_custom_target(ch3_generate_include_tabledefs ALL
   DEPENDS Ops.h.inc Ops.cpp.inc
   )

