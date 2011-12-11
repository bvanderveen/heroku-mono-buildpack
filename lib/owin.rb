require 'uri'
require 'net/http'

def run(command)
	%x{ #{command} 2>&1 }
end

module Owin
	def self.detect(build_dir)
		puts '-----> attempting to detect mono'
		Dir.chdir(build_dir)

		return File.exists? "usemono"
	end

	def self.compile(build_dir, cache_dir)
		mono_binaries_url = "https://cloudant.com/db/bvanderveen/make/23399466-c06c-4c94-ae84-b9e040a6a38f/output"
		mono_path = File.join(build_dir, "_mono")

		Dir.chdir(mono_path) do
			run("curl #{mono_binaries_url} -o - | tar xzf -")
		end
	end
end