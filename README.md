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
   git clone https://github.com/sergionic18/kbot.git
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
   go build -ldflags "-X="kbot/cmd.appVersion=version_number
   ```  
    where ```version_number``` is surpisely current build number 
  
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
   
   - User sends the command to the bot  
   Command starts with slash  
   For example **message** command:
     ```
     /message
     ```
- **Getting Version Information**
  - Send the command `/start hello` to the bot, and it will answer with ```"Hello, I'm kbot _version_number_"```

  ```
  Hello, I'm kbot 1.0.3
  ```
- **Logging Messages**
  - By default the bot will log every message and payloads it recieve
   ```bash
    kbot 1.0.3 started
    2023/11/19 23:20:20 /hi
    2023/11/19 23:20:38 messagge
    2023/11/19 23:20:49 hello/start hello
  ```