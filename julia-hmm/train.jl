require("ArgParse")
using ArgParse


function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table s begin
        "train_file"
            help = "training inputs"
            required = true
    end

    return parse_args(s)
end

function main()
    parsed_args = parse_commandline()
    for pa in parsed_args
        println("   $(pa[1]) => $(pa[2])")
    end
end

main()
