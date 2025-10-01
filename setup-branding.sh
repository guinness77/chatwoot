#!/bin/bash

# Script para configurar branding do Chatwoot
# Baseado no CUSTOM_BRANDING.md

echo "🎨 Configuração de Branding do Chatwoot"
echo "====================================="

# Verificar se estamos no diretório correto
if [ ! -f "Gemfile" ]; then
    echo "❌ Execute este script no diretório raiz do Chatwoot"
    exit 1
fi

# Verificar se o bundle está instalado
if ! command -v bundle &> /dev/null; then
    echo "❌ Bundle não encontrado. Instale o Ruby e as gems primeiro"
    exit 1
fi

echo "✅ Ambiente verificado"

# Configurações de branding (customize conforme necessário)
INSTALLATION_NAME="${INSTALLATION_NAME:-'Sua Empresa Chat'}"
BRAND_NAME="${BRAND_NAME:-'Sua Empresa'}"
LOGO_THUMBNAIL="${LOGO_THUMBNAIL:-'/brand-assets/logo.png'}"
LOGO="${LOGO:-'/brand-assets/logo.png'}"
LOGO_DARK="${LOGO_DARK:-'/brand-assets/logo.png'}"
BRAND_URL="${BRAND_URL:-'https://suaempresa.com'}"
WIDGET_BRAND_URL="${WIDGET_BRAND_URL:-'https://suaempresa.com'}"
TERMS_URL="${TERMS_URL:-'https://suaempresa.com/terms'}"
PRIVACY_URL="${PRIVACY_URL:-'https://suaempresa.com/privacy'}"
DISPLAY_MANIFEST="${DISPLAY_MANIFEST:-'true'}"

echo "📋 Configurações de branding:"
echo "   - Nome da instalação: $INSTALLATION_NAME"
echo "   - Nome da marca: $BRAND_NAME"
echo "   - Logo: $LOGO"
echo "   - Logo thumbnail: $LOGO_THUMBNAIL"
echo "   - URL da marca: $BRAND_URL"

# Verificar se os arquivos de logo existem
if [ ! -f "public/brand-assets/logo.png" ]; then
    echo "⚠️  Arquivo logo.png não encontrado em public/brand-assets/"
    echo "   Coloque seu logo em public/brand-assets/logo.png"
    exit 1
fi

echo "✅ Logo encontrado"

# Executar o comando de branding
echo "🔄 Aplicando configurações de branding..."

INSTALLATION_NAME="$INSTALLATION_NAME" \
BRAND_NAME="$BRAND_NAME" \
LOGO_THUMBNAIL="$LOGO_THUMBNAIL" \
LOGO="$LOGO" \
LOGO_DARK="$LOGO_DARK" \
BRAND_URL="$BRAND_URL" \
WIDGET_BRAND_URL="$WIDGET_BRAND_URL" \
TERMS_URL="$TERMS_URL" \
PRIVACY_URL="$PRIVACY_URL" \
DISPLAY_MANIFEST="$DISPLAY_MANIFEST" \
bundle exec rails branding:update

if [ $? -eq 0 ]; then
    echo "✅ Branding configurado com sucesso!"
    echo ""
    echo "🎯 Próximos passos:"
    echo "   1. Reinicie o servidor Chatwoot"
    echo "   2. Acesse o dashboard para verificar as mudanças"
    echo "   3. Teste o widget para confirmar o branding"
    echo ""
    echo "📝 Para personalizar mais, edite as variáveis no início deste script"
else
    echo "❌ Erro ao configurar branding"
    exit 1
fi
