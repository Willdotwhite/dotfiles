# Source - https://stackoverflow.com/a/10325758
# Posted by Daniel Baulig, modified by community. See post 'Timeline' for change history
# Retrieved 2026-02-27, License - CC BY-SA 4.0

for k in $(git branch | sed /\*/d); do 
  if [ -z "$(git log -1 --since='2 months ago' -s $k)" ]; then
    # echo "Deleting old branch: $k"
    git branch -D $k
  fi
done

