<?php

namespace SON\Http\Controllers\Api;

use Illuminate\Http\Request;
use SON\Http\Controllers\Controller;
use SON\Models\ComercioSub;
use SON\Models\Imagescompany;
use SON\Models\Trades;
use SON\Repositories\TradesRepository;


class TradesController extends Controller
{
    protected $repository;
    public function __construct(TradesRepository $tradeRepository)
    {
        $this->repository = $tradeRepository;
    }

    public function getAbstract(Request $request){
        $subCategory = $request->input('subCategory');
        $city = $request->input('city');

        $comercio_subcategories = ComercioSub::query();
        $comercio_subcategories->where('subcat_id',$subCategory);
        $comercio_subcategories->select('comercio_id');

        foreach ($comercio_subcategories->get()->toArray() as $key => $comercio_subcategory){
            $comercio_subcategoryIds[] = $comercio_subcategory['comercio_id'];
        }

        $trades = Trades::query();
        $trades->where('cities_id',$city);
        $trades->whereIn('id',$comercio_subcategoryIds);

        foreach ($trades->get() as $key => $trade){
            $tradeData[$key]['id'] = $trade->id;
            $tradeData[$key]['title'] = $trade->nome_empresa;
            $tradeData[$key]['logoPath'] = $trade->full_url;
        }
        return ['data' => $tradeData];
    }

    public function getTrade($tradeId){
        $trades = Trades::query();
        $trades->find($tradeId);

        $tradeImages = Imagescompany::query();
        $tradeImages->where('companies_id',$tradeId);

        foreach($tradeImages->get() as $tradeImage){
            $images [] = $tradeImage->getFullUrlAttribute();
        }

        foreach ($trades->get() as $key => $trade){
            $tradeData[$key]['id'] = $trade->id;
            $tradeData[$key]['nome_empresa'] = $trade->nome_empresa;
            $tradeData[$key]['tel'] = $trade->tel;
            $tradeData[$key]['cel'] = $this->deixarNumero($trade->cel);
            $tradeData[$key]['email'] = $trade->email;
            $tradeData[$key]['endereco'] = $trade->endereco;
            $tradeData[$key]['latitude'] = $trade->latitude;
            $tradeData[$key]['latitude'] = $trade->latitude;
            $tradeData[$key]['longitude'] = $trade->longitude;
            $tradeData[$key]['cep'] = $trade->cep;
            $tradeData[$key]['desc'] = $trade->desc;
            $tradeData[$key]['linkSite'] = $trade->linkSite;
            $tradeData[$key]['linkFace'] = $trade->linkFace;
            $tradeData[$key]['linkinstagram'] = $trade->linkinstagram;
            $tradeData[$key]['status'] = $trade->status;
            $tradeData[$key]['plano_id'] = $trade->plano_id;
            $tradeData[$key]['full_url'] = $trade->full_url;
        }

        return ['data' => $tradeData, 'imgs' => $images];
    }
    function deixarNumero($string){
        return preg_replace("/[^0-9]/", "", $string);
    }

}
