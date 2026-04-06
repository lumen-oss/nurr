#!/usr/bin/env -S nvim -u NONE -U NONE -N -i NONE -l

local pkg = _G.arg[1]
if not pkg then
  error("expected [PACKAGE] argument")
end
local sc = vim.system({
  'luarocks',
  '--lua-version',
  '5.1',
  '--dev',
  'search',
  '--porcelain',
  pkg,
}):wait()
if sc.code ~= 0 then
  error("error querying luarocks: " .. (sc.stderr or tostring(sc.code)))
end
local stdout = sc.stdout or ""
local latest_specrev = 0
local latest_version = 'scm-0'
for name, version in stdout:gmatch("(%S+)%s+(%S+)%s+[^\n]+") do
  if name == pkg then
    local specrev = version:match("^scm%-(%d*)$")
    if specrev then
      specrev = tonumber(specrev)
      if specrev and specrev >= latest_specrev then
        latest_specrev = specrev
        latest_version = version
      end
    end
  end
end
if latest_specrev == 0 then
  io.write("1")
  return
end
local temp_dir = vim.fn.tempname()
vim.system({"mkdir", "-p", temp_dir}):wait()
sc = vim.system({
  'luarocks',
  '--lua-version',
  '5.1',
  '--dev',
  'download',
  '--rockspec',
  pkg,
  latest_version,
}, {
  cwd = temp_dir,
}):wait()
if sc.code ~= 0 then
  error("error downloading latest rockspec: " .. (sc.stderr or tostring(sc.code)))
end
local rockspec_path = vim.fs.joinpath(temp_dir, ("%s-%s.rockspec"):format(pkg, latest_version))
local h = assert(io.open(rockspec_path, "r"), "unable to open " .. rockspec_path)
local content = h:read("*a")
local expected_sha = assert(vim.env.GITHUB_SHA_OVERRIDE, "GITHUB_SHA_OVERRIDE not set")
if content:find("git_ref = '" .. expected_sha .. "'") ~= nil then
  io.write(tostring(latest_specrev))
else
  io.write(tostring(latest_specrev + 1))
end
