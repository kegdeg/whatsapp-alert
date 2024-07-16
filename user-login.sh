#!/bin/bash

# Function to send WhatsApp message
send_whatsapp_message() {
    curl -X POST https://messages-sandbox.nexmo.com/v1/messages \
        -u 'your key:your secret' \
        -H 'Content-Type: application/json' \
        -H 'Accept: application/json' \
        -d '{
            "from": "14157386102",
            "to": "your number here",
            "message_type": "text",
            "text": "User has logged in!",
            "channel": "whatsapp"
        }'
}

# Wait until user is logged in
while ! who | grep -q "$USER"; do
    sleep 5
done

# Send alert after logging in
send_whatsapp_message   # Send initial alert


# Send an alert if your laptop lid has been opened:

# Main loop to check lid state (optional, can be removed)
#previous_state="closed"
#while true; do
#    lid_state=$(grep -o 'open' /proc/acpi/button/lid/LID0/state)

    # Update previous state
#    previous_state="$lid_state"
#    sleep 1
#done

#TODO, take a picture
