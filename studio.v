import ui

const (
	win_width  = 1280
	win_height = 720
)

[heap]
struct App {
mut:
	tb                     string
	soft_input_visible     bool
	soft_input_buffer      string
	soft_input_parsed_char string
	window                 &ui.Window = unsafe { nil }
}

fn main() {
	mut app := &App{
		label: ui.label(text: 'Enabled')
	}
	app.switcher = ui.switcher(open: true, on_click: app.on_switch_click)
	app.window = ui.window(
		width: win_width
		height: win_height
		title: "Vode Studio"
		children: [
			
		]
	)
	c := ui.column(
		widths: ui.stretch
		heights: [ui.compact, ui.stretch]
		margin_: 5
		spacing: 10
		children: [
			ui.row(
				spacing: 5
				children: [
					ui.label(
						text: 'Text input' //&app.tb
					),
				]
			),
			ui.textbox(
				id: 'tb1'
				mode: .multiline | .word_wrap
				placeholder: 'Println("hello vode studio!")'
				fitted_height: true
			),
		]
	)
	
	w := ui.window(
		width: 500
		height: 300
		mode: .resizable
		children: [c]
	)
	
	app.window = w
	ui.run(w)
}
