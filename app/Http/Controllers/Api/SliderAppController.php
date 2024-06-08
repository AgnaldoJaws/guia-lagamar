<?php

namespace SON\Http\Controllers\Api;


use SON\Http\Controllers\Controller;
use SON\Models\SliderContent;

class SliderAppController extends Controller
{

    public function getSlider($area, $type, $cidade){

        $result = SliderContent::select('logoPath')
            ->where(['area_id' =>$area])
            ->where(['type_id' =>$type])
            ->where(['cities_id' =>$cidade])
            ->get();

        foreach ($result as $key => $value)
        {
            $res[$key]['full_url'] = $value->full_url;
        }
        return ['data' => $res];
    }

}
