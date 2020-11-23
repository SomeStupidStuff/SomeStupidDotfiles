syntax match i3Comment /\v#.*$/ contains=i3HexColorList
hi def link i3Comment Comment

syntax region i3String start=+"+ end=+"+ skip=+\\"+
syntax region i3String start=+'+ end=+'+ skip=+\\'+
hi def link i3String String

syntax match i3Number /\v<-?(\d+(\.\d+)?|\.\d+)>/
hi def link i3Number Number

syntax keyword i3Keyword set font bindsym bindcode mode floating_modifier floating_maximum_size floating_minimum_size default_orientation workspace_layout title_align default_border default_floating_border hide_edge_borders for_window no_focus set_from_resource assign exec exec_always workspace focus_follows_mouse mouse_warping popup_during_fullscreen focus_wrapping force_focus_wrapping force_xinerama workspace_auto_back_and_forth force_display_urgency_hint focus_on_window_activation show_marks fullscreen bar status_command i3bar_command hidden_state modifier id position output colors tray_output tray_padding separator_symbol workspace_buttons workspace_min_width strip_workspace_numbers strip_workspace_name binding_mode_indicator border move split layout focus swap sticky rename mark unmark title_format shmlog debuglog restart reload exit scratchpad nop to floating tiling kill resize or
hi def link i3Keyword Statement

syntax match i3Flag /\v--(no-startup-id|no-auto-back-and-forth|add|replace|toggle|release|border|whole-window|exclude-titlebar|pango_markup)/ containedin=i3Keyword
hi def link i3Flag Type

syntax match i3Variable /\v\$\w+/ nextgroup=i3KeyPlus
hi def link i3Variable Identifier

syntax match i3ExecCommand /\v(exec(_always)?\s*(--no-startup-id)?\s*)@<=.{-}(#|$)@=/ contains=i3Flag,i3String

syntax match i3SpecialKey /\v<Mod\d+>/ nextgroup=i3KeyPlus
syntax keyword i3SpecialKey Return Shift Escape Left Right Up Down Control XF86MonBrightnessUp XF86MonBrightnessDown XF86AudioRaiseVolume XF86AudioLowerVolume XF86AudioMute Print nextgroup=i3KeyPlus
syntax match i3NonSpecialKey /\v\+@<=\c(.|minus|plus|equals|space|grave)>/ contained contains=i3Number
hi def link i3SpecialKey Function
hi def link i3NonSpecialKey Constant

syntax match i3KeyPlus /+/ contained nextgroup=i3NonSpecialKey
hi def link i3KeyPlus Operator

syntax match i3Font /\v(<font\s+)@<=.{-}(#|$)@=/

syntax keyword i3Option yes no on off toggle stacking tabbed normal pixel mode_toggle parent left right up down both container grow shrink width height px ppt show
hi def link i3Option PreProc

syntax keyword i3CriteriaName class instance window_role window_type id title urgent workspace con_mark con_id floating tiling contained
hi def link i3CriteriaName Identifier
syntax match i3Criteria /\v\[(.*\=["'].*["']|\w+)\]/ contains=i3String,i3Number,i3CriteriaName

syntax keyword i3ColorKeyword client background statusline separator focused_background focused_statusline focused_separator focused_workspace active_workspace inactive_workspace urgent_workspace binding_mode focused focused_inactive unfocused urgent placeholder background nextgroup=i3HexColorList
hi def link i3ColorKeyword Type

syntax match i3HexColorList /\v^\s*\w+\s+.*$/ contained contains=i3HexColor
syntax match i3HexColor /\v\c#[0-9a-f]{1,8}/
hi def link i3HexColor String

syntax match i3SetKey /\v(<set\s+.{-}\s+)@<=\S+(\s*(#|$))@=/ contains=i3SpecialKey,i3Keyword,i3Number,i3String
