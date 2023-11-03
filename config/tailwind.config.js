const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './app/views/**/*.rb',
    './app/components/**/*rb',
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      colors: {
        green: colors.emerald,
        orange: colors.amber,
        primary: colors.slate,
        secondary: colors.blue,
        tertiary: colors.emerald,
        green: colors.emerald,
        danger: colors.rose,
        gray: colors.slate,
        purple: colors.violet,
        amber: colors.amber,
        violet: colors.violet,
        "code-400": "#fefcf9",
        "code-600": "#3c455b",
      },
      fontFamily: {
        sans: ['Inter var', 'system-ui', ...defaultTheme.fontFamily.sans],
      },
      fontSize: {
        'xxs': '11px'
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
