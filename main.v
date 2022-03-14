/*
	This project is used to create Messagram.v Module and to test it. 

	The code below is an example on how to use the module!

	Please keep in mind, the code below is still in development. Properties or methods can change in the future. 
	
	To follow up with updates on the module i suggest checking out the official repo. The repo is where i work on 
	the module so i can be more updated than the one in this project

	https://github.com/Messgagram/messagram.v
*/
import os
import time
import src.messagram // src/messagram/main.v

fn main() {
	mut m := messagram.Messagram{}
	go messagram.messagram_connect(mut &m)
	go on_message(mut &m)
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
