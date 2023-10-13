import ui

const (
	win_width  = 1280
	win_height = 720
)

[heap]
struct App {
mut:
	label    &ui.Label
	window   &ui.Window = unsafe { nil }
}

fn main() {
	mut app := &App{
		label: ui.label(text: 'Enabled')
	}
	app.switcher = ui.switcher(open: true, on_click: app.on_switch_click)
	app.window = ui.window(
		width: win_width
		height: win_height
		title: "Verve"
		mode: .resizable
		children: [
			
		]
	)
	ui.run(app.window)
}
