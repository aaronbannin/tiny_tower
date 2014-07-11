module MissionsHelper
    def mission_is_eligible(floor_hash)
        if floor_hash.length == 1
            puts floor_hash[0].is_owned == true
        elsif floor_hash.length == 2
            puts floor_hash[0].is_owned && floor_hash[1].is_owned
        elsif floor_hash.length == 3
            puts floor_hash[0].is_owned && floor_hash[1].is_owned && floor_hash[2].is_owned
        end
    end
end

