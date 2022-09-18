import React, {useEffect, useState} from 'react';
import {useHistory} from 'react-router-dom';
import API, {BASE_URL_DOWNLOAD} from '../../lib/API';
import '../../style/exploreVN.scss';

export default function ExploreAll() {
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
            <div className="wrapper__explore">
                <div className="container container__explore">
                    <h3 className="title">
                        khám phá việt nam
                    </h3>
                    <div className="row row__explore">
                        {items?.map((item, idx) => {
                            return (
                                <div className="col col__item" key={idx}>
                                    <div className="wrapper__image" onClick={() => {
                                        window.scrollTo({top: 0, behavior: 'smooth'});
                                        history.push({
                                            pathname: '/post-detail',
                                            state: item
                                        });
                                    }}>
                                        <img alt="" src={`${BASE_URL_DOWNLOAD}${item?.image}`}/>
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