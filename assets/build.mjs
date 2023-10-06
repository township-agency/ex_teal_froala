import ESBuild from "esbuild";
import vuePlugin from "esbuild-vue";
import chokidar from "chokidar";

const ctx = await ESBuild.context({
  entryPoints: [
    "./src/main.js"
  ],
  bundle: true,
  outdir: "../priv/static/",
  plugins: [vuePlugin()],
  define: {
    "process.env.NODE_ENV": JSON.stringify("development"),
  },
  minify: process.argv.includes("--deploy")
})

if (process.argv.includes("--watch")) {
  (async () => {
    chokidar.watch('src').on('all', async (_, p) => {
      console.log(`Changes were detected in: ${p}`);
      console.log('Rebuilding...');
      await ctx.rebuild();
    });
  })();
} else {
  await ctx.rebuild().then(() => {
    ctx.dispose();
  });
}