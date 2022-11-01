import React, {useEffect} from 'react';


export default function Popup({isPopup, popupMessage, handleClosePopup}) {

    useEffect(() => {
        if (isPopup) document.getElementById("btnPopup").click();

    }, [isPopup]);
    return (
        <>

            <button id="btnPopup" type="button" class="btn btn-primary" data-toggle="modal" data-target="#popupModal"
                    hidden>
                Modal
            </button>

            <div class="modal fade" id="popupModal" tabindex="-1" role="dialog" aria-labelledby="popupModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div style={{width: "400px", height: "200px"}} class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="popupModalLabel">Notification</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                                    onClick={() => handleClosePopup()}>
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            {popupMessage}
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning" data-dismiss="modal"
                                    onClick={() => handleClosePopup()}>Close
                            </button>

                        </div>
                    </div>
                </div>
            </div>

        </>

    )
}