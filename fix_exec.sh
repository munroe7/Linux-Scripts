#!/bin/bash

if [[ $# -ne 1 ]]
then
        echo "usage: ./fix_exec.sh filename"
        exit
else
        if [[ -f $1 ]]
        then
                if [[ -x $1 ]]
                then
                        owner=$(stat --format '%a' $1 | cut -c1)
                        group=$(stat --format '%a' $1 | cut -c2)
                        world=$(stat --format '%a' $1 | cut -c3)

                        if [[ $((group%2)) -eq 0 ]]
                        then
                                echo "Should the execute bit for $1 be set for the group (y/n)?"
                                read $gExec

                                if [[ $gExec -eq y ]]
                                then
                                        ((group++))
                                        chmod $owner$group$world  $1
                                fi
                        fi

                        if [[ $((world%2)) -eq 0 ]]
                        then
                                echo "Should the execute bit for $1 be set for the world (y/n)?"
                                read $wExec

                                if [[ $wExec -eq y ]]
                                then
                                        ((world++))

                                        chmod $owner$group$world $1
                                fi
                        fi
                else
                        owner=$(stat --format '%a' $1 | cut -c1)
                        group=$(stat --format '%a' $1 | cut -c2)
                        world=$(stat --format '%a' $1 | cut -c3)

                        if [[ $((owner%2)) -ne 0 ]]
                        then
                                ((owner--))
                                chmod $owner$group$world $1
                        fi

                        if [[ $((group%2)) -ne 0 ]]
                        then
                                ((group--))
                                chmod $owner$group$world $1
                        fi

                        if [[ $((world%2)) -ne 0 ]]
                        then
                                ((world--))
                                chmod $owner$group$world $1
                        fi
                        echo "File was not executable so permissions have been changed"
                fi
        else
                echo "Not a regular file"
        fi
fi
                                                                                                                                                              66,2          Bot

