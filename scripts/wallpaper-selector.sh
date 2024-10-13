# Set some variables
wall_dir="${HOME}/.dotfiles/wallpapers"
cacheDir="${HOME}/.cache/jp/${theme}"
rofi_command="rofi  -dmenu -theme ${HOME}/.config/rofi/wallpaper-selector.rasi -theme-str ${rofi_override}"

# Create cache dir if not exists
if [ ! -d "${cacheDir}" ] ; then
        mkdir -p "${cacheDir}"
    fi


physical_monitor_size=24
monitor_res=$(hyprctl monitors |grep -A2 Monitor |head -n 2 |awk '{print $1}' | grep -oE '^[0-9]+')

rofi_override="element-icon{size:${monitor_res}px;border-radius:0px;}"

# Convert images in directory and save to cache dir
for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
	if [ -f "$imagen" ]; then
		nombre_archivo=$(basename "$imagen")
			if [ ! -f "${cacheDir}/${nombre_archivo}" ] ; then
				magick convert -strip "$imagen" -thumbnail 500x500^ -gravity center -extent 500x500 "${cacheDir}/${nombre_archivo}"
			fi
    fi
done

# Select a picture with rofi
wall_selection=$(find "${wall_dir}"  -maxdepth 1  -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A ; do  echo -en "$A\x00icon\x1f""${cacheDir}"/"$A\n" ; done | $rofi_command)

# Set the wallpaper
[[ -n "$wall_selection" ]] || exit 1
selected_wall="~/.dotfiles/wallpapers/${wall_selection}"

wal -i ~/.dotfiles/wallpapers/${wall_selection}

echo "preload = ~/.dotfiles/wallpapers/${wall_selection}" > ~/.dotfiles/.config/hypr/hyprpaper.conf
echo "wallpaper = , ~/.dotfiles/wallpapers/${wall_selection}" >> ~/.dotfiles/.config/hypr/hyprpaper.conf

cat ~/.cache/wal/colors-kitty.conf > ~/.dotfiles/.config/kitty/theme.conf
cat ~/.cache/wal/colors-rasi-custom.rasi > ~/.dotfiles/.config/rofi/colors.rasi
cat ~/.cache/wal/colors-warp.yml > ~/.dotfiles/.local/share/warp-terminal/themes/pywal_personal.yml
cat ~/.cache/wal/colors-waybar.css > ~/.dotfiles/.config/waybar/colors.css

killall waybar
waybar &

hyprctl hyprpaper preload "${selected_wall}"
hyprctl hyprpaper wallpaper ",${selected_wall}"

exit 0
