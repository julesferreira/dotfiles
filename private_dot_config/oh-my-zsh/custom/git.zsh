unalias gst
function gst() {
	if ! git rev-parse --git-dir > /dev/null 2>&1; then
		cd ~/bamboo/
	fi
	git status
}
