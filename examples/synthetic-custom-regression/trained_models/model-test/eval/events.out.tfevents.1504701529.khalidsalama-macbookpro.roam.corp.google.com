       ЃK"	  @ћkжAbrain.Event:2}ЩОюjP     яжз!	:JћkжA"н 	

global_step/Initializer/zerosConst*
dtype0	*
_class
loc:@global_step*
value	B	 R *
_output_shapes
: 

global_step
VariableV2*
	container *
_output_shapes
: *
dtype0	*
shape: *
_class
loc:@global_step*
shared_name 
В
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
validate_shape(*
_class
loc:@global_step*
use_locking(*
T0	*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
_class
loc:@global_step*
T0	*
_output_shapes
: 
s
input_producer/ConstConst*
dtype0*+
value"B B../data/valid-data.csv*
_output_shapes
:
U
input_producer/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
Z
input_producer/Greater/yConst*
dtype0*
value	B : *
_output_shapes
: 
q
input_producer/GreaterGreaterinput_producer/Sizeinput_producer/Greater/y*
T0*
_output_shapes
: 

input_producer/Assert/ConstConst*
dtype0*G
value>B< B6string_input_producer requires a non-null input tensor*
_output_shapes
: 

#input_producer/Assert/Assert/data_0Const*
dtype0*G
value>B< B6string_input_producer requires a non-null input tensor*
_output_shapes
: 

input_producer/Assert/AssertAssertinput_producer/Greater#input_producer/Assert/Assert/data_0*
	summarize*

T
2
}
input_producer/IdentityIdentityinput_producer/Const^input_producer/Assert/Assert*
T0*
_output_shapes
:

input_producerFIFOQueueV2*
capacity *
_output_shapes
: *
shapes
: *
component_types
2*
	container *
shared_name 

)input_producer/input_producer_EnqueueManyQueueEnqueueManyV2input_producerinput_producer/Identity*

