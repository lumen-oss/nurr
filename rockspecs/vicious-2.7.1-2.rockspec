local modrev = '2.7.1'
local specrev = '-2'

rockspec_format = '3.0'
package = 'vicious'
version = modrev .. specrev

description = {
  summary = 'Modular widget library for the "awesome" window manager',
  labels = { 'awesomewm', 'widget-libraries' },
  homepage = 'https://vicious.rtfd.io',
  license = 'GPL-2.0+',
}

dependencies = {
  'lua == 5.1',
}

source = {
  url = 'https://github.com/vicious-widgets/vicious/archive/refs/tags/v' .. modrev .. '.zip',
}

build = {
  modules = {
    vicious = 'init.lua',
    ['vicious.helpers'] = 'helpers.lua',
    ['vicious.spawn'] = 'spawn.lua',
    ['vicious.widgets.amdgpu_linux'] = 'widgets/amdgpu_linux.lua',
    ['vicious.widgets.net_freebsd'] = 'widgets/net_freebsd.lua',
    ['vicious.widgets.net_linux'] = 'widgets/net_linux.lua',
    ['vicious.widgets.notmuch_all'] = 'widgets/notmuch_all.lua',
    ['vicious.widgets.org_all'] = 'widgets/org_all.lua',
    ['vicious.widgets.os_bsd'] = 'widgets/os_bsd.lua',
    ['vicious.widgets.os_linux'] = 'widgets/os_linux.lua',
    ['vicious.widgets.pkg_all'] = 'widgets/pkg_all.lua',
    ['vicious.widgets.raid_linux'] = 'widgets/raid_linux.lua',
    ['vicious.widgets.thermal_freebsd'] = 'widgets/thermal_freebsd.lua',
    ['vicious.widgets.thermal_linux'] = 'widgets/thermal_linux.lua',
    ['vicious.widgets.uptime_freebsd'] = 'widgets/uptime_freebsd.lua',
    ['vicious.widgets.uptime_linux'] = 'widgets/uptime_linux.lua',
    ['vicious.widgets.volume_freebsd'] = 'widgets/volume_freebsd.lua',
    ['vicious.widgets.volume_linux'] = 'widgets/volume_linux.lua',
    ['vicious.widgets.weather_all'] = 'widgets/weather_all.lua',
    ['vicious.widgets.wifi_linux'] = 'widgets/wifi_linux.lua',
    ['vicious.widgets.wifiiw_linux'] = 'widgets/wifiiw_linux.lua',
    ['vicious.contrib.ac_linux'] = 'contrib/ac_linux.lua',
    ['vicious.contrib.ati_linux'] = 'contrib/ati_linux.lua',
    ['vicious.contrib.batpmu_linux'] = 'contrib/batpmu_linux.lua',
    ['vicious.contrib.batproc_linux'] = 'contrib/batproc_linux.lua',
    ['vicious.contrib.btc_all'] = 'contrib/btc_all.lua',
    ['vicious.contrib.buildbot_all'] = 'contrib/buildbot_all.lua',
    ['vicious.contrib.cmus_all'] = 'contrib/cmus_all.lua',
    ['vicious.contrib.countfiles_all'] = 'contrib/countfiles_all.lua',
    ['vicious.contrib.dio_linux'] = 'contrib/dio_linux.lua',
    ['vicious.contrib.init'] = 'contrib/init.lua',
    ['vicious.contrib.mpc_all'] = 'contrib/mpc_all.lua',
    ['vicious.contrib.net_linux'] = 'contrib/net_linux.lua',
    ['vicious.contrib.netcfg'] = 'contrib/netcfg.lua',
    ['vicious.contrib.nvinf_all'] = 'contrib/nvinf_all.lua',
    ['vicious.contrib.nvsmi_all'] = 'contrib/nvsmi_all.lua',
    ['vicious.contrib.openweather_all'] = 'contrib/openweather_all.lua',
    ['vicious.contrib.ossvol_linux'] = 'contrib/ossvol_linux.lua',
    ['vicious.contrib.pop_all'] = 'contrib/pop_all.lua',
    ['vicious.contrib.pulse_all'] = 'contrib/pulse_all.lua',
    ['vicious.contrib.rss_all'] = 'contrib/rss_all.lua',
    ['vicious.contrib.sensors_linux'] = 'contrib/sensors_linux.lua',
    ['vicious.contrib.wpa_all'] = 'contrib/wpa_all.lua',
  },
}
