@echo off
call git checkout -b Development
call git branch --set-upstream-to=origin/Development Development
call git config credential.helper store
FOR /L %%y IN (1, 1, %1) DO (
call git checkout -b Release-%%y
call git branch --set-upstream-to=origin/Release-%%y Release-%%y
FOR /L %%i IN (1,1,2) DO (
call git checkout Release-%%y
call git checkout -b R%%y-Feature%%i
call git branch --set-upstream-to=origin/R%%y-Feature%%i R%%y-Feature%%i
mkdir Patches
cd Patches
echo>>Readme
call git add -A
call git commit -m "Patches Folder added"
call git push
)
call git checkout Development
)
PAUSE