# Small utility to auto-fix a poetry project with isort and black
function fix-py -a path
    poetry run isort $path 
    poetry run black $path
end
