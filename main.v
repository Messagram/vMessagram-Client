import src.messagram // src/messagram/main.v

fn main() {
	mut m := messagram.Messagram{}
	go buffer_listener(m)
}

fn buffer_listener(mut m messagram.Messagram) {
	for {
		if m.check_new_msg() == true {
			msg = m.grab_new_msg()
			// place your text anywhere. im just gonnah print it normally
			print(msg)
		}
	}
}