# Inspired from https://github.com/rideron89/rider-theme
# Thanks!

function _rider_theme_get_duration
    set -l seconds (math "$CMD_DURATION / 1000")
    set -l minutes (math "$seconds / 60")

    if test $minutes -ge 1
        echo "$minutes"m
    else if test $seconds -ge 1
        echo "$seconds"s
    else
        echo "$CMD_DURATION"ms
    end
end

function fish_right_prompt
    set -l gray (set_color 555)
    set -l normal (set_color normal)
    set -l yellow (set_color yellow)

    if [ $CMD_DURATION ]
        set -l duration (_rider_theme_get_duration)

        echo "$gray$duration$normal"
    else
        echo $gray"---"
    end

    echo "$yellow"
    printf '%s ' (__fish_git_prompt)
    echo "$normal"
end
