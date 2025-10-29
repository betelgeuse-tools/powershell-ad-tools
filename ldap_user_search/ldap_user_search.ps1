$prefix = Read-Host "Enter username to search"

$searchBase = "LDAP://DC=test,DC=com"
$searcher = New-Object DirectoryServices.DirectorySearcher([ADSI]$searchBase)

$searcher.Filter = "(&(objectClass=user)(|(sAMAccountName=$prefix*)(userPrincipalName=$prefix*)))"

$props = @(
    "displayName",
    "name",
    "userPrincipalName",
    "company",
    "distinguishedName",
    "userAccountControl"
)

$searcher.PropertiesToLoad.AddRange($props)

$results = $searcher.FindAll()

foreach ($result in $results) {

    $user = $result.GetDirectoryEntry()
    $uac = [int]$user.Properties["userAccountControl"].Value
    $enabled = -not ($uac -band 2)

    [PSCustomObject]@{
        Enabled           = $enabled
        DisplayName       = $user.Properties["displayName"]      | Select-Object -First 1
        Name              = $user.Properties["name"]             | Select-Object -First 1
        UserPrincipalName = $user.Properties["userPrincipalName"]| Select-Object -First 1
        Company           = $user.Properties["company"]          | Select-Object -First 1
        DistinguishedName = $user.Properties["distinguishedName"]| Select-Object -First 1
    }
}
