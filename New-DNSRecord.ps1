function New-DNSRecord {
    param (
        [parameter(Mandatory = $True)][string]$Type,
        [parameter(Mandatory = $True)][string]$Name,
        [parameter(Mandatory = $True)][string]$Content,
        [parameter(Mandatory = $True)][string]$TTL,
        [parameter(Mandatory = $True)][bool]$Proxied,
        [parameter(Mandatory = $True)][string]$APIKey
    )
    $Header = @{
        'Content-Type' = "application/json"
        Authorization  = "Bearer $APIKey"
    }
    $Body =@{
        type = $Type
        name = $Name
        content = $Content
        ttl = $TTL
        proxied = $Proxied
    } | ConvertTo-Json -Compress
    $URI = "https://api.cloudflare.com/client/v4/zones/38e05a298627b5e65c0c9d90d2e47b21/dns_records"
    $Results = Invoke-RestMethod -Method POST -URI $URI -Headers $Header -Body $Body
    return $Results.result
}