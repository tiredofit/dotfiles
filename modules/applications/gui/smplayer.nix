{config, lib, pkgs, ...}:

let
  cfg = config.host.home.applications.smplayer;
in
  with lib;
{
  options = {
    host.home.applications.smplayer = {
      enable = mkOption {
        default = false;
        type = with types; bool;
        description = "Video Player";
      };
      defaultApplication = {
        enable = mkOption {
          description = "MIME default application configuration";
          type = with types; bool;
          default = false;
        };
        mimeTypes = mkOption {
          description = "MIME types to be the default application for";
          type = types.listOf types.str;
          default = [
            "application/mxf"
            "application/ogg"
            "application/sdp"
            "application/smil"
            "application/streamingmedia"
            "application/vnd.apple.mpegurl"
            "application/vnd.ms-asf"
            "application/vnd.rn-realmedia"
            "application/vnd.rn-realmedia-vbr"
            "application/x-cue"
            "application/x-extension-m4a"
            "application/x-extension-mp4"
            "application/x-matroska"
            "application/x-mpegurl"
            "application/x-ogg"
            "application/x-ogm"
            "application/x-ogm-audio"
            "application/x-ogm-video"
            "application/x-shorten"
            "application/x-smil"
            "application/x-streamingmedia"
            "audio/3gpp"
            "audio/3gpp2"
            "audio/AMR"
            "audio/aac"
            "audio/ac3"
            "audio/aiff"
            "audio/amr-wb"
            "audio/dv"
            "audio/eac3"
            "audio/flac"
            "audio/m3u"
            "audio/m4a"
            "audio/mp1"
            "audio/mp2"
            "audio/mp3"
            "audio/mp4"
            "audio/mpeg"
            "audio/mpeg2"
            "audio/mpeg3"
            "audio/mpegurl"
            "audio/mpg"
            "audio/musepack"
            "audio/ogg"
            "audio/opus"
            "audio/rn-mpeg"
            "audio/scpls"
            "audio/vnd.dolby.heaac.1"
            "audio/vnd.dolby.heaac.2"
            "audio/vnd.dts"
            "audio/vnd.dts.hd"
            "audio/vnd.rn-realaudio"
            "audio/vorbis"
            "audio/wav"
            "audio/webm"
            "audio/x-aac"
            "audio/x-adpcm"
            "audio/x-aiff"
            "audio/x-ape"
            "audio/x-m4a"
            "audio/x-matroska"
            "audio/x-mp1"
            "audio/x-mp2"
            "audio/x-mp3"
            "audio/x-mpegurl"
            "audio/x-mpg"
            "audio/x-ms-asf"
            "audio/x-ms-wma"
            "audio/x-musepack"
            "audio/x-pls"
            "audio/x-pn-au"
            "audio/x-pn-realaudio"
            "audio/x-pn-wav"
            "audio/x-pn-windows-pcm"
            "audio/x-realaudio"
            "audio/x-scpls"
            "audio/x-shorten"
            "audio/x-tta"
            "audio/x-vorbis"
            "audio/x-vorbis+ogg"
            "audio/x-wav"
            "audio/x-wavpack"
            "video/3gp"
            "video/3gpp"
            "video/3gpp2"
            "video/avi"
            "video/divx"
            "video/dv"
            "video/fli"
            "video/flv"
            "video/mkv"
            "video/mp2t"
            "video/mp4"
            "video/mp4v-es"
            "video/mpeg"
            "video/msvideo"
            "video/ogg"
            "video/quicktime"
            "video/vnd.divx"
            "video/vnd.mpegurl"
            "video/vnd.rn-realvideo"
            "video/webm"
            "video/x-avi"
            "video/x-flc"
            "video/x-flic"
            "video/x-flv"
            "video/x-m4v"
            "video/x-matroska"
            "video/x-mpeg2"
            "video/x-mpeg3"
            "video/x-ms-afs"
            "video/x-ms-asf"
            "video/x-ms-wmv"
            "video/x-ms-wmx"
            "video/x-ms-wvxvideo"
            "video/x-msvideo"
            "video/x-ogm"
            "video/x-ogm+ogg"
            "video/x-theora"
            "video/x-theora+ogg"
          ];
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs;
        [
          mpv
          smplayer
        ];
    };

    xdg.configFile."smplayer/smplayer.ini".text = ''
[%General]
add_blackborders_on_fullscreen=false
alang=
audio_equalizer=0, 0, 0, 0, 0, 0, 0, 0, 0, 0
autoload_m4a=true
autoq=6
autosync=false
autosync_factor=100
config_version=5
disable_screensaver=true
driver\audio_output=
driver\vo=
file_settings_method=hash
global_audio_equalizer=true
global_volume=true
mc_value=0
min_step=4
mplayer_bin=${config.home.homeDirectory}/.nix-profile/bin/mpv
mute=false
osd=2
osd_bar_pos=80
osd_delay=5000
osd_fractions=false
osd_scale=1
osd_show_filename_duration=2000
remember_media_settings=false
remember_stream_settings=true
remember_time_pos=true
screenshot_folder=
screenshot_format=jpg
screenshot_template=cap_%F_%p_%02n
slang=
softvol_max=110
subfont_osd_scale=3
tablet_mode=false
use_audio_equalizer=false
use_direct_rendering=false
use_double_buffer=true
use_hwac3=false
use_mc=false
use_scaletempo=-1
use_screenshot=false
use_slices=false
use_soft_video_eq=false
use_soft_vol=true
vdpau_disable_video_filters=true
vdpau_ffh264vdpau=true
vdpau_ffhevcvdpau=false
vdpau_ffmpeg12vdpau=true
vdpau_ffodivxvdpau=false
vdpau_ffvc1vdpau=true
vdpau_ffwmv3vdpau=true
volume=47
wayland_workarounds=true

[actions]
ab_menu=
about_smplayer=
add_bookmark=Ctrl+A
add_letterbox=
add_noise=
angles_menu=
aspect_11%3A8=
aspect_14%3A10=
aspect_14%3A9=
aspect_16%3A10=
aspect_16%3A9=
aspect_1%3A1=
aspect_2.35%3A1=
aspect_3%3A2=
aspect_4%3A3=
aspect_5%3A4=
aspect_detect=
aspect_menu=
aspect_none=
audio_delay=
audio_equalizer=
audiochannels_menu=
audiofilter_menu=
audiotrack_menu=
auto_zoom=Shift+W
autodetect_phase=
blur=
bookmarks_menu=
cast_to_menu=
cc_ch_1=
cc_ch_2=
cc_ch_3=
cc_ch_4=
cc_none=
channels_default=
channels_ful51=
channels_ful61=
channels_ful71=
channels_stereo=
channels_surround=
chapters_menu=
check_updates=
cl_options=
clear_ab_markers=
clear_recents=
close=Ctrl+X
closed_captions_menu=
compact=Ctrl+C
deblock=
dec_audio_delay=-
dec_brightness=3
dec_contrast=1
dec_gamma=
dec_hue=5
dec_osd_scale=Shift+Y
dec_saturation=7
dec_speed=[
dec_speed_1=
dec_speed_4=
dec_sub_delay=Z
dec_sub_pos=R
dec_sub_scale=Shift+R
dec_sub_step=G
dec_zoom=W
decrease_volume="9, /, Volume Down"
deinterlace_kern=
deinterlace_l5=
deinterlace_lb=
deinterlace_menu=
deinterlace_none=
deinterlace_yadif0=
deinterlace_yadif1=
denoise_menu=
denoise_none=
denoise_normal=
denoise_soft=
dering=
disc_menu=
donate=
double_speed=}
earwax_filter=
edit_bookmarks=
edit_control1=
edit_control2=
edit_control_minigui=
edit_floating_control=
edit_floating_control_minigui=
edit_main_toolbar=
edit_radio_list=
edit_tv_list=
exit_fullscreen=Esc
extrastereo_filter=
faq=
favorites_menu=
first_steps=
flip=
forward1="Right, Ctrl+Shift+F"
forward2=Up
forward3=PgUp
frame_back_step=","
frame_step=.
fullscreen="F, Ctrl+T"
gradfun=
halve_speed={
inc_audio_delay=+
inc_brightness=4
inc_contrast=2
inc_gamma=
inc_hue=6
inc_osd_scale=Shift+U
inc_saturation=8
inc_speed=]
inc_speed_1=
inc_speed_4=
inc_sub_delay=X
inc_sub_pos=T
inc_sub_scale=Shift+T
inc_sub_step=Y
inc_zoom=E
increase_volume="0, *, Volume Up"
jump_radio_list=
jump_to=Ctrl+J
jump_tv_list=
karaoke_filter=
left_channel=
load_audio_file=
load_subs=
mirror=
mono=
move_down=Alt+Down
move_left=Alt+Left
move_right=Alt+Right
move_up=Alt+Up
multiple_screenshots=Shift+D
mute="M, Volume Mute"
next_aspect=A
next_audio=K
next_bookmark=Ctrl+N
next_chapter=@@
next_osd=O
next_radio=Shift+H
next_subtitle=J
next_tv=H
next_video=
next_wheel_function=
normal_speed=Backspace
on_top_always=
on_top_never=
on_top_playing=
ontop_menu=
open_audio_cd=
open_bluray=
open_bluray_folder=
open_directory=
open_dvd=
open_dvd_folder=
open_file=Ctrl+F
open_playlist=
open_url=Ctrl+U
open_vcd=
osd_fractions=
osd_menu=
osd_none=
osd_seek=
osd_timer=
osd_total=
pause="Space, Media Pause"
pause_and_frame_step=
pl_add_current=
pl_add_directory=
pl_add_files=
pl_add_urls=
pl_chromecast=
pl_copy_url=
pl_delete_from_disk=
pl_edit=
pl_move_down=
pl_move_up=
pl_next=N
pl_open=
pl_open_folder=
pl_open_url=
pl_play=
pl_prev=P
pl_remove_all=
pl_remove_selected=
pl_repeat=
pl_save=
pl_save_as=
pl_show_duration_column=
pl_show_filename_column=
pl_show_name_column=
pl_show_position_column=
pl_show_search=
pl_show_shuffle_column=
pl_shuffle=
play=
play_next=">, Media Next"
play_on_chromecast=
play_on_mobile=
play_or_pause="Media Play, Toggle Media Play/Pause"
play_prev="<, Media Previous"
postprocessing=
prev_bookmark=Ctrl+B
prev_chapter=!
previous_audio=Shift+K
previous_radio=Shift+L
previous_subtitle=Shift+J
previous_tv=L
previous_video=
quick_access_menu=
quit=Ctrl+Q
radio_menu=
recents_menu=
repeat=
reset_audio_equalizer=
reset_video_equalizer=
reset_zoom=Shift+E
restore\hide=
reverse_channels=
rewind1="Left, Ctrl+Shift+B"
rewind2=Down
rewind3=PgDown
right_channel=
rotate_180=
rotate_clockwise=
rotate_clockwise_flip=
rotate_counterclockwise=
rotate_counterclockwise_flip=
rotate_menu=
rotate_none=
screens_info=
screenshot=S
screenshot_with_subtitles=Ctrl+Shift+S
screenshot_without_subtitles=Ctrl+Alt+S
secondary_subtitles_track_menu=
seek_next_sub=Ctrl+Right
seek_prev_sub=Ctrl+Left
send_audio_menu=
send_to_screen_1=
send_to_screen_2=
send_to_screen_3=
send_to_screen_menu=
set_a_marker=
set_b_marker=
sharpen=
show_config=
show_context_menu=
show_file_properties=Ctrl+I
show_filename_osd=Shift+O
show_find_sub_dialog=
show_info_osd=Shift+I
show_main_toolbar=F5
show_mplayer_log=Ctrl+M
show_playlist=Ctrl+L
show_preferences=Ctrl+P
show_smplayer_log=Ctrl+S
show_time=I
show_tray_icon=
show_tube_browser=F11
size_100=Ctrl+1
size_125=
size_150=
size_175=
size_200=Ctrl+2
size_300=
size_400=
size_50=
size_75=
speed_0.25x=
speed_0.5x=
speed_0.75x=
speed_1.25x=
speed_1.5x=
speed_1.75x=
speed_menu=
statusbar_remaining_time=
statusbar_total_time=
stereo=
stereo_3d_filter=
stereomode_menu=
stop=Media Stop
sub_delay=
sub_fps_23976=
sub_fps_24=
sub_fps_25=
sub_fps_29970=
sub_fps_30=
sub_fps_none=
sub_visibility=
subfps_menu=
subtitlestrack_menu=
tablet_mode=
titles_menu=
toggle_bitrate_info=
toggle_deinterlacing=D
toggle_double_size=Ctrl+D
toggle_format_info=
toggle_frame_counter=
toggle_stay_on_top=
toggle_video_info=
tv_menu=
unload_audio_file=
unload_subs=
unsharp_menu=
unsharp_off=
update_youtube=
upload_subtitles=
upscaling=
use_custom_sub_style=
use_forced_subs_only=
use_milliseconds=
video_equalizer=Ctrl+E
video_preview=
videofilter_menu=
videosize_menu=
videotrack_menu=
volnorm_filter=
zoom_169=Shift+A
zoom_235=Shift+S
zoom_menu=

[advanced]
actions_to_run=
autosave_mplayer_log=false
change_video_equalizer_on_startup=true
correct_pts=-1
disable_player_config=true
emulate_mplayer_ab_section=false
log_filter=.*
log_mplayer=false
log_smplayer=false
monitor_aspect=
mplayer_additional_audio_filters=
mplayer_additional_options=
mplayer_additional_video_filters=
mplayer_log_saveto=
mplayer_osd_media_info=
mpv_osd_media_info=
prefer_ipv4=true
repaint_video_background=true
save_smplayer_log=false
show_tag_in_window_title=true
time_to_kill_player=5000
use_edl_files=true
use_idx=false
use_lavf_demuxer=false
use_mplayer_window=false
use_mpris2=true
use_native_open_dialog=true
use_pausing_keep_force=true
use_playlist_option=false
use_short_pathnames=false
verbose_log=false

[base_gui_plus]
compact_playlist_was_visible=false
fullscreen_playlist_was_floating=true
fullscreen_playlist_was_visible=false
ignore_playlist_events=false
mainwindow_visible=true
show_tray_icon=false
trayicon_playlist_was_visible=false
widgets_size=0

[chromecast]
server\directory_listing=false
server\local_address=
server\port=8010
subtitles\autoconvert_to_vtt=false
subtitles\overwrite_vtt=true
subtitles\position=95
subtitles\text_filter=
subtitles\use_sub_filter=true

[default_gui]
actions\controlwidget\1=play_or_pause, stop, separator, rewindbutton_action, timeslider_action, forwardbutton_action, separator, fullscreen, mute, volumeslider_action
actions\controlwidget_mini\1=play_or_pause, stop, separator, rewind1, timeslider_action, forward1, separator, mute, volumeslider_action
actions\floating_control\1=play_or_pause, stop, separator, rewind1, current_timelabel_action, timeslider_action, total_timelabel_action, forward1, separator, fullscreen, mute, volumeslider_action
actions\toolbar1\2=open_file, open_url, favorites_menu, separator, screenshot, separator, show_file_properties, show_playlist, show_tube_browser, separator, show_preferences, separator, play_prev, play_next, separator, audiotrack_menu, subtitlestrack_menu
bitrate_info=false
compact_toolbar1_was_visible=false
display_remaining_time=false
format_info=false
frame_counter=false
fullscreen_toolbar1_was_visible=true
pos=@Point(3845 739)
size=@Size(1256 664)
state=0
toolbars_icon_size\controlwidget=@Size(40 40)
toolbars_icon_size\controlwidget_mini=@Size(24 24)
toolbars_icon_size\floating_control=@Size(48 48)
toolbars_icon_size\toolbar1=@Size(32 32)
toolbars_state=@ByteArray(\0\0\0\xff\0\0\x19m\xfd\0\0\0\x1\0\0\0\x3\0\0\0\0\0\0\0\0\xfc\x1\0\0\0\x1\xfb\0\0\0\x18\0p\0l\0\x61\0y\0l\0i\0s\0t\0\x64\0o\0\x63\0k\x2\0\0\0\0\0\0\0\0\0\0\0\x64\0\0\0\x1e\0\0\x4\xe8\0\0\x2\x4\0\0\0\x4\0\0\0\x4\0\0\0\b\0\0\0\b\xfc\0\0\0\x2\0\0\0\x2\0\0\0\x1\0\0\0\x10\0t\0o\0o\0l\0\x62\0\x61\0r\0\x31\x1\0\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\0\0\0\x3\0\0\0\x2\0\0\0\x1a\0\x63\0o\0n\0t\0r\0o\0l\0w\0i\0\x64\0g\0\x65\0t\x1\0\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\0\0\0$\0\x63\0o\0n\0t\0r\0o\0l\0w\0i\0\x64\0g\0\x65\0t\0_\0m\0i\0n\0i\0\0\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0)
use_milliseconds=false
video_info=false

[defaults]
audio_channels=0
initial_audio_equalizer=0, 0, 0, 0, 0, 0, 0, 0, 0, 0
initial_blackborders=false
initial_brightness=0
initial_contrast=0
initial_deinterlace=0
initial_gamma=0
initial_hue=0
initial_postprocessing=false
initial_saturation=0
initial_stereo_mode=0
initial_sub_pos=100
initial_sub_scale=5
initial_sub_scale_ass=1
initial_volnorm=false
initial_volume=40
initial_zoom_factor=1
preferred_audio_track=0
preferred_subtitle_track=0

[directories]
last_dvd_directory=
latest_dir=
save_dirs=false

[drives]
bluray_device=
cdrom_device=
dvd_device=
vcd_initial_title=2

[filter_options]
acompressor=
blur=lc:-1.5
deblock=vb/hb
denoise_normal=
denoise_soft=2:1:2
gradfun=
noise=9ah:5ah
sharpen=lc:1.5
volnorm=1

[floating_control]
activation_area=1
animated=true
display_in_compact_mode=false
hide_delay=3000
margin=0
width=100

[gui]
allow_video_movement=false
auto_add_to_playlist=true
auto_shutdown_pc=false
balloon_count=5
center_window=false
center_window_if_outside=false
close_on_finish=false
compact_mode=false
default_font="Noto Sans,11,-1,5,50,0,0,0,0,0,Regular"
default_size=@Size(683 509)
delay_left_click=false
dockable_playlist=true
drag_function=1
fullscreen=false
global_shortcuts_grabbed_keys=511
gui=MiniGUI
gui_minimum_width=0
hide_video_window_on_audio_files=true
iconset=H2O
language=
media_to_add_to_playlist=0
mouse_double_click_function=fullscreen
mouse_left_click_function=
mouse_middle_click_function=mute
mouse_right_click_function=show_context_menu
mouse_wheel_function=2
mouse_xbutton1_click_function=
mouse_xbutton2_click_function=
pause_when_hidden=false
precise_seeking=false
qt_style=Fusion
relative_seeking=false
report_player_crashes=true
reported_mplayer_is_old=false
reset_stop=false
resize_method=0
restore_pos_after_fullscreen=false
save_window_size_on_exit=true
seeking1=10
seeking2=60
seeking3=600
seeking4=30
size_factor=100
start_in_fullscreen=false
stay_on_top=0
time_slider_drag_delay=100
update_while_seeking=false
use_global_shortcuts=false
use_player_shortcuts_in_playlist=false
wheel_function_cycle=30
wheel_function_seeking_reverse=false

[history]
recents=@Invalid()
recents\max_items=0
urls=@Invalid()
urls\max_items=0

[instances]
single_instance_enabled=true

[mini_gui]
actions\controlwidget=play_or_pause, stop, separator, timeslider_action, separator, fullscreen, mute, volumeslider_action
actions\floating_control=play_or_pause, stop, separator, timeslider_action, separator, fullscreen, mute, volumeslider_action, separator, timelabel_action
pos=@Point(3845 706)
size=@Size(1256 697)
state=0
toolbars_icon_size\controlwidget=@Size(24 24)
toolbars_icon_size\floating_control=@Size(24 24)
toolbars_state=@ByteArray(\0\0\0\xff\0\0\x19m\xfd\0\0\0\x1\0\0\0\x3\0\0\0\0\0\0\0\0\xfc\x1\0\0\0\x1\xfb\0\0\0\x18\0p\0l\0\x61\0y\0l\0i\0s\0t\0\x64\0o\0\x63\0k\x2\0\0\0\0\0\0\0\0\0\0\0\x64\0\0\0\x1e\0\0\x4\xe8\0\0\x2y\0\0\0\x4\0\0\0\x4\0\0\0\b\0\0\0\b\xfc\0\0\0\x1\0\0\0\x3\0\0\0\x1\0\0\0\x1a\0\x63\0o\0n\0t\0r\0o\0l\0w\0i\0\x64\0g\0\x65\0t\x1\0\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0)

[mplayer_info]
is_mplayer2=true
mplayer2_detected_version=
mplayer_detected_version=33472
mplayer_user_supplied_version=-1

[performance]
HD_height=720
cache_auto=true
cache_for_audiocds=1024
cache_for_dvds=0
cache_for_files=2048
cache_for_streams=2048
cache_for_tv=3000
cache_for_vcds=1024
coreavc=false
frame_drop=false
h264_skip_loop_filter=1
hard_frame_drop=false
hwdec=auto
threads=1

[proxy]
host=
password=
port=0
type=3
use_proxy=false
username=

[reminder]
count=9

[streaming]
streaming\youtube\override_format=
streaming\youtube\preferred_user_agent=
streaming\youtube\resolution=4
streaming\youtube\use_60fps=true
streaming\youtube\use_av1=true
streaming\youtube\use_dash=true
streaming\youtube\ytdl_bin=
streaming_type=1
ytdl_quality=

[subtitles]
ass_line_spacing=0
autoload_sub=false
change_sub_scale_should_restart=-1
enable_ass_styles=true
enca_lang=
fast_load_sub=true
force_ass_styles=false
freetype_support=true
styles\backcolor\argb=ff000000
styles\backgroundcolor\argb=ff000000
styles\bold=false
styles\borderstyle=1
styles\fontname=Arial
styles\fontsize=20
styles\halignment=2
styles\italic=false
styles\marginl=20
styles\marginr=20
styles\marginv=8
styles\outline=0.3
styles\outlinecolor\argb=ff000000
styles\primarycolor\argb=ffffffff
styles\shadow=1
styles\valignment=0
sub_visibility=true
subcp=ISO-8859-1
subfuzziness=0
subtitles_on_screenshots=false
use_ass_subtitles=true
use_enca=true
use_forced_subs_only=false
user_forced_ass_style=

[tv]
check_channels_conf_on_startup=false
initial_tv_deinterlace=4
last_dvb_channel=
last_tv_channel=

[update_checker]
enabled=false
    '';

    xdg.mimeApps.defaultApplications = mkIf cfg.defaultApplication.enable (
      lib.genAttrs cfg.defaultApplication.mimeTypes (_: "smplayer.desktop")
    );
  };
}
