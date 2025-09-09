import * as esbuild from 'esbuild';
import fs from 'fs';
import { glob } from 'glob';
import path from 'path';

const isWatchCommand = process.argv.includes('--watch')
const buildDirectory = path.join(process.cwd(), "app/assets/builds")
const webAwesomePublicDirectory = path.join(process.cwd(), "public/assets/webawesome-dist")

function copyFiles(from, to, overwrite = false) {
  const resolvedFrom = path.resolve(from)
  const resolvedTo = path.resolve(to)
  console.log(`copy files: ${resolvedFrom} → ${resolvedTo}`)
  fs.mkdirSync(resolvedTo, { recursive: true })
  fs.cpSync(resolvedFrom, resolvedTo, {recursive: true})
}

const buildEntrypoints = async () => {
  const entrypoints = await glob(path.join(process.cwd(), "app/javascript", "*.js"))
  await esbuild.build({
    entryPoints: entrypoints,
    bundle: true,
    outdir: "app/assets/builds",
  })
  console.log(`esbuild complete`)

  copyFiles("./node_modules/webawesome/dist", webAwesomePublicDirectory)
  console.log(`build finished`)
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
