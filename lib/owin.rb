require 'uri'
require 'net/http'
require 'fileutils'

def run(command)
	%x{ #{command} 2>&1 }
end

module Owin
	def self.detect(build_dir)
		Dir.chdir(build_dir)

		return File.exists? "usemono"
	end

	def self.compile(build_dir, cache_dir)
		mono_binaries_url = "https://cloudant.com/db/bvanderveen/make/23399466-c06c-4c94-ae84-b9e040a6a38f/output"
		mono_path = File.join(build_dir, "_mono")

		FileUtils.mkdir_p(mono_path)
		Dir.chdir(mono_path) do
			run("curl #{mono_binaries_url} -s -o - | tar xzf -")
		end
	end
end