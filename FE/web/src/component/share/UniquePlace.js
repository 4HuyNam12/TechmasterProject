import React, {useEffect, useState} from 'react';
import {useHistory} from 'react-router-dom';
import API, {BASE_URL_DOWNLOAD} from '../../lib/API';
import '../../style/UniquePlace.scss';

export default function UniquePlace() {
    const [items, setItems] = useState();
    useEffect(() => {
        search()
    }, [])
    let search = async () => {
        let path = `/customer/post/search/all`;
        let resp = await API.anonymousJSONGET(path);
        if (resp.ok) {
            let response = await resp.json();
            let arr = [];
            for (let i = 0; i < 5; i++) {
                arr.push(response?.data[i])
            }
            setItems(arr)
        }
    }

    let history = useHistory()
    return (
        <>
            <div className="wrapper__unique-place">
                <div className="container container__unique-place">
                    <h3 className="title">
                        Những địa điểm độc đáo
                    </h3>
                    <div className="row row__unique-place">

                        {items?.map((data, idx) => {
                            return (
                               
                                    <div className="col col__item" key={idx}>
                                        <div className="wrapper__item">
                                            <div className="image__blog" onClick={() =>{
                                                window.scrollTo({ top: 0, behavior: 'smooth' });
                                                history.push({
                                                pathname: '/post-detail',
                                                state: data
                                            })}}>
                                                <img alt="" src={`${BASE_URL_DOWNLOAD}${data?.image}`} />
                                            </div>
                                            <div className="content__blog">
                                                <h4 className="title">
                                                    {data?.title}
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                               
                            )
                        })}


                    </div>
                </div>
            </div>
        </>
    )
}