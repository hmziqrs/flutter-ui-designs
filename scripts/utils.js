import fs from 'fs';

export function mkDir(path, logs = false) {
  try {
    const check = fs.existsSync(path);
    if (logs) {
      console.log('path', path);
      console.log('check', check);
    }
    if (!check) {
      return fs.mkdirSync(path);
    }
    return check;
  } catch (e) {
    throw e;
  }
}
