unalias gst
function gst() {
	if ! git rev-parse --git-dir > /dev/null 2>&1; then
		cd ~/repos/poke/
	fi
	git status
}
