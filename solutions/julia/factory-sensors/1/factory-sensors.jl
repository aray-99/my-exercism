function humiditycheck(pct_humidity)
    if pct_humidity <= 70
        @info "humidity level check passed: $(pct_humidity)%"
    else
        error("$pct_humidity is over 70%")
    end
end

function temperaturecheck(temperature)
    if isnothing(temperature)
        throw(ArgumentError("sensor is broken"))
    elseif temperature <= 500
        @info "temperature check passed: $temperature °C"
    else
        throw(DomainError(temperature, "overheating detected"))
    end
end

# define MachineError here
struct MachineError <: Exception end

function machinemonitor(pct_humidity, temperature)
    failed = false
    try
        humiditycheck(pct_humidity)
    catch e
        if e isa ErrorException
            @error "humidity level check failed: $pct_humidity%"
            failed = true
        else
            rethrow()
        end
    end
    try
        temperaturecheck(temperature)
    catch e
        if e isa ArgumentError
            @warn "sensor is broken"
            failed = true
        elseif e isa DomainError
            @error "overheating detected: $temperature °C"
            failed = true
        else
            rethrow()
        end
    end
    if failed
        throw(MachineError())
    end
end
