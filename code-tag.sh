#!/bin/bash
#!/bin/bash
# COMMENT=$*
# echo ${COMMENT}
# function mipublish {
#     echo "publish code to test envirment...\n"
#     commitCurBranch
# }

# function find_git_branch {
#     local dir=. head
#     until [ "$dir" -ef / ]; do
#         if [ -f "$dir/.git/HEAD" ]; then
#             head=$(< "$dir/.git/HEAD")
#             if [[ $head = ref:\ refs/heads/* ]]; then
#                 git_branch="${head#*/*/}"
#             elif [[ $head != '' ]]; then
#                 git_branch=" | (detached)"
#             else
#                 git_branch=" | (unknow)"
#             fi
#             return
#         fi
#         dir="../$dir"
#     done
#     git_branch=''
# }

# function commitCurBranch {
#     git pull
#     git status
#     git add .
#     $(git add ^code.*)
#     git commit -m "${COMMENT}"
#     git push
#     checkMasterBranch
# }

# function checkMasterBranch {
#     find_git_branch
#     echo "合并 "${git_branch}" 分支到master分支..."
#     git checkout master
#     git pull
#     diff_msg=$(git merge ${git_branch})
#     if [[ $diff_msg =~ "CONFLICT (content)" ]]; then
#         echo 'conflict error!'
#         exit 2
#     else
#         echo 'no conflict~'
#     fi
#     git status
#     git add .
#     git commit -m "${COMMENT}"
#     git push
#     git checkout RELEASE
#     git pull
#     diff_msg=$(git merge master)
#     if [[ $diff_msg =~ "CONFLICT (content)" ]]; then
#         echo 'conflict error!'
#         exit 2
#     else
#         echo 'no conflict~'
#     fi
#     git status
#     git add .
#     git commit -m "${COMMENT}"
#     git push
#     #mitag
# }

# find_git_branch
# if [[ $git_branch =~ ^feature ]]; then
# #   echo 'yes'
#     mipublish
# else
#     echo '不能在除 feature 分支执行 npm run deploy 命令'
#     exit 1
# fi

# function mitag {
#     git pull --tags > /dev/null 2>&1
#     local branch=$(git branch | sed -n '/\* /s///p')
#     if [[ $branch =~ 'testing' ]]; then
#         local new_tag=$(echo ${branch}-$(date +'%Y%m%d')-$(git tag -l "${branch}-$(date +'%Y%m%d')-*" | wc -l | xargs printf '%02d'))
#         echo ${new_tag}
#         git tag ${new_tag}
#         git push origin $new_tag > /dev/null 2>&1
#     elif [[ $branch =~ 'RELEASE' ]]; then
#         local new_tag=$(echo ${branch}-$(date +'%Y%m%d')-$(git tag -l "${branch}-$(date +'%Y%m%d')-*" | wc -l | xargs printf '%02d'))
#         echo ${new_tag}
#         git tag ${new_tag}
#         git push origin $new_tag > /dev/null 2>&1
#     else
#         exit 1
#     fi

# }

$(git add .)
git commit -m 'modify'
git push








