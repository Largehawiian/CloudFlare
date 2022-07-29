function Get-DNSRecord {
    param (
        [parameter(Mandatory = $True)][string]$APIKey
    )
    $Header = @{
        'Content-Type' = "application/json"
        Authorization  = "Bearer $APIKey"
    }
    $URI = "https://api.cloudflare.com/client/v4/zones/38e05a298627b5e65c0c9d90d2e47b21/dns_records"
    
    $Results = Invoke-RestMethod -Method Get -Uri $URI -Headers $Header
    return $Results.result
}
