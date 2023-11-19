# kbot - Telegram Bot

## Introduction
[kbot](https://t.me/bott_butt_bot) is a simple Telegram bot located at [https://t.me/bott_butt_bot](https://t.me/bott_butt_bot)  
Bot logs received messages.  
It responds to the `/start hello` command with a greeting and the current version of the bot.  

## Features
- **Logging**: Logs every message received.
- **Version Info**: Provides the bot's version when the `/start hello` command is issued.

## Prerequisites
- [Go (Golang)](https://golang.org/dl/)
- [Telegram Bot Token](https://core.telegram.org/bots#6-botfather)

## Installation
1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/kbot.git
   cd kbot
   ```

2. **Set Up Telegram Bot Token**
   - Create a new bot through [BotFather](https://t.me/botfather) on Telegram and get your token.
   - Put token into evironment variable TELE_TOKEN in silent input mode
     ```bash
     read -s TELE_TOKEN
     ```

   - Export the token as an environment variable:
     ```bash
     export TELE_TOKEN='your_bot_token_here'
     ```

3. **Build the Bot**
   ```bash
   go get
   go build -ldflags "-X="kbot/cmd.appVersion=_version_number
   ```  
    where _version_number is surpisely number of current build number  
  
    **example:**  
    ```bash
    go build -ldflags "-X="kbot/cmd.appVersion=1.0.3
    ```

4. **Run the Bot**
   ```bash
   ./kbot start
   ```

## Usage
Once kbot is running, you can interact with it through Telegram.
   
   - User sends the command to the bot:
     ```
     /start hello
     ```

   - `kbot` responds with its greeting and the current version number:
     ```
     Hello, I'm kbot 1.0.3
     ```


- **Logging Messages**
  - By default the bot will log every message it recieve

- **Getting Version Information**
  - Send the command `/start hello` to the bot, and it will answer with "Hello, I'm kbot _version_number_"
