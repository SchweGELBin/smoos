use crate::Error;
use std::env::var;
use serde_json::{json, to_string_pretty,  Value};
use std::io::{Read, Write};
use std::net::TcpStream;

pub async fn request(
    req_type: String,
    req_data: Option<String>
) -> Result<String, Error> {
    let token: String = var("API_TOKEN").expect("Missing `API_TOKEN` env var");
    let host: String = var("API_HOST").unwrap_or("localhost".to_string());
    let port: String = var("API_PORT").unwrap_or("1027".to_string());

    let url = format!("{}:{}", host, port);
    let json = json!({
        "API_JSON_REQUEST": {
            "Token": token,
            "Type": req_type,
            "Data": req_data
        }
    }).to_string();

    let mut stream = TcpStream::connect(url).unwrap();
    stream.write_all(json.as_bytes()).unwrap();

    let mut response = String::new();
    stream.read_to_string(&mut response).unwrap();

    let response_json: Value = serde_json::from_str(&response).unwrap();
    let output = to_string_pretty(&response_json).unwrap();

    Ok(output)
}
