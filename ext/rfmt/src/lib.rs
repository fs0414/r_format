use magnus::{define_module, function, prelude::*, Error, Ruby};

fn format_ruby_code(source: String) -> String {
    // indent with 2 spaces
    let lines: Vec<&str> = source.lines().collect();
    let mut result = Vec::new();
    let mut indent_level: i32 = 0;
    
    for line in lines {
        let trimmed = line.trim();
        
        if trimmed == "end" || trimmed.starts_with("end ") 
            || trimmed == "}" || trimmed == "]" {
            indent_level = indent_level.saturating_sub(1);
        }
        
        // eval indent
        if !trimmed.is_empty() {
            result.push(format!("{}{}", "  ".repeat(indent_level as usize), trimmed));
        } else {
            result.push(String::new());
        }
        
        // add indent lebel
        if trimmed.starts_with("def ") || trimmed.starts_with("class ")
            || trimmed.starts_with("module ") || trimmed.starts_with("if ")
            || trimmed.starts_with("unless ") || trimmed.starts_with("while ")
            || trimmed.starts_with("for ") || trimmed.starts_with("do ")
            || trimmed == "do" || trimmed.ends_with(" do")
            || trimmed == "{" || trimmed == "[" {
            indent_level += 1;
        }
    }
    
    result.join("\n")
}

fn rust_version() -> String {
    "0.1.0 (Rust)".to_string()
}

#[magnus::init]
fn init(_ruby: &Ruby) -> Result<(), Error> {
    let module = define_module("Rfmt")?;
    module.define_singleton_method("format_code", function!(format_ruby_code, 1))?;
    module.define_singleton_method("rust_version", function!(rust_version, 0))?;
    Ok(())
}
