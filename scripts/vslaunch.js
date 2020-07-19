import fs from 'fs';
import util from 'util';
import cp from 'child_process';

import * as utils from './utils';

const exec = util.promisify(cp.exec);
const desktopFilters = ['mac', 'linux', 'windows'];

async function main() {
  try {
    const { stdout } = await exec('flutter devices');
    const raw = stdout.split('\n');
    const devices = raw.slice(2, raw.length - 1).map((result) => {
      const [name, deviceId] = result.split('•').map((str) => str.trim());
      const obj = {
        name,
        deviceId,
        type: 'dart',
        request: 'launch',
      };
      if (
        desktopFilters.filter((str) => deviceId.toLowerCase().includes(str))
          .length === 0
      ) {
        obj.args = ['-t', 'lib/main.mobile.dart'];
      }
      return obj;
    });

    const newConfig = {
      version: '1.0.0',
      configurations: [
        {
          name: 'Flutter',
          request: 'launch',
          type: 'dart',
        },
        ...devices,
      ],
      compounds: [
        {
          name: 'current',
          configurations: devices.map((obj) => obj.name),
        },
      ],
    };
    console.log(newConfig);
    await utils.mkDir('.vscode');
    fs.writeFileSync(
      './.vscode/launch.json',
      JSON.stringify(newConfig, null, 2)
    );
  } catch (e) {
    console.error(e);
  }
}

main();
