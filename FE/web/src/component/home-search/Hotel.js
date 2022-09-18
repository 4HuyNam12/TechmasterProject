import React, {useRef} from 'react';
import Slider from 'react-slick';
import {useHistory} from 'react-router-dom';
import {BASE_URL_DOWNLOAD} from '../../lib/API';

export default function Hotel({ data }) {
    const ref = useRef({});
    let history = useHistory()
    const next = () => {
        ref.current.slickNext();
    };

    const previous = () => {
        ref.current.slickPrev();
    };

    return (
        <div style={{ width: '100%', height: 300 }}>
            <div className="row row__search row__stay">
                <div className="col-3 col-item col__content">
                    <h4 className="title">
                        Khách sạn
                    </h4>
                    <p className="content">
                        Những địa điểm tham quan, hoạt động khám phá và trải nghiệm
                    </p>
                    <span onClick={() => {
                        history.push('/search-hotel')
                    }}
                        style={{ cursor: 'pointer' }}
                    >
                        Xem Tất Cả
                    </span>
                </div>
                {data?.length > 3 ?
                    <div className="col-9 row ">
                        <div style={{ overflowX: 'hidden', position: 'relative' }}>
                            <div className="row" style={{ position: 'relative' }}>
                                <div onClick={() => previous()} style={{ position: 'absolute', cursor: 'pointer', width: 50, height: 25, top: '35%', left: '-2%', zIndex: 2 }}>
                                    <svg style={{ width: 24, height: 24 }} viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M15.41,16.58L10.83,12L15.41,7.41L14,6L8,12L14,18L15.41,16.58Z" />
                                    </svg>
                                </div>
                                <Slider ref={ref} slidesToScroll={1} slidesToShow={3} >
                                    {data?.map((item, index) => {
                                        return (
                                            <div className=" col-item" key={index}
                                                onClick={() => {
                                                    localStorage.setItem("pageHeader","hotel")
                                                    history.push({
                                                        pathname: '/search-hotel-detail',
                                                        state: item?.slug
                                                    })
                                                }}
                                                
                                                style={{ cursor: 'pointer' }}
                                            >
                                                <div className="wrapper__item">
                                                    <div className="image">
                                                        <img alt="" src={`${BASE_URL_DOWNLOAD}${item?.image}`} />
                                                    </div>
                                                    <div className="content">
                                                        {item?.title}
                                                    </div>
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
                    :
                    <>
                        <div className="col-9">
                            {data?.map((item, index) => {
                                return (
                                    <div className="col-4 col-item" key={index}
                                    onClick={() => {
                                        localStorage.setItem("pageHeader","hotel")
                                        history.push({
                                            pathname: '/search-hotel-detail',
                                            state: item?.slug
                                        })
                                    }}
                                    
                                        style={{ cursor: 'pointer' }}
                                    >
                                        <div className="wrapper__item">
                                            <div className="image">
                                                <img alt="" src={`${BASE_URL_DOWNLOAD}${item?.image}`} />
                                            </div>
                                            <div className="content">
                                                {item?.title}
                                            </div>
                                        </div>
                                    </div>
                                )
                            })}
                        </div>
                    </>
                }

            </div>

        </div>
    )
}