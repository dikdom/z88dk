/* generated by Template::Toolkit - do not edit */

#pragma once

extern void error_read_file(const char *filename);
extern void error_write_file(const char *filename);
extern void error_include_recursion(const char *filename);
extern void error_no_src_file(void);
extern void error_illegal_option(const char *option);
extern void error_glob(const char *filename, const char *error);
extern void error_glob_no_files(const char *filename);
extern void error_not_regular_file(const char *filename);
extern void warn_symbol_different(const char *name, const char *used);
extern void warn_expr_in_parens(void);
extern void error_redefined_macro(const char *name);
extern void error_macro_defcont_without_define(void);
extern void error_macro_recursion(const char* name);
extern void error_missing_close_paren(void);
extern void error_missing_close_angle_bracket(void);
extern void error_missing_macro_arguments(void);
extern void error_extra_macro_arguments(void);
extern void error_syntax(void);
extern void error_syntax_expr(void);
extern void error_invalid_squoted_string(void);
extern void error_unclosed_string(void);
extern void error_divide_by_zero(void);
extern void error_missing_block(void);
extern void error_missing_close_block(void);
extern void error_unbalanced_struct_at(const char *filename, int line_nr);
extern void error_unbalanced_struct(void);
extern void error_not_defined(const char *name);
extern void error_illegal_ident(void);
extern void error_jr_not_local(void);
extern void error_expected_const_expr(void);
extern void error_symbol_redefined(const char *symbol);
extern void error_symbol_redefined_module(const char *symbol, const char *module);
extern void error_symbol_decl_local(const char *symbol);
extern void error_symbol_redecl(const char *symbol);
extern void error_expression_recursion(const char *name);
extern void error_max_codesize(long size);
extern void error_org_redefined(void);
extern void error_align_redefined(void);
extern void error_org_not_aligned(int org, int align);
extern void error_invalid_org_option(const char *org_hex);
extern void error_invalid_org(int origin);
extern void error_invalid_filler_option(const char *filler_hex);
extern void warn_org_ignored(const char *filename, const char *section_name);
extern void error_not_obj_file(const char *filename);
extern void error_obj_file_version(const char *filename, int found_version, int expected_version);
extern void error_not_lib_file(const char *filename);
extern void error_lib_file_version(const char *filename, int found_version, int expected_version);
extern void warn_int_range(long value);
extern void error_int_range(long value);
extern void error_base_register_illegal(long value);
extern void error_missing_arguments(void);
extern void error_extra_arguments(void);
extern void error_port_A_timing(void);
extern void error_dma_unsupported_interrupts(void);
extern void error_dma_illegal_mode(void);
extern void error_dma_illegal_command(void);
extern void error_dma_illegal_read_mask(void);
extern void error_port_B_timing(void);
extern void warn_dma_unsupported_features(void);
extern void warn_dma_unsupported_command(void);
extern void warn_dma_half_cycle_timing(void);
extern void warn_dma_ready_signal_unsupported(void);
extern void error_cmd_failed(const char *cmd);
