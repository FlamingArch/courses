const HTMLWebpackPlugin = require("html-webpack-plugin");
const path = require("path");

module.exports = {
  mode: "development",
  target: "web",
  entry: {
    math: path.resolve(__dirname, "src/main.ts"),
  },
  module: {
    rules: [
      {
        test: /\.ts?$/,
        use: "ts-loader",
        exclude: "/node_modules",
      },
    ],
  },
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "bundle.js",
  },
  plugins: [
    new HTMLWebpackPlugin({
      filename: "index.html",
      title: "My Webpage",
      inject: "body",
    }),
  ],
  devServer: {
    static: {
      directory: path.join(__dirname, "dist"),
    },
    compress: true,
    port: 9000,
  },
  resolve: {
    extensions: [".ts", ".js"],
  },
};
