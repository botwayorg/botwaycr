require "yaml"
require "json"

module Botwaycr
  VERSION = "0.1.1"

  BotwayConfig = JSON.parse(File.read(File.join(Path["~/.botway"].expand(home: true), "botway.json")))

  class BW
    def get_bot_info(value)
      data = YAML.parse(File.read(".botway.yaml"))

      data["bot"][value].to_s
    end

    def get_token()
      if get_bot_info("lang") != "crystal"
        raise "ERROR: Your Bot language is not Crystal"
      else
        BotwayConfig["botway"]["bots"][get_bot_info("name")]["bot_token"].to_s
      end
    end

    def get_app_id()
      if get_bot_info("lang") != "crystal"
        raise "ERROR: Your Bot language is not Crystal"
      else
        if get_bot_info("type") == "slack"
          BotwayConfig["botway"]["bots"][get_bot_info("name")]["bot_app_token"].to_s
        else
          BotwayConfig["botway"]["bots"][get_bot_info("name")]["bot_app_id"].to_s
        end
      end
    end

    def get_guild_id(serverName)
      if get_bot_info("lang") != "crystal"
        raise "ERROR: Your Bot language is not Crystal"
      elsif get_bot_info("type") != "discord"
        raise "ERROR: This function/feature is only working with discord bots."
      else
        BotwayConfig["botway"]["bots"][get_bot_info("name")]["guilds"][serverName]["server_id"].to_s
      end
    end

    def get_signing_secret()
      if get_bot_info("lang") != "crystal"
        raise "ERROR: Your Bot language is not Crystal"
      elsif get_bot_info("type") != "slack"
        raise "ERROR: This function/feature is only working with slack bots."
      else
        BotwayConfig["botway"]["bots"][get_bot_info("name")]["signing_secret"].to_s
      end
    end
  end
end
