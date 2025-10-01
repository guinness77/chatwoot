# Script simples para configurar branding do Chatwoot
Write-Host "🎨 Configuração de Branding do Chatwoot" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan

# Verificar se estamos no diretório correto
if (-not (Test-Path "Gemfile")) {
    Write-Host "❌ Execute este script no diretório raiz do Chatwoot" -ForegroundColor Red
    exit 1
}

# Verificar se o logo existe
if (-not (Test-Path "public/brand-assets/logo.png")) {
    Write-Host "⚠️  Arquivo logo.png não encontrado em public/brand-assets/" -ForegroundColor Yellow
    Write-Host "   Coloque seu logo em public/brand-assets/logo.png" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Logo encontrado" -ForegroundColor Green

# Configurações de branding
$env:INSTALLATION_NAME = "Sua Empresa Chat"
$env:BRAND_NAME = "Sua Empresa"
$env:LOGO_THUMBNAIL = "/brand-assets/logo.png"
$env:LOGO = "/brand-assets/logo.png"
$env:LOGO_DARK = "/brand-assets/logo.png"
$env:BRAND_URL = "https://suaempresa.com"
$env:WIDGET_BRAND_URL = "https://suaempresa.com"
$env:TERMS_URL = "https://suaempresa.com/terms"
$env:PRIVACY_URL = "https://suaempresa.com/privacy"
$env:DISPLAY_MANIFEST = "true"

Write-Host "📋 Configurações de branding:" -ForegroundColor Yellow
Write-Host "   - Nome da instalação: $($env:INSTALLATION_NAME)" -ForegroundColor White
Write-Host "   - Nome da marca: $($env:BRAND_NAME)" -ForegroundColor White
Write-Host "   - Logo: $($env:LOGO)" -ForegroundColor White
Write-Host "   - URL da marca: $($env:BRAND_URL)" -ForegroundColor White

# Executar o comando de branding
Write-Host "🔄 Aplicando configurações de branding..." -ForegroundColor Cyan

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
