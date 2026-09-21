using Dates

function schedule_appointment(appointment::String)
    dtfmt = dateformat"m/d/y H:M:S"
    return DateTime(appointment, dtfmt)
end

function has_passed(appointment::DateTime)
    return now() > appointment
end

function is_afternoon_appointment(appointment::DateTime)
    return 12 <= hour(appointment) < 18
end

function describe(appointment::DateTime)
    dtfmt = dateformat"E, U d, yyyy at HH:MM"
    msg = "You have an appointment on $(Dates.format(appointment, dtfmt))"
    return msg
end

function anniversary_date()
    return Date(year(now()), 09, 15)
end
