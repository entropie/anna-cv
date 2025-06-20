#!/usr/bin/env ruby

SERVER = "hive"


MOCK = false

TARGET = if MOCK
           "/tmp/cv"
         else
           "/home/ha2itats/snobdog/current/media/public/data/cv"
         end


def run(cmd, mock = MOCK)
  print ">>> ", cmd, "\n"
  if mock
  else
    system(cmd)
  end
end

def rcopy(cmd, mock: MOCK, server: SERVER)
  c = "scp -r %s #{server}:'#{TARGET}'" % cmd
  run(c)
end

run("ssh #{SERVER} 'rm -rf #{TARGET}'")
rcopy(File.expand_path(File.dirname(__FILE__)))
