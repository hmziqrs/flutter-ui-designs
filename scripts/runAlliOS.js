import util from 'util';
import cp from 'child_process';
import vsConfig from '../.vscode/launch.json';

const exec = util.promisify(cp.exec);

async function main(params) {
  try {
    if (process.platform !== 'darwin') {
      throw Error('This script can only run on MacOS');
    }
    const devices = vsConfig.configurations.filter(obj => obj.target === 'iOS');
    const openSimulator = await exec('open -a Simulator.app');

    if (openSimulator.err) {
      throw Error('cannot open simulator');
    }

    let openedDevices = 0;
    while (openedDevices < devices.length) {
      const device = devices[openedDevices];
      console.log(`launching ${device.name}`);
      try {
        const simulatorState = await exec(
          `xcrun simctl boot ${device.deviceId}`
        );
      } catch (e) {
        console.log(e.err);
      }
      openedDevices++;
    }
  } catch (e) {
    console.error(e);
  }
}

main();
