import React, {useEffect, useRef, useState} from 'react';
import Slider from "react-slick";
import {useHistory} from 'react-router-dom';
import API, {BASE_URL_DOWNLOAD} from '../../lib/API';
import '../../style/exploreVN.scss';

export default function ExploreVN() {
    const [items, setItems] = useState();
    const ref = useRef({});
    const next = () => {
        ref.current.slickNext();
    };
    const previous = () => {
        ref.current.slickPrev();
    };
    useEffect(() => {
        search()
    }, [])
    let search = async () => {
        let path = `/customer/post/search/all`;
        let resp = await API.anonymousJSONGET(path);
        if (resp.ok) {
            let response = await resp.json();
            let arr = [];
            let index =response?.data.length -1;
            while (index >= response?.data.length - 10) {
                arr.push(response?.data[index]);
                index--;
            }
            setItems(arr);
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
                    <div className="row ">
                        <div style={{ overflowX: 'hidden', position: 'relative' }}>
                            <div className="row" style={{ position: 'relative' }}>
                                <div onClick={() => previous()} style={{ position: 'absolute', cursor: 'pointer', width: 50, height: 25, top: '35%', left: '-2%', zIndex: 2 }}>
                                    <svg style={{ width: 24, height: 24 }} viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M15.41,16.58L10.83,12L15.41,7.41L14,6L8,12L14,18L15.41,16.58Z" />
                                    </svg>
                                </div>
                                <Slider ref={ref} slidesToScroll={1} slidesToShow={5} autoplay={true} autoplaySpeed={2000} >
                                    {items?.map((item, index) => {
                                        return (
                                            <div className="col col__item" key={index}
                                                 onClick={() => {
                                                     window.scrollTo({top: 0, behavior: 'smooth'});
                                                     history.push({
                                                         pathname: '/post-detail',
                                                         state: item
                                                     })
                                                 }}
                                            >
                                                <div className="wrapper__image">
                                                        <img alt="" src={`${BASE_URL_DOWNLOAD}${item?.image}`} />
                                                </div>
                                            </div>
                                        )
                                    })}
                                </Slider>
                                <div onClick={() => next()} style={{ zIndex: 2, cursor: 'pointer', position: 'absolute', top: '35%', display: "flex", justifyContent: 'flex-end', width: 50, height: 25, right: '-2%' }}>
                                    <svg style={{ width: 24, height: 24 }} viewBox="0 0 24 24" >
                                        <path fill="currentColor" d="M8.59,16.58L13.17,12L8.59,7.41L10,6L16,12L10,18L8.59,16.58Z" />
                                    </svg>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </>
    )
}