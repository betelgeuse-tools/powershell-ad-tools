# LDAP User Search - PowerShell Script

## Description
This tool allows you to search Active Directory user accounts by prefix on  
`sAMAccountName` or `userPrincipalName` using LDAP.

It retrieves key user attributes and reports whether the account is enabled.

---

## Features
- LDAP query using `DirectorySearcher`
- Search by prefix on username or UPN
- Outputs:
  - **Enabled / disabled**
  - **DisplayName**
  - **Name**
  - **UserPrincipalName**
  - **Company**
  - **DistinguishedName**

---

## Usage

1. Run the script in PowerShell.
2. Enter the prefix of the username when prompted.
3. Results will be printed as objects.

### Example
```
Enter username prefix: adm
```

Example output:
```
Enabled           : True
DisplayName       : Adam Smith
Name              : Adam Smith
UserPrincipalName : adam.smith@test.com
Company           : TestCorp
DistinguishedName : CN=Adam Smith,OU=Users,DC=test,DC=com
```

---

## Requirements
- PowerShell
- Active Directory access
- Network connectivity to the Domain Controller (DC)

---

## Notes
- Update the LDAP path to match the actual domain.
  - Example:
    ```
    LDAP://DC=test,DC=com  →  test.com
    ```

---

## License
MIT License
