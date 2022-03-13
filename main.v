import os
import time
import src.messagram // src/messagram/main.v

fn main() {
	mut m := messagram.Messagram{}
	go messagram.messagram_connect(mut &m)
	go buffer_listener(mut &m)
	time.sleep(2*time.second)
	m.send_msg('{"status": "true/false","cmd": "msg","userid": "username_here","client_name": ""}\n')
	for {

	}
}

fn buffer_listener(mut m messagram.Messagram) {
	for {
		if m.check_new_msg() == true {
			msg := m.grab_new_msg()
			// place your text anywhere. im just gonnah print it normally
			print(msg)
		}
	}
}