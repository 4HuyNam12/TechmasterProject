import React, {useEffect, useState} from 'react';
import API, {BASE_URL_DOWNLOAD} from '../../../lib/API';
import {typeRestaurant} from '../../../utils/amenities';
import ModalDetail from './ModalDetail';
import ModalUpdate from './ModalUpdate';
import ModalUploadMenu from './ModalUploadMenu';
// import ModalUploadGame from './ModalUploadGame';

export default function Item({ data, index, search }) {

    let typeRestaurantName = typeRestaurant.filter((item) => item.value == data?.restaurantType)?.[0]?.name;
    let [showUpdate, setShowUpdate] = useState(false);
    const handleShowUpdate = () => {
        setShowUpdate(true)
    }
    const handleCloseUpdate = () => {
        setShowUpdate(false)
    }
    let [isUpload, setIsUpload] = useState(false);
    const [restaurant, setRestaurant] = useState();

    useEffect(() => {
        fetchData()
    }, [])
    let fetchData = async () => {
        let path = `/restaurant/${data?.slug}`;
        let resp = await API.anonymousJSONGETHOTEL(path);
        if (resp.ok) {
            let response = await resp.json();
            console.log(response)
            setRestaurant(response?.data)
        }
    }

    let handleUpload = () => {
        setIsUpload(!isUpload)
    }
    let [showDetail, setShowDetail] = useState(false);
    const handleShowDetail = () => {
        setShowDetail(true)
    }
    const handleCloseDetail = () => {
        setShowDetail(false)
    }
    let [show, setShow] = useState(false);
    const handleShow = () => {
        setShow(true)
    }
    const handleClose = () => {
        setShow(false)
    }
    let deleteItem = async () => {
        let message = window.confirm("Bạn chắc chắn muốn xóa nhà hàng này?");
        if (message) {
            let path = `/partner/restaurant/delete/${data?.code}`;
            let resp = await API.authorizedJSONPost(path);
            if (resp.ok) {
                search()
            }
        }

    }
    
    return (
        <>
            <tr >
                <td className="text-center" style={{ verticalAlign: 'middle' }}>{index}</td>
                <td className="text-center" style={{ verticalAlign: 'middle' }}>
                    {data?.title}
                </td>
                <td className="text-center" style={{ verticalAlign: 'middle' }}>{typeRestaurantName}</td>
                <td className="text-center" style={{ verticalAlign: 'middle' }}>{data?.address}</td>
                <td><img src={`${BASE_URL_DOWNLOAD}${data?.image}`} style={{ width: 150, height: 'auto', borderRadius: 25, objectFit: 'contain' }} /></td>


                <ModalUpdate handleClose={handleCloseUpdate} handleShow={handleShowUpdate} show={showUpdate} data={data} images={restaurant?.images} search={search}
                    restaurantCode={data?.code}
                    feature={data?.feature}
                />
                <td style={{ verticalAlign: 'middle' }} className="btn__setting">
                    <button
                        onClick={() => setShowDetail(true)}
                    >
                        <svg style={{ width: 24, height: 24 }} viewBox="0 0 24 24" color="#dc3545">
                            <path fill="currentColor" d="M12,9A3,3 0 0,0 9,12A3,3 0 0,0 12,15A3,3 0 0,0 15,12A3,3 0 0,0 12,9M12,17A5,5 0 0,1 7,12A5,5 0 0,1 12,7A5,5 0 0,1 17,12A5,5 0 0,1 12,17M12,4.5C7,4.5 2.73,7.61 1,12C2.73,16.39 7,19.5 12,19.5C17,19.5 21.27,16.39 23,12C21.27,7.61 17,4.5 12,4.5Z" />
                        </svg>
                    </button>
                    <ModalDetail handleClose={handleCloseDetail} handleShow={handleShowDetail} show={showDetail} slug={data?.slug} restaurantType={data?.restaurantType}
                        feature={data?.feature}
                        isUpload={isUpload} />
                    <ModalUploadMenu search={search} handleClose={handleClose} handleShow={handleShow} show={show} restaurantCode={data?.code} handleUpload={handleUpload} />

                    <button
                        onClick={handleShowUpdate}
                    >
                        <svg style={{ width: 24, height: 24 }} viewBox="0 0 24 24" color="#00a6d9">
                            <path fill="currentColor" d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12H20A8,8 0 0,1 12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4V2M18.78,3C18.61,3 18.43,3.07 18.3,3.2L17.08,4.41L19.58,6.91L20.8,5.7C21.06,5.44 21.06,5 20.8,4.75L19.25,3.2C19.12,3.07 18.95,3 18.78,3M16.37,5.12L9,12.5V15H11.5L18.87,7.62L16.37,5.12Z" />
                        </svg>
                    </button>
                    <button
                        onClick={deleteItem}
                    >
                        <svg style={{ width: 24, height: 24 }} viewBox="0 0 24 24">
                            <path fill="currentColor" d="M9,3V4H4V6H5V19A2,2 0 0,0 7,21H17A2,2 0 0,0 19,19V6H20V4H15V3H9M7,6H17V19H7V6M9,8V17H11V8H9M13,8V17H15V8H13Z" />
                        </svg>
                    </button>
                    <button
                        onClick={handleShow}
                        style={{ border: '1px solid #333' }}
                    >
                        Thêm món
                    </button>
                </td>
            </tr>

        </>
    )
}