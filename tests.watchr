require 'uri'
require 'open3'
command = "c:/Program Files (x86)/full phat/Snarl/tools/heysnarl.exe"
output = ""
args = ""
watch('(.*\.scm)$') { |md| 
    file = "#{md[0]}"
    stdin, stdout, stderr = Open3.popen3(
        "c:/chicken/bin/csi.exe",
        file,
        "-b",
        "-q",
        "-r5rs-syntax",
        "-n") 
    output = stdout.readlines[1..-3]
    err = stderr.readlines
    if err.length == 0 
        puts output
    else 
        puts "Out: %s\nErr: %s" % [output, err.join]
    end
    if output.to_s =~ /\(100%\) tests passed/
        icon = "#{ENV["HOME"]}\\icons\\ok-icon.png"
    else
        icon = "#{ENV["HOME"]}\\icons\\Button-Close-icon.png"
    end
    args = if not(output) || output.empty?
                URI.escape(err[0..1].join).gsub(/%0A/,'\n')
            else 
                URI.escape(output[-1]).gsub(/%0A/,'\n')
            end
    args = "notify?title=" + 
        "Watchr: Scheme Tests" +
        "&text=" + 
        args +
        "&icon=" +
        icon
    stdin, stdout, stderr = Open3.popen3(command,args)
    puts(stderr.read)
}
