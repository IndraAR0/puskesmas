
                <div class="clearfix"></div>
            </div>
        </div>

    </div>
    <div class="modal fade" id="AssesmentModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true" >
    <div class="modal-dialog" style='width:80%'>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="">Riwayat assesment</h4>
            </div>
            <div class="modal-body">

                <table class="table table-bordered" id='assesment_datatable' style='width:100%'>
                    <thead>
                        <tr>
                            <th></th>
                            <th>No. Assesment</th>
                            <th>Tanggal</th>
                            <th>Keluhan utama</th>
                            <th>Dokter</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div>
<!-- /page content -->

<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->

@include('footer')
<script src="{{ asset('') }}js/registration/assesment/assesmentShowCtrl.js"></script>

