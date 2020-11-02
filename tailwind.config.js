module.exports = {
  future: {
    removeDeprecatedGapUtilities: true,
    purgeLayersByDefault: true,
  },
  purge: ['./app/**/*.html.erb', './app/helpers/**/*.rb'],
  theme: {
    container: {
      center: true,
      padding: '1rem',
    },
    extend: {},
  },
  variants: {},
  plugins: [require('@tailwindcss/ui'), require('@tailwindcss/typography')],
}
