mod api;

use crate::{Context, Error};

#[poise::command(prefix_command, track_edits, slash_command)]
pub async fn help(
    ctx: Context<'_>,
    #[description = "Specific command to show help about"]
    #[autocomplete = "poise::builtins::autocomplete_command"]
    command: Option<String>,
) -> Result<(), Error> {
    poise::builtins::help(
        ctx,
        command.as_deref(),
        poise::builtins::HelpConfiguration {
            extra_text_at_bottom: "This Bot can control the Super Mario Odyssey: Online Server",
            ..Default::default()
        },
    )
    .await?;
    Ok(())
}

#[poise::command(prefix_command, slash_command)]
pub async fn command(
    ctx: Context<'_>,
    #[description = "Execute a command"]
    data: Option<String>,
) -> Result<(), Error> {
    let res = api::request("Command".to_string(), data).await?;
    ctx.say(res).await?;
    Ok(())
}

#[poise::command(prefix_command, slash_command)]
pub async fn permissions(
    ctx: Context<'_>,
    #[description = "Execute a command"]
    data: Option<String>,
) -> Result<(), Error> {
    let res = api::request("Permissions".to_string(), data).await?;
    ctx.say(res).await?;
    Ok(())
}

#[poise::command(prefix_command, slash_command)]
pub async fn status(
    ctx: Context<'_>,
    #[description = "Get the status"]
    data: Option<String>
) -> Result<(), Error> {
    let res = api::request("Status".to_string(), data).await?;
    ctx.say(res).await?;
    Ok(())
}
