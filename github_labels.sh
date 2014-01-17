echo "   ___       ___       ___    "
echo "  /\  \     /\  \     /\  \   "
echo " /::\  \   /::\  \   /::\  \  "
echo "/::\:\__\ /:/\:\__\ /:/\:\__\ "
echo "\/\::/  / \:\ \/__/ \:\ \/__/ "
echo "  /:/  /   \:\__\    \:\__\   "
echo "  \/__/     \/__/     \/__/   "
echo                                  
echo "    ATHLETICS CODE CREW       "
echo "   Github  Label  Script     	"
echo "    (JP1983  Flashback)       "
echo
echo -n "Github Username: "
read username
read -s -p "Github Password: " password
echo
echo -n "Repository Name: "
read repository
echo -n "Organization(y/N)? "
read org_bool

if [ "$org_bool" == "y" ]; then
		echo -n "Organiztion Name: "
		read organization
		org_or_repo=$organization
else
	echo "Using username for repository path ..."
	org_or_repo=$username
fi

echo -n "Delete defaults(y/N)? "
read del_bool

if [ "$del_bool" == "y" ]; then
	curl -u "$username:$password" --include --request DELETE "https://api.github.com/repos/$org_or_repo/$repository/labels/bug"
	sleep 1
	curl -u "$username:$password" --include --request DELETE "https://api.github.com/repos/$org_or_repo/$repository/labels/duplicate"
	sleep 1
	curl -u "$username:$password" --include --request DELETE "https://api.github.com/repos/$org_or_repo/$repository/labels/enhancement"
	sleep 1
	curl -u "$username:$password" --include --request DELETE "https://api.github.com/repos/$org_or_repo/$repository/labels/invalid"
	sleep 1
	curl -u "$username:$password" --include --request DELETE "https://api.github.com/repos/$org_or_repo/$repository/labels/question"
	sleep 1
	curl -u "$username:$password" --include --request DELETE "https://api.github.com/repos/$org_or_repo/$repository/labels/wontfix"
	sleep 1
else
	echo "Keeping default labels ..."
fi

echo "Creating labels ..."
if [ "$del_bool" == "y" ]; then
	curl -k -u "$username:$password" -d "{\"name\":\"bug\",\"color\":\"e11d21\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
fi	
curl -k -u "$username:$password" -d "{\"name\":\"daily build\",\"color\":\"009800\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
curl -k -u "$username:$password" -d "{\"name\":\"feature request\",\"color\":\"0052cc\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
curl -k -u "$username:$password" -d "{\"name\":\"lang css\",\"color\":\"888888\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
curl -k -u "$username:$password" -d "{\"name\":\"lang html\",\"color\":\"888888\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
curl -k -u "$username:$password" -d "{\"name\":\"lang javascript\",\"color\":\"888888\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
curl -k -u "$username:$password" -d "{\"name\":\"lang php\",\"color\":\"888888\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
curl -k -u "$username:$password" -d "{\"name\":\"priority high\",\"color\":\"e11d21\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
curl -k -u "$username:$password" -d "{\"name\":\"priority normal\",\"color\":\"eb6420\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
curl -k -u "$username:$password" -d "{\"name\":\"priority low\",\"color\":\"fbca04\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
curl -k -u "$username:$password" -d "{\"name\":\"question\",\"color\":\"cc317c\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
curl -k -u "$username:$password" -d "{\"name\":\"waiting\",\"color\":\"fef2c0\"}" https://api.github.com/repos/$org_or_repo/$repository/labels
echo "Current labels ..."
curl -k -u "$username:$password" https://api.github.com/repos/$org_or_repo/$repository/labels