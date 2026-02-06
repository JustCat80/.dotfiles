function tv --description 'enable and disable tv easily using kscreen-doctor'
    argparse -x e,d 'e/enable' 'd/disable' -- $argv #removes -A from vars

    if set -ql _flag_e
        kscreen-doctor output.HDMI-A-1.enable
    else if set -ql _flag_d
        kscreen-doctor output.HDMI-A-1.disable
    else
        set -f enabled $(kscreen-doctor -o | grep "enabled" | wc -l)
        if test $enabled -lt 3
            kscreen-doctor output.HDMI-A-1.enable
        else
            kscreen-doctor output.HDMI-A-1.disable
        end
    end
end