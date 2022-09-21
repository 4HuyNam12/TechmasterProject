import React, {useEffect, useState} from 'react';
import slick3 from '../../image/slick/image 3.png';
import slick1 from '../../image/slick/image 1.png';
import slick4 from '../../image/slick/image 4.png';
import slick5 from '../../image/slick/image 5.png';
import slick2 from '../../image/slick/image 2.png';
import '../../style/home.scss';

export default function HomeSlick() {
    const [imag,setImg] = useState(slick1);
    let index = 0;
    const autoSetImg = () =>{
        setInterval(() =>{
            switch (index) {
                case 0: setImg(slick1);
                break;
                case 1:setImg(slick2);
                break;
                case 2:setImg(slick3);
                break;
                case 3:setImg(slick4);
                break;
                case 4:setImg(slick5);
                index=-1;
                break;
            }
            index++;
        },3000);
    }

    useEffect(()=>{
        autoSetImg();
    },[]);
    return (
        <>
            <div className="wrapper__slick container">
                <div className="row row__hero">
                    <div className="hero__image">
                        <div className="col-12 col__hero">
                            <img alt="a" src={imag} />
                        </div>
                    </div>
                </div>
                <div className="row row__slick">
                    <div className="slick__image">
                        <div className="col col-item">
                            <img alt="img1" src={slick1}
                            onClick={() => setImg(slick1)}
                            />
                        </div>
                        <div className="col col-item">
                            <img alt="img2" src={slick2}
                             onClick={() => setImg(slick2)}
                            />
                        </div>
                        <div className="col col-item">
                            <img alt="img3" src={slick3}
                             onClick={() => setImg(slick3)}
                            />
                        </div>
                        <div className="col col-item">
                            <img alt="img4" src={slick4}
                             onClick={() => setImg(slick4)}
                            />
                        </div>
                        <div className="col col-item">
                            <img alt="img5" src={slick5}
                             onClick={() => setImg(slick5)} />
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
}