import os
import time
import src.messagram // src/messagram/main.v

fn main() {
	mut m := messagram.Messagram{}
	go messagram.messagram_connect(mut &m)
	on_message(mut &m)
}

fn on_message(mut m messagram.Messagram) {
	time.sleep(1*time.second)
	m.send_msg('{"status": "true/false","cmd": "msg","userid": "username_here","client_name": ""}\n')
	for {
		if m.check_new_msg() == true { // if we recieved a new message
			msg := m.grab_new_msg() // grab new message
			// place your text anywhere. im just gonnah print it normally
			print(msg)
		}
	}
}
