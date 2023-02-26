CREATE DATABASE road_accident_data;
USE road_accident_data;


-- dft-road-casualty-statistics-accident-2021
-- accident_index,accident_year,accident_reference,location_easting_osgr,location_northing_osgr,longitude,latitude,police_force,accident_severity,number_of_vehicles,
-- number_of_casualties,date,day_of_week,time,local_authority_district,local_authority_ons_district,local_authority_highway,first_road_class,first_road_number,road_type,
-- speed_limit,junction_detail,junction_control,second_road_class,second_road_number,pedestrian_crossing_human_control,pedestrian_crossing_physical_facilities,light_conditions,
-- weather_conditions,road_surface_conditions,special_conditions_at_site,carriageway_hazards,urban_or_rural_area,did_police_officer_attend_scene_of_accident,trunk_road_flag,
-- lsoa_of_accident_location

-- dft-road-casualty-statistics-casualty-2021
-- accident_index,accident_year,accident_reference,vehicle_reference,casualty_reference,casualty_class,sex_of_casualty,age_of_casualty,age_band_of_casualty,casualty_severity,
-- pedestrian_location,pedestrian_movement,car_passenger,bus_or_coach_passenger,pedestrian_road_maintenance_worker,casualty_type,casualty_home_area_type,casualty_imd_decile,lsoa_of_casualty

-- dft-road-casualty-statistics-vehicle-2021
-- accident_index,accident_year,accident_reference,vehicle_reference,vehicle_type,towing_and_articulation,vehicle_manoeuvre,vehicle_direction_from,vehicle_direction_to,
-- vehicle_location_restricted_lane,junction_location,skidding_and_overturning,hit_object_in_carriageway,vehicle_leaving_carriageway,hit_object_off_carriageway,first_point_of_impact,
-- vehicle_left_hand_drive,journey_purpose_of_driver,sex_of_driver,age_of_driver,age_band_of_driver,engine_capacity_cc,propulsion_code,age_of_vehicle,generic_make_model,driver_imd_decile,
-- driver_home_area_type,lsoa_of_driver

-- vehicle_types
-- code, label

CREATE TABLE accidents (
  accident_index BIGINT PRIMARY KEY NOT NULL,
  accident_year SMALLINT,
  accident_reference INT,
  location_easting_osgr INT,
  location_northing_osgr INT,
  longitude FLOAT,
  latitude FLOAT,
  police_force INT,
  accident_severity INT,
  number_of_vehicles INT,
  number_of_casualties INT,
  accident_date DATE,
  day_of_week INT,
  accident_time TIME,
  local_authority_district INT,
  local_authority_ons_district INT,
  local_authority_highway VARCHAR(50),
  first_road_class VARCHAR(50),
  first_road_number INT,
  road_type INT,
  speed_limit INT,
  junction_detail INT,
  junction_control INT,
  second_road_class INT,
  second_road_number INT,
  pedestrian_crossing_human_control INT,
  pedestrian_crossing_physical_facilities INT,
  light_conditions INT,
  weather_conditions INT,
  road_surface_conditions INT,
  special_conditions_at_site INT,
  carriageway_hazards INT,
  urban_or_rural_area INT,
  did_police_officer_attend_scene_of_accident INT,
  trunk_road_flag INT,
  lsoa_of_accident_location VARCHAR(50)
);

SELECT * FROM accidents;

CREATE TABLE casualties (
  accident_index INT NOT NULL,
  accident_year INT,
  accident_reference INT,
  vehicle_reference INT,
  casualty_reference INT,
  casualty_class INT,
  sex_of_casualty INT,
  age_of_casualty INT,
  age_band_of_casualty INT,
  casualty_severity INT,
  pedestrian_location INT,
  pedestrian_movement INT,
  car_passenger INT,
  bus_or_coach_passenger INT,
  pedestrian_road_maintenance_worker INT,
  casualty_type INT,
  casualty_home_area_type INT,
  casualty_imd_decile INT,
  lsoa_of_casualty VARCHAR(50),
  PRIMARY KEY (accident_index, accident_reference, vehicle_reference, casualty_reference),
  FOREIGN KEY (accident_index) REFERENCES accidents(accident_index) ON DELETE CASCADE
);


CREATE TABLE vehicles (
  accident_index INT NOT NULL,
  accident_year INT,
  accident_reference INT,
  vehicle_reference INT,
  vehicle_type INT,
  towing_and_articulation INT,
  vehicle_manoeuvre INT,
  vehicle_direction_from INT,
  vehicle_direction_to INT,
  vehicle_location_restricted_lane INT,
  junction_location INT,
  skidding_and_overturning INT,
  hit_object_in_carriageway INT,
  vehicle_leaving_carriageway INT,
  hit_object_off_carriageway INT,
  first_point_of_impact INT,
  vehicle_left_hand_drive INT,
  journey_purpose_of_driver INT,
  sex_of_driver INT,
  age_of_driver INT,
  age_band_of_driver INT,
  engine_capacity_cc INT,
  propulsion_code INT,
  age_of_vehicle INT,
  generic_make_model VARCHAR(50),
  driver_imd_decile INT,
  driver_home_area_type INT,
  lsoa_of_driver VARCHAR(9),
  PRIMARY KEY (accident_index, vehicle_reference, vehicle_type),
  FOREIGN KEY (accident_index) REFERENCES accidents(accident_index) ON DELETE CASCADE
);


CREATE TABLE vehicle_type (
    vehicle_code INT PRIMARY KEY NOT NULL,
    label VARCHAR(50)
);








