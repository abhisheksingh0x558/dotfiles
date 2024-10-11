{
  # Code style
  editorconfig = {
    enable = true;

    settings = {
      # All files
      "*" = {
        charset = "utf-8"; # File character encoding
        end_of_line = "lf"; # Line ending file format
        indent_size = "tab"; # Mimic tab size
        indent_style = "tab"; # Indent with tabs
        insert_final_newline = true; # Insert newline at end of file
        max_line_length = 120; # Maximum length of line
        tab_width = 2; # Tab size
        trim_trailing_whitespace = true; # Remove whitespaces at end of line
      };
    };
  };
}
