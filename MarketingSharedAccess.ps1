# Create Shared Mailbox
New-Mailbox -Name "Marketing Shared" -Shared -PrimarySmtpAddress "marketing@domain.com"

# Assign Read-Only Access
$readUsers = @("user1@domain.com", "user2@domain.com", "user10@domain.com")
foreach ($user in $readUsers) {
    Add-MailboxFolderPermission -Identity "marketing@domain.com:\Inbox" -User $user -AccessRights Reviewer
}

# Assign Send As permissions
$sendAsUsers = @("user11@domain.com", "user12@domain.com", "user20@domain.com")
foreach ($user in $sendAsUsers) {
    Add-ADPermission -Identity "Marketing Shared" -User $user -ExtendedRights "Send As"
}

# Assign Full Access to Owner
Add-MailboxPermission -Identity "marketing@domain.com" -User "owner@domain.com" -AccessRights FullAccess -InheritanceType All
