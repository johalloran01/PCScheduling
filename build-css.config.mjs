import * as esbuild from 'esbuild';
import fs from 'fs';
import { glob } from 'glob';
import path from 'path';

const isWatchCommand = process.argv.includes('--watch')
const buildDirectory = path.join(process.cwd(), "app/assets/builds")

const buildEntrypoints = async () => {
  const entrypoints = await glob(path.join(process.cwd(), "app/assets/stylesheets", "*.css"))
  await esbuild.build({
    entryPoints: entrypoints,
    bundle: true,
    outdir: "app/assets/builds",
  })
}

const buildAll = async () => {
  await buildEntrypoints();
}

(async () => {
  await buildAll()

  if (isWatchCommand) {
    fs.watch(path.join(process.cwd(), "app/javascript"), { recursive: true }, (eventType, filename) => {
      console.log(`File changed: ${filename}. Rebuilding...`);
      buildAll();
    });
  } else {
    process.exit(0);
  }
})();
