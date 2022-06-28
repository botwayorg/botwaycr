<div align="center">
  <h1>botwaycr</h1>
	<p>
		Crystal client package for Botway
	</p>
</div>

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     botwaycr:
       github: abdfnx/botwaycr
   ```

2. Run `shards install`

## Usage

> after creating a new crystal botway project, you need to use your tokens to connect with your bot.

```crystal
require "discordcr"
require "botwaycr"

token = Botwaycr::BW.new.get_token
client_id = Botwaycr::BW.new.get_app_id

client = Discord::Client.new(token: "Bot " + token, client_id: client_id)

client.on_message_create do |payload|
  if payload.content.starts_with? "ping"
    client.create_message(payload.channel_id, "Pong!")
  end
end

client.run
```

## Contributors

- [abdfnx](https://github.com/abdfnx) - creator and maintainer
