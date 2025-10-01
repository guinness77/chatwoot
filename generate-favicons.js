const fs = require('fs');
const path = require('path');

// Lista de tamanhos necessários para favicons
const faviconSizes = [
  { name: 'android-icon-36x36.png', size: 36 },
  { name: 'android-icon-48x48.png', size: 48 },
  { name: 'android-icon-72x72.png', size: 72 },
  { name: 'android-icon-96x96.png', size: 96 },
  { name: 'android-icon-144x144.png', size: 144 },
  { name: 'android-icon-192x192.png', size: 192 },
  { name: 'apple-icon-57x57.png', size: 57 },
  { name: 'apple-icon-60x60.png', size: 60 },
  { name: 'apple-icon-72x72.png', size: 72 },
  { name: 'apple-icon-76x76.png', size: 76 },
  { name: 'apple-icon-114x114.png', size: 114 },
  { name: 'apple-icon-120x120.png', size: 120 },
  { name: 'apple-icon-144x144.png', size: 144 },
  { name: 'apple-icon-152x152.png', size: 152 },
  { name: 'apple-icon-180x180.png', size: 180 },
  { name: 'apple-icon.png', size: 180 },
  { name: 'apple-icon-precomposed.png', size: 180 },
  { name: 'apple-touch-icon.png', size: 180 },
  { name: 'apple-touch-icon-precomposed.png', size: 180 },
  { name: 'favicon-16x16.png', size: 16 },
  { name: 'favicon-32x32.png', size: 32 },
  { name: 'favicon-96x96.png', size: 96 },
  { name: 'favicon-512x512.png', size: 512 },
  { name: 'favicon-badge-16x16.png', size: 16 },
  { name: 'favicon-badge-32x32.png', size: 32 },
  { name: 'favicon-badge-96x96.png', size: 96 },
  { name: 'ms-icon-70x70.png', size: 70 },
  { name: 'ms-icon-144x144.png', size: 144 },
  { name: 'ms-icon-150x150.png', size: 150 },
  { name: 'ms-icon-310x310.png', size: 310 }
];

console.log('📱 Gerador de Favicons para Chatwoot');
console.log('=====================================');

// Verificar se o arquivo logo.png existe
const logoPath = path.join(__dirname, 'public', 'brand-assets', 'favicon.ico');
if (!fs.existsSync(logoPath)) {
  console.error('❌ Arquivo favicon.ico não encontrado em public/brand-assets/');
  process.exit(1);
}

console.log('✅ Arquivo favicon.ico encontrado');
console.log('📋 Tamanhos de favicon necessários:');
faviconSizes.forEach(favicon => {
  console.log(`   - ${favicon.name} (${favicon.size}x${favicon.size})`);
});

console.log('\n🔧 Para gerar os favicons, você pode:');
console.log('1. Usar uma ferramenta online como https://realfavicongenerator.net/');
console.log('2. Usar ImageMagick: convert favicon.ico -resize 36x36 android-icon-36x36.png');
console.log('3. Usar GIMP ou Photoshop para redimensionar manualmente');
console.log('4. Usar o script extract_brand_assets.sh com um arquivo ZIP');

console.log('\n📁 Coloque todos os arquivos gerados na pasta public/');
console.log('🎯 Depois execute: bundle exec rails branding:update');
