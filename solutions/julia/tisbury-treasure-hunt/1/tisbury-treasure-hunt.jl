function get_coordinate(line)
    _, coordinate = line
    return coordinate
end

function convert_coordinate(coordinate)
    return (coordinate[1], coordinate[2])
end

function compare_records(azara_record, rui_record)
    azara_coor = convert_coordinate(get_coordinate(azara_record))
    return azara_coor == rui_record[2]
end

function create_record(azara_record, rui_record)
    if compare_records(azara_record, rui_record)
        return (azara_record[2], rui_record[1], rui_record[3], azara_record[1])
    else
        return ()
    end
end
