import { createTheme } from "@mantine/core";

const colors = {
  blue: "#007AFF",
  cyan: "#32ADE6",
  green: "#34C759",
  indigo: "#5856BE",
  mint: "#00C7BE",
  orange: "#FF9500",
  pink: "#DE5494",
  purple: "#AF52DE",
  red: "#FF3B30",
  "red-muted": "#EB5757",
  "red-sizzling": "#FF2D55",
  teal: "#30B0C7",
  yellow: "#FFCC00",
  gray: {
    50: "#F8F8F8",
    100: "#F7F7F7",
    150: "#F4F4F5",
    200: "#F2F2F7",
    250: "#EEEEEF",
    300: "#E9E8E7",
    350: "#E3E3E8",
    400: "#DADADA",
    450: "#D1D1D6",
    500: "#C4C4C4",
    550: "#A2A2A2",
    600: "#808080",
    650: "#595959",
    700: "#9A9EA7",
    750: "#50555C",
  },
};

const generateShades = (
  color: string
): [
  string,
  string,
  string,
  string,
  string,
  string,
  string,
  string,
  string,
  string
] => {
  return [color, color, color, color, color, color, color, color, color, color];
};

export const theme = createTheme({
  colors: {
    blue: generateShades(colors.blue),
    cyan: generateShades(colors.cyan),
    green: generateShades(colors.green),
    indigo: generateShades(colors.indigo),
    mint: generateShades(colors.mint),
    orange: generateShades(colors.orange),
    pink: generateShades(colors.pink),
    purple: generateShades(colors.purple),
    red: generateShades(colors.red),
    "red-muted": generateShades(colors["red-muted"]),
    "red-sizzling": generateShades(colors["red-sizzling"]),
    teal: generateShades(colors.teal),
    yellow: generateShades(colors.yellow),
    gray: [
      colors.gray[50],
      colors.gray[100],
      colors.gray[200],
      colors.gray[300],
      colors.gray[400],
      colors.gray[500],
      colors.gray[600],
      colors.gray[650],
      colors.gray[700],
      colors.gray[750],
    ],
  },
  primaryColor: "blue",
});
