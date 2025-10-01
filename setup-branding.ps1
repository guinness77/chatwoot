# Script para configurar branding do Chatwoot
# Baseado no CUSTOM_BRANDING.md

Write-Host "🎨 Configuração de Branding do Chatwoot" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan

# Verificar se estamos no diretório correto
if (-not (Test-Path "Gemfile")) {
    Write-Host "❌ Execute este script no diretório raiz do Chatwoot" -ForegroundColor Red
    exit 1
}

# Verificar se o bundle está instalado
try {
    $bundleVersion = bundle --version
    Write-Host "✅ Bundle encontrado: $bundleVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Bundle não encontrado. Instale o Ruby e as gems primeiro" -ForegroundColor Red
    exit 1
}

# Configurações de branding (customize conforme necessário)
$env:INSTALLATION_NAME = if ($env:INSTALLATION_NAME) { $env:INSTALLATION_NAME } else { "Sua Empresa Chat" }
$env:BRAND_NAME = if ($env:BRAND_NAME) { $env:BRAND_NAME } else { "Sua Empresa" }
$env:LOGO_THUMBNAIL = if ($env:LOGO_THUMBNAIL) { $env:LOGO_THUMBNAIL } else { "/brand-assets/logo.png" }
$env:LOGO = if ($env:LOGO) { $env:LOGO } else { "/brand-assets/logo.png" }
$env:LOGO_DARK = if ($env:LOGO_DARK) { $env:LOGO_DARK } else { "/brand-assets/logo.png" }
$env:BRAND_URL = if ($env:BRAND_URL) { $env:BRAND_URL } else { "https://suaempresa.com" }
$env:WIDGET_BRAND_URL = if ($env:WIDGET_BRAND_URL) { $env:WIDGET_BRAND_URL } else { "https://suaempresa.com" }
$env:TERMS_URL = if ($env:TERMS_URL) { $env:TERMS_URL } else { "https://suaempresa.com/terms" }
$env:PRIVACY_URL = if ($env:PRIVACY_URL) { $env:PRIVACY_URL } else { "https://suaempresa.com/privacy" }
$env:DISPLAY_MANIFEST = if ($env:DISPLAY_MANIFEST) { $env:DISPLAY_MANIFEST } else { "true" }

Write-Host "📋 Configurações de branding:" -ForegroundColor Yellow
Write-Host "   - Nome da instalação: $($env:INSTALLATION_NAME)" -ForegroundColor White
Write-Host "   - Nome da marca: $($env:BRAND_NAME)" -ForegroundColor White
Write-Host "   - Logo: $($env:LOGO)" -ForegroundColor White
Write-Host "   - Logo thumbnail: $($env:LOGO_THUMBNAIL)" -ForegroundColor White
Write-Host "   - URL da marca: $($env:BRAND_URL)" -ForegroundColor White

# Verificar se os arquivos de logo existem
if (-not (Test-Path "public/brand-assets/logo.png")) {
    Write-Host "⚠️  Arquivo logo.png não encontrado em public/brand-assets/" -ForegroundColor Yellow
    Write-Host "   Coloque seu logo em public/brand-assets/logo.png" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Logo encontrado" -ForegroundColor Green

# Executar o comando de branding
Write-Host "🔄 Aplicando configurações de branding..." -ForegroundColor Cyan

try {
    bundle exec rails branding:update
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Branding configurado com sucesso!" -ForegroundColor Green
        Write-Host ""
        Write-Host "🎯 Próximos passos:" -ForegroundColor Cyan
        Write-Host "   1. Reinicie o servidor Chatwoot" -ForegroundColor White
        Write-Host "   2. Acesse o dashboard para verificar as mudanças" -ForegroundColor White
        Write-Host "   3. Teste o widget para confirmar o branding" -ForegroundColor White
        Write-Host ""
        Write-Host "📝 Para personalizar mais, edite as variáveis no início deste script" -ForegroundColor Yellow
    } else {
        Write-Host "❌ Erro ao configurar branding" -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "❌ Erro ao configurar branding" -ForegroundColor Red
    Write-Host "Erro: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