timeout_msџџџџџџџџџ*
Tcomponents
2
b
#input_producer/input_producer_CloseQueueCloseV2input_producer*
cancel_pending_enqueues( 
d
%input_producer/input_producer_Close_1QueueCloseV2input_producer*
cancel_pending_enqueues(
Y
"input_producer/input_producer_SizeQueueSizeV2input_producer*
_output_shapes
: 
o
input_producer/CastCast"input_producer/input_producer_Size*

DstT0*

SrcT0*
_output_shapes
: 
Y
input_producer/mul/yConst*
dtype0*
valueB
 *   =*
_output_shapes
: 
e
input_producer/mulMulinput_producer/Castinput_producer/mul/y*
T0*
_output_shapes
: 

'input_producer/fraction_of_32_full/tagsConst*
dtype0*3
value*B( B"input_producer/fraction_of_32_full*
_output_shapes
: 

"input_producer/fraction_of_32_fullScalarSummary'input_producer/fraction_of_32_full/tagsinput_producer/mul*
T0*
_output_shapes
: 
y
TextLineReaderV2TextLineReaderV2*
	container *
shared_name *
skip_header_lines *
_output_shapes
: 
_
ReaderReadUpToV2/num_recordsConst*
dtype0	*
value
B	 Rє*
_output_shapes
: 

ReaderReadUpToV2ReaderReadUpToV2TextLineReaderV2input_producerReaderReadUpToV2/num_records*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ
Y
ExpandDims/dimConst*
dtype0*
valueB :
џџџџџџџџџ*
_output_shapes
: 
z

ExpandDims
ExpandDimsReaderReadUpToV2:1ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:џџџџџџџџџ
h
DecodeCSV/record_defaults_0Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_1Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_2Const*
dtype0*
valueB*    *
_output_shapes
:
d
DecodeCSV/record_defaults_3Const*
dtype0*
valueB
B *
_output_shapes
:
d
DecodeCSV/record_defaults_4Const*
dtype0*
valueB
B *
_output_shapes
:
h
DecodeCSV/record_defaults_5Const*
dtype0*
valueB*    *
_output_shapes
:

	DecodeCSV	DecodeCSV
ExpandDimsDecodeCSV/record_defaults_0DecodeCSV/record_defaults_1DecodeCSV/record_defaults_2DecodeCSV/record_defaults_3DecodeCSV/record_defaults_4DecodeCSV/record_defaults_5*
OUT_TYPE

2*
field_delim,*
_output_shapest
r:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
M
batch/ConstConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
Ж
batch/fifo_queueFIFOQueueV2*
capacity'*
_output_shapes
: **
shapes 
:::::*
component_types	
2*
	container *
shared_name 
К
batch/fifo_queue_EnqueueManyQueueEnqueueManyV2batch/fifo_queueDecodeCSV:3DecodeCSV:4DecodeCSV:5DecodeCSV:1DecodeCSV:2*

timeout_msџџџџџџџџџ*
Tcomponents	
2
W
batch/fifo_queue_CloseQueueCloseV2batch/fifo_queue*
cancel_pending_enqueues( 
Y
batch/fifo_queue_Close_1QueueCloseV2batch/fifo_queue*
cancel_pending_enqueues(
N
batch/fifo_queue_SizeQueueSizeV2batch/fifo_queue*
_output_shapes
: 
Y

batch/CastCastbatch/fifo_queue_Size*

DstT0*

SrcT0*
_output_shapes
: 
P
batch/mul/yConst*
dtype0*
valueB
 *ЗQ9*
_output_shapes
: 
J
	batch/mulMul
batch/Castbatch/mul/y*
T0*
_output_shapes
: 
|
 batch/fraction_of_5000_full/tagsConst*
dtype0*,
value#B! Bbatch/fraction_of_5000_full*
_output_shapes
: 
z
batch/fraction_of_5000_fullScalarSummary batch/fraction_of_5000_full/tags	batch/mul*
T0*
_output_shapes
: 
J
batch/nConst*
dtype0*
value
B :є*
_output_shapes
: 
ф
batchQueueDequeueUpToV2batch/fifo_queuebatch/n*

timeout_msџџџџџџџџџ*
component_types	
2*s
_output_shapesa
_:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ

Pdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/ShapeShapebatch*
out_type0*
T0*
_output_shapes
:
н
Odnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/CastCastPdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:

Sdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
э
Sdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/NotEqualNotEqualbatchSdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:џџџџџџџџџ
з
Pdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/WhereWhereSdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ
Ћ
Xdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
њ
Rdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/ReshapeReshapebatchXdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Reshape/shape*#
_output_shapes
:џџџџџџџџџ*
T0*
Tshape0
Џ
^dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Б
`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Б
`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
§
Xdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_sliceStridedSlicePdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Where^dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stack`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stack_1`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Б
`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Г
bdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Г
bdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:

Zdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1StridedSlicePdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Where`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stackbdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stack_1bdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
ч
Rdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/unstackUnpackOdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Cast*	
num*
T0	*
_output_shapes
: : *

axis 
ш
Pdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/stackPackTdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/unstack:1*
N*
T0	*
_output_shapes
:*

axis 
Е
Ndnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/MulMulZdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1Pdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/stack*
T0	*'
_output_shapes
:џџџџџџџџџ
Њ
`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
в
Ndnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/SumSumNdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Mul`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Sum/reduction_indices*#
_output_shapes
:џџџџџџџџџ*
T0	*
	keep_dims( *

Tidx0
­
Ndnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/AddAddXdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_sliceNdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Sum*
T0	*#
_output_shapes
:џџџџџџџџџ
л
Qdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/GatherGatherRdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/ReshapeNdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ
 
Mdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/ConstConst*
dtype0*
valueBBax01Bax02*
_output_shapes
:

Ldnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 

Sdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 

Sdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
і
Mdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/rangeRangeSdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/range/startLdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/SizeSdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/range/delta*

Tidx0*
_output_shapes
:
к
Odnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/ToInt64CastMdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
о
Rdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
Ѓ
Xdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 
ў
]dnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_table/table_initInitializeTableV2Rdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_tableMdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/ConstOdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/ToInt64*

Tkey0*

Tval0	

Ldnn/input_from_feature_columns/input_layer/alpha_indicator/hash_table_LookupLookupTableFindV2Rdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_tableQdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/GatherXdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:џџџџџџџџџ
Ё
Vdnn/input_from_feature_columns/input_layer/alpha_indicator/SparseToDense/default_valueConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 

Hdnn/input_from_feature_columns/input_layer/alpha_indicator/SparseToDenseSparseToDensePdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/WhereOdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/CastLdnn/input_from_feature_columns/input_layer/alpha_indicator/hash_table_LookupVdnn/input_from_feature_columns/input_layer/alpha_indicator/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0	*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ

Hdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

Jdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/Const_1Const*
dtype0*
valueB
 *    *
_output_shapes
: 

Hdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/depthConst*
dtype0*
value	B :*
_output_shapes
: 

Kdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/on_valueConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

Ldnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/off_valueConst*
dtype0*
valueB
 *    *
_output_shapes
: 
й
Bdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hotOneHotHdnn/input_from_feature_columns/input_layer/alpha_indicator/SparseToDenseHdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/depthKdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/on_valueLdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/off_value*
axisџџџџџџџџџ*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ*
TI0	

Pdnn/input_from_feature_columns/input_layer/alpha_indicator/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
Њ
>dnn/input_from_feature_columns/input_layer/alpha_indicator/SumSumBdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hotPdnn/input_from_feature_columns/input_layer/alpha_indicator/Sum/reduction_indices*'
_output_shapes
:џџџџџџџџџ*
T0*
	keep_dims( *

Tidx0
О
@dnn/input_from_feature_columns/input_layer/alpha_indicator/ShapeShape>dnn/input_from_feature_columns/input_layer/alpha_indicator/Sum*
out_type0*
T0*
_output_shapes
:

Ndnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Pdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Pdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
 
Hdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_sliceStridedSlice@dnn/input_from_feature_columns/input_layer/alpha_indicator/ShapeNdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stackPdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stack_1Pdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask

Jdnn/input_from_feature_columns/input_layer/alpha_indicator/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
 
Hdnn/input_from_feature_columns/input_layer/alpha_indicator/Reshape/shapePackHdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_sliceJdnn/input_from_feature_columns/input_layer/alpha_indicator/Reshape/shape/1*
N*
T0*
_output_shapes
:*

axis 

Bdnn/input_from_feature_columns/input_layer/alpha_indicator/ReshapeReshape>dnn/input_from_feature_columns/input_layer/alpha_indicator/SumHdnn/input_from_feature_columns/input_layer/alpha_indicator/Reshape/shape*'
_output_shapes
:џџџџџџџџџ*
T0*
Tshape0

Odnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/ShapeShapebatch:1*
out_type0*
T0*
_output_shapes
:
л
Ndnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/CastCastOdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:

Rdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
э
Rdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/NotEqualNotEqualbatch:1Rdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:џџџџџџџџџ
е
Odnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/WhereWhereRdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ
Њ
Wdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
њ
Qdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/ReshapeReshapebatch:1Wdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Reshape/shape*#
_output_shapes
:џџџџџџџџџ*
T0*
Tshape0
Ў
]dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
А
_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
А
_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ј
Wdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_sliceStridedSliceOdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Where]dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stack_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stack_1_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
А
_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
В
adnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
В
adnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:

Ydnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1StridedSliceOdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Where_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stackadnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stack_1adnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
х
Qdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/unstackUnpackNdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Cast*	
num*
T0	*
_output_shapes
: : *

axis 
ц
Odnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/stackPackSdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/unstack:1*
N*
T0	*
_output_shapes
:*

axis 
В
Mdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/MulMulYdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1Odnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/stack*
T0	*'
_output_shapes
:џџџџџџџџџ
Љ
_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
Я
Mdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/SumSumMdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Mul_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Sum/reduction_indices*#
_output_shapes
:џџџџџџџџџ*
T0	*
	keep_dims( *

Tidx0
Њ
Mdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/AddAddWdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_sliceMdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Sum*
T0	*#
_output_shapes
:џџџџџџџџџ
и
Pdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/GatherGatherQdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/ReshapeMdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ

Kdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/ConstConst*
dtype0*
valueBBbx01Bbx02*
_output_shapes
:

Jdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 

Qdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 

Qdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
ю
Kdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/rangeRangeQdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/range/startJdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/SizeQdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/range/delta*

Tidx0*
_output_shapes
:
ж
Mdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/ToInt64CastKdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
м
Pdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
Ё
Vdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 
і
[dnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_table/table_initInitializeTableV2Pdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_tableKdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/ConstMdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/ToInt64*

Tkey0*

Tval0	

Kdnn/input_from_feature_columns/input_layer/beta_indicator/hash_table_LookupLookupTableFindV2Pdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_tablePdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/GatherVdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:џџџџџџџџџ
 
Udnn/input_from_feature_columns/input_layer/beta_indicator/SparseToDense/default_valueConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 

Gdnn/input_from_feature_columns/input_layer/beta_indicator/SparseToDenseSparseToDenseOdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/WhereNdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/CastKdnn/input_from_feature_columns/input_layer/beta_indicator/hash_table_LookupUdnn/input_from_feature_columns/input_layer/beta_indicator/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0	*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ

Gdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

Idnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/Const_1Const*
dtype0*
valueB
 *    *
_output_shapes
: 

Gdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/depthConst*
dtype0*
value	B :*
_output_shapes
: 

Jdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/on_valueConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

Kdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/off_valueConst*
dtype0*
valueB
 *    *
_output_shapes
: 
д
Adnn/input_from_feature_columns/input_layer/beta_indicator/one_hotOneHotGdnn/input_from_feature_columns/input_layer/beta_indicator/SparseToDenseGdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/depthJdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/on_valueKdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/off_value*
axisџџџџџџџџџ*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ*
TI0	

Odnn/input_from_feature_columns/input_layer/beta_indicator/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
Ї
=dnn/input_from_feature_columns/input_layer/beta_indicator/SumSumAdnn/input_from_feature_columns/input_layer/beta_indicator/one_hotOdnn/input_from_feature_columns/input_layer/beta_indicator/Sum/reduction_indices*'
_output_shapes
:џџџџџџџџџ*
T0*
	keep_dims( *

Tidx0
М
?dnn/input_from_feature_columns/input_layer/beta_indicator/ShapeShape=dnn/input_from_feature_columns/input_layer/beta_indicator/Sum*
out_type0*
T0*
_output_shapes
:

Mdnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Odnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Odnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

Gdnn/input_from_feature_columns/input_layer/beta_indicator/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/beta_indicator/ShapeMdnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stackOdnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stack_1Odnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask

Idnn/input_from_feature_columns/input_layer/beta_indicator/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 

Gdnn/input_from_feature_columns/input_layer/beta_indicator/Reshape/shapePackGdnn/input_from_feature_columns/input_layer/beta_indicator/strided_sliceIdnn/input_from_feature_columns/input_layer/beta_indicator/Reshape/shape/1*
N*
T0*
_output_shapes
:*

axis 

Adnn/input_from_feature_columns/input_layer/beta_indicator/ReshapeReshape=dnn/input_from_feature_columns/input_layer/beta_indicator/SumGdnn/input_from_feature_columns/input_layer/beta_indicator/Reshape/shape*'
_output_shapes
:џџџџџџџџџ*
T0*
Tshape0
y
2dnn/input_from_feature_columns/input_layer/x/ShapeShapebatch:3*
out_type0*
T0*
_output_shapes
:

@dnn/input_from_feature_columns/input_layer/x/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Bdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Bdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
к
:dnn/input_from_feature_columns/input_layer/x/strided_sliceStridedSlice2dnn/input_from_feature_columns/input_layer/x/Shape@dnn/input_from_feature_columns/input_layer/x/strided_slice/stackBdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_1Bdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
~
<dnn/input_from_feature_columns/input_layer/x/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
і
:dnn/input_from_feature_columns/input_layer/x/Reshape/shapePack:dnn/input_from_feature_columns/input_layer/x/strided_slice<dnn/input_from_feature_columns/input_layer/x/Reshape/shape/1*
N*
T0*
_output_shapes
:*

axis 
Ф
4dnn/input_from_feature_columns/input_layer/x/ReshapeReshapebatch:3:dnn/input_from_feature_columns/input_layer/x/Reshape/shape*'
_output_shapes
:џџџџџџџџџ*
T0*
Tshape0
y
2dnn/input_from_feature_columns/input_layer/y/ShapeShapebatch:4*
out_type0*
T0*
_output_shapes
:

@dnn/input_from_feature_columns/input_layer/y/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Bdnn/input_from_feature_columns/input_layer/y/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Bdnn/input_from_feature_columns/input_layer/y/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
к
:dnn/input_from_feature_columns/input_layer/y/strided_sliceStridedSlice2dnn/input_from_feature_columns/input_layer/y/Shape@dnn/input_from_feature_columns/input_layer/y/strided_slice/stackBdnn/input_from_feature_columns/input_layer/y/strided_slice/stack_1Bdnn/input_from_feature_columns/input_layer/y/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
~
<dnn/input_from_feature_columns/input_layer/y/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
і
:dnn/input_from_feature_columns/input_layer/y/Reshape/shapePack:dnn/input_from_feature_columns/input_layer/y/strided_slice<dnn/input_from_feature_columns/input_layer/y/Reshape/shape/1*
N*
T0*
_output_shapes
:*

axis 
Ф
4dnn/input_from_feature_columns/input_layer/y/ReshapeReshapebatch:4:dnn/input_from_feature_columns/input_layer/y/Reshape/shape*'
_output_shapes
:џџџџџџџџџ*
T0*
Tshape0
x
6dnn/input_from_feature_columns/input_layer/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
Џ
1dnn/input_from_feature_columns/input_layer/concatConcatV2Bdnn/input_from_feature_columns/input_layer/alpha_indicator/ReshapeAdnn/input_from_feature_columns/input_layer/beta_indicator/Reshape4dnn/input_from_feature_columns/input_layer/x/Reshape4dnn/input_from_feature_columns/input_layer/y/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*
N*

Tidx0*'
_output_shapes
:џџџџџџџџџ*
T0
Ч
Adnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB"      *
_output_shapes
:
Й
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/minConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB
 *ЃЎXО*
_output_shapes
: 
Й
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB
 *ЃЎX>*
_output_shapes
: 
Ђ
Idnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shape*
_output_shapes
:	*
dtype0*
seed2 *

seed *
T0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0

?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes
: 
Б
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/sub*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes
:	
Ѓ
;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes
:	
Ы
 dnn/hiddenlayer_0/weights/part_0
VariableV2*
	container *
_output_shapes
:	*
dtype0*
shape:	*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
shared_name 

'dnn/hiddenlayer_0/weights/part_0/AssignAssign dnn/hiddenlayer_0/weights/part_0;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
use_locking(*
T0*
_output_shapes
:	
В
%dnn/hiddenlayer_0/weights/part_0/readIdentity dnn/hiddenlayer_0/weights/part_0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes
:	
Д
1dnn/hiddenlayer_0/biases/part_0/Initializer/zerosConst*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
valueB*    *
_output_shapes	
:
С
dnn/hiddenlayer_0/biases/part_0
VariableV2*
	container *
_output_shapes	
:*
dtype0*
shape:*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
shared_name 

&dnn/hiddenlayer_0/biases/part_0/AssignAssigndnn/hiddenlayer_0/biases/part_01dnn/hiddenlayer_0/biases/part_0/Initializer/zeros*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
use_locking(*
T0*
_output_shapes	
:
Ћ
$dnn/hiddenlayer_0/biases/part_0/readIdentitydnn/hiddenlayer_0/biases/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
T0*
_output_shapes	
:
v
dnn/hiddenlayer_0/weightsIdentity%dnn/hiddenlayer_0/weights/part_0/read*
T0*
_output_shapes
:	
Щ
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/weights*
transpose_b( *
transpose_a( *
T0*(
_output_shapes
:џџџџџџџџџ
p
dnn/hiddenlayer_0/biasesIdentity$dnn/hiddenlayer_0/biases/part_0/read*
T0*
_output_shapes	
:
Ђ
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/biases*(
_output_shapes
:џџџџџџџџџ*
T0*
data_formatNHWC
z
$dnn/hiddenlayer_0/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*(
_output_shapes
:џџџџџџџџџ
[
dnn/zero_fraction/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 

dnn/zero_fraction/EqualEqual$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*(
_output_shapes
:џџџџџџџџџ
y
dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*

DstT0*

SrcT0
*(
_output_shapes
:џџџџџџџџџ
h
dnn/zero_fraction/ConstConst*
dtype0*
valueB"       *
_output_shapes
:

dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
 
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*
dtype0*>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
_output_shapes
: 
Ћ
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_0/activation/tagConst*
dtype0*1
value(B& B dnn/dnn/hiddenlayer_0/activation*
_output_shapes
: 
Ё
 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tag$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes
: 
Ч
Adnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB"   @   *
_output_shapes
:
Й
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/minConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB
 *ѓ5О*
_output_shapes
: 
Й
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB
 *ѓ5>*
_output_shapes
: 
Ђ
Idnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shape*
_output_shapes
:	@*
dtype0*
seed2 *

seed *
T0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0

?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes
: 
Б
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/sub*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes
:	@
Ѓ
;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes
:	@
Ы
 dnn/hiddenlayer_1/weights/part_0
VariableV2*
	container *
_output_shapes
:	@*
dtype0*
shape:	@*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
shared_name 

'dnn/hiddenlayer_1/weights/part_0/AssignAssign dnn/hiddenlayer_1/weights/part_0;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
use_locking(*
T0*
_output_shapes
:	@
В
%dnn/hiddenlayer_1/weights/part_0/readIdentity dnn/hiddenlayer_1/weights/part_0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes
:	@
В
1dnn/hiddenlayer_1/biases/part_0/Initializer/zerosConst*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
valueB@*    *
_output_shapes
:@
П
dnn/hiddenlayer_1/biases/part_0
VariableV2*
	container *
_output_shapes
:@*
dtype0*
shape:@*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
shared_name 

&dnn/hiddenlayer_1/biases/part_0/AssignAssigndnn/hiddenlayer_1/biases/part_01dnn/hiddenlayer_1/biases/part_0/Initializer/zeros*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
use_locking(*
T0*
_output_shapes
:@
Њ
$dnn/hiddenlayer_1/biases/part_0/readIdentitydnn/hiddenlayer_1/biases/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
T0*
_output_shapes
:@
v
dnn/hiddenlayer_1/weightsIdentity%dnn/hiddenlayer_1/weights/part_0/read*
T0*
_output_shapes
:	@
Л
dnn/hiddenlayer_1/MatMulMatMul$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/hiddenlayer_1/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:џџџџџџџџџ@
o
dnn/hiddenlayer_1/biasesIdentity$dnn/hiddenlayer_1/biases/part_0/read*
T0*
_output_shapes
:@
Ё
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/biases*'
_output_shapes
:џџџџџџџџџ@*
T0*
data_formatNHWC
y
$dnn/hiddenlayer_1/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*'
_output_shapes
:џџџџџџџџџ@
]
dnn/zero_fraction_1/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 

dnn/zero_fraction_1/EqualEqual$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/zero_fraction_1/zero*
T0*'
_output_shapes
:џџџџџџџџџ@
|
dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*

DstT0*

SrcT0
*'
_output_shapes
:џџџџџџџџџ@
j
dnn/zero_fraction_1/ConstConst*
dtype0*
valueB"       *
_output_shapes
:

dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
 
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*
dtype0*>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values*
_output_shapes
: 
­
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_1/activation/tagConst*
dtype0*1
value(B& B dnn/dnn/hiddenlayer_1/activation*
_output_shapes
: 
Ё
 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tag$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes
: 
Ч
Adnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
valueB"@       *
_output_shapes
:
Й
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/minConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
valueB
 *  О*
_output_shapes
: 
Й
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
valueB
 *  >*
_output_shapes
: 
Ё
Idnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shape*
_output_shapes

:@ *
dtype0*
seed2 *

seed *
T0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0

?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes
: 
А
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/sub*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes

:@ 
Ђ
;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes

:@ 
Щ
 dnn/hiddenlayer_2/weights/part_0
VariableV2*
	container *
_output_shapes

:@ *
dtype0*
shape
:@ *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
shared_name 

'dnn/hiddenlayer_2/weights/part_0/AssignAssign dnn/hiddenlayer_2/weights/part_0;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
use_locking(*
T0*
_output_shapes

:@ 
Б
%dnn/hiddenlayer_2/weights/part_0/readIdentity dnn/hiddenlayer_2/weights/part_0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes

:@ 
В
1dnn/hiddenlayer_2/biases/part_0/Initializer/zerosConst*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
valueB *    *
_output_shapes
: 
П
dnn/hiddenlayer_2/biases/part_0
VariableV2*
	container *
_output_shapes
: *
dtype0*
shape: *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
shared_name 

&dnn/hiddenlayer_2/biases/part_0/AssignAssigndnn/hiddenlayer_2/biases/part_01dnn/hiddenlayer_2/biases/part_0/Initializer/zeros*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
use_locking(*
T0*
_output_shapes
: 
Њ
$dnn/hiddenlayer_2/biases/part_0/readIdentitydnn/hiddenlayer_2/biases/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
T0*
_output_shapes
: 
u
dnn/hiddenlayer_2/weightsIdentity%dnn/hiddenlayer_2/weights/part_0/read*
T0*
_output_shapes

:@ 
Л
dnn/hiddenlayer_2/MatMulMatMul$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/hiddenlayer_2/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:џџџџџџџџџ 
o
dnn/hiddenlayer_2/biasesIdentity$dnn/hiddenlayer_2/biases/part_0/read*
T0*
_output_shapes
: 
Ё
dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/biases*'
_output_shapes
:џџџџџџџџџ *
T0*
data_formatNHWC
y
$dnn/hiddenlayer_2/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*'
_output_shapes
:џџџџџџџџџ 
]
dnn/zero_fraction_2/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 

dnn/zero_fraction_2/EqualEqual$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/zero_fraction_2/zero*
T0*'
_output_shapes
:џџџџџџџџџ 
|
dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

DstT0*

SrcT0
*'
_output_shapes
:џџџџџџџџџ 
j
dnn/zero_fraction_2/ConstConst*
dtype0*
valueB"       *
_output_shapes
:

dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
 
2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsConst*
dtype0*>
value5B3 B-dnn/dnn/hiddenlayer_2/fraction_of_zero_values*
_output_shapes
: 
­
-dnn/dnn/hiddenlayer_2/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_2/activation/tagConst*
dtype0*1
value(B& B dnn/dnn/hiddenlayer_2/activation*
_output_shapes
: 
Ё
 dnn/dnn/hiddenlayer_2/activationHistogramSummary$dnn/dnn/hiddenlayer_2/activation/tag$dnn/hiddenlayer_2/hiddenlayer_2/Relu*
T0*
_output_shapes
: 
Й
:dnn/logits/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB"       *
_output_shapes
:
Ћ
8dnn/logits/weights/part_0/Initializer/random_uniform/minConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB
 *JQкО*
_output_shapes
: 
Ћ
8dnn/logits/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB
 *JQк>*
_output_shapes
: 

Bdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniform:dnn/logits/weights/part_0/Initializer/random_uniform/shape*
_output_shapes

: *
dtype0*
seed2 *

seed *
T0*,
_class"
 loc:@dnn/logits/weights/part_0

8dnn/logits/weights/part_0/Initializer/random_uniform/subSub8dnn/logits/weights/part_0/Initializer/random_uniform/max8dnn/logits/weights/part_0/Initializer/random_uniform/min*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes
: 

8dnn/logits/weights/part_0/Initializer/random_uniform/mulMulBdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniform8dnn/logits/weights/part_0/Initializer/random_uniform/sub*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

: 

4dnn/logits/weights/part_0/Initializer/random_uniformAdd8dnn/logits/weights/part_0/Initializer/random_uniform/mul8dnn/logits/weights/part_0/Initializer/random_uniform/min*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

: 
Л
dnn/logits/weights/part_0
VariableV2*
	container *
_output_shapes

: *
dtype0*
shape
: *,
_class"
 loc:@dnn/logits/weights/part_0*
shared_name 
ћ
 dnn/logits/weights/part_0/AssignAssigndnn/logits/weights/part_04dnn/logits/weights/part_0/Initializer/random_uniform*
validate_shape(*,
_class"
 loc:@dnn/logits/weights/part_0*
use_locking(*
T0*
_output_shapes

: 

dnn/logits/weights/part_0/readIdentitydnn/logits/weights/part_0*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

: 
Є
*dnn/logits/biases/part_0/Initializer/zerosConst*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
valueB*    *
_output_shapes
:
Б
dnn/logits/biases/part_0
VariableV2*
	container *
_output_shapes
:*
dtype0*
shape:*+
_class!
loc:@dnn/logits/biases/part_0*
shared_name 
ъ
dnn/logits/biases/part_0/AssignAssigndnn/logits/biases/part_0*dnn/logits/biases/part_0/Initializer/zeros*
validate_shape(*+
_class!
loc:@dnn/logits/biases/part_0*
use_locking(*
T0*
_output_shapes
:

dnn/logits/biases/part_0/readIdentitydnn/logits/biases/part_0*+
_class!
loc:@dnn/logits/biases/part_0*
T0*
_output_shapes
:
g
dnn/logits/weightsIdentitydnn/logits/weights/part_0/read*
T0*
_output_shapes

: 
­
dnn/logits/MatMulMatMul$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/logits/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:џџџџџџџџџ
a
dnn/logits/biasesIdentitydnn/logits/biases/part_0/read*
T0*
_output_shapes
:

dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/biases*'
_output_shapes
:џџџџџџџџџ*
T0*
data_formatNHWC
]
dnn/zero_fraction_3/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 

dnn/zero_fraction_3/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_3/zero*
T0*'
_output_shapes
:џџџџџџџџџ
|
dnn/zero_fraction_3/CastCastdnn/zero_fraction_3/Equal*

DstT0*

SrcT0
*'
_output_shapes
:џџџџџџџџџ
j
dnn/zero_fraction_3/ConstConst*
dtype0*
valueB"       *
_output_shapes
:

dnn/zero_fraction_3/MeanMeandnn/zero_fraction_3/Castdnn/zero_fraction_3/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0

+dnn/dnn/logits/fraction_of_zero_values/tagsConst*
dtype0*7
value.B, B&dnn/dnn/logits/fraction_of_zero_values*
_output_shapes
: 

&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_3/Mean*
T0*
_output_shapes
: 
w
dnn/dnn/logits/activation/tagConst*
dtype0**
value!B Bdnn/dnn/logits/activation*
_output_shapes
: 

dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
T0*
_output_shapes
: 
t
/linear/linear_model/alpha/to_sparse_input/ShapeShapebatch*
out_type0*
T0*
_output_shapes
:

.linear/linear_model/alpha/to_sparse_input/CastCast/linear/linear_model/alpha/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
s
2linear/linear_model/alpha/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
Ћ
2linear/linear_model/alpha/to_sparse_input/NotEqualNotEqualbatch2linear/linear_model/alpha/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:џџџџџџџџџ

/linear/linear_model/alpha/to_sparse_input/WhereWhere2linear/linear_model/alpha/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ

7linear/linear_model/alpha/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
И
1linear/linear_model/alpha/to_sparse_input/ReshapeReshapebatch7linear/linear_model/alpha/to_sparse_input/Reshape/shape*#
_output_shapes
:џџџџџџџџџ*
T0*
Tshape0

=linear/linear_model/alpha/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:

?linear/linear_model/alpha/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:

?linear/linear_model/alpha/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
и
7linear/linear_model/alpha/to_sparse_input/strided_sliceStridedSlice/linear/linear_model/alpha/to_sparse_input/Where=linear/linear_model/alpha/to_sparse_input/strided_slice/stack?linear/linear_model/alpha/to_sparse_input/strided_slice/stack_1?linear/linear_model/alpha/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask

?linear/linear_model/alpha/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:

Alinear/linear_model/alpha/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:

Alinear/linear_model/alpha/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ф
9linear/linear_model/alpha/to_sparse_input/strided_slice_1StridedSlice/linear/linear_model/alpha/to_sparse_input/Where?linear/linear_model/alpha/to_sparse_input/strided_slice_1/stackAlinear/linear_model/alpha/to_sparse_input/strided_slice_1/stack_1Alinear/linear_model/alpha/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
Ѕ
1linear/linear_model/alpha/to_sparse_input/unstackUnpack.linear/linear_model/alpha/to_sparse_input/Cast*	
num*
T0	*
_output_shapes
: : *

axis 
І
/linear/linear_model/alpha/to_sparse_input/stackPack3linear/linear_model/alpha/to_sparse_input/unstack:1*
N*
T0	*
_output_shapes
:*

axis 
в
-linear/linear_model/alpha/to_sparse_input/MulMul9linear/linear_model/alpha/to_sparse_input/strided_slice_1/linear/linear_model/alpha/to_sparse_input/stack*
T0	*'
_output_shapes
:џџџџџџџџџ

?linear/linear_model/alpha/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
я
-linear/linear_model/alpha/to_sparse_input/SumSum-linear/linear_model/alpha/to_sparse_input/Mul?linear/linear_model/alpha/to_sparse_input/Sum/reduction_indices*#
_output_shapes
:џџџџџџџџџ*
T0	*
	keep_dims( *

Tidx0
Ъ
-linear/linear_model/alpha/to_sparse_input/AddAdd7linear/linear_model/alpha/to_sparse_input/strided_slice-linear/linear_model/alpha/to_sparse_input/Sum*
T0	*#
_output_shapes
:џџџџџџџџџ
ј
0linear/linear_model/alpha/to_sparse_input/GatherGather1linear/linear_model/alpha/to_sparse_input/Reshape-linear/linear_model/alpha/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ

,linear/linear_model/alpha/alpha_lookup/ConstConst*
dtype0*
valueBBax01Bax02*
_output_shapes
:
m
+linear/linear_model/alpha/alpha_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
t
2linear/linear_model/alpha/alpha_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
t
2linear/linear_model/alpha/alpha_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
ђ
,linear/linear_model/alpha/alpha_lookup/rangeRange2linear/linear_model/alpha/alpha_lookup/range/start+linear/linear_model/alpha/alpha_lookup/Size2linear/linear_model/alpha/alpha_lookup/range/delta*

Tidx0*
_output_shapes
:

.linear/linear_model/alpha/alpha_lookup/ToInt64Cast,linear/linear_model/alpha/alpha_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
Н
1linear/linear_model/alpha/alpha_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 

7linear/linear_model/alpha/alpha_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 
њ
<linear/linear_model/alpha/alpha_lookup/hash_table/table_initInitializeTableV21linear/linear_model/alpha/alpha_lookup/hash_table,linear/linear_model/alpha/alpha_lookup/Const.linear/linear_model/alpha/alpha_lookup/ToInt64*

Tkey0*

Tval0	

+linear/linear_model/alpha/hash_table_LookupLookupTableFindV21linear/linear_model/alpha/alpha_lookup/hash_table0linear/linear_model/alpha/to_sparse_input/Gather7linear/linear_model/alpha/alpha_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:џџџџџџџџџ

$linear/linear_model/alpha/Shape/CastCast.linear/linear_model/alpha/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
w
-linear/linear_model/alpha/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
y
/linear/linear_model/alpha/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
y
/linear/linear_model/alpha/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

'linear/linear_model/alpha/strided_sliceStridedSlice$linear/linear_model/alpha/Shape/Cast-linear/linear_model/alpha/strided_slice/stack/linear/linear_model/alpha/strided_slice/stack_1/linear/linear_model/alpha/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
m
"linear/linear_model/alpha/Cast/x/1Const*
dtype0*
valueB :
џџџџџџџџџ*
_output_shapes
: 
Џ
 linear/linear_model/alpha/Cast/xPack'linear/linear_model/alpha/strided_slice"linear/linear_model/alpha/Cast/x/1*
N*
T0*
_output_shapes
:*

axis 
|
linear/linear_model/alpha/CastCast linear/linear_model/alpha/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
ш
'linear/linear_model/alpha/SparseReshapeSparseReshape/linear/linear_model/alpha/to_sparse_input/Where.linear/linear_model/alpha/to_sparse_input/Castlinear/linear_model/alpha/Cast*-
_output_shapes
:џџџџџџџџџ:

0linear/linear_model/alpha/SparseReshape/IdentityIdentity+linear/linear_model/alpha/hash_table_Lookup*
T0	*#
_output_shapes
:џџџџџџџџџ
Ь
:linear/linear_model/alpha/weights/part_0/Initializer/zerosConst*
dtype0*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
valueB*    *
_output_shapes

:
й
(linear/linear_model/alpha/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
shared_name 
Ў
/linear/linear_model/alpha/weights/part_0/AssignAssign(linear/linear_model/alpha/weights/part_0:linear/linear_model/alpha/weights/part_0/Initializer/zeros*
validate_shape(*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
use_locking(*
T0*
_output_shapes

:
Щ
-linear/linear_model/alpha/weights/part_0/readIdentity(linear/linear_model/alpha/weights/part_0*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
T0*
_output_shapes

:
|
2linear/linear_model/alpha/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
{
1linear/linear_model/alpha/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
љ
,linear/linear_model/alpha/weighted_sum/SliceSlice)linear/linear_model/alpha/SparseReshape:12linear/linear_model/alpha/weighted_sum/Slice/begin1linear/linear_model/alpha/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
v
,linear/linear_model/alpha/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
Э
+linear/linear_model/alpha/weighted_sum/ProdProd,linear/linear_model/alpha/weighted_sum/Slice,linear/linear_model/alpha/weighted_sum/Const*
_output_shapes
: *
T0	*
	keep_dims( *

Tidx0
w
5linear/linear_model/alpha/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
ш
-linear/linear_model/alpha/weighted_sum/GatherGather)linear/linear_model/alpha/SparseReshape:15linear/linear_model/alpha/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
Ы
-linear/linear_model/alpha/weighted_sum/Cast/xPack+linear/linear_model/alpha/weighted_sum/Prod-linear/linear_model/alpha/weighted_sum/Gather*
N*
T0	*
_output_shapes
:*

axis 
ї
4linear/linear_model/alpha/weighted_sum/SparseReshapeSparseReshape'linear/linear_model/alpha/SparseReshape)linear/linear_model/alpha/SparseReshape:1-linear/linear_model/alpha/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
Љ
=linear/linear_model/alpha/weighted_sum/SparseReshape/IdentityIdentity0linear/linear_model/alpha/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ
w
5linear/linear_model/alpha/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
ч
3linear/linear_model/alpha/weighted_sum/GreaterEqualGreaterEqual=linear/linear_model/alpha/weighted_sum/SparseReshape/Identity5linear/linear_model/alpha/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ

,linear/linear_model/alpha/weighted_sum/WhereWhere3linear/linear_model/alpha/weighted_sum/GreaterEqual*'
_output_shapes
:џџџџџџџџџ

4linear/linear_model/alpha/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
й
.linear/linear_model/alpha/weighted_sum/ReshapeReshape,linear/linear_model/alpha/weighted_sum/Where4linear/linear_model/alpha/weighted_sum/Reshape/shape*#
_output_shapes
:џџџџџџџџџ*
T0	*
Tshape0
џ
/linear/linear_model/alpha/weighted_sum/Gather_1Gather4linear/linear_model/alpha/weighted_sum/SparseReshape.linear/linear_model/alpha/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:џџџџџџџџџ

/linear/linear_model/alpha/weighted_sum/Gather_2Gather=linear/linear_model/alpha/weighted_sum/SparseReshape/Identity.linear/linear_model/alpha/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:џџџџџџџџџ

/linear/linear_model/alpha/weighted_sum/IdentityIdentity6linear/linear_model/alpha/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 

Nlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice/linear/linear_model/alpha/weighted_sum/IdentityNlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stackPlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
С
?linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/CastCastHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 

Flinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 

Flinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ы
@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/rangeRangeFlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/range/start?linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/CastFlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:џџџџџџџџџ
Ш
Alinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Cast_1Cast@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:џџџџџџџџџ
Ё
Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ѓ
Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ѓ
Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Є
Jlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice/linear/linear_model/alpha/weighted_sum/Gather_1Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackRlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Њ
Clinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ListDiffListDiffAlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Cast_1Jlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:

Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

Jlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice/linear/linear_model/alpha/weighted_sum/IdentityPlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackRlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask

Ilinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
џџџџџџџџџ*
_output_shapes
: 

Elinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsJlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2Ilinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:

Vlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 

Vlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
ы
Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseClinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ListDiffElinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ExpandDimsVlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesVlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:џџџџџџџџџ

Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"џџџџ   *
_output_shapes
:

Blinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ReshapeReshapeClinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ListDiffHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Reshape/shape*'
_output_shapes
:џџџџџџџџџ*
T0	*
Tshape0
Ш
Elinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeBlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:џџџџџџџџџ

Flinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
ч
Alinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concatConcatV2Blinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ReshapeElinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/zeros_likeFlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat/axis*
N*

Tidx0*'
_output_shapes
:џџџџџџџџџ*
T0	
У
@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ShapeShapeClinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
љ
?linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/FillFill@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Shape@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:џџџџџџџџџ

Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
д
Clinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_1ConcatV2/linear/linear_model/alpha/weighted_sum/Gather_1Alinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concatHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_1/axis*
N*

Tidx0*'
_output_shapes
:џџџџџџџџџ*
T0	

Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ю
Clinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_2ConcatV2/linear/linear_model/alpha/weighted_sum/Gather_2?linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/FillHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_2/axis*
N*

Tidx0*#
_output_shapes
:џџџџџџџџџ*
T0	
е
Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderClinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_1Clinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_2/linear/linear_model/alpha/weighted_sum/Identity*
T0	*6
_output_shapes$
":џџџџџџџџџ:џџџџџџџџџ
Ѕ
Clinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/IdentityIdentity/linear/linear_model/alpha/weighted_sum/Identity*
T0	*
_output_shapes
:
Ѓ
Rlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ѕ
Tlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ѕ
Tlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Х
Llinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseReorderRlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stackTlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Tlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
ж
Clinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/CastCastLlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:џџџџџџџџџ
ч
Elinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/UniqueUniqueJlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ
ь
Olinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/embedding_lookupGather-linear/linear_model/alpha/weights/part_0/readElinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*'
_output_shapes
:џџџџџџџџџ
я
>linear/linear_model/alpha/weighted_sum/embedding_lookup_sparseSparseSegmentSumOlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/embedding_lookupGlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/Unique:1Clinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:џџџџџџџџџ*
T0*

Tidx0

6linear/linear_model/alpha/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"џџџџ   *
_output_shapes
:
§
0linear/linear_model/alpha/weighted_sum/Reshape_1ReshapeHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDense6linear/linear_model/alpha/weighted_sum/Reshape_1/shape*'
_output_shapes
:џџџџџџџџџ*
T0
*
Tshape0
Њ
,linear/linear_model/alpha/weighted_sum/ShapeShape>linear/linear_model/alpha/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:

:linear/linear_model/alpha/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:

<linear/linear_model/alpha/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

<linear/linear_model/alpha/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
М
4linear/linear_model/alpha/weighted_sum/strided_sliceStridedSlice,linear/linear_model/alpha/weighted_sum/Shape:linear/linear_model/alpha/weighted_sum/strided_slice/stack<linear/linear_model/alpha/weighted_sum/strided_slice/stack_1<linear/linear_model/alpha/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
p
.linear/linear_model/alpha/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
д
,linear/linear_model/alpha/weighted_sum/stackPack.linear/linear_model/alpha/weighted_sum/stack/04linear/linear_model/alpha/weighted_sum/strided_slice*
N*
T0*
_output_shapes
:*

axis 
р
+linear/linear_model/alpha/weighted_sum/TileTile0linear/linear_model/alpha/weighted_sum/Reshape_1,linear/linear_model/alpha/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
А
1linear/linear_model/alpha/weighted_sum/zeros_like	ZerosLike>linear/linear_model/alpha/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ

&linear/linear_model/alpha/weighted_sumSelect+linear/linear_model/alpha/weighted_sum/Tile1linear/linear_model/alpha/weighted_sum/zeros_like>linear/linear_model/alpha/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ

-linear/linear_model/alpha/weighted_sum/Cast_1Cast)linear/linear_model/alpha/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
~
4linear/linear_model/alpha/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
}
3linear/linear_model/alpha/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:

.linear/linear_model/alpha/weighted_sum/Slice_1Slice-linear/linear_model/alpha/weighted_sum/Cast_14linear/linear_model/alpha/weighted_sum/Slice_1/begin3linear/linear_model/alpha/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:

.linear/linear_model/alpha/weighted_sum/Shape_1Shape&linear/linear_model/alpha/weighted_sum*
out_type0*
T0*
_output_shapes
:
~
4linear/linear_model/alpha/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:

3linear/linear_model/alpha/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:

.linear/linear_model/alpha/weighted_sum/Slice_2Slice.linear/linear_model/alpha/weighted_sum/Shape_14linear/linear_model/alpha/weighted_sum/Slice_2/begin3linear/linear_model/alpha/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
t
2linear/linear_model/alpha/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 

-linear/linear_model/alpha/weighted_sum/concatConcatV2.linear/linear_model/alpha/weighted_sum/Slice_1.linear/linear_model/alpha/weighted_sum/Slice_22linear/linear_model/alpha/weighted_sum/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
в
0linear/linear_model/alpha/weighted_sum/Reshape_2Reshape&linear/linear_model/alpha/weighted_sum-linear/linear_model/alpha/weighted_sum/concat*'
_output_shapes
:џџџџџџџџџ*
T0*
Tshape0
u
.linear/linear_model/beta/to_sparse_input/ShapeShapebatch:1*
out_type0*
T0*
_output_shapes
:

-linear/linear_model/beta/to_sparse_input/CastCast.linear/linear_model/beta/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
r
1linear/linear_model/beta/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
Ћ
1linear/linear_model/beta/to_sparse_input/NotEqualNotEqualbatch:11linear/linear_model/beta/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:џџџџџџџџџ

.linear/linear_model/beta/to_sparse_input/WhereWhere1linear/linear_model/beta/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ

6linear/linear_model/beta/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
И
0linear/linear_model/beta/to_sparse_input/ReshapeReshapebatch:16linear/linear_model/beta/to_sparse_input/Reshape/shape*#
_output_shapes
:џџџџџџџџџ*
T0*
Tshape0

<linear/linear_model/beta/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:

>linear/linear_model/beta/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:

>linear/linear_model/beta/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
г
6linear/linear_model/beta/to_sparse_input/strided_sliceStridedSlice.linear/linear_model/beta/to_sparse_input/Where<linear/linear_model/beta/to_sparse_input/strided_slice/stack>linear/linear_model/beta/to_sparse_input/strided_slice/stack_1>linear/linear_model/beta/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask

>linear/linear_model/beta/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:

@linear/linear_model/beta/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:

@linear/linear_model/beta/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
п
8linear/linear_model/beta/to_sparse_input/strided_slice_1StridedSlice.linear/linear_model/beta/to_sparse_input/Where>linear/linear_model/beta/to_sparse_input/strided_slice_1/stack@linear/linear_model/beta/to_sparse_input/strided_slice_1/stack_1@linear/linear_model/beta/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
Ѓ
0linear/linear_model/beta/to_sparse_input/unstackUnpack-linear/linear_model/beta/to_sparse_input/Cast*	
num*
T0	*
_output_shapes
: : *

axis 
Є
.linear/linear_model/beta/to_sparse_input/stackPack2linear/linear_model/beta/to_sparse_input/unstack:1*
N*
T0	*
_output_shapes
:*

axis 
Я
,linear/linear_model/beta/to_sparse_input/MulMul8linear/linear_model/beta/to_sparse_input/strided_slice_1.linear/linear_model/beta/to_sparse_input/stack*
T0	*'
_output_shapes
:џџџџџџџџџ

>linear/linear_model/beta/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
ь
,linear/linear_model/beta/to_sparse_input/SumSum,linear/linear_model/beta/to_sparse_input/Mul>linear/linear_model/beta/to_sparse_input/Sum/reduction_indices*#
_output_shapes
:џџџџџџџџџ*
T0	*
	keep_dims( *

Tidx0
Ч
,linear/linear_model/beta/to_sparse_input/AddAdd6linear/linear_model/beta/to_sparse_input/strided_slice,linear/linear_model/beta/to_sparse_input/Sum*
T0	*#
_output_shapes
:џџџџџџџџџ
ѕ
/linear/linear_model/beta/to_sparse_input/GatherGather0linear/linear_model/beta/to_sparse_input/Reshape,linear/linear_model/beta/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ
}
*linear/linear_model/beta/beta_lookup/ConstConst*
dtype0*
valueBBbx01Bbx02*
_output_shapes
:
k
)linear/linear_model/beta/beta_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
r
0linear/linear_model/beta/beta_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
r
0linear/linear_model/beta/beta_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
ъ
*linear/linear_model/beta/beta_lookup/rangeRange0linear/linear_model/beta/beta_lookup/range/start)linear/linear_model/beta/beta_lookup/Size0linear/linear_model/beta/beta_lookup/range/delta*

Tidx0*
_output_shapes
:

,linear/linear_model/beta/beta_lookup/ToInt64Cast*linear/linear_model/beta/beta_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
Л
/linear/linear_model/beta/beta_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 

5linear/linear_model/beta/beta_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 
ђ
:linear/linear_model/beta/beta_lookup/hash_table/table_initInitializeTableV2/linear/linear_model/beta/beta_lookup/hash_table*linear/linear_model/beta/beta_lookup/Const,linear/linear_model/beta/beta_lookup/ToInt64*

Tkey0*

Tval0	

*linear/linear_model/beta/hash_table_LookupLookupTableFindV2/linear/linear_model/beta/beta_lookup/hash_table/linear/linear_model/beta/to_sparse_input/Gather5linear/linear_model/beta/beta_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:џџџџџџџџџ

#linear/linear_model/beta/Shape/CastCast-linear/linear_model/beta/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
v
,linear/linear_model/beta/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
x
.linear/linear_model/beta/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
x
.linear/linear_model/beta/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ћ
&linear/linear_model/beta/strided_sliceStridedSlice#linear/linear_model/beta/Shape/Cast,linear/linear_model/beta/strided_slice/stack.linear/linear_model/beta/strided_slice/stack_1.linear/linear_model/beta/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
l
!linear/linear_model/beta/Cast/x/1Const*
dtype0*
valueB :
џџџџџџџџџ*
_output_shapes
: 
Ќ
linear/linear_model/beta/Cast/xPack&linear/linear_model/beta/strided_slice!linear/linear_model/beta/Cast/x/1*
N*
T0*
_output_shapes
:*

axis 
z
linear/linear_model/beta/CastCastlinear/linear_model/beta/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
ф
&linear/linear_model/beta/SparseReshapeSparseReshape.linear/linear_model/beta/to_sparse_input/Where-linear/linear_model/beta/to_sparse_input/Castlinear/linear_model/beta/Cast*-
_output_shapes
:џџџџџџџџџ:

/linear/linear_model/beta/SparseReshape/IdentityIdentity*linear/linear_model/beta/hash_table_Lookup*
T0	*#
_output_shapes
:џџџџџџџџџ
Ъ
9linear/linear_model/beta/weights/part_0/Initializer/zerosConst*
dtype0*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
valueB*    *
_output_shapes

:
з
'linear/linear_model/beta/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
shared_name 
Њ
.linear/linear_model/beta/weights/part_0/AssignAssign'linear/linear_model/beta/weights/part_09linear/linear_model/beta/weights/part_0/Initializer/zeros*
validate_shape(*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
use_locking(*
T0*
_output_shapes

:
Ц
,linear/linear_model/beta/weights/part_0/readIdentity'linear/linear_model/beta/weights/part_0*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
T0*
_output_shapes

:
{
1linear/linear_model/beta/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
z
0linear/linear_model/beta/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
ѕ
+linear/linear_model/beta/weighted_sum/SliceSlice(linear/linear_model/beta/SparseReshape:11linear/linear_model/beta/weighted_sum/Slice/begin0linear/linear_model/beta/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
u
+linear/linear_model/beta/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
Ъ
*linear/linear_model/beta/weighted_sum/ProdProd+linear/linear_model/beta/weighted_sum/Slice+linear/linear_model/beta/weighted_sum/Const*
_output_shapes
: *
T0	*
	keep_dims( *

Tidx0
v
4linear/linear_model/beta/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
х
,linear/linear_model/beta/weighted_sum/GatherGather(linear/linear_model/beta/SparseReshape:14linear/linear_model/beta/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
Ш
,linear/linear_model/beta/weighted_sum/Cast/xPack*linear/linear_model/beta/weighted_sum/Prod,linear/linear_model/beta/weighted_sum/Gather*
N*
T0	*
_output_shapes
:*

axis 
ѓ
3linear/linear_model/beta/weighted_sum/SparseReshapeSparseReshape&linear/linear_model/beta/SparseReshape(linear/linear_model/beta/SparseReshape:1,linear/linear_model/beta/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
Ї
<linear/linear_model/beta/weighted_sum/SparseReshape/IdentityIdentity/linear/linear_model/beta/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ
v
4linear/linear_model/beta/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
ф
2linear/linear_model/beta/weighted_sum/GreaterEqualGreaterEqual<linear/linear_model/beta/weighted_sum/SparseReshape/Identity4linear/linear_model/beta/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ

+linear/linear_model/beta/weighted_sum/WhereWhere2linear/linear_model/beta/weighted_sum/GreaterEqual*'
_output_shapes
:џџџџџџџџџ

3linear/linear_model/beta/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
ж
-linear/linear_model/beta/weighted_sum/ReshapeReshape+linear/linear_model/beta/weighted_sum/Where3linear/linear_model/beta/weighted_sum/Reshape/shape*#
_output_shapes
:џџџџџџџџџ*
T0	*
Tshape0
ќ
.linear/linear_model/beta/weighted_sum/Gather_1Gather3linear/linear_model/beta/weighted_sum/SparseReshape-linear/linear_model/beta/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:џџџџџџџџџ

.linear/linear_model/beta/weighted_sum/Gather_2Gather<linear/linear_model/beta/weighted_sum/SparseReshape/Identity-linear/linear_model/beta/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:џџџџџџџџџ

.linear/linear_model/beta/weighted_sum/IdentityIdentity5linear/linear_model/beta/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 

Mlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice.linear/linear_model/beta/weighted_sum/IdentityMlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stackOlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
П
>linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/CastCastGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 

Elinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 

Elinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ч
?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/rangeRangeElinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/range/start>linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/CastElinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:џџџџџџџџџ
Ц
@linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Cast_1Cast?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:џџџџџџџџџ
 
Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ђ
Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ђ
Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:

Ilinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice.linear/linear_model/beta/weighted_sum/Gather_1Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackQlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Ї
Blinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ListDiffListDiff@linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Cast_1Ilinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:

Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

Ilinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice.linear/linear_model/beta/weighted_sum/IdentityOlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackQlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask

Hlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
џџџџџџџџџ*
_output_shapes
: 

Dlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsIlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2Hlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:

Ulinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 

Ulinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
ц
Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseBlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ListDiffDlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ExpandDimsUlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesUlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:џџџџџџџџџ

Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"џџџџ   *
_output_shapes
:

Alinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ReshapeReshapeBlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ListDiffGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Reshape/shape*'
_output_shapes
:џџџџџџџџџ*
T0	*
Tshape0
Ц
Dlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeAlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:џџџџџџџџџ

Elinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
у
@linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concatConcatV2Alinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ReshapeDlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/zeros_likeElinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat/axis*
N*

Tidx0*'
_output_shapes
:џџџџџџџџџ*
T0	
С
?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ShapeShapeBlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
і
>linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/FillFill?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Shape?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:џџџџџџџџџ

Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
а
Blinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_1ConcatV2.linear/linear_model/beta/weighted_sum/Gather_1@linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concatGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_1/axis*
N*

Tidx0*'
_output_shapes
:џџџџџџџџџ*
T0	

Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ъ
Blinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_2ConcatV2.linear/linear_model/beta/weighted_sum/Gather_2>linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/FillGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_2/axis*
N*

Tidx0*#
_output_shapes
:џџџџџџџџџ*
T0	
б
Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderBlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_1Blinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_2.linear/linear_model/beta/weighted_sum/Identity*
T0	*6
_output_shapes$
":џџџџџџџџџ:џџџџџџџџџ
Ѓ
Blinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/IdentityIdentity.linear/linear_model/beta/weighted_sum/Identity*
T0	*
_output_shapes
:
Ђ
Qlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Є
Slinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Є
Slinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Р
Klinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseReorderQlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stackSlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Slinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
д
Blinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/CastCastKlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:џџџџџџџџџ
х
Dlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/UniqueUniqueIlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ
ш
Nlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/embedding_lookupGather,linear/linear_model/beta/weights/part_0/readDlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*'
_output_shapes
:џџџџџџџџџ
ы
=linear/linear_model/beta/weighted_sum/embedding_lookup_sparseSparseSegmentSumNlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/embedding_lookupFlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/Unique:1Blinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:џџџџџџџџџ*
T0*

Tidx0

5linear/linear_model/beta/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"џџџџ   *
_output_shapes
:
њ
/linear/linear_model/beta/weighted_sum/Reshape_1ReshapeGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDense5linear/linear_model/beta/weighted_sum/Reshape_1/shape*'
_output_shapes
:џџџџџџџџџ*
T0
*
Tshape0
Ј
+linear/linear_model/beta/weighted_sum/ShapeShape=linear/linear_model/beta/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:

9linear/linear_model/beta/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:

;linear/linear_model/beta/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

;linear/linear_model/beta/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
З
3linear/linear_model/beta/weighted_sum/strided_sliceStridedSlice+linear/linear_model/beta/weighted_sum/Shape9linear/linear_model/beta/weighted_sum/strided_slice/stack;linear/linear_model/beta/weighted_sum/strided_slice/stack_1;linear/linear_model/beta/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
o
-linear/linear_model/beta/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
б
+linear/linear_model/beta/weighted_sum/stackPack-linear/linear_model/beta/weighted_sum/stack/03linear/linear_model/beta/weighted_sum/strided_slice*
N*
T0*
_output_shapes
:*

axis 
н
*linear/linear_model/beta/weighted_sum/TileTile/linear/linear_model/beta/weighted_sum/Reshape_1+linear/linear_model/beta/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
Ў
0linear/linear_model/beta/weighted_sum/zeros_like	ZerosLike=linear/linear_model/beta/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
ў
%linear/linear_model/beta/weighted_sumSelect*linear/linear_model/beta/weighted_sum/Tile0linear/linear_model/beta/weighted_sum/zeros_like=linear/linear_model/beta/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ

,linear/linear_model/beta/weighted_sum/Cast_1Cast(linear/linear_model/beta/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
}
3linear/linear_model/beta/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
|
2linear/linear_model/beta/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
џ
-linear/linear_model/beta/weighted_sum/Slice_1Slice,linear/linear_model/beta/weighted_sum/Cast_13linear/linear_model/beta/weighted_sum/Slice_1/begin2linear/linear_model/beta/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:

-linear/linear_model/beta/weighted_sum/Shape_1Shape%linear/linear_model/beta/weighted_sum*
out_type0*
T0*
_output_shapes
:
}
3linear/linear_model/beta/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:

2linear/linear_model/beta/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:

-linear/linear_model/beta/weighted_sum/Slice_2Slice-linear/linear_model/beta/weighted_sum/Shape_13linear/linear_model/beta/weighted_sum/Slice_2/begin2linear/linear_model/beta/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
s
1linear/linear_model/beta/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 

,linear/linear_model/beta/weighted_sum/concatConcatV2-linear/linear_model/beta/weighted_sum/Slice_1-linear/linear_model/beta/weighted_sum/Slice_21linear/linear_model/beta/weighted_sum/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
Я
/linear/linear_model/beta/weighted_sum/Reshape_2Reshape%linear/linear_model/beta/weighted_sum,linear/linear_model/beta/weighted_sum/concat*'
_output_shapes
:џџџџџџџџџ*
T0*
Tshape0
Ю
(linear/linear_model/weighted_sum_no_biasAddN0linear/linear_model/alpha/weighted_sum/Reshape_2/linear/linear_model/beta/weighted_sum/Reshape_2*'
_output_shapes
:џџџџџџџџџ*
T0*
N
Т
9linear/linear_model/bias_weights/part_0/Initializer/zerosConst*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
valueB*    *
_output_shapes
:
Я
'linear/linear_model/bias_weights/part_0
VariableV2*
	container *
_output_shapes
:*
dtype0*
shape:*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
shared_name 
І
.linear/linear_model/bias_weights/part_0/AssignAssign'linear/linear_model/bias_weights/part_09linear/linear_model/bias_weights/part_0/Initializer/zeros*
validate_shape(*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
use_locking(*
T0*
_output_shapes
:
Т
,linear/linear_model/bias_weights/part_0/readIdentity'linear/linear_model/bias_weights/part_0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
T0*
_output_shapes
:

 linear/linear_model/bias_weightsIdentity,linear/linear_model/bias_weights/part_0/read*
T0*
_output_shapes
:
Р
 linear/linear_model/weighted_sumBiasAdd(linear/linear_model/weighted_sum_no_bias linear/linear_model/bias_weights*'
_output_shapes
:џџџџџџџџџ*
T0*
data_formatNHWC
^
linear/zero_fraction/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 

linear/zero_fraction/EqualEqual linear/linear_model/weighted_sumlinear/zero_fraction/zero*
T0*'
_output_shapes
:џџџџџџџџџ
~
linear/zero_fraction/CastCastlinear/zero_fraction/Equal*

DstT0*

SrcT0
*'
_output_shapes
:џџџџџџџџџ
k
linear/zero_fraction/ConstConst*
dtype0*
valueB"       *
_output_shapes
:

linear/zero_fraction/MeanMeanlinear/zero_fraction/Castlinear/zero_fraction/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0

*linear/linear/fraction_of_zero_values/tagsConst*
dtype0*6
value-B+ B%linear/linear/fraction_of_zero_values*
_output_shapes
: 

%linear/linear/fraction_of_zero_valuesScalarSummary*linear/linear/fraction_of_zero_values/tagslinear/zero_fraction/Mean*
T0*
_output_shapes
: 
u
linear/linear/activation/tagConst*
dtype0*)
value B Blinear/linear/activation*
_output_shapes
: 

linear/linear/activationHistogramSummarylinear/linear/activation/tag linear/linear_model/weighted_sum*
T0*
_output_shapes
: 
r
addAdddnn/logits/BiasAdd linear/linear_model/weighted_sum*
T0*'
_output_shapes
:џџџџџџџџџ
w
"regression_head/predictions/scoresSqueezeadd*
squeeze_dims
*
T0*#
_output_shapes
:џџџџџџџџџ

$regression_head/predictions/IdentityIdentity"regression_head/predictions/scores*
T0*#
_output_shapes
:џџџџџџџџџ
l
%regression_head/mean_squared_loss/subSubaddbatch:2*
T0*'
_output_shapes
:џџџџџџџџџ

!regression_head/mean_squared_lossSquare%regression_head/mean_squared_loss/sub*
T0*'
_output_shapes
:џџџџџџџџџ
}
,regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
Н
&regression_head/mean_squared_loss/lossMean!regression_head/mean_squared_loss,regression_head/mean_squared_loss/loss/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
g
"regression_head/ScalarSummary/tagsConst*
dtype0*
valueB
 Bloss*
_output_shapes
: 

regression_head/ScalarSummaryScalarSummary"regression_head/ScalarSummary/tags&regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
g
"regression_head/metrics/mean/zerosConst*
dtype0*
valueB
 *    *
_output_shapes
: 

"regression_head/metrics/mean/total
VariableV2*
dtype0*
shape: *
	container *
shared_name *
_output_shapes
: 
ќ
)regression_head/metrics/mean/total/AssignAssign"regression_head/metrics/mean/total"regression_head/metrics/mean/zeros*
validate_shape(*5
_class+
)'loc:@regression_head/metrics/mean/total*
use_locking(*
T0*
_output_shapes
: 
Џ
'regression_head/metrics/mean/total/readIdentity"regression_head/metrics/mean/total*5
_class+
)'loc:@regression_head/metrics/mean/total*
T0*
_output_shapes
: 
i
$regression_head/metrics/mean/zeros_1Const*
dtype0*
valueB
 *    *
_output_shapes
: 

"regression_head/metrics/mean/count
VariableV2*
dtype0*
shape: *
	container *
shared_name *
_output_shapes
: 
ў
)regression_head/metrics/mean/count/AssignAssign"regression_head/metrics/mean/count$regression_head/metrics/mean/zeros_1*
validate_shape(*5
_class+
)'loc:@regression_head/metrics/mean/count*
use_locking(*
T0*
_output_shapes
: 
Џ
'regression_head/metrics/mean/count/readIdentity"regression_head/metrics/mean/count*5
_class+
)'loc:@regression_head/metrics/mean/count*
T0*
_output_shapes
: 
c
!regression_head/metrics/mean/SizeConst*
dtype0*
value	B :*
_output_shapes
: 

&regression_head/metrics/mean/ToFloat_1Cast!regression_head/metrics/mean/Size*

DstT0*

SrcT0*
_output_shapes
: 
e
"regression_head/metrics/mean/ConstConst*
dtype0*
valueB *
_output_shapes
: 
Б
 regression_head/metrics/mean/SumSum&regression_head/mean_squared_loss/loss"regression_head/metrics/mean/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
ф
&regression_head/metrics/mean/AssignAdd	AssignAdd"regression_head/metrics/mean/total regression_head/metrics/mean/Sum*5
_class+
)'loc:@regression_head/metrics/mean/total*
use_locking( *
T0*
_output_shapes
: 

(regression_head/metrics/mean/AssignAdd_1	AssignAdd"regression_head/metrics/mean/count&regression_head/metrics/mean/ToFloat_1'^regression_head/mean_squared_loss/loss*5
_class+
)'loc:@regression_head/metrics/mean/count*
use_locking( *
T0*
_output_shapes
: 
k
&regression_head/metrics/mean/Greater/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ё
$regression_head/metrics/mean/GreaterGreater'regression_head/metrics/mean/count/read&regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
Ђ
$regression_head/metrics/mean/truedivRealDiv'regression_head/metrics/mean/total/read'regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
i
$regression_head/metrics/mean/value/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
П
"regression_head/metrics/mean/valueSelect$regression_head/metrics/mean/Greater$regression_head/metrics/mean/truediv$regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
m
(regression_head/metrics/mean/Greater_1/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 
І
&regression_head/metrics/mean/Greater_1Greater(regression_head/metrics/mean/AssignAdd_1(regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
Є
&regression_head/metrics/mean/truediv_1RealDiv&regression_head/metrics/mean/AssignAdd(regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
m
(regression_head/metrics/mean/update_op/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ы
&regression_head/metrics/mean/update_opSelect&regression_head/metrics/mean/Greater_1&regression_head/metrics/mean/truediv_1(regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: 

$remove_squeezable_dimensions/SqueezeSqueezebatch:2*
squeeze_dims

џџџџџџџџџ*
T0*#
_output_shapes
:џџџџџџџџџ

subSub$remove_squeezable_dimensions/Squeeze$regression_head/predictions/Identity*
T0*#
_output_shapes
:џџџџџџџџџ
C
SquareSquaresub*
T0*#
_output_shapes
:џџџџџџџџџ
b
root_mean_squared_error/zerosConst*
dtype0*
valueB
 *    *
_output_shapes
: 

root_mean_squared_error/total
VariableV2*
dtype0*
shape: *
	container *
shared_name *
_output_shapes
: 
ш
$root_mean_squared_error/total/AssignAssignroot_mean_squared_error/totalroot_mean_squared_error/zeros*
validate_shape(*0
_class&
$"loc:@root_mean_squared_error/total*
use_locking(*
T0*
_output_shapes
: 
 
"root_mean_squared_error/total/readIdentityroot_mean_squared_error/total*0
_class&
$"loc:@root_mean_squared_error/total*
T0*
_output_shapes
: 
d
root_mean_squared_error/zeros_1Const*
dtype0*
valueB
 *    *
_output_shapes
: 

root_mean_squared_error/count
VariableV2*
dtype0*
shape: *
	container *
shared_name *
_output_shapes
: 
ъ
$root_mean_squared_error/count/AssignAssignroot_mean_squared_error/countroot_mean_squared_error/zeros_1*
validate_shape(*0
_class&
$"loc:@root_mean_squared_error/count*
use_locking(*
T0*
_output_shapes
: 
 
"root_mean_squared_error/count/readIdentityroot_mean_squared_error/count*0
_class&
$"loc:@root_mean_squared_error/count*
T0*
_output_shapes
: 
]
root_mean_squared_error/SizeSizeSquare*
out_type0*
T0*
_output_shapes
: 
w
!root_mean_squared_error/ToFloat_1Castroot_mean_squared_error/Size*

DstT0*

SrcT0*
_output_shapes
: 
g
root_mean_squared_error/ConstConst*
dtype0*
valueB: *
_output_shapes
:

root_mean_squared_error/SumSumSquareroot_mean_squared_error/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
а
!root_mean_squared_error/AssignAdd	AssignAddroot_mean_squared_error/totalroot_mean_squared_error/Sum*0
_class&
$"loc:@root_mean_squared_error/total*
use_locking( *
T0*
_output_shapes
: 
с
#root_mean_squared_error/AssignAdd_1	AssignAddroot_mean_squared_error/count!root_mean_squared_error/ToFloat_1^Square*0
_class&
$"loc:@root_mean_squared_error/count*
use_locking( *
T0*
_output_shapes
: 
f
!root_mean_squared_error/Greater/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 

root_mean_squared_error/GreaterGreater"root_mean_squared_error/count/read!root_mean_squared_error/Greater/y*
T0*
_output_shapes
: 

root_mean_squared_error/truedivRealDiv"root_mean_squared_error/total/read"root_mean_squared_error/count/read*
T0*
_output_shapes
: 
d
root_mean_squared_error/value/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ћ
root_mean_squared_error/valueSelectroot_mean_squared_error/Greaterroot_mean_squared_error/truedivroot_mean_squared_error/value/e*
T0*
_output_shapes
: 
h
#root_mean_squared_error/Greater_1/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 

!root_mean_squared_error/Greater_1Greater#root_mean_squared_error/AssignAdd_1#root_mean_squared_error/Greater_1/y*
T0*
_output_shapes
: 

!root_mean_squared_error/truediv_1RealDiv!root_mean_squared_error/AssignAdd#root_mean_squared_error/AssignAdd_1*
T0*
_output_shapes
: 
h
#root_mean_squared_error/update_op/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
З
!root_mean_squared_error/update_opSelect!root_mean_squared_error/Greater_1!root_mean_squared_error/truediv_1#root_mean_squared_error/update_op/e*
T0*
_output_shapes
: 
L
SqrtSqrtroot_mean_squared_error/value*
T0*
_output_shapes
: 
R
Sqrt_1Sqrt!root_mean_squared_error/update_op*
T0*
_output_shapes
: 
D

group_depsNoOp'^regression_head/metrics/mean/update_op^Sqrt_1
{
eval_step/Initializer/zerosConst*
dtype0	*
_class
loc:@eval_step*
value	B	 R *
_output_shapes
: 

	eval_step
VariableV2*
	container *
_output_shapes
: *
dtype0	*
shape: *
_class
loc:@eval_step*
shared_name 
Њ
eval_step/AssignAssign	eval_stepeval_step/Initializer/zeros*
validate_shape(*
_class
loc:@eval_step*
use_locking(*
T0	*
_output_shapes
: 
d
eval_step/readIdentity	eval_step*
_class
loc:@eval_step*
T0	*
_output_shapes
: 
Q
AssignAdd/valueConst*
dtype0	*
value	B	 R*
_output_shapes
: 

	AssignAdd	AssignAdd	eval_stepAssignAdd/value*
_class
loc:@eval_step*
use_locking( *
T0	*
_output_shapes
: 
ѓ
initNoOp^global_step/Assign(^dnn/hiddenlayer_0/weights/part_0/Assign'^dnn/hiddenlayer_0/biases/part_0/Assign(^dnn/hiddenlayer_1/weights/part_0/Assign'^dnn/hiddenlayer_1/biases/part_0/Assign(^dnn/hiddenlayer_2/weights/part_0/Assign'^dnn/hiddenlayer_2/biases/part_0/Assign!^dnn/logits/weights/part_0/Assign ^dnn/logits/biases/part_0/Assign0^linear/linear_model/alpha/weights/part_0/Assign/^linear/linear_model/beta/weights/part_0/Assign/^linear/linear_model/bias_weights/part_0/Assign

init_1NoOp
$
group_deps_1NoOp^init^init_1

4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_class
loc:@global_step*
_output_shapes
: 
Ы
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
_output_shapes
: 
Щ
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
_output_shapes
: 
Ы
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
_output_shapes
: 
Щ
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
_output_shapes
: 
Ы
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitialized dnn/hiddenlayer_2/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
_output_shapes
: 
Щ
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitializeddnn/hiddenlayer_2/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
_output_shapes
: 
Н
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitializeddnn/logits/weights/part_0*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
_output_shapes
: 
Л
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitializeddnn/logits/biases/part_0*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
_output_shapes
: 
л
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitialized(linear/linear_model/alpha/weights/part_0*
dtype0*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
_output_shapes
: 
к
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitialized'linear/linear_model/beta/weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
_output_shapes
: 
к
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitialized'linear/linear_model/bias_weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
: 
а
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitialized"regression_head/metrics/mean/total*
dtype0*5
_class+
)'loc:@regression_head/metrics/mean/total*
_output_shapes
: 
а
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitialized"regression_head/metrics/mean/count*
dtype0*5
_class+
)'loc:@regression_head/metrics/mean/count*
_output_shapes
: 
Ц
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitializedroot_mean_squared_error/total*
dtype0*0
_class&
$"loc:@root_mean_squared_error/total*
_output_shapes
: 
Ц
7report_uninitialized_variables/IsVariableInitialized_15IsVariableInitializedroot_mean_squared_error/count*
dtype0*0
_class&
$"loc:@root_mean_squared_error/count*
_output_shapes
: 

7report_uninitialized_variables/IsVariableInitialized_16IsVariableInitialized	eval_step*
dtype0	*
_class
loc:@eval_step*
_output_shapes
: 
Ѓ
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized6report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_56report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_147report_uninitialized_variables/IsVariableInitialized_157report_uninitialized_variables/IsVariableInitialized_16*
N*
T0
*
_output_shapes
:*

axis 
y
)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack*
_output_shapes
:

$report_uninitialized_variables/ConstConst*
dtype0*­
valueЃB Bglobal_stepB dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0B dnn/hiddenlayer_2/weights/part_0Bdnn/hiddenlayer_2/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B(linear/linear_model/alpha/weights/part_0B'linear/linear_model/beta/weights/part_0B'linear/linear_model/bias_weights/part_0B"regression_head/metrics/mean/totalB"regression_head/metrics/mean/countBroot_mean_squared_error/totalBroot_mean_squared_error/countB	eval_step*
_output_shapes
:
{
1report_uninitialized_variables/boolean_mask/ShapeConst*
dtype0*
valueB:*
_output_shapes
:

?report_uninitialized_variables/boolean_mask/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
й
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask*
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 

Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst*
dtype0*
valueB: *
_output_shapes
:
ѕ
0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
}
3report_uninitialized_variables/boolean_mask/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst*
dtype0*
valueB:*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
valueB: *
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
с
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Џ
;report_uninitialized_variables/boolean_mask/concat/values_0Pack0report_uninitialized_variables/boolean_mask/Prod*
N*
T0*
_output_shapes
:*

axis 
y
7report_uninitialized_variables/boolean_mask/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ћ
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/concat/values_0;report_uninitialized_variables/boolean_mask/strided_slice_17report_uninitialized_variables/boolean_mask/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
Ы
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat*
_output_shapes
:*
T0*
Tshape0

;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
л
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape*
_output_shapes
:*
T0
*
Tshape0

1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1*'
_output_shapes
:џџџџџџџџџ
Ж
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where*
squeeze_dims
*
T0	*#
_output_shapes
:џџџџџџџџџ

2report_uninitialized_variables/boolean_mask/GatherGather3report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ
g
$report_uninitialized_resources/ConstConst*
dtype0*
valueB *
_output_shapes
: 
M
concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
М
concatConcatV22report_uninitialized_variables/boolean_mask/Gather$report_uninitialized_resources/Constconcat/axis*
N*

Tidx0*#
_output_shapes
:џџџџџџџџџ*
T0
Ё
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_class
loc:@global_step*
_output_shapes
: 
Э
8report_uninitialized_variables_1/IsVariableInitialized_1IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
_output_shapes
: 
Ы
8report_uninitialized_variables_1/IsVariableInitialized_2IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
_output_shapes
: 
Э
8report_uninitialized_variables_1/IsVariableInitialized_3IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
_output_shapes
: 
Ы
8report_uninitialized_variables_1/IsVariableInitialized_4IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
_output_shapes
: 
Э
8report_uninitialized_variables_1/IsVariableInitialized_5IsVariableInitialized dnn/hiddenlayer_2/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
_output_shapes
: 
Ы
8report_uninitialized_variables_1/IsVariableInitialized_6IsVariableInitializeddnn/hiddenlayer_2/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
_output_shapes
: 
П
8report_uninitialized_variables_1/IsVariableInitialized_7IsVariableInitializeddnn/logits/weights/part_0*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
_output_shapes
: 
Н
8report_uninitialized_variables_1/IsVariableInitialized_8IsVariableInitializeddnn/logits/biases/part_0*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
_output_shapes
: 
н
8report_uninitialized_variables_1/IsVariableInitialized_9IsVariableInitialized(linear/linear_model/alpha/weights/part_0*
dtype0*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
_output_shapes
: 
м
9report_uninitialized_variables_1/IsVariableInitialized_10IsVariableInitialized'linear/linear_model/beta/weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
_output_shapes
: 
м
9report_uninitialized_variables_1/IsVariableInitialized_11IsVariableInitialized'linear/linear_model/bias_weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
: 
 
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized8report_uninitialized_variables_1/IsVariableInitialized_18report_uninitialized_variables_1/IsVariableInitialized_28report_uninitialized_variables_1/IsVariableInitialized_38report_uninitialized_variables_1/IsVariableInitialized_48report_uninitialized_variables_1/IsVariableInitialized_58report_uninitialized_variables_1/IsVariableInitialized_68report_uninitialized_variables_1/IsVariableInitialized_78report_uninitialized_variables_1/IsVariableInitialized_88report_uninitialized_variables_1/IsVariableInitialized_99report_uninitialized_variables_1/IsVariableInitialized_109report_uninitialized_variables_1/IsVariableInitialized_11*
N*
T0
*
_output_shapes
:*

axis 
}
+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack*
_output_shapes
:
ї
&report_uninitialized_variables_1/ConstConst*
dtype0*
valueBBglobal_stepB dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0B dnn/hiddenlayer_2/weights/part_0Bdnn/hiddenlayer_2/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B(linear/linear_model/alpha/weights/part_0B'linear/linear_model/beta/weights/part_0B'linear/linear_model/bias_weights/part_0*
_output_shapes
:
}
3report_uninitialized_variables_1/boolean_mask/ShapeConst*
dtype0*
valueB:*
_output_shapes
:

Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
у
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask*
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 

Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst*
dtype0*
valueB: *
_output_shapes
:
ћ
2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0

5report_uninitialized_variables_1/boolean_mask/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst*
dtype0*
valueB:*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
valueB: *
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ы
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Г
=report_uninitialized_variables_1/boolean_mask/concat/values_0Pack2report_uninitialized_variables_1/boolean_mask/Prod*
N*
T0*
_output_shapes
:*

axis 
{
9report_uninitialized_variables_1/boolean_mask/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Г
4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/concat/values_0=report_uninitialized_variables_1/boolean_mask/strided_slice_19report_uninitialized_variables_1/boolean_mask/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
б
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat*
_output_shapes
:*
T0*
Tshape0

=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
с
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape*
_output_shapes
:*
T0
*
Tshape0

3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1*'
_output_shapes
:џџџџџџџџџ
К
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where*
squeeze_dims
*
T0	*#
_output_shapes
:џџџџџџџџџ

4report_uninitialized_variables_1/boolean_mask/GatherGather5report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ
Ч
init_2NoOp*^regression_head/metrics/mean/total/Assign*^regression_head/metrics/mean/count/Assign%^root_mean_squared_error/total/Assign%^root_mean_squared_error/count/Assign^eval_step/Assign
б
init_all_tablesNoOp^^dnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_table/table_init\^dnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_table/table_init=^linear/linear_model/alpha/alpha_lookup/hash_table/table_init;^linear/linear_model/beta/beta_lookup/hash_table/table_init
/
group_deps_2NoOp^init_2^init_all_tables

Merge/MergeSummaryMergeSummary"input_producer/fraction_of_32_fullbatch/fraction_of_5000_full-dnn/dnn/hiddenlayer_0/fraction_of_zero_values dnn/dnn/hiddenlayer_0/activation-dnn/dnn/hiddenlayer_1/fraction_of_zero_values dnn/dnn/hiddenlayer_1/activation-dnn/dnn/hiddenlayer_2/fraction_of_zero_values dnn/dnn/hiddenlayer_2/activation&dnn/dnn/logits/fraction_of_zero_valuesdnn/dnn/logits/activation%linear/linear/fraction_of_zero_valueslinear/linear/activationregression_head/ScalarSummary*
_output_shapes
: *
N
P

save/ConstConst*
dtype0*
valueB Bmodel*
_output_shapes
: 

save/StringJoin/inputs_1Const*
dtype0*<
value3B1 B+_temp_438653a107aa4c02b26dc325fbae4b75/part*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
_output_shapes
: *
	separator *
N
Q
save/num_shardsConst*
dtype0*
value	B :*
_output_shapes
: 
\
save/ShardedFilename/shardConst*
dtype0*
value	B : *
_output_shapes
: 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 

save/SaveV2/tensor_namesConst*
dtype0*Я
valueХBТBdnn/hiddenlayer_0/biasesBdnn/hiddenlayer_0/weightsBdnn/hiddenlayer_1/biasesBdnn/hiddenlayer_1/weightsBdnn/hiddenlayer_2/biasesBdnn/hiddenlayer_2/weightsBdnn/logits/biasesBdnn/logits/weightsBglobal_stepB!linear/linear_model/alpha/weightsB linear/linear_model/beta/weightsB linear/linear_model/bias_weights*
_output_shapes
:
ё
save/SaveV2/shape_and_slicesConst*
dtype0* 
valueBB	128 0,128B6 128 0,6:0,128B64 0,64B128 64 0,128:0,64B32 0,32B64 32 0,64:0,32B1 0,1B32 1 0,32:0,1B B2 1 0,2:0,1B2 1 0,2:0,1B1 0,1*
_output_shapes
:
Н
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices$dnn/hiddenlayer_0/biases/part_0/read%dnn/hiddenlayer_0/weights/part_0/read$dnn/hiddenlayer_1/biases/part_0/read%dnn/hiddenlayer_1/weights/part_0/read$dnn/hiddenlayer_2/biases/part_0/read%dnn/hiddenlayer_2/weights/part_0/readdnn/logits/biases/part_0/readdnn/logits/weights/part_0/readglobal_step-linear/linear_model/alpha/weights/part_0/read,linear/linear_model/beta/weights/part_0/read,linear/linear_model/bias_weights/part_0/read*
dtypes
2	

save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*'
_class
loc:@save/ShardedFilename*
T0*
_output_shapes
: 

+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*
N*
T0*
_output_shapes
:*

axis 
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
T0*
_output_shapes
: 
|
save/RestoreV2/tensor_namesConst*
dtype0*-
value$B"Bdnn/hiddenlayer_0/biases*
_output_shapes
:
q
save/RestoreV2/shape_and_slicesConst*
dtype0*
valueBB	128 0,128*
_output_shapes
:

save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:
Щ
save/AssignAssigndnn/hiddenlayer_0/biases/part_0save/RestoreV2*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
use_locking(*
T0*
_output_shapes	
:

save/RestoreV2_1/tensor_namesConst*
dtype0*.
value%B#Bdnn/hiddenlayer_0/weights*
_output_shapes
:
y
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*$
valueBB6 128 0,6:0,128*
_output_shapes
:

save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes
:
г
save/Assign_1Assign dnn/hiddenlayer_0/weights/part_0save/RestoreV2_1*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
use_locking(*
T0*
_output_shapes
:	
~
save/RestoreV2_2/tensor_namesConst*
dtype0*-
value$B"Bdnn/hiddenlayer_1/biases*
_output_shapes
:
q
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
valueBB64 0,64*
_output_shapes
:

save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
Ь
save/Assign_2Assigndnn/hiddenlayer_1/biases/part_0save/RestoreV2_2*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
use_locking(*
T0*
_output_shapes
:@

save/RestoreV2_3/tensor_namesConst*
dtype0*.
value%B#Bdnn/hiddenlayer_1/weights*
_output_shapes
:
{
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*&
valueBB128 64 0,128:0,64*
_output_shapes
:

save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:
г
save/Assign_3Assign dnn/hiddenlayer_1/weights/part_0save/RestoreV2_3*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
use_locking(*
T0*
_output_shapes
:	@
~
save/RestoreV2_4/tensor_namesConst*
dtype0*-
value$B"Bdnn/hiddenlayer_2/biases*
_output_shapes
:
q
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*
valueBB32 0,32*
_output_shapes
:

save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes
:
Ь
save/Assign_4Assigndnn/hiddenlayer_2/biases/part_0save/RestoreV2_4*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
use_locking(*
T0*
_output_shapes
: 

save/RestoreV2_5/tensor_namesConst*
dtype0*.
value%B#Bdnn/hiddenlayer_2/weights*
_output_shapes
:
y
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*$
valueBB64 32 0,64:0,32*
_output_shapes
:

save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:
в
save/Assign_5Assign dnn/hiddenlayer_2/weights/part_0save/RestoreV2_5*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
use_locking(*
T0*
_output_shapes

:@ 
w
save/RestoreV2_6/tensor_namesConst*
dtype0*&
valueBBdnn/logits/biases*
_output_shapes
:
o
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*
valueBB1 0,1*
_output_shapes
:

save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:
О
save/Assign_6Assigndnn/logits/biases/part_0save/RestoreV2_6*
validate_shape(*+
_class!
loc:@dnn/logits/biases/part_0*
use_locking(*
T0*
_output_shapes
:
x
save/RestoreV2_7/tensor_namesConst*
dtype0*'
valueBBdnn/logits/weights*
_output_shapes
:
w
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*"
valueBB32 1 0,32:0,1*
_output_shapes
:

save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes
:
Ф
save/Assign_7Assigndnn/logits/weights/part_0save/RestoreV2_7*
validate_shape(*,
_class"
 loc:@dnn/logits/weights/part_0*
use_locking(*
T0*
_output_shapes

: 
q
save/RestoreV2_8/tensor_namesConst*
dtype0* 
valueBBglobal_step*
_output_shapes
:
j
!save/RestoreV2_8/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:

save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
dtypes
2	*
_output_shapes
:
 
save/Assign_8Assignglobal_stepsave/RestoreV2_8*
validate_shape(*
_class
loc:@global_step*
use_locking(*
T0	*
_output_shapes
: 

save/RestoreV2_9/tensor_namesConst*
dtype0*6
value-B+B!linear/linear_model/alpha/weights*
_output_shapes
:
u
!save/RestoreV2_9/shape_and_slicesConst*
dtype0* 
valueBB2 1 0,2:0,1*
_output_shapes
:

save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
dtypes
2*
_output_shapes
:
т
save/Assign_9Assign(linear/linear_model/alpha/weights/part_0save/RestoreV2_9*
validate_shape(*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
use_locking(*
T0*
_output_shapes

:

save/RestoreV2_10/tensor_namesConst*
dtype0*5
value,B*B linear/linear_model/beta/weights*
_output_shapes
:
v
"save/RestoreV2_10/shape_and_slicesConst*
dtype0* 
valueBB2 1 0,2:0,1*
_output_shapes
:

save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
dtypes
2*
_output_shapes
:
т
save/Assign_10Assign'linear/linear_model/beta/weights/part_0save/RestoreV2_10*
validate_shape(*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
use_locking(*
T0*
_output_shapes

:

save/RestoreV2_11/tensor_namesConst*
dtype0*5
value,B*B linear/linear_model/bias_weights*
_output_shapes
:
p
"save/RestoreV2_11/shape_and_slicesConst*
dtype0*
valueBB1 0,1*
_output_shapes
:

save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
dtypes
2*
_output_shapes
:
о
save/Assign_11Assign'linear/linear_model/bias_weights/part_0save/RestoreV2_11*
validate_shape(*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
use_locking(*
T0*
_output_shapes
:
к
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11
-
save/restore_allNoOp^save/restore_shard"mмJ     №
[	IіmћkжAJН

Х4Ѓ4
9
Add
x"T
y"T
z"T"
Ttype:
2	
S
AddN
inputs"T*N
sum"T"
Nint(0"
Ttype:
2	
P
Assert
	condition
	
data2T"
T
list(type)(0"
	summarizeint
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
p
	AssignAdd
ref"T

value"T

output_ref"T"
Ttype:
2	"
use_lockingbool( 
{
BiasAdd

value"T	
bias"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype

	DecodeCSV
records
record_defaults2OUT_TYPE
output2OUT_TYPE"$
OUT_TYPE
list(type)(0:
2	"
field_delimstring,
A
Equal
x"T
y"T
z
"
Ttype:
2	

W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
Ў
FIFOQueueV2

handle"!
component_types
list(type)(0"
shapeslist(shape)
 ("
capacityintџџџџџџџџџ"
	containerstring "
shared_namestring 
4
Fill
dims

value"T
output"T"	
Ttype

Gather
params"Tparams
indices"Tindices
output"Tparams"
validate_indicesbool("
Tparamstype"
Tindicestype:
2	
:
Greater
x"T
y"T
z
"
Ttype:
2		
?
GreaterEqual
x"T
y"T
z
"
Ttype:
2		
Ё
HashTableV2
table_handle"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetype
S
HistogramSummary
tag
values"T
summary"
Ttype0:
2		
.
Identity

input"T
output"T"	
Ttype
b
InitializeTableV2
table_handle
keys"Tkey
values"Tval"
Tkeytype"
Tvaltype
N
IsVariableInitialized
ref"dtype
is_initialized
"
dtypetype
\
ListDiff
x"T
y"T
out"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	


LogicalNot
x

y

w
LookupTableFindV2
table_handle
keys"Tin
default_value"Tout
values"Tout"
Tintype"
Touttype
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
8
MergeSummary
inputs*N
summary"
Nint(0
b
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
<
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
D
NotEqual
x"T
y"T
z
"
Ttype:
2	


OneHot
indices"TI	
depth
on_value"T
	off_value"T
output"T"
axisintџџџџџџџџџ"	
Ttype"
TItype0	:
2	
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
B
QueueCloseV2

handle"#
cancel_pending_enqueuesbool( 

QueueDequeueUpToV2

handle
n

components2component_types"!
component_types
list(type)(0"

timeout_msintџџџџџџџџџ
}
QueueEnqueueManyV2

handle

components2Tcomponents"
Tcomponents
list(type)(0"

timeout_msintџџџџџџџџџ
&
QueueSizeV2

handle
size
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
`
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:
2	
a
ReaderReadUpToV2
reader_handle
queue_handle
num_records	
keys

values
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
A
Relu
features"T
activations"T"
Ttype:
2		
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
l
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
i
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
M
ScalarSummary
tags
values"T
summary"
Ttype:
2		
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
y
SparseReorder
input_indices	
input_values"T
input_shape	
output_indices	
output_values"T"	
Ttype
h
SparseReshape
input_indices	
input_shape	
	new_shape	
output_indices	
output_shape	

SparseSegmentSum	
data"T
indices"Tidx
segment_ids
output"T"
Ttype:
2		"
Tidxtype0:
2	
М
SparseToDense
sparse_indices"Tindices
output_shape"Tindices
sparse_values"T
default_value"T

dense"T"
validate_indicesbool("	
Ttype"
Tindicestype:
2	
,
Sqrt
x"T
y"T"
Ttype:	
2
0
Square
x"T
y"T"
Ttype:
	2	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
і
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
5
Sub
x"T
y"T
z"T"
Ttype:
	2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
z
TextLineReaderV2
reader_handle"
skip_header_linesint "
	containerstring "
shared_namestring 
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
P
Unique
x"T
y"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
P
Unpack

value"T
output"T*num"
numint("	
Ttype"
axisint 
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring 

Where	
input
	
index	
&
	ZerosLike
x"T
y"T"	
Ttype*1.2.02v1.2.0-rc2-21-g12f033dн 	

global_step/Initializer/zerosConst*
dtype0	*
_class
loc:@global_step*
value	B	 R *
_output_shapes
: 

global_step
VariableV2*
	container *
_output_shapes
: *
dtype0	*
shape: *
_class
loc:@global_step*
shared_name 
В
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
validate_shape(*
_class
loc:@global_step*
use_locking(*
T0	*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
_class
loc:@global_step*
T0	*
_output_shapes
: 
s
input_producer/ConstConst*
dtype0*+
value"B B../data/valid-data.csv*
_output_shapes
:
U
input_producer/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
Z
input_producer/Greater/yConst*
dtype0*
value	B : *
_output_shapes
: 
q
input_producer/GreaterGreaterinput_producer/Sizeinput_producer/Greater/y*
T0*
_output_shapes
: 

input_producer/Assert/ConstConst*
dtype0*G
value>B< B6string_input_producer requires a non-null input tensor*
_output_shapes
: 

#input_producer/Assert/Assert/data_0Const*
dtype0*G
value>B< B6string_input_producer requires a non-null input tensor*
_output_shapes
: 

input_producer/Assert/AssertAssertinput_producer/Greater#input_producer/Assert/Assert/data_0*
	summarize*

T
2
}
input_producer/IdentityIdentityinput_producer/Const^input_producer/Assert/Assert*
T0*
_output_shapes
:

input_producerFIFOQueueV2*
capacity *
component_types
2*
_output_shapes
: *
shapes
: *
	container *
shared_name 

)input_producer/input_producer_EnqueueManyQueueEnqueueManyV2input_producerinput_producer/Identity*

timeout_msџџџџџџџџџ*
Tcomponents
2
b
#input_producer/input_producer_CloseQueueCloseV2input_producer*
cancel_pending_enqueues( 
d
%input_producer/input_producer_Close_1QueueCloseV2input_producer*
cancel_pending_enqueues(
Y
"input_producer/input_producer_SizeQueueSizeV2input_producer*
_output_shapes
: 
o
input_producer/CastCast"input_producer/input_producer_Size*

DstT0*

SrcT0*
_output_shapes
: 
Y
input_producer/mul/yConst*
dtype0*
valueB
 *   =*
_output_shapes
: 
e
input_producer/mulMulinput_producer/Castinput_producer/mul/y*
T0*
_output_shapes
: 

'input_producer/fraction_of_32_full/tagsConst*
dtype0*3
value*B( B"input_producer/fraction_of_32_full*
_output_shapes
: 

"input_producer/fraction_of_32_fullScalarSummary'input_producer/fraction_of_32_full/tagsinput_producer/mul*
T0*
_output_shapes
: 
y
TextLineReaderV2TextLineReaderV2*
shared_name *
	container *
skip_header_lines *
_output_shapes
: 
_
ReaderReadUpToV2/num_recordsConst*
dtype0	*
value
B	 Rє*
_output_shapes
: 

ReaderReadUpToV2ReaderReadUpToV2TextLineReaderV2input_producerReaderReadUpToV2/num_records*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ
Y
ExpandDims/dimConst*
dtype0*
valueB :
џџџџџџџџџ*
_output_shapes
: 
z

ExpandDims
ExpandDimsReaderReadUpToV2:1ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:џџџџџџџџџ
h
DecodeCSV/record_defaults_0Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_1Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_2Const*
dtype0*
valueB*    *
_output_shapes
:
d
DecodeCSV/record_defaults_3Const*
dtype0*
valueB
B *
_output_shapes
:
d
DecodeCSV/record_defaults_4Const*
dtype0*
valueB
B *
_output_shapes
:
h
DecodeCSV/record_defaults_5Const*
dtype0*
valueB*    *
_output_shapes
:

	DecodeCSV	DecodeCSV
ExpandDimsDecodeCSV/record_defaults_0DecodeCSV/record_defaults_1DecodeCSV/record_defaults_2DecodeCSV/record_defaults_3DecodeCSV/record_defaults_4DecodeCSV/record_defaults_5*
OUT_TYPE

2*
field_delim,*
_output_shapest
r:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
M
batch/ConstConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
Ж
batch/fifo_queueFIFOQueueV2*
capacity'*
component_types	
2*
_output_shapes
: **
shapes 
:::::*
	container *
shared_name 
К
batch/fifo_queue_EnqueueManyQueueEnqueueManyV2batch/fifo_queueDecodeCSV:3DecodeCSV:4DecodeCSV:5DecodeCSV:1DecodeCSV:2*

timeout_msџџџџџџџџџ*
Tcomponents	
2
W
batch/fifo_queue_CloseQueueCloseV2batch/fifo_queue*
cancel_pending_enqueues( 
Y
batch/fifo_queue_Close_1QueueCloseV2batch/fifo_queue*
cancel_pending_enqueues(
N
batch/fifo_queue_SizeQueueSizeV2batch/fifo_queue*
_output_shapes
: 
Y

batch/CastCastbatch/fifo_queue_Size*

DstT0*

SrcT0*
_output_shapes
: 
P
batch/mul/yConst*
dtype0*
valueB
 *ЗQ9*
_output_shapes
: 
J
	batch/mulMul
batch/Castbatch/mul/y*
T0*
_output_shapes
: 
|
 batch/fraction_of_5000_full/tagsConst*
dtype0*,
value#B! Bbatch/fraction_of_5000_full*
_output_shapes
: 
z
batch/fraction_of_5000_fullScalarSummary batch/fraction_of_5000_full/tags	batch/mul*
T0*
_output_shapes
: 
J
batch/nConst*
dtype0*
value
B :є*
_output_shapes
: 
ф
batchQueueDequeueUpToV2batch/fifo_queuebatch/n*

timeout_msџџџџџџџџџ*
component_types	
2*s
_output_shapesa
_:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ

Pdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/ShapeShapebatch*
out_type0*
T0*
_output_shapes
:
н
Odnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/CastCastPdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:

Sdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
э
Sdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/NotEqualNotEqualbatchSdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:џџџџџџџџџ
з
Pdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/WhereWhereSdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ
Ћ
Xdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
њ
Rdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/ReshapeReshapebatchXdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Reshape/shape*
Tshape0*
T0*#
_output_shapes
:џџџџџџџџџ
Џ
^dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Б
`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Б
`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
§
Xdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_sliceStridedSlicePdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Where^dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stack`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stack_1`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Б
`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Г
bdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Г
bdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:

Zdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1StridedSlicePdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Where`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stackbdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stack_1bdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
ч
Rdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/unstackUnpackOdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Cast*	
num*

axis *
T0	*
_output_shapes
: : 
ш
Pdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/stackPackTdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/unstack:1*
_output_shapes
:*

axis *
T0	*
N
Е
Ndnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/MulMulZdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_slice_1Pdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/stack*
T0	*'
_output_shapes
:џџџџџџџџџ
Њ
`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
в
Ndnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/SumSumNdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Mul`dnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Sum/reduction_indices*

Tidx0*
T0	*
	keep_dims( *#
_output_shapes
:џџџџџџџџџ
­
Ndnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/AddAddXdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/strided_sliceNdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Sum*
T0	*#
_output_shapes
:џџџџџџџџџ
л
Qdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/GatherGatherRdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/ReshapeNdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ
 
Mdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/ConstConst*
dtype0*
valueBBax01Bax02*
_output_shapes
:

Ldnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 

Sdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 

Sdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
і
Mdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/rangeRangeSdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/range/startLdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/SizeSdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/range/delta*

Tidx0*
_output_shapes
:
к
Odnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/ToInt64CastMdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
о
Rdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
Ѓ
Xdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 
ў
]dnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_table/table_initInitializeTableV2Rdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_tableMdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/ConstOdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/ToInt64*

Tkey0*

Tval0	

Ldnn/input_from_feature_columns/input_layer/alpha_indicator/hash_table_LookupLookupTableFindV2Rdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_tableQdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/GatherXdnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:џџџџџџџџџ
Ё
Vdnn/input_from_feature_columns/input_layer/alpha_indicator/SparseToDense/default_valueConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 

Hdnn/input_from_feature_columns/input_layer/alpha_indicator/SparseToDenseSparseToDensePdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/WhereOdnn/input_from_feature_columns/input_layer/alpha_indicator/to_sparse_input/CastLdnn/input_from_feature_columns/input_layer/alpha_indicator/hash_table_LookupVdnn/input_from_feature_columns/input_layer/alpha_indicator/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0	*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ

Hdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

Jdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/Const_1Const*
dtype0*
valueB
 *    *
_output_shapes
: 

Hdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/depthConst*
dtype0*
value	B :*
_output_shapes
: 

Kdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/on_valueConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

Ldnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/off_valueConst*
dtype0*
valueB
 *    *
_output_shapes
: 
й
Bdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hotOneHotHdnn/input_from_feature_columns/input_layer/alpha_indicator/SparseToDenseHdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/depthKdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/on_valueLdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hot/off_value*
TI0	*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ*
T0*
axisџџџџџџџџџ

Pdnn/input_from_feature_columns/input_layer/alpha_indicator/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
Њ
>dnn/input_from_feature_columns/input_layer/alpha_indicator/SumSumBdnn/input_from_feature_columns/input_layer/alpha_indicator/one_hotPdnn/input_from_feature_columns/input_layer/alpha_indicator/Sum/reduction_indices*

Tidx0*
T0*
	keep_dims( *'
_output_shapes
:џџџџџџџџџ
О
@dnn/input_from_feature_columns/input_layer/alpha_indicator/ShapeShape>dnn/input_from_feature_columns/input_layer/alpha_indicator/Sum*
out_type0*
T0*
_output_shapes
:

Ndnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Pdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Pdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
 
Hdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_sliceStridedSlice@dnn/input_from_feature_columns/input_layer/alpha_indicator/ShapeNdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stackPdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stack_1Pdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask

Jdnn/input_from_feature_columns/input_layer/alpha_indicator/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
 
Hdnn/input_from_feature_columns/input_layer/alpha_indicator/Reshape/shapePackHdnn/input_from_feature_columns/input_layer/alpha_indicator/strided_sliceJdnn/input_from_feature_columns/input_layer/alpha_indicator/Reshape/shape/1*
_output_shapes
:*

axis *
T0*
N

Bdnn/input_from_feature_columns/input_layer/alpha_indicator/ReshapeReshape>dnn/input_from_feature_columns/input_layer/alpha_indicator/SumHdnn/input_from_feature_columns/input_layer/alpha_indicator/Reshape/shape*
Tshape0*
T0*'
_output_shapes
:џџџџџџџџџ

Odnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/ShapeShapebatch:1*
out_type0*
T0*
_output_shapes
:
л
Ndnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/CastCastOdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:

Rdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
э
Rdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/NotEqualNotEqualbatch:1Rdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:џџџџџџџџџ
е
Odnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/WhereWhereRdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ
Њ
Wdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
њ
Qdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/ReshapeReshapebatch:1Wdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Reshape/shape*
Tshape0*
T0*#
_output_shapes
:џџџџџџџџџ
Ў
]dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
А
_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
А
_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ј
Wdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_sliceStridedSliceOdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Where]dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stack_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stack_1_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
А
_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
В
adnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
В
adnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:

Ydnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1StridedSliceOdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Where_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stackadnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stack_1adnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
х
Qdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/unstackUnpackNdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Cast*	
num*

axis *
T0	*
_output_shapes
: : 
ц
Odnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/stackPackSdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/unstack:1*
_output_shapes
:*

axis *
T0	*
N
В
Mdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/MulMulYdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_slice_1Odnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/stack*
T0	*'
_output_shapes
:џџџџџџџџџ
Љ
_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
Я
Mdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/SumSumMdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Mul_dnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Sum/reduction_indices*

Tidx0*
T0	*
	keep_dims( *#
_output_shapes
:џџџџџџџџџ
Њ
Mdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/AddAddWdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/strided_sliceMdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Sum*
T0	*#
_output_shapes
:џџџџџџџџџ
и
Pdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/GatherGatherQdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/ReshapeMdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ

Kdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/ConstConst*
dtype0*
valueBBbx01Bbx02*
_output_shapes
:

Jdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 

Qdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 

Qdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
ю
Kdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/rangeRangeQdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/range/startJdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/SizeQdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/range/delta*

Tidx0*
_output_shapes
:
ж
Mdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/ToInt64CastKdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
м
Pdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
Ё
Vdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 
і
[dnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_table/table_initInitializeTableV2Pdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_tableKdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/ConstMdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/ToInt64*

Tkey0*

Tval0	

Kdnn/input_from_feature_columns/input_layer/beta_indicator/hash_table_LookupLookupTableFindV2Pdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_tablePdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/GatherVdnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:џџџџџџџџџ
 
Udnn/input_from_feature_columns/input_layer/beta_indicator/SparseToDense/default_valueConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 

Gdnn/input_from_feature_columns/input_layer/beta_indicator/SparseToDenseSparseToDenseOdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/WhereNdnn/input_from_feature_columns/input_layer/beta_indicator/to_sparse_input/CastKdnn/input_from_feature_columns/input_layer/beta_indicator/hash_table_LookupUdnn/input_from_feature_columns/input_layer/beta_indicator/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0	*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ

Gdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

Idnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/Const_1Const*
dtype0*
valueB
 *    *
_output_shapes
: 

Gdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/depthConst*
dtype0*
value	B :*
_output_shapes
: 

Jdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/on_valueConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

Kdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/off_valueConst*
dtype0*
valueB
 *    *
_output_shapes
: 
д
Adnn/input_from_feature_columns/input_layer/beta_indicator/one_hotOneHotGdnn/input_from_feature_columns/input_layer/beta_indicator/SparseToDenseGdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/depthJdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/on_valueKdnn/input_from_feature_columns/input_layer/beta_indicator/one_hot/off_value*
TI0	*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ*
T0*
axisџџџџџџџџџ

Odnn/input_from_feature_columns/input_layer/beta_indicator/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
Ї
=dnn/input_from_feature_columns/input_layer/beta_indicator/SumSumAdnn/input_from_feature_columns/input_layer/beta_indicator/one_hotOdnn/input_from_feature_columns/input_layer/beta_indicator/Sum/reduction_indices*

Tidx0*
T0*
	keep_dims( *'
_output_shapes
:џџџџџџџџџ
М
?dnn/input_from_feature_columns/input_layer/beta_indicator/ShapeShape=dnn/input_from_feature_columns/input_layer/beta_indicator/Sum*
out_type0*
T0*
_output_shapes
:

Mdnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Odnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Odnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

Gdnn/input_from_feature_columns/input_layer/beta_indicator/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/beta_indicator/ShapeMdnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stackOdnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stack_1Odnn/input_from_feature_columns/input_layer/beta_indicator/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask

Idnn/input_from_feature_columns/input_layer/beta_indicator/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 

Gdnn/input_from_feature_columns/input_layer/beta_indicator/Reshape/shapePackGdnn/input_from_feature_columns/input_layer/beta_indicator/strided_sliceIdnn/input_from_feature_columns/input_layer/beta_indicator/Reshape/shape/1*
_output_shapes
:*

axis *
T0*
N

Adnn/input_from_feature_columns/input_layer/beta_indicator/ReshapeReshape=dnn/input_from_feature_columns/input_layer/beta_indicator/SumGdnn/input_from_feature_columns/input_layer/beta_indicator/Reshape/shape*
Tshape0*
T0*'
_output_shapes
:џџџџџџџџџ
y
2dnn/input_from_feature_columns/input_layer/x/ShapeShapebatch:3*
out_type0*
T0*
_output_shapes
:

@dnn/input_from_feature_columns/input_layer/x/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Bdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Bdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
к
:dnn/input_from_feature_columns/input_layer/x/strided_sliceStridedSlice2dnn/input_from_feature_columns/input_layer/x/Shape@dnn/input_from_feature_columns/input_layer/x/strided_slice/stackBdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_1Bdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
~
<dnn/input_from_feature_columns/input_layer/x/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
і
:dnn/input_from_feature_columns/input_layer/x/Reshape/shapePack:dnn/input_from_feature_columns/input_layer/x/strided_slice<dnn/input_from_feature_columns/input_layer/x/Reshape/shape/1*
_output_shapes
:*

axis *
T0*
N
Ф
4dnn/input_from_feature_columns/input_layer/x/ReshapeReshapebatch:3:dnn/input_from_feature_columns/input_layer/x/Reshape/shape*
Tshape0*
T0*'
_output_shapes
:џџџџџџџџџ
y
2dnn/input_from_feature_columns/input_layer/y/ShapeShapebatch:4*
out_type0*
T0*
_output_shapes
:

@dnn/input_from_feature_columns/input_layer/y/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Bdnn/input_from_feature_columns/input_layer/y/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Bdnn/input_from_feature_columns/input_layer/y/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
к
:dnn/input_from_feature_columns/input_layer/y/strided_sliceStridedSlice2dnn/input_from_feature_columns/input_layer/y/Shape@dnn/input_from_feature_columns/input_layer/y/strided_slice/stackBdnn/input_from_feature_columns/input_layer/y/strided_slice/stack_1Bdnn/input_from_feature_columns/input_layer/y/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
~
<dnn/input_from_feature_columns/input_layer/y/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
і
:dnn/input_from_feature_columns/input_layer/y/Reshape/shapePack:dnn/input_from_feature_columns/input_layer/y/strided_slice<dnn/input_from_feature_columns/input_layer/y/Reshape/shape/1*
_output_shapes
:*

axis *
T0*
N
Ф
4dnn/input_from_feature_columns/input_layer/y/ReshapeReshapebatch:4:dnn/input_from_feature_columns/input_layer/y/Reshape/shape*
Tshape0*
T0*'
_output_shapes
:џџџџџџџџџ
x
6dnn/input_from_feature_columns/input_layer/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
Џ
1dnn/input_from_feature_columns/input_layer/concatConcatV2Bdnn/input_from_feature_columns/input_layer/alpha_indicator/ReshapeAdnn/input_from_feature_columns/input_layer/beta_indicator/Reshape4dnn/input_from_feature_columns/input_layer/x/Reshape4dnn/input_from_feature_columns/input_layer/y/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0*
N
Ч
Adnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB"      *
_output_shapes
:
Й
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/minConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB
 *ЃЎXО*
_output_shapes
: 
Й
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB
 *ЃЎX>*
_output_shapes
: 
Ђ
Idnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shape*
_output_shapes
:	*
dtype0*
seed2 *

seed *
T0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0

?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes
: 
Б
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/sub*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes
:	
Ѓ
;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes
:	
Ы
 dnn/hiddenlayer_0/weights/part_0
VariableV2*
	container *
_output_shapes
:	*
dtype0*
shape:	*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
shared_name 

'dnn/hiddenlayer_0/weights/part_0/AssignAssign dnn/hiddenlayer_0/weights/part_0;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
use_locking(*
T0*
_output_shapes
:	
В
%dnn/hiddenlayer_0/weights/part_0/readIdentity dnn/hiddenlayer_0/weights/part_0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes
:	
Д
1dnn/hiddenlayer_0/biases/part_0/Initializer/zerosConst*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
valueB*    *
_output_shapes	
:
С
dnn/hiddenlayer_0/biases/part_0
VariableV2*
	container *
_output_shapes	
:*
dtype0*
shape:*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
shared_name 

&dnn/hiddenlayer_0/biases/part_0/AssignAssigndnn/hiddenlayer_0/biases/part_01dnn/hiddenlayer_0/biases/part_0/Initializer/zeros*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
use_locking(*
T0*
_output_shapes	
:
Ћ
$dnn/hiddenlayer_0/biases/part_0/readIdentitydnn/hiddenlayer_0/biases/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
T0*
_output_shapes	
:
v
dnn/hiddenlayer_0/weightsIdentity%dnn/hiddenlayer_0/weights/part_0/read*
T0*
_output_shapes
:	
Щ
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/weights*
transpose_b( *
transpose_a( *
T0*(
_output_shapes
:џџџџџџџџџ
p
dnn/hiddenlayer_0/biasesIdentity$dnn/hiddenlayer_0/biases/part_0/read*
T0*
_output_shapes	
:
Ђ
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/biases*
data_formatNHWC*
T0*(
_output_shapes
:џџџџџџџџџ
z
$dnn/hiddenlayer_0/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*(
_output_shapes
:џџџџџџџџџ
[
dnn/zero_fraction/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 

dnn/zero_fraction/EqualEqual$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*(
_output_shapes
:џџџџџџџџџ
y
dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*

DstT0*

SrcT0
*(
_output_shapes
:џџџџџџџџџ
h
dnn/zero_fraction/ConstConst*
dtype0*
valueB"       *
_output_shapes
:

dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
 
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*
dtype0*>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
_output_shapes
: 
Ћ
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_0/activation/tagConst*
dtype0*1
value(B& B dnn/dnn/hiddenlayer_0/activation*
_output_shapes
: 
Ё
 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tag$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes
: 
Ч
Adnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB"   @   *
_output_shapes
:
Й
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/minConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB
 *ѓ5О*
_output_shapes
: 
Й
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB
 *ѓ5>*
_output_shapes
: 
Ђ
Idnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shape*
_output_shapes
:	@*
dtype0*
seed2 *

seed *
T0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0

?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes
: 
Б
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/sub*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes
:	@
Ѓ
;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes
:	@
Ы
 dnn/hiddenlayer_1/weights/part_0
VariableV2*
	container *
_output_shapes
:	@*
dtype0*
shape:	@*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
shared_name 

'dnn/hiddenlayer_1/weights/part_0/AssignAssign dnn/hiddenlayer_1/weights/part_0;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
use_locking(*
T0*
_output_shapes
:	@
В
%dnn/hiddenlayer_1/weights/part_0/readIdentity dnn/hiddenlayer_1/weights/part_0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes
:	@
В
1dnn/hiddenlayer_1/biases/part_0/Initializer/zerosConst*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
valueB@*    *
_output_shapes
:@
П
dnn/hiddenlayer_1/biases/part_0
VariableV2*
	container *
_output_shapes
:@*
dtype0*
shape:@*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
shared_name 

&dnn/hiddenlayer_1/biases/part_0/AssignAssigndnn/hiddenlayer_1/biases/part_01dnn/hiddenlayer_1/biases/part_0/Initializer/zeros*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
use_locking(*
T0*
_output_shapes
:@
Њ
$dnn/hiddenlayer_1/biases/part_0/readIdentitydnn/hiddenlayer_1/biases/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
T0*
_output_shapes
:@
v
dnn/hiddenlayer_1/weightsIdentity%dnn/hiddenlayer_1/weights/part_0/read*
T0*
_output_shapes
:	@
Л
dnn/hiddenlayer_1/MatMulMatMul$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/hiddenlayer_1/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:џџџџџџџџџ@
o
dnn/hiddenlayer_1/biasesIdentity$dnn/hiddenlayer_1/biases/part_0/read*
T0*
_output_shapes
:@
Ё
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/biases*
data_formatNHWC*
T0*'
_output_shapes
:џџџџџџџџџ@
y
$dnn/hiddenlayer_1/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*'
_output_shapes
:џџџџџџџџџ@
]
dnn/zero_fraction_1/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 

dnn/zero_fraction_1/EqualEqual$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/zero_fraction_1/zero*
T0*'
_output_shapes
:џџџџџџџџџ@
|
dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*

DstT0*

SrcT0
*'
_output_shapes
:џџџџџџџџџ@
j
dnn/zero_fraction_1/ConstConst*
dtype0*
valueB"       *
_output_shapes
:

dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
 
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*
dtype0*>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values*
_output_shapes
: 
­
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_1/activation/tagConst*
dtype0*1
value(B& B dnn/dnn/hiddenlayer_1/activation*
_output_shapes
: 
Ё
 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tag$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes
: 
Ч
Adnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
valueB"@       *
_output_shapes
:
Й
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/minConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
valueB
 *  О*
_output_shapes
: 
Й
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
valueB
 *  >*
_output_shapes
: 
Ё
Idnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shape*
_output_shapes

:@ *
dtype0*
seed2 *

seed *
T0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0

?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes
: 
А
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/sub*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes

:@ 
Ђ
;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes

:@ 
Щ
 dnn/hiddenlayer_2/weights/part_0
VariableV2*
	container *
_output_shapes

:@ *
dtype0*
shape
:@ *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
shared_name 

'dnn/hiddenlayer_2/weights/part_0/AssignAssign dnn/hiddenlayer_2/weights/part_0;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
use_locking(*
T0*
_output_shapes

:@ 
Б
%dnn/hiddenlayer_2/weights/part_0/readIdentity dnn/hiddenlayer_2/weights/part_0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes

:@ 
В
1dnn/hiddenlayer_2/biases/part_0/Initializer/zerosConst*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
valueB *    *
_output_shapes
: 
П
dnn/hiddenlayer_2/biases/part_0
VariableV2*
	container *
_output_shapes
: *
dtype0*
shape: *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
shared_name 

&dnn/hiddenlayer_2/biases/part_0/AssignAssigndnn/hiddenlayer_2/biases/part_01dnn/hiddenlayer_2/biases/part_0/Initializer/zeros*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
use_locking(*
T0*
_output_shapes
: 
Њ
$dnn/hiddenlayer_2/biases/part_0/readIdentitydnn/hiddenlayer_2/biases/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
T0*
_output_shapes
: 
u
dnn/hiddenlayer_2/weightsIdentity%dnn/hiddenlayer_2/weights/part_0/read*
T0*
_output_shapes

:@ 
Л
dnn/hiddenlayer_2/MatMulMatMul$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/hiddenlayer_2/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:џџџџџџџџџ 
o
dnn/hiddenlayer_2/biasesIdentity$dnn/hiddenlayer_2/biases/part_0/read*
T0*
_output_shapes
: 
Ё
dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/biases*
data_formatNHWC*
T0*'
_output_shapes
:џџџџџџџџџ 
y
$dnn/hiddenlayer_2/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*'
_output_shapes
:џџџџџџџџџ 
]
dnn/zero_fraction_2/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 

dnn/zero_fraction_2/EqualEqual$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/zero_fraction_2/zero*
T0*'
_output_shapes
:џџџџџџџџџ 
|
dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

DstT0*

SrcT0
*'
_output_shapes
:џџџџџџџџџ 
j
dnn/zero_fraction_2/ConstConst*
dtype0*
valueB"       *
_output_shapes
:

dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
 
2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsConst*
dtype0*>
value5B3 B-dnn/dnn/hiddenlayer_2/fraction_of_zero_values*
_output_shapes
: 
­
-dnn/dnn/hiddenlayer_2/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_2/activation/tagConst*
dtype0*1
value(B& B dnn/dnn/hiddenlayer_2/activation*
_output_shapes
: 
Ё
 dnn/dnn/hiddenlayer_2/activationHistogramSummary$dnn/dnn/hiddenlayer_2/activation/tag$dnn/hiddenlayer_2/hiddenlayer_2/Relu*
T0*
_output_shapes
: 
Й
:dnn/logits/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB"       *
_output_shapes
:
Ћ
8dnn/logits/weights/part_0/Initializer/random_uniform/minConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB
 *JQкО*
_output_shapes
: 
Ћ
8dnn/logits/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB
 *JQк>*
_output_shapes
: 

Bdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniform:dnn/logits/weights/part_0/Initializer/random_uniform/shape*
_output_shapes

: *
dtype0*
seed2 *

seed *
T0*,
_class"
 loc:@dnn/logits/weights/part_0

8dnn/logits/weights/part_0/Initializer/random_uniform/subSub8dnn/logits/weights/part_0/Initializer/random_uniform/max8dnn/logits/weights/part_0/Initializer/random_uniform/min*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes
: 

8dnn/logits/weights/part_0/Initializer/random_uniform/mulMulBdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniform8dnn/logits/weights/part_0/Initializer/random_uniform/sub*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

: 

4dnn/logits/weights/part_0/Initializer/random_uniformAdd8dnn/logits/weights/part_0/Initializer/random_uniform/mul8dnn/logits/weights/part_0/Initializer/random_uniform/min*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

: 
Л
dnn/logits/weights/part_0
VariableV2*
	container *
_output_shapes

: *
dtype0*
shape
: *,
_class"
 loc:@dnn/logits/weights/part_0*
shared_name 
ћ
 dnn/logits/weights/part_0/AssignAssigndnn/logits/weights/part_04dnn/logits/weights/part_0/Initializer/random_uniform*
validate_shape(*,
_class"
 loc:@dnn/logits/weights/part_0*
use_locking(*
T0*
_output_shapes

: 

dnn/logits/weights/part_0/readIdentitydnn/logits/weights/part_0*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

: 
Є
*dnn/logits/biases/part_0/Initializer/zerosConst*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
valueB*    *
_output_shapes
:
Б
dnn/logits/biases/part_0
VariableV2*
	container *
_output_shapes
:*
dtype0*
shape:*+
_class!
loc:@dnn/logits/biases/part_0*
shared_name 
ъ
dnn/logits/biases/part_0/AssignAssigndnn/logits/biases/part_0*dnn/logits/biases/part_0/Initializer/zeros*
validate_shape(*+
_class!
loc:@dnn/logits/biases/part_0*
use_locking(*
T0*
_output_shapes
:

dnn/logits/biases/part_0/readIdentitydnn/logits/biases/part_0*+
_class!
loc:@dnn/logits/biases/part_0*
T0*
_output_shapes
:
g
dnn/logits/weightsIdentitydnn/logits/weights/part_0/read*
T0*
_output_shapes

: 
­
dnn/logits/MatMulMatMul$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/logits/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:џџџџџџџџџ
a
dnn/logits/biasesIdentitydnn/logits/biases/part_0/read*
T0*
_output_shapes
:

dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/biases*
data_formatNHWC*
T0*'
_output_shapes
:џџџџџџџџџ
]
dnn/zero_fraction_3/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 

dnn/zero_fraction_3/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_3/zero*
T0*'
_output_shapes
:џџџџџџџџџ
|
dnn/zero_fraction_3/CastCastdnn/zero_fraction_3/Equal*

DstT0*

SrcT0
*'
_output_shapes
:џџџџџџџџџ
j
dnn/zero_fraction_3/ConstConst*
dtype0*
valueB"       *
_output_shapes
:

dnn/zero_fraction_3/MeanMeandnn/zero_fraction_3/Castdnn/zero_fraction_3/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 

+dnn/dnn/logits/fraction_of_zero_values/tagsConst*
dtype0*7
value.B, B&dnn/dnn/logits/fraction_of_zero_values*
_output_shapes
: 

&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_3/Mean*
T0*
_output_shapes
: 
w
dnn/dnn/logits/activation/tagConst*
dtype0**
value!B Bdnn/dnn/logits/activation*
_output_shapes
: 

dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
T0*
_output_shapes
: 
t
/linear/linear_model/alpha/to_sparse_input/ShapeShapebatch*
out_type0*
T0*
_output_shapes
:

.linear/linear_model/alpha/to_sparse_input/CastCast/linear/linear_model/alpha/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
s
2linear/linear_model/alpha/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
Ћ
2linear/linear_model/alpha/to_sparse_input/NotEqualNotEqualbatch2linear/linear_model/alpha/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:џџџџџџџџџ

/linear/linear_model/alpha/to_sparse_input/WhereWhere2linear/linear_model/alpha/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ

7linear/linear_model/alpha/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
И
1linear/linear_model/alpha/to_sparse_input/ReshapeReshapebatch7linear/linear_model/alpha/to_sparse_input/Reshape/shape*
Tshape0*
T0*#
_output_shapes
:џџџџџџџџџ

=linear/linear_model/alpha/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:

?linear/linear_model/alpha/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:

?linear/linear_model/alpha/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
и
7linear/linear_model/alpha/to_sparse_input/strided_sliceStridedSlice/linear/linear_model/alpha/to_sparse_input/Where=linear/linear_model/alpha/to_sparse_input/strided_slice/stack?linear/linear_model/alpha/to_sparse_input/strided_slice/stack_1?linear/linear_model/alpha/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask

?linear/linear_model/alpha/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:

Alinear/linear_model/alpha/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:

Alinear/linear_model/alpha/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ф
9linear/linear_model/alpha/to_sparse_input/strided_slice_1StridedSlice/linear/linear_model/alpha/to_sparse_input/Where?linear/linear_model/alpha/to_sparse_input/strided_slice_1/stackAlinear/linear_model/alpha/to_sparse_input/strided_slice_1/stack_1Alinear/linear_model/alpha/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
Ѕ
1linear/linear_model/alpha/to_sparse_input/unstackUnpack.linear/linear_model/alpha/to_sparse_input/Cast*	
num*

axis *
T0	*
_output_shapes
: : 
І
/linear/linear_model/alpha/to_sparse_input/stackPack3linear/linear_model/alpha/to_sparse_input/unstack:1*
_output_shapes
:*

axis *
T0	*
N
в
-linear/linear_model/alpha/to_sparse_input/MulMul9linear/linear_model/alpha/to_sparse_input/strided_slice_1/linear/linear_model/alpha/to_sparse_input/stack*
T0	*'
_output_shapes
:џџџџџџџџџ

?linear/linear_model/alpha/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
я
-linear/linear_model/alpha/to_sparse_input/SumSum-linear/linear_model/alpha/to_sparse_input/Mul?linear/linear_model/alpha/to_sparse_input/Sum/reduction_indices*

Tidx0*
T0	*
	keep_dims( *#
_output_shapes
:џџџџџџџџџ
Ъ
-linear/linear_model/alpha/to_sparse_input/AddAdd7linear/linear_model/alpha/to_sparse_input/strided_slice-linear/linear_model/alpha/to_sparse_input/Sum*
T0	*#
_output_shapes
:џџџџџџџџџ
ј
0linear/linear_model/alpha/to_sparse_input/GatherGather1linear/linear_model/alpha/to_sparse_input/Reshape-linear/linear_model/alpha/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ

,linear/linear_model/alpha/alpha_lookup/ConstConst*
dtype0*
valueBBax01Bax02*
_output_shapes
:
m
+linear/linear_model/alpha/alpha_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
t
2linear/linear_model/alpha/alpha_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
t
2linear/linear_model/alpha/alpha_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
ђ
,linear/linear_model/alpha/alpha_lookup/rangeRange2linear/linear_model/alpha/alpha_lookup/range/start+linear/linear_model/alpha/alpha_lookup/Size2linear/linear_model/alpha/alpha_lookup/range/delta*

Tidx0*
_output_shapes
:

.linear/linear_model/alpha/alpha_lookup/ToInt64Cast,linear/linear_model/alpha/alpha_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
Н
1linear/linear_model/alpha/alpha_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 

7linear/linear_model/alpha/alpha_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 
њ
<linear/linear_model/alpha/alpha_lookup/hash_table/table_initInitializeTableV21linear/linear_model/alpha/alpha_lookup/hash_table,linear/linear_model/alpha/alpha_lookup/Const.linear/linear_model/alpha/alpha_lookup/ToInt64*

Tkey0*

Tval0	

+linear/linear_model/alpha/hash_table_LookupLookupTableFindV21linear/linear_model/alpha/alpha_lookup/hash_table0linear/linear_model/alpha/to_sparse_input/Gather7linear/linear_model/alpha/alpha_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:џџџџџџџџџ

$linear/linear_model/alpha/Shape/CastCast.linear/linear_model/alpha/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
w
-linear/linear_model/alpha/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
y
/linear/linear_model/alpha/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
y
/linear/linear_model/alpha/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

'linear/linear_model/alpha/strided_sliceStridedSlice$linear/linear_model/alpha/Shape/Cast-linear/linear_model/alpha/strided_slice/stack/linear/linear_model/alpha/strided_slice/stack_1/linear/linear_model/alpha/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
m
"linear/linear_model/alpha/Cast/x/1Const*
dtype0*
valueB :
џџџџџџџџџ*
_output_shapes
: 
Џ
 linear/linear_model/alpha/Cast/xPack'linear/linear_model/alpha/strided_slice"linear/linear_model/alpha/Cast/x/1*
_output_shapes
:*

axis *
T0*
N
|
linear/linear_model/alpha/CastCast linear/linear_model/alpha/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
ш
'linear/linear_model/alpha/SparseReshapeSparseReshape/linear/linear_model/alpha/to_sparse_input/Where.linear/linear_model/alpha/to_sparse_input/Castlinear/linear_model/alpha/Cast*-
_output_shapes
:џџџџџџџџџ:

0linear/linear_model/alpha/SparseReshape/IdentityIdentity+linear/linear_model/alpha/hash_table_Lookup*
T0	*#
_output_shapes
:џџџџџџџџџ
Ь
:linear/linear_model/alpha/weights/part_0/Initializer/zerosConst*
dtype0*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
valueB*    *
_output_shapes

:
й
(linear/linear_model/alpha/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
shared_name 
Ў
/linear/linear_model/alpha/weights/part_0/AssignAssign(linear/linear_model/alpha/weights/part_0:linear/linear_model/alpha/weights/part_0/Initializer/zeros*
validate_shape(*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
use_locking(*
T0*
_output_shapes

:
Щ
-linear/linear_model/alpha/weights/part_0/readIdentity(linear/linear_model/alpha/weights/part_0*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
T0*
_output_shapes

:
|
2linear/linear_model/alpha/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
{
1linear/linear_model/alpha/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
љ
,linear/linear_model/alpha/weighted_sum/SliceSlice)linear/linear_model/alpha/SparseReshape:12linear/linear_model/alpha/weighted_sum/Slice/begin1linear/linear_model/alpha/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
v
,linear/linear_model/alpha/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
Э
+linear/linear_model/alpha/weighted_sum/ProdProd,linear/linear_model/alpha/weighted_sum/Slice,linear/linear_model/alpha/weighted_sum/Const*

Tidx0*
T0	*
	keep_dims( *
_output_shapes
: 
w
5linear/linear_model/alpha/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
ш
-linear/linear_model/alpha/weighted_sum/GatherGather)linear/linear_model/alpha/SparseReshape:15linear/linear_model/alpha/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
Ы
-linear/linear_model/alpha/weighted_sum/Cast/xPack+linear/linear_model/alpha/weighted_sum/Prod-linear/linear_model/alpha/weighted_sum/Gather*
_output_shapes
:*

axis *
T0	*
N
ї
4linear/linear_model/alpha/weighted_sum/SparseReshapeSparseReshape'linear/linear_model/alpha/SparseReshape)linear/linear_model/alpha/SparseReshape:1-linear/linear_model/alpha/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
Љ
=linear/linear_model/alpha/weighted_sum/SparseReshape/IdentityIdentity0linear/linear_model/alpha/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ
w
5linear/linear_model/alpha/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
ч
3linear/linear_model/alpha/weighted_sum/GreaterEqualGreaterEqual=linear/linear_model/alpha/weighted_sum/SparseReshape/Identity5linear/linear_model/alpha/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ

,linear/linear_model/alpha/weighted_sum/WhereWhere3linear/linear_model/alpha/weighted_sum/GreaterEqual*'
_output_shapes
:џџџџџџџџџ

4linear/linear_model/alpha/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
й
.linear/linear_model/alpha/weighted_sum/ReshapeReshape,linear/linear_model/alpha/weighted_sum/Where4linear/linear_model/alpha/weighted_sum/Reshape/shape*
Tshape0*
T0	*#
_output_shapes
:џџџџџџџџџ
џ
/linear/linear_model/alpha/weighted_sum/Gather_1Gather4linear/linear_model/alpha/weighted_sum/SparseReshape.linear/linear_model/alpha/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:џџџџџџџџџ

/linear/linear_model/alpha/weighted_sum/Gather_2Gather=linear/linear_model/alpha/weighted_sum/SparseReshape/Identity.linear/linear_model/alpha/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:џџџџџџџџџ

/linear/linear_model/alpha/weighted_sum/IdentityIdentity6linear/linear_model/alpha/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 

Nlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice/linear/linear_model/alpha/weighted_sum/IdentityNlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stackPlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
С
?linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/CastCastHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 

Flinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 

Flinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ы
@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/rangeRangeFlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/range/start?linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/CastFlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:џџџџџџџџџ
Ш
Alinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Cast_1Cast@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:џџџџџџџџџ
Ё
Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ѓ
Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ѓ
Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Є
Jlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice/linear/linear_model/alpha/weighted_sum/Gather_1Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackRlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Њ
Clinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ListDiffListDiffAlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Cast_1Jlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

Plinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:

Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

Jlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice/linear/linear_model/alpha/weighted_sum/IdentityPlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackRlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Rlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask

Ilinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
џџџџџџџџџ*
_output_shapes
: 

Elinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsJlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/strided_slice_2Ilinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:

Vlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 

Vlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
ы
Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseClinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ListDiffElinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ExpandDimsVlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesVlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:џџџџџџџџџ

Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"џџџџ   *
_output_shapes
:

Blinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ReshapeReshapeClinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ListDiffHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Reshape/shape*
Tshape0*
T0	*'
_output_shapes
:џџџџџџџџџ
Ш
Elinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeBlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:џџџџџџџџџ

Flinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
ч
Alinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concatConcatV2Blinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ReshapeElinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/zeros_likeFlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat/axis*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0	*
N
У
@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ShapeShapeClinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
љ
?linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/FillFill@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Shape@linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:џџџџџџџџџ

Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
д
Clinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_1ConcatV2/linear/linear_model/alpha/weighted_sum/Gather_1Alinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concatHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_1/axis*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0	*
N

Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ю
Clinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_2ConcatV2/linear/linear_model/alpha/weighted_sum/Gather_2?linear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/FillHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_2/axis*#
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0	*
N
е
Hlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderClinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_1Clinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/concat_2/linear/linear_model/alpha/weighted_sum/Identity*
T0	*6
_output_shapes$
":џџџџџџџџџ:џџџџџџџџџ
Ѕ
Clinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/IdentityIdentity/linear/linear_model/alpha/weighted_sum/Identity*
T0	*
_output_shapes
:
Ѓ
Rlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ѕ
Tlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ѕ
Tlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Х
Llinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseReorderRlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stackTlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Tlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
ж
Clinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/CastCastLlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:џџџџџџџџџ
ч
Elinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/UniqueUniqueJlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ
ь
Olinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/embedding_lookupGather-linear/linear_model/alpha/weights/part_0/readElinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*'
_output_shapes
:џџџџџџџџџ
я
>linear/linear_model/alpha/weighted_sum/embedding_lookup_sparseSparseSegmentSumOlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/embedding_lookupGlinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/Unique:1Clinear/linear_model/alpha/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:џџџџџџџџџ

6linear/linear_model/alpha/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"џџџџ   *
_output_shapes
:
§
0linear/linear_model/alpha/weighted_sum/Reshape_1ReshapeHlinear/linear_model/alpha/weighted_sum/SparseFillEmptyRows/SparseToDense6linear/linear_model/alpha/weighted_sum/Reshape_1/shape*
Tshape0*
T0
*'
_output_shapes
:џџџџџџџџџ
Њ
,linear/linear_model/alpha/weighted_sum/ShapeShape>linear/linear_model/alpha/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:

:linear/linear_model/alpha/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:

<linear/linear_model/alpha/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

<linear/linear_model/alpha/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
М
4linear/linear_model/alpha/weighted_sum/strided_sliceStridedSlice,linear/linear_model/alpha/weighted_sum/Shape:linear/linear_model/alpha/weighted_sum/strided_slice/stack<linear/linear_model/alpha/weighted_sum/strided_slice/stack_1<linear/linear_model/alpha/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
p
.linear/linear_model/alpha/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
д
,linear/linear_model/alpha/weighted_sum/stackPack.linear/linear_model/alpha/weighted_sum/stack/04linear/linear_model/alpha/weighted_sum/strided_slice*
_output_shapes
:*

axis *
T0*
N
р
+linear/linear_model/alpha/weighted_sum/TileTile0linear/linear_model/alpha/weighted_sum/Reshape_1,linear/linear_model/alpha/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
А
1linear/linear_model/alpha/weighted_sum/zeros_like	ZerosLike>linear/linear_model/alpha/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ

&linear/linear_model/alpha/weighted_sumSelect+linear/linear_model/alpha/weighted_sum/Tile1linear/linear_model/alpha/weighted_sum/zeros_like>linear/linear_model/alpha/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ

-linear/linear_model/alpha/weighted_sum/Cast_1Cast)linear/linear_model/alpha/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
~
4linear/linear_model/alpha/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
}
3linear/linear_model/alpha/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:

.linear/linear_model/alpha/weighted_sum/Slice_1Slice-linear/linear_model/alpha/weighted_sum/Cast_14linear/linear_model/alpha/weighted_sum/Slice_1/begin3linear/linear_model/alpha/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:

.linear/linear_model/alpha/weighted_sum/Shape_1Shape&linear/linear_model/alpha/weighted_sum*
out_type0*
T0*
_output_shapes
:
~
4linear/linear_model/alpha/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:

3linear/linear_model/alpha/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:

.linear/linear_model/alpha/weighted_sum/Slice_2Slice.linear/linear_model/alpha/weighted_sum/Shape_14linear/linear_model/alpha/weighted_sum/Slice_2/begin3linear/linear_model/alpha/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
t
2linear/linear_model/alpha/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 

-linear/linear_model/alpha/weighted_sum/concatConcatV2.linear/linear_model/alpha/weighted_sum/Slice_1.linear/linear_model/alpha/weighted_sum/Slice_22linear/linear_model/alpha/weighted_sum/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
в
0linear/linear_model/alpha/weighted_sum/Reshape_2Reshape&linear/linear_model/alpha/weighted_sum-linear/linear_model/alpha/weighted_sum/concat*
Tshape0*
T0*'
_output_shapes
:џџџџџџџџџ
u
.linear/linear_model/beta/to_sparse_input/ShapeShapebatch:1*
out_type0*
T0*
_output_shapes
:

-linear/linear_model/beta/to_sparse_input/CastCast.linear/linear_model/beta/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
r
1linear/linear_model/beta/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
Ћ
1linear/linear_model/beta/to_sparse_input/NotEqualNotEqualbatch:11linear/linear_model/beta/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:џџџџџџџџџ

.linear/linear_model/beta/to_sparse_input/WhereWhere1linear/linear_model/beta/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ

6linear/linear_model/beta/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
И
0linear/linear_model/beta/to_sparse_input/ReshapeReshapebatch:16linear/linear_model/beta/to_sparse_input/Reshape/shape*
Tshape0*
T0*#
_output_shapes
:џџџџџџџџџ

<linear/linear_model/beta/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:

>linear/linear_model/beta/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:

>linear/linear_model/beta/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
г
6linear/linear_model/beta/to_sparse_input/strided_sliceStridedSlice.linear/linear_model/beta/to_sparse_input/Where<linear/linear_model/beta/to_sparse_input/strided_slice/stack>linear/linear_model/beta/to_sparse_input/strided_slice/stack_1>linear/linear_model/beta/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask

>linear/linear_model/beta/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:

@linear/linear_model/beta/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:

@linear/linear_model/beta/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
п
8linear/linear_model/beta/to_sparse_input/strided_slice_1StridedSlice.linear/linear_model/beta/to_sparse_input/Where>linear/linear_model/beta/to_sparse_input/strided_slice_1/stack@linear/linear_model/beta/to_sparse_input/strided_slice_1/stack_1@linear/linear_model/beta/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
Ѓ
0linear/linear_model/beta/to_sparse_input/unstackUnpack-linear/linear_model/beta/to_sparse_input/Cast*	
num*

axis *
T0	*
_output_shapes
: : 
Є
.linear/linear_model/beta/to_sparse_input/stackPack2linear/linear_model/beta/to_sparse_input/unstack:1*
_output_shapes
:*

axis *
T0	*
N
Я
,linear/linear_model/beta/to_sparse_input/MulMul8linear/linear_model/beta/to_sparse_input/strided_slice_1.linear/linear_model/beta/to_sparse_input/stack*
T0	*'
_output_shapes
:џџџџџџџџџ

>linear/linear_model/beta/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
ь
,linear/linear_model/beta/to_sparse_input/SumSum,linear/linear_model/beta/to_sparse_input/Mul>linear/linear_model/beta/to_sparse_input/Sum/reduction_indices*

Tidx0*
T0	*
	keep_dims( *#
_output_shapes
:џџџџџџџџџ
Ч
,linear/linear_model/beta/to_sparse_input/AddAdd6linear/linear_model/beta/to_sparse_input/strided_slice,linear/linear_model/beta/to_sparse_input/Sum*
T0	*#
_output_shapes
:џџџџџџџџџ
ѕ
/linear/linear_model/beta/to_sparse_input/GatherGather0linear/linear_model/beta/to_sparse_input/Reshape,linear/linear_model/beta/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ
}
*linear/linear_model/beta/beta_lookup/ConstConst*
dtype0*
valueBBbx01Bbx02*
_output_shapes
:
k
)linear/linear_model/beta/beta_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
r
0linear/linear_model/beta/beta_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
r
0linear/linear_model/beta/beta_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
ъ
*linear/linear_model/beta/beta_lookup/rangeRange0linear/linear_model/beta/beta_lookup/range/start)linear/linear_model/beta/beta_lookup/Size0linear/linear_model/beta/beta_lookup/range/delta*

Tidx0*
_output_shapes
:

,linear/linear_model/beta/beta_lookup/ToInt64Cast*linear/linear_model/beta/beta_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
Л
/linear/linear_model/beta/beta_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 

5linear/linear_model/beta/beta_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
џџџџџџџџџ*
_output_shapes
: 
ђ
:linear/linear_model/beta/beta_lookup/hash_table/table_initInitializeTableV2/linear/linear_model/beta/beta_lookup/hash_table*linear/linear_model/beta/beta_lookup/Const,linear/linear_model/beta/beta_lookup/ToInt64*

Tkey0*

Tval0	

*linear/linear_model/beta/hash_table_LookupLookupTableFindV2/linear/linear_model/beta/beta_lookup/hash_table/linear/linear_model/beta/to_sparse_input/Gather5linear/linear_model/beta/beta_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:џџџџџџџџџ

#linear/linear_model/beta/Shape/CastCast-linear/linear_model/beta/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
v
,linear/linear_model/beta/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
x
.linear/linear_model/beta/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
x
.linear/linear_model/beta/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ћ
&linear/linear_model/beta/strided_sliceStridedSlice#linear/linear_model/beta/Shape/Cast,linear/linear_model/beta/strided_slice/stack.linear/linear_model/beta/strided_slice/stack_1.linear/linear_model/beta/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
l
!linear/linear_model/beta/Cast/x/1Const*
dtype0*
valueB :
џџџџџџџџџ*
_output_shapes
: 
Ќ
linear/linear_model/beta/Cast/xPack&linear/linear_model/beta/strided_slice!linear/linear_model/beta/Cast/x/1*
_output_shapes
:*

axis *
T0*
N
z
linear/linear_model/beta/CastCastlinear/linear_model/beta/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
ф
&linear/linear_model/beta/SparseReshapeSparseReshape.linear/linear_model/beta/to_sparse_input/Where-linear/linear_model/beta/to_sparse_input/Castlinear/linear_model/beta/Cast*-
_output_shapes
:џџџџџџџџџ:

/linear/linear_model/beta/SparseReshape/IdentityIdentity*linear/linear_model/beta/hash_table_Lookup*
T0	*#
_output_shapes
:џџџџџџџџџ
Ъ
9linear/linear_model/beta/weights/part_0/Initializer/zerosConst*
dtype0*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
valueB*    *
_output_shapes

:
з
'linear/linear_model/beta/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
shared_name 
Њ
.linear/linear_model/beta/weights/part_0/AssignAssign'linear/linear_model/beta/weights/part_09linear/linear_model/beta/weights/part_0/Initializer/zeros*
validate_shape(*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
use_locking(*
T0*
_output_shapes

:
Ц
,linear/linear_model/beta/weights/part_0/readIdentity'linear/linear_model/beta/weights/part_0*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
T0*
_output_shapes

:
{
1linear/linear_model/beta/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
z
0linear/linear_model/beta/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
ѕ
+linear/linear_model/beta/weighted_sum/SliceSlice(linear/linear_model/beta/SparseReshape:11linear/linear_model/beta/weighted_sum/Slice/begin0linear/linear_model/beta/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
u
+linear/linear_model/beta/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
Ъ
*linear/linear_model/beta/weighted_sum/ProdProd+linear/linear_model/beta/weighted_sum/Slice+linear/linear_model/beta/weighted_sum/Const*

Tidx0*
T0	*
	keep_dims( *
_output_shapes
: 
v
4linear/linear_model/beta/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
х
,linear/linear_model/beta/weighted_sum/GatherGather(linear/linear_model/beta/SparseReshape:14linear/linear_model/beta/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
Ш
,linear/linear_model/beta/weighted_sum/Cast/xPack*linear/linear_model/beta/weighted_sum/Prod,linear/linear_model/beta/weighted_sum/Gather*
_output_shapes
:*

axis *
T0	*
N
ѓ
3linear/linear_model/beta/weighted_sum/SparseReshapeSparseReshape&linear/linear_model/beta/SparseReshape(linear/linear_model/beta/SparseReshape:1,linear/linear_model/beta/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
Ї
<linear/linear_model/beta/weighted_sum/SparseReshape/IdentityIdentity/linear/linear_model/beta/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ
v
4linear/linear_model/beta/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
ф
2linear/linear_model/beta/weighted_sum/GreaterEqualGreaterEqual<linear/linear_model/beta/weighted_sum/SparseReshape/Identity4linear/linear_model/beta/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ

+linear/linear_model/beta/weighted_sum/WhereWhere2linear/linear_model/beta/weighted_sum/GreaterEqual*'
_output_shapes
:џџџџџџџџџ

3linear/linear_model/beta/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
ж
-linear/linear_model/beta/weighted_sum/ReshapeReshape+linear/linear_model/beta/weighted_sum/Where3linear/linear_model/beta/weighted_sum/Reshape/shape*
Tshape0*
T0	*#
_output_shapes
:џџџџџџџџџ
ќ
.linear/linear_model/beta/weighted_sum/Gather_1Gather3linear/linear_model/beta/weighted_sum/SparseReshape-linear/linear_model/beta/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:џџџџџџџџџ

.linear/linear_model/beta/weighted_sum/Gather_2Gather<linear/linear_model/beta/weighted_sum/SparseReshape/Identity-linear/linear_model/beta/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:џџџџџџџџџ

.linear/linear_model/beta/weighted_sum/IdentityIdentity5linear/linear_model/beta/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 

Mlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice.linear/linear_model/beta/weighted_sum/IdentityMlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stackOlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
П
>linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/CastCastGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 

Elinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 

Elinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ч
?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/rangeRangeElinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/range/start>linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/CastElinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:џџџџџџџџџ
Ц
@linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Cast_1Cast?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:џџџџџџџџџ
 
Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ђ
Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ђ
Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:

Ilinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice.linear/linear_model/beta/weighted_sum/Gather_1Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackQlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Ї
Blinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ListDiffListDiff@linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Cast_1Ilinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

Olinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:

Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

Ilinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice.linear/linear_model/beta/weighted_sum/IdentityOlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackQlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Qlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask

Hlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
џџџџџџџџџ*
_output_shapes
: 

Dlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsIlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/strided_slice_2Hlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:

Ulinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 

Ulinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
ц
Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseBlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ListDiffDlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ExpandDimsUlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesUlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:џџџџџџџџџ

Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"џџџџ   *
_output_shapes
:

Alinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ReshapeReshapeBlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ListDiffGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Reshape/shape*
Tshape0*
T0	*'
_output_shapes
:џџџџџџџџџ
Ц
Dlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeAlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:џџџџџџџџџ

Elinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
у
@linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concatConcatV2Alinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ReshapeDlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/zeros_likeElinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat/axis*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0	*
N
С
?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ShapeShapeBlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
і
>linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/FillFill?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Shape?linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:џџџџџџџџџ

Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
а
Blinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_1ConcatV2.linear/linear_model/beta/weighted_sum/Gather_1@linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concatGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_1/axis*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0	*
N

Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ъ
Blinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_2ConcatV2.linear/linear_model/beta/weighted_sum/Gather_2>linear/linear_model/beta/weighted_sum/SparseFillEmptyRows/FillGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_2/axis*#
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0	*
N
б
Glinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderBlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_1Blinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/concat_2.linear/linear_model/beta/weighted_sum/Identity*
T0	*6
_output_shapes$
":џџџџџџџџџ:џџџџџџџџџ
Ѓ
Blinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/IdentityIdentity.linear/linear_model/beta/weighted_sum/Identity*
T0	*
_output_shapes
:
Ђ
Qlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Є
Slinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Є
Slinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Р
Klinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseReorderQlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stackSlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Slinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:џџџџџџџџџ*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
д
Blinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/CastCastKlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:џџџџџџџџџ
х
Dlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/UniqueUniqueIlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ
ш
Nlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/embedding_lookupGather,linear/linear_model/beta/weights/part_0/readDlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*'
_output_shapes
:џџџџџџџџџ
ы
=linear/linear_model/beta/weighted_sum/embedding_lookup_sparseSparseSegmentSumNlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/embedding_lookupFlinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/Unique:1Blinear/linear_model/beta/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:џџџџџџџџџ

5linear/linear_model/beta/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"џџџџ   *
_output_shapes
:
њ
/linear/linear_model/beta/weighted_sum/Reshape_1ReshapeGlinear/linear_model/beta/weighted_sum/SparseFillEmptyRows/SparseToDense5linear/linear_model/beta/weighted_sum/Reshape_1/shape*
Tshape0*
T0
*'
_output_shapes
:џџџџџџџџџ
Ј
+linear/linear_model/beta/weighted_sum/ShapeShape=linear/linear_model/beta/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:

9linear/linear_model/beta/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:

;linear/linear_model/beta/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

;linear/linear_model/beta/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
З
3linear/linear_model/beta/weighted_sum/strided_sliceStridedSlice+linear/linear_model/beta/weighted_sum/Shape9linear/linear_model/beta/weighted_sum/strided_slice/stack;linear/linear_model/beta/weighted_sum/strided_slice/stack_1;linear/linear_model/beta/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
o
-linear/linear_model/beta/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
б
+linear/linear_model/beta/weighted_sum/stackPack-linear/linear_model/beta/weighted_sum/stack/03linear/linear_model/beta/weighted_sum/strided_slice*
_output_shapes
:*

axis *
T0*
N
н
*linear/linear_model/beta/weighted_sum/TileTile/linear/linear_model/beta/weighted_sum/Reshape_1+linear/linear_model/beta/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
Ў
0linear/linear_model/beta/weighted_sum/zeros_like	ZerosLike=linear/linear_model/beta/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
ў
%linear/linear_model/beta/weighted_sumSelect*linear/linear_model/beta/weighted_sum/Tile0linear/linear_model/beta/weighted_sum/zeros_like=linear/linear_model/beta/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ

,linear/linear_model/beta/weighted_sum/Cast_1Cast(linear/linear_model/beta/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
}
3linear/linear_model/beta/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
|
2linear/linear_model/beta/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
џ
-linear/linear_model/beta/weighted_sum/Slice_1Slice,linear/linear_model/beta/weighted_sum/Cast_13linear/linear_model/beta/weighted_sum/Slice_1/begin2linear/linear_model/beta/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:

-linear/linear_model/beta/weighted_sum/Shape_1Shape%linear/linear_model/beta/weighted_sum*
out_type0*
T0*
_output_shapes
:
}
3linear/linear_model/beta/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:

2linear/linear_model/beta/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:

-linear/linear_model/beta/weighted_sum/Slice_2Slice-linear/linear_model/beta/weighted_sum/Shape_13linear/linear_model/beta/weighted_sum/Slice_2/begin2linear/linear_model/beta/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
s
1linear/linear_model/beta/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 

,linear/linear_model/beta/weighted_sum/concatConcatV2-linear/linear_model/beta/weighted_sum/Slice_1-linear/linear_model/beta/weighted_sum/Slice_21linear/linear_model/beta/weighted_sum/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
Я
/linear/linear_model/beta/weighted_sum/Reshape_2Reshape%linear/linear_model/beta/weighted_sum,linear/linear_model/beta/weighted_sum/concat*
Tshape0*
T0*'
_output_shapes
:џџџџџџџџџ
Ю
(linear/linear_model/weighted_sum_no_biasAddN0linear/linear_model/alpha/weighted_sum/Reshape_2/linear/linear_model/beta/weighted_sum/Reshape_2*
N*
T0*'
_output_shapes
:џџџџџџџџџ
Т
9linear/linear_model/bias_weights/part_0/Initializer/zerosConst*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
valueB*    *
_output_shapes
:
Я
'linear/linear_model/bias_weights/part_0
VariableV2*
	container *
_output_shapes
:*
dtype0*
shape:*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
shared_name 
І
.linear/linear_model/bias_weights/part_0/AssignAssign'linear/linear_model/bias_weights/part_09linear/linear_model/bias_weights/part_0/Initializer/zeros*
validate_shape(*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
use_locking(*
T0*
_output_shapes
:
Т
,linear/linear_model/bias_weights/part_0/readIdentity'linear/linear_model/bias_weights/part_0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
T0*
_output_shapes
:

 linear/linear_model/bias_weightsIdentity,linear/linear_model/bias_weights/part_0/read*
T0*
_output_shapes
:
Р
 linear/linear_model/weighted_sumBiasAdd(linear/linear_model/weighted_sum_no_bias linear/linear_model/bias_weights*
data_formatNHWC*
T0*'
_output_shapes
:џџџџџџџџџ
^
linear/zero_fraction/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 

linear/zero_fraction/EqualEqual linear/linear_model/weighted_sumlinear/zero_fraction/zero*
T0*'
_output_shapes
:џџџџџџџџџ
~
linear/zero_fraction/CastCastlinear/zero_fraction/Equal*

DstT0*

SrcT0
*'
_output_shapes
:џџџџџџџџџ
k
linear/zero_fraction/ConstConst*
dtype0*
valueB"       *
_output_shapes
:

linear/zero_fraction/MeanMeanlinear/zero_fraction/Castlinear/zero_fraction/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 

*linear/linear/fraction_of_zero_values/tagsConst*
dtype0*6
value-B+ B%linear/linear/fraction_of_zero_values*
_output_shapes
: 

%linear/linear/fraction_of_zero_valuesScalarSummary*linear/linear/fraction_of_zero_values/tagslinear/zero_fraction/Mean*
T0*
_output_shapes
: 
u
linear/linear/activation/tagConst*
dtype0*)
value B Blinear/linear/activation*
_output_shapes
: 

linear/linear/activationHistogramSummarylinear/linear/activation/tag linear/linear_model/weighted_sum*
T0*
_output_shapes
: 
r
addAdddnn/logits/BiasAdd linear/linear_model/weighted_sum*
T0*'
_output_shapes
:џџџџџџџџџ
w
"regression_head/predictions/scoresSqueezeadd*
squeeze_dims
*
T0*#
_output_shapes
:џџџџџџџџџ

$regression_head/predictions/IdentityIdentity"regression_head/predictions/scores*
T0*#
_output_shapes
:џџџџџџџџџ
l
%regression_head/mean_squared_loss/subSubaddbatch:2*
T0*'
_output_shapes
:џџџџџџџџџ

!regression_head/mean_squared_lossSquare%regression_head/mean_squared_loss/sub*
T0*'
_output_shapes
:џџџџџџџџџ
}
,regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
Н
&regression_head/mean_squared_loss/lossMean!regression_head/mean_squared_loss,regression_head/mean_squared_loss/loss/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
g
"regression_head/ScalarSummary/tagsConst*
dtype0*
valueB
 Bloss*
_output_shapes
: 

regression_head/ScalarSummaryScalarSummary"regression_head/ScalarSummary/tags&regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
g
"regression_head/metrics/mean/zerosConst*
dtype0*
valueB
 *    *
_output_shapes
: 

"regression_head/metrics/mean/total
VariableV2*
dtype0*
shape: *
shared_name *
	container *
_output_shapes
: 
ќ
)regression_head/metrics/mean/total/AssignAssign"regression_head/metrics/mean/total"regression_head/metrics/mean/zeros*
validate_shape(*5
_class+
)'loc:@regression_head/metrics/mean/total*
use_locking(*
T0*
_output_shapes
: 
Џ
'regression_head/metrics/mean/total/readIdentity"regression_head/metrics/mean/total*5
_class+
)'loc:@regression_head/metrics/mean/total*
T0*
_output_shapes
: 
i
$regression_head/metrics/mean/zeros_1Const*
dtype0*
valueB
 *    *
_output_shapes
: 

"regression_head/metrics/mean/count
VariableV2*
dtype0*
shape: *
shared_name *
	container *
_output_shapes
: 
ў
)regression_head/metrics/mean/count/AssignAssign"regression_head/metrics/mean/count$regression_head/metrics/mean/zeros_1*
validate_shape(*5
_class+
)'loc:@regression_head/metrics/mean/count*
use_locking(*
T0*
_output_shapes
: 
Џ
'regression_head/metrics/mean/count/readIdentity"regression_head/metrics/mean/count*5
_class+
)'loc:@regression_head/metrics/mean/count*
T0*
_output_shapes
: 
c
!regression_head/metrics/mean/SizeConst*
dtype0*
value	B :*
_output_shapes
: 

&regression_head/metrics/mean/ToFloat_1Cast!regression_head/metrics/mean/Size*

DstT0*

SrcT0*
_output_shapes
: 
e
"regression_head/metrics/mean/ConstConst*
dtype0*
valueB *
_output_shapes
: 
Б
 regression_head/metrics/mean/SumSum&regression_head/mean_squared_loss/loss"regression_head/metrics/mean/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
ф
&regression_head/metrics/mean/AssignAdd	AssignAdd"regression_head/metrics/mean/total regression_head/metrics/mean/Sum*5
_class+
)'loc:@regression_head/metrics/mean/total*
use_locking( *
T0*
_output_shapes
: 

(regression_head/metrics/mean/AssignAdd_1	AssignAdd"regression_head/metrics/mean/count&regression_head/metrics/mean/ToFloat_1'^regression_head/mean_squared_loss/loss*5
_class+
)'loc:@regression_head/metrics/mean/count*
use_locking( *
T0*
_output_shapes
: 
k
&regression_head/metrics/mean/Greater/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ё
$regression_head/metrics/mean/GreaterGreater'regression_head/metrics/mean/count/read&regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
Ђ
$regression_head/metrics/mean/truedivRealDiv'regression_head/metrics/mean/total/read'regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
i
$regression_head/metrics/mean/value/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
П
"regression_head/metrics/mean/valueSelect$regression_head/metrics/mean/Greater$regression_head/metrics/mean/truediv$regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
m
(regression_head/metrics/mean/Greater_1/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 
І
&regression_head/metrics/mean/Greater_1Greater(regression_head/metrics/mean/AssignAdd_1(regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
Є
&regression_head/metrics/mean/truediv_1RealDiv&regression_head/metrics/mean/AssignAdd(regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
m
(regression_head/metrics/mean/update_op/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ы
&regression_head/metrics/mean/update_opSelect&regression_head/metrics/mean/Greater_1&regression_head/metrics/mean/truediv_1(regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: 

$remove_squeezable_dimensions/SqueezeSqueezebatch:2*
squeeze_dims

џџџџџџџџџ*
T0*#
_output_shapes
:џџџџџџџџџ

subSub$remove_squeezable_dimensions/Squeeze$regression_head/predictions/Identity*
T0*#
_output_shapes
:џџџџџџџџџ
C
SquareSquaresub*
T0*#
_output_shapes
:џџџџџџџџџ
b
root_mean_squared_error/zerosConst*
dtype0*
valueB
 *    *
_output_shapes
: 

root_mean_squared_error/total
VariableV2*
dtype0*
shape: *
shared_name *
	container *
_output_shapes
: 
ш
$root_mean_squared_error/total/AssignAssignroot_mean_squared_error/totalroot_mean_squared_error/zeros*
validate_shape(*0
_class&
$"loc:@root_mean_squared_error/total*
use_locking(*
T0*
_output_shapes
: 
 
"root_mean_squared_error/total/readIdentityroot_mean_squared_error/total*0
_class&
$"loc:@root_mean_squared_error/total*
T0*
_output_shapes
: 
d
root_mean_squared_error/zeros_1Const*
dtype0*
valueB
 *    *
_output_shapes
: 

root_mean_squared_error/count
VariableV2*
dtype0*
shape: *
shared_name *
	container *
_output_shapes
: 
ъ
$root_mean_squared_error/count/AssignAssignroot_mean_squared_error/countroot_mean_squared_error/zeros_1*
validate_shape(*0
_class&
$"loc:@root_mean_squared_error/count*
use_locking(*
T0*
_output_shapes
: 
 
"root_mean_squared_error/count/readIdentityroot_mean_squared_error/count*0
_class&
$"loc:@root_mean_squared_error/count*
T0*
_output_shapes
: 
]
root_mean_squared_error/SizeSizeSquare*
out_type0*
T0*
_output_shapes
: 
w
!root_mean_squared_error/ToFloat_1Castroot_mean_squared_error/Size*

DstT0*

SrcT0*
_output_shapes
: 
g
root_mean_squared_error/ConstConst*
dtype0*
valueB: *
_output_shapes
:

root_mean_squared_error/SumSumSquareroot_mean_squared_error/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
а
!root_mean_squared_error/AssignAdd	AssignAddroot_mean_squared_error/totalroot_mean_squared_error/Sum*0
_class&
$"loc:@root_mean_squared_error/total*
use_locking( *
T0*
_output_shapes
: 
с
#root_mean_squared_error/AssignAdd_1	AssignAddroot_mean_squared_error/count!root_mean_squared_error/ToFloat_1^Square*0
_class&
$"loc:@root_mean_squared_error/count*
use_locking( *
T0*
_output_shapes
: 
f
!root_mean_squared_error/Greater/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 

root_mean_squared_error/GreaterGreater"root_mean_squared_error/count/read!root_mean_squared_error/Greater/y*
T0*
_output_shapes
: 

root_mean_squared_error/truedivRealDiv"root_mean_squared_error/total/read"root_mean_squared_error/count/read*
T0*
_output_shapes
: 
d
root_mean_squared_error/value/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ћ
root_mean_squared_error/valueSelectroot_mean_squared_error/Greaterroot_mean_squared_error/truedivroot_mean_squared_error/value/e*
T0*
_output_shapes
: 
h
#root_mean_squared_error/Greater_1/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 

!root_mean_squared_error/Greater_1Greater#root_mean_squared_error/AssignAdd_1#root_mean_squared_error/Greater_1/y*
T0*
_output_shapes
: 

!root_mean_squared_error/truediv_1RealDiv!root_mean_squared_error/AssignAdd#root_mean_squared_error/AssignAdd_1*
T0*
_output_shapes
: 
h
#root_mean_squared_error/update_op/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
З
!root_mean_squared_error/update_opSelect!root_mean_squared_error/Greater_1!root_mean_squared_error/truediv_1#root_mean_squared_error/update_op/e*
T0*
_output_shapes
: 
L
SqrtSqrtroot_mean_squared_error/value*
T0*
_output_shapes
: 
R
Sqrt_1Sqrt!root_mean_squared_error/update_op*
T0*
_output_shapes
: 
D

group_depsNoOp'^regression_head/metrics/mean/update_op^Sqrt_1
{
eval_step/Initializer/zerosConst*
dtype0	*
_class
loc:@eval_step*
value	B	 R *
_output_shapes
: 

	eval_step
VariableV2*
	container *
_output_shapes
: *
dtype0	*
shape: *
_class
loc:@eval_step*
shared_name 
Њ
eval_step/AssignAssign	eval_stepeval_step/Initializer/zeros*
validate_shape(*
_class
loc:@eval_step*
use_locking(*
T0	*
_output_shapes
: 
d
eval_step/readIdentity	eval_step*
_class
loc:@eval_step*
T0	*
_output_shapes
: 
Q
AssignAdd/valueConst*
dtype0	*
value	B	 R*
_output_shapes
: 

	AssignAdd	AssignAdd	eval_stepAssignAdd/value*
_class
loc:@eval_step*
use_locking( *
T0	*
_output_shapes
: 
ѓ
initNoOp^global_step/Assign(^dnn/hiddenlayer_0/weights/part_0/Assign'^dnn/hiddenlayer_0/biases/part_0/Assign(^dnn/hiddenlayer_1/weights/part_0/Assign'^dnn/hiddenlayer_1/biases/part_0/Assign(^dnn/hiddenlayer_2/weights/part_0/Assign'^dnn/hiddenlayer_2/biases/part_0/Assign!^dnn/logits/weights/part_0/Assign ^dnn/logits/biases/part_0/Assign0^linear/linear_model/alpha/weights/part_0/Assign/^linear/linear_model/beta/weights/part_0/Assign/^linear/linear_model/bias_weights/part_0/Assign

init_1NoOp
$
group_deps_1NoOp^init^init_1

4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_class
loc:@global_step*
_output_shapes
: 
Ы
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
_output_shapes
: 
Щ
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
_output_shapes
: 
Ы
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
_output_shapes
: 
Щ
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
_output_shapes
: 
Ы
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitialized dnn/hiddenlayer_2/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
_output_shapes
: 
Щ
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitializeddnn/hiddenlayer_2/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
_output_shapes
: 
Н
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitializeddnn/logits/weights/part_0*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
_output_shapes
: 
Л
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitializeddnn/logits/biases/part_0*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
_output_shapes
: 
л
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitialized(linear/linear_model/alpha/weights/part_0*
dtype0*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
_output_shapes
: 
к
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitialized'linear/linear_model/beta/weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
_output_shapes
: 
к
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitialized'linear/linear_model/bias_weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
: 
а
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitialized"regression_head/metrics/mean/total*
dtype0*5
_class+
)'loc:@regression_head/metrics/mean/total*
_output_shapes
: 
а
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitialized"regression_head/metrics/mean/count*
dtype0*5
_class+
)'loc:@regression_head/metrics/mean/count*
_output_shapes
: 
Ц
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitializedroot_mean_squared_error/total*
dtype0*0
_class&
$"loc:@root_mean_squared_error/total*
_output_shapes
: 
Ц
7report_uninitialized_variables/IsVariableInitialized_15IsVariableInitializedroot_mean_squared_error/count*
dtype0*0
_class&
$"loc:@root_mean_squared_error/count*
_output_shapes
: 

7report_uninitialized_variables/IsVariableInitialized_16IsVariableInitialized	eval_step*
dtype0	*
_class
loc:@eval_step*
_output_shapes
: 
Ѓ
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized6report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_56report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_147report_uninitialized_variables/IsVariableInitialized_157report_uninitialized_variables/IsVariableInitialized_16*
_output_shapes
:*

axis *
T0
*
N
y
)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack*
_output_shapes
:

$report_uninitialized_variables/ConstConst*
dtype0*­
valueЃB Bglobal_stepB dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0B dnn/hiddenlayer_2/weights/part_0Bdnn/hiddenlayer_2/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B(linear/linear_model/alpha/weights/part_0B'linear/linear_model/beta/weights/part_0B'linear/linear_model/bias_weights/part_0B"regression_head/metrics/mean/totalB"regression_head/metrics/mean/countBroot_mean_squared_error/totalBroot_mean_squared_error/countB	eval_step*
_output_shapes
:
{
1report_uninitialized_variables/boolean_mask/ShapeConst*
dtype0*
valueB:*
_output_shapes
:

?report_uninitialized_variables/boolean_mask/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
й
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask*
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 

Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst*
dtype0*
valueB: *
_output_shapes
:
ѕ
0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
}
3report_uninitialized_variables/boolean_mask/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst*
dtype0*
valueB:*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
valueB: *
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
с
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Џ
;report_uninitialized_variables/boolean_mask/concat/values_0Pack0report_uninitialized_variables/boolean_mask/Prod*
_output_shapes
:*

axis *
T0*
N
y
7report_uninitialized_variables/boolean_mask/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ћ
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/concat/values_0;report_uninitialized_variables/boolean_mask/strided_slice_17report_uninitialized_variables/boolean_mask/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
Ы
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat*
Tshape0*
T0*
_output_shapes
:

;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
л
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape*
Tshape0*
T0
*
_output_shapes
:

1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1*'
_output_shapes
:џџџџџџџџџ
Ж
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where*
squeeze_dims
*
T0	*#
_output_shapes
:џџџџџџџџџ

2report_uninitialized_variables/boolean_mask/GatherGather3report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ
g
$report_uninitialized_resources/ConstConst*
dtype0*
valueB *
_output_shapes
: 
M
concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
М
concatConcatV22report_uninitialized_variables/boolean_mask/Gather$report_uninitialized_resources/Constconcat/axis*#
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0*
N
Ё
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_class
loc:@global_step*
_output_shapes
: 
Э
8report_uninitialized_variables_1/IsVariableInitialized_1IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
_output_shapes
: 
Ы
8report_uninitialized_variables_1/IsVariableInitialized_2IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
_output_shapes
: 
Э
8report_uninitialized_variables_1/IsVariableInitialized_3IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
_output_shapes
: 
Ы
8report_uninitialized_variables_1/IsVariableInitialized_4IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
_output_shapes
: 
Э
8report_uninitialized_variables_1/IsVariableInitialized_5IsVariableInitialized dnn/hiddenlayer_2/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
_output_shapes
: 
Ы
8report_uninitialized_variables_1/IsVariableInitialized_6IsVariableInitializeddnn/hiddenlayer_2/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
_output_shapes
: 
П
8report_uninitialized_variables_1/IsVariableInitialized_7IsVariableInitializeddnn/logits/weights/part_0*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
_output_shapes
: 
Н
8report_uninitialized_variables_1/IsVariableInitialized_8IsVariableInitializeddnn/logits/biases/part_0*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
_output_shapes
: 
н
8report_uninitialized_variables_1/IsVariableInitialized_9IsVariableInitialized(linear/linear_model/alpha/weights/part_0*
dtype0*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
_output_shapes
: 
м
9report_uninitialized_variables_1/IsVariableInitialized_10IsVariableInitialized'linear/linear_model/beta/weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
_output_shapes
: 
м
9report_uninitialized_variables_1/IsVariableInitialized_11IsVariableInitialized'linear/linear_model/bias_weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
: 
 
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized8report_uninitialized_variables_1/IsVariableInitialized_18report_uninitialized_variables_1/IsVariableInitialized_28report_uninitialized_variables_1/IsVariableInitialized_38report_uninitialized_variables_1/IsVariableInitialized_48report_uninitialized_variables_1/IsVariableInitialized_58report_uninitialized_variables_1/IsVariableInitialized_68report_uninitialized_variables_1/IsVariableInitialized_78report_uninitialized_variables_1/IsVariableInitialized_88report_uninitialized_variables_1/IsVariableInitialized_99report_uninitialized_variables_1/IsVariableInitialized_109report_uninitialized_variables_1/IsVariableInitialized_11*
_output_shapes
:*

axis *
T0
*
N
}
+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack*
_output_shapes
:
ї
&report_uninitialized_variables_1/ConstConst*
dtype0*
valueBBglobal_stepB dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0B dnn/hiddenlayer_2/weights/part_0Bdnn/hiddenlayer_2/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B(linear/linear_model/alpha/weights/part_0B'linear/linear_model/beta/weights/part_0B'linear/linear_model/bias_weights/part_0*
_output_shapes
:
}
3report_uninitialized_variables_1/boolean_mask/ShapeConst*
dtype0*
valueB:*
_output_shapes
:

Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
у
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask*
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 

Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst*
dtype0*
valueB: *
_output_shapes
:
ћ
2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 

5report_uninitialized_variables_1/boolean_mask/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst*
dtype0*
valueB:*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
valueB: *
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ы
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
Г
=report_uninitialized_variables_1/boolean_mask/concat/values_0Pack2report_uninitialized_variables_1/boolean_mask/Prod*
_output_shapes
:*

axis *
T0*
N
{
9report_uninitialized_variables_1/boolean_mask/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Г
4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/concat/values_0=report_uninitialized_variables_1/boolean_mask/strided_slice_19report_uninitialized_variables_1/boolean_mask/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
б
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat*
Tshape0*
T0*
_output_shapes
:

=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst*
dtype0*
valueB:
џџџџџџџџџ*
_output_shapes
:
с
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape*
Tshape0*
T0
*
_output_shapes
:

3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1*'
_output_shapes
:џџџџџџџџџ
К
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where*
squeeze_dims
*
T0	*#
_output_shapes
:џџџџџџџџџ

4report_uninitialized_variables_1/boolean_mask/GatherGather5report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:џџџџџџџџџ
Ч
init_2NoOp*^regression_head/metrics/mean/total/Assign*^regression_head/metrics/mean/count/Assign%^root_mean_squared_error/total/Assign%^root_mean_squared_error/count/Assign^eval_step/Assign
б
init_all_tablesNoOp^^dnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_table/table_init\^dnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_table/table_init=^linear/linear_model/alpha/alpha_lookup/hash_table/table_init;^linear/linear_model/beta/beta_lookup/hash_table/table_init
/
group_deps_2NoOp^init_2^init_all_tables

Merge/MergeSummaryMergeSummary"input_producer/fraction_of_32_fullbatch/fraction_of_5000_full-dnn/dnn/hiddenlayer_0/fraction_of_zero_values dnn/dnn/hiddenlayer_0/activation-dnn/dnn/hiddenlayer_1/fraction_of_zero_values dnn/dnn/hiddenlayer_1/activation-dnn/dnn/hiddenlayer_2/fraction_of_zero_values dnn/dnn/hiddenlayer_2/activation&dnn/dnn/logits/fraction_of_zero_valuesdnn/dnn/logits/activation%linear/linear/fraction_of_zero_valueslinear/linear/activationregression_head/ScalarSummary*
N*
_output_shapes
: 
P

save/ConstConst*
dtype0*
valueB Bmodel*
_output_shapes
: 

save/StringJoin/inputs_1Const*
dtype0*<
value3B1 B+_temp_438653a107aa4c02b26dc325fbae4b75/part*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
	separator *
_output_shapes
: 
Q
save/num_shardsConst*
dtype0*
value	B :*
_output_shapes
: 
\
save/ShardedFilename/shardConst*
dtype0*
value	B : *
_output_shapes
: 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 

save/SaveV2/tensor_namesConst*
dtype0*Я
valueХBТBdnn/hiddenlayer_0/biasesBdnn/hiddenlayer_0/weightsBdnn/hiddenlayer_1/biasesBdnn/hiddenlayer_1/weightsBdnn/hiddenlayer_2/biasesBdnn/hiddenlayer_2/weightsBdnn/logits/biasesBdnn/logits/weightsBglobal_stepB!linear/linear_model/alpha/weightsB linear/linear_model/beta/weightsB linear/linear_model/bias_weights*
_output_shapes
:
ё
save/SaveV2/shape_and_slicesConst*
dtype0* 
valueBB	128 0,128B6 128 0,6:0,128B64 0,64B128 64 0,128:0,64B32 0,32B64 32 0,64:0,32B1 0,1B32 1 0,32:0,1B B2 1 0,2:0,1B2 1 0,2:0,1B1 0,1*
_output_shapes
:
Н
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices$dnn/hiddenlayer_0/biases/part_0/read%dnn/hiddenlayer_0/weights/part_0/read$dnn/hiddenlayer_1/biases/part_0/read%dnn/hiddenlayer_1/weights/part_0/read$dnn/hiddenlayer_2/biases/part_0/read%dnn/hiddenlayer_2/weights/part_0/readdnn/logits/biases/part_0/readdnn/logits/weights/part_0/readglobal_step-linear/linear_model/alpha/weights/part_0/read,linear/linear_model/beta/weights/part_0/read,linear/linear_model/bias_weights/part_0/read*
dtypes
2	

save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*'
_class
loc:@save/ShardedFilename*
T0*
_output_shapes
: 

+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*
_output_shapes
:*

axis *
T0*
N
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
T0*
_output_shapes
: 
|
save/RestoreV2/tensor_namesConst*
dtype0*-
value$B"Bdnn/hiddenlayer_0/biases*
_output_shapes
:
q
save/RestoreV2/shape_and_slicesConst*
dtype0*
valueBB	128 0,128*
_output_shapes
:

save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:
Щ
save/AssignAssigndnn/hiddenlayer_0/biases/part_0save/RestoreV2*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
use_locking(*
T0*
_output_shapes	
:

save/RestoreV2_1/tensor_namesConst*
dtype0*.
value%B#Bdnn/hiddenlayer_0/weights*
_output_shapes
:
y
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*$
valueBB6 128 0,6:0,128*
_output_shapes
:

save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes
:
г
save/Assign_1Assign dnn/hiddenlayer_0/weights/part_0save/RestoreV2_1*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
use_locking(*
T0*
_output_shapes
:	
~
save/RestoreV2_2/tensor_namesConst*
dtype0*-
value$B"Bdnn/hiddenlayer_1/biases*
_output_shapes
:
q
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
valueBB64 0,64*
_output_shapes
:

save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
Ь
save/Assign_2Assigndnn/hiddenlayer_1/biases/part_0save/RestoreV2_2*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
use_locking(*
T0*
_output_shapes
:@

save/RestoreV2_3/tensor_namesConst*
dtype0*.
value%B#Bdnn/hiddenlayer_1/weights*
_output_shapes
:
{
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*&
valueBB128 64 0,128:0,64*
_output_shapes
:

save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:
г
save/Assign_3Assign dnn/hiddenlayer_1/weights/part_0save/RestoreV2_3*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
use_locking(*
T0*
_output_shapes
:	@
~
save/RestoreV2_4/tensor_namesConst*
dtype0*-
value$B"Bdnn/hiddenlayer_2/biases*
_output_shapes
:
q
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*
valueBB32 0,32*
_output_shapes
:

save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes
:
Ь
save/Assign_4Assigndnn/hiddenlayer_2/biases/part_0save/RestoreV2_4*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
use_locking(*
T0*
_output_shapes
: 

save/RestoreV2_5/tensor_namesConst*
dtype0*.
value%B#Bdnn/hiddenlayer_2/weights*
_output_shapes
:
y
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*$
valueBB64 32 0,64:0,32*
_output_shapes
:

save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:
в
save/Assign_5Assign dnn/hiddenlayer_2/weights/part_0save/RestoreV2_5*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
use_locking(*
T0*
_output_shapes

:@ 
w
save/RestoreV2_6/tensor_namesConst*
dtype0*&
valueBBdnn/logits/biases*
_output_shapes
:
o
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*
valueBB1 0,1*
_output_shapes
:

save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:
О
save/Assign_6Assigndnn/logits/biases/part_0save/RestoreV2_6*
validate_shape(*+
_class!
loc:@dnn/logits/biases/part_0*
use_locking(*
T0*
_output_shapes
:
x
save/RestoreV2_7/tensor_namesConst*
dtype0*'
valueBBdnn/logits/weights*
_output_shapes
:
w
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*"
valueBB32 1 0,32:0,1*
_output_shapes
:

save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes
:
Ф
save/Assign_7Assigndnn/logits/weights/part_0save/RestoreV2_7*
validate_shape(*,
_class"
 loc:@dnn/logits/weights/part_0*
use_locking(*
T0*
_output_shapes

: 
q
save/RestoreV2_8/tensor_namesConst*
dtype0* 
valueBBglobal_step*
_output_shapes
:
j
!save/RestoreV2_8/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:

save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
dtypes
2	*
_output_shapes
:
 
save/Assign_8Assignglobal_stepsave/RestoreV2_8*
validate_shape(*
_class
loc:@global_step*
use_locking(*
T0	*
_output_shapes
: 

save/RestoreV2_9/tensor_namesConst*
dtype0*6
value-B+B!linear/linear_model/alpha/weights*
_output_shapes
:
u
!save/RestoreV2_9/shape_and_slicesConst*
dtype0* 
valueBB2 1 0,2:0,1*
_output_shapes
:

save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
dtypes
2*
_output_shapes
:
т
save/Assign_9Assign(linear/linear_model/alpha/weights/part_0save/RestoreV2_9*
validate_shape(*;
_class1
/-loc:@linear/linear_model/alpha/weights/part_0*
use_locking(*
T0*
_output_shapes

:

save/RestoreV2_10/tensor_namesConst*
dtype0*5
value,B*B linear/linear_model/beta/weights*
_output_shapes
:
v
"save/RestoreV2_10/shape_and_slicesConst*
dtype0* 
valueBB2 1 0,2:0,1*
_output_shapes
:

save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
dtypes
2*
_output_shapes
:
т
save/Assign_10Assign'linear/linear_model/beta/weights/part_0save/RestoreV2_10*
validate_shape(*:
_class0
.,loc:@linear/linear_model/beta/weights/part_0*
use_locking(*
T0*
_output_shapes

:

save/RestoreV2_11/tensor_namesConst*
dtype0*5
value,B*B linear/linear_model/bias_weights*
_output_shapes
:
p
"save/RestoreV2_11/shape_and_slicesConst*
dtype0*
valueBB1 0,1*
_output_shapes
:

save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
dtypes
2*
_output_shapes
:
о
save/Assign_11Assign'linear/linear_model/bias_weights/part_0save/RestoreV2_11*
validate_shape(*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
use_locking(*
T0*
_output_shapes
:
к
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11
-
save/restore_allNoOp^save/restore_shard""U
ready_for_local_init_op:
8
6report_uninitialized_variables_1/boolean_mask/Gather:0" 
global_step

global_step:0"
trainable_variablesџќ
Ё
"dnn/hiddenlayer_0/weights/part_0:0'dnn/hiddenlayer_0/weights/part_0/Assign'dnn/hiddenlayer_0/weights/part_0/read:0")
dnn/hiddenlayer_0/weights  "

!dnn/hiddenlayer_0/biases/part_0:0&dnn/hiddenlayer_0/biases/part_0/Assign&dnn/hiddenlayer_0/biases/part_0/read:0"%
dnn/hiddenlayer_0/biases "
Ё
"dnn/hiddenlayer_1/weights/part_0:0'dnn/hiddenlayer_1/weights/part_0/Assign'dnn/hiddenlayer_1/weights/part_0/read:0")
dnn/hiddenlayer_1/weights@  "@

!dnn/hiddenlayer_1/biases/part_0:0&dnn/hiddenlayer_1/biases/part_0/Assign&dnn/hiddenlayer_1/biases/part_0/read:0"#
dnn/hiddenlayer_1/biases@ "@

"dnn/hiddenlayer_2/weights/part_0:0'dnn/hiddenlayer_2/weights/part_0/Assign'dnn/hiddenlayer_2/weights/part_0/read:0"'
dnn/hiddenlayer_2/weights@   "@ 

!dnn/hiddenlayer_2/biases/part_0:0&dnn/hiddenlayer_2/biases/part_0/Assign&dnn/hiddenlayer_2/biases/part_0/read:0"#
dnn/hiddenlayer_2/biases  " 

dnn/logits/weights/part_0:0 dnn/logits/weights/part_0/Assign dnn/logits/weights/part_0/read:0" 
dnn/logits/weights   " 
|
dnn/logits/biases/part_0:0dnn/logits/biases/part_0/Assigndnn/logits/biases/part_0/read:0"
dnn/logits/biases "
П
*linear/linear_model/alpha/weights/part_0:0/linear/linear_model/alpha/weights/part_0/Assign/linear/linear_model/alpha/weights/part_0/read:0"/
!linear/linear_model/alpha/weights  "
Л
)linear/linear_model/beta/weights/part_0:0.linear/linear_model/beta/weights/part_0/Assign.linear/linear_model/beta/weights/part_0/read:0".
 linear/linear_model/beta/weights  "
И
)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign.linear/linear_model/bias_weights/part_0/read:0"+
 linear/linear_model/bias_weights ""!
local_init_op

group_deps_2"Ц
	variablesИЕ
7
global_step:0global_step/Assignglobal_step/read:0
Ё
"dnn/hiddenlayer_0/weights/part_0:0'dnn/hiddenlayer_0/weights/part_0/Assign'dnn/hiddenlayer_0/weights/part_0/read:0")
dnn/hiddenlayer_0/weights  "

!dnn/hiddenlayer_0/biases/part_0:0&dnn/hiddenlayer_0/biases/part_0/Assign&dnn/hiddenlayer_0/biases/part_0/read:0"%
dnn/hiddenlayer_0/biases "
Ё
"dnn/hiddenlayer_1/weights/part_0:0'dnn/hiddenlayer_1/weights/part_0/Assign'dnn/hiddenlayer_1/weights/part_0/read:0")
dnn/hiddenlayer_1/weights@  "@

!dnn/hiddenlayer_1/biases/part_0:0&dnn/hiddenlayer_1/biases/part_0/Assign&dnn/hiddenlayer_1/biases/part_0/read:0"#
dnn/hiddenlayer_1/biases@ "@

"dnn/hiddenlayer_2/weights/part_0:0'dnn/hiddenlayer_2/weights/part_0/Assign'dnn/hiddenlayer_2/weights/part_0/read:0"'
dnn/hiddenlayer_2/weights@   "@ 

!dnn/hiddenlayer_2/biases/part_0:0&dnn/hiddenlayer_2/biases/part_0/Assign&dnn/hiddenlayer_2/biases/part_0/read:0"#
dnn/hiddenlayer_2/biases  " 

dnn/logits/weights/part_0:0 dnn/logits/weights/part_0/Assign dnn/logits/weights/part_0/read:0" 
dnn/logits/weights   " 
|
dnn/logits/biases/part_0:0dnn/logits/biases/part_0/Assigndnn/logits/biases/part_0/read:0"
dnn/logits/biases "
П
*linear/linear_model/alpha/weights/part_0:0/linear/linear_model/alpha/weights/part_0/Assign/linear/linear_model/alpha/weights/part_0/read:0"/
!linear/linear_model/alpha/weights  "
Л
)linear/linear_model/beta/weights/part_0:0.linear/linear_model/beta/weights/part_0/Assign.linear/linear_model/beta/weights/part_0/read:0".
 linear/linear_model/beta/weights  "
И
)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign.linear/linear_model/bias_weights/part_0/read:0"+
 linear/linear_model/bias_weights ""
dnn

"dnn/hiddenlayer_0/weights/part_0:0
!dnn/hiddenlayer_0/biases/part_0:0
"dnn/hiddenlayer_1/weights/part_0:0
!dnn/hiddenlayer_1/biases/part_0:0
"dnn/hiddenlayer_2/weights/part_0:0
!dnn/hiddenlayer_2/biases/part_0:0
dnn/logits/weights/part_0:0
dnn/logits/biases/part_0:0"
	summariesє
ё
$input_producer/fraction_of_32_full:0
batch/fraction_of_5000_full:0
/dnn/dnn/hiddenlayer_0/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_0/activation:0
/dnn/dnn/hiddenlayer_1/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_1/activation:0
/dnn/dnn/hiddenlayer_2/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_2/activation:0
(dnn/dnn/logits/fraction_of_zero_values:0
dnn/dnn/logits/activation:0
'linear/linear/fraction_of_zero_values:0
linear/linear/activation:0
regression_head/ScalarSummary:0"В
local_variables

$regression_head/metrics/mean/total:0
$regression_head/metrics/mean/count:0
root_mean_squared_error/total:0
root_mean_squared_error/count:0
eval_step:0"Я
table_initializerЙ
Ж
]dnn/input_from_feature_columns/input_layer/alpha_indicator/alpha_lookup/hash_table/table_init
[dnn/input_from_feature_columns/input_layer/beta_indicator/beta_lookup/hash_table/table_init
<linear/linear_model/alpha/alpha_lookup/hash_table/table_init
:linear/linear_model/beta/beta_lookup/hash_table/table_init"ф
queue_runnersвЯ

input_producer)input_producer/input_producer_EnqueueMany#input_producer/input_producer_Close"%input_producer/input_producer_Close_1*
П
batch/fifo_queuebatch/fifo_queue_EnqueueManybatch/fifo_queue_EnqueueManybatch/fifo_queue_EnqueueManybatch/fifo_queue_EnqueueManybatch/fifo_queue_Close"batch/fifo_queue_Close_1*"
linear

*linear/linear_model/alpha/weights/part_0:0
)linear/linear_model/beta/weights/part_0:0
)linear/linear_model/bias_weights/part_0:0"J
savers@>
<
save/Const:0save/Identity:0save/restore_all (5 @F8"&

summary_op

Merge/MergeSummary:0"
	eval_step

eval_step:0"
ready_op


concat:0"Ї
model_variables

"dnn/hiddenlayer_0/weights/part_0:0
!dnn/hiddenlayer_0/biases/part_0:0
"dnn/hiddenlayer_1/weights/part_0:0
!dnn/hiddenlayer_1/biases/part_0:0
"dnn/hiddenlayer_2/weights/part_0:0
!dnn/hiddenlayer_2/biases/part_0:0
dnn/logits/weights/part_0:0
dnn/logits/biases/part_0:0
*linear/linear_model/alpha/weights/part_0:0
)linear/linear_model/beta/weights/part_0:0
)linear/linear_model/bias_weights/part_0:0"
init_op

group_deps_1ф%жл'       ЛсБF	ЉnћkжA*

lossвC

rmseV:Aю,4