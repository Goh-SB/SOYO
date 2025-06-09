import { useMemo, useRef } from 'react';
import ReactQuill from 'react-quill-new';
import 'react-quill-new/dist/quill.snow.css';
import './ProductEnrollFormComponent.css';
import ImageResize from 'quill-image-resize';

function ProductEnrollFormComponent({ style, value, onChange }) {
  const quillRef = useRef(null);

  const imageHandler = async () => {
    if (!quillRef.current) return;

    const quillInstance = quillRef.current.getEditor();
    const input = document.createElement('input');
    input.setAttribute('type', 'file');
    input.setAttribute('accept', 'image/*');
    input.click();

    input.onchange = async () => {
      const file = input.files?.[0];

      try {
        // const url = await PostAPI.uploadImg(file); // 실제 업로드 로직으로 교체
        const url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1c9zAnn02wcDmYlMABoRgWoxn4wccXzUpUg&s'; // 더미 URL
        const range = quillInstance.getSelection(true);
        quillInstance.insertEmbed(range.index, 'image', url);
        quillInstance.setSelection(range.index + 1);
      } catch (error) {
        console.error(error);
      }
    };
  };

  const modules = useMemo(() => ({
    toolbar: {
      container: [
        [{ header: [1, 2, 3, 4, 5, false] }],
        ['bold', 'italic', 'underline', 'strike'],
        [{ list: 'ordered' }, { list: 'bullet' }, { indent: '-1' }, { indent: '+1' }],
        [{ color: [] }, { background: [] }],
        ['link', 'image'],
        ['clean']
      ],
      handlers: {
        image: imageHandler
      }
    }
  }), []);


const srcArray = []; // src만 추출
const blopArray = [];// blopArray로 변환
const urlArray = [];// 최종 src url 저장할곳
const gainSource = /(<img[^>]*src\s*=\s*[\"']?([^>\"']+)[\"']?[^>]*>)/g;
let endContent = content;
let index = 0; // 인덱스 변수 추가
while (gainSource.test(content)) {
  // console.log('이미지가 있을때만 진행함.');
  let result = RegExp.$2;
  // console.log('src 추출 결과 : ',result)
  srcArray.push(result);
  //console.log('srcArray 추가: ', srcArray);
  // base64파일 Blop으로 바꾸기

  // // dataURL 값이 data:image/jpeg:base64,~~~~~~~ 이므로 ','를 기점으로 잘라서 ~~~~~인 부분만 다시 인코딩
  const byteString = atob(result.split(',')[1]);
  // Blob를 구성하기 위한 준비
  const ab = new ArrayBuffer(byteString.length);
  const ia = new Uint8Array(ab);
  for (let i = 0; i < byteString.length; i++) {
    ia[i] = byteString.charCodeAt(i);
  }
  const blob = new Blob([ia], {
    type: 'image/jpeg'
  });
  // const file = new File([blob], 'image.jpg');
  const file = new File([blob], `image-${index}.jpg`);
  //console.log('file: ', file); //선택한 이미지
  // 위 과정을 통해 만든 image폼을 FormData에 넣어줍니다.
  // 서버에서는 이미지를 받을 때, FormData가 아니면 받지 않도록 세팅해야합니다.
  const formData = new FormData();
  // formData.append('file', file);
  formData.append('files[]', file);
  index++;
  console.log('formData : ', formData);

  // 백엔드로 보내서 urlArray에 돌려받은 url을 배열 형태로 push 해준다.
  // 최상단 while문이 모든 사진을 추출해 하나씩 저장하여 push하므로
  // 백엔드의 multer 패키지에 single로 저장을 요청한다.
  const config = {
    header: { 'content-type': 'multipart/form-data' }
  };
  // TODO FormData 백엔드로 넘겨서 url 건네받아 저장하고, url 반환해서 urlArray에 저장하기
  /* await axios.post('api/board/uploadImgFolder', formData, config).then((response) => {
    if (response.data.success) {
      console.log('이미지 서버에 업로드 성공', response);
      urlArray.push(response.data.url);
      console.log('urlArray에 추가', urlArray);
    } else {
      console.log(response);
      alert('이미지를 서버에 업로드하는데에 실패했습니다.');
    }
  }); */
  urlArray.push(
    'https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/cnoC/image/66LHXQZY2bFLKR7SEO_KJjOnX6M',
    'https://cdn.playforum.net/news/photo/202210/202392_18836_2310.jpg'
  );//api 대신 더미로 테스트
  console.log('urlArray에 추가', urlArray);

  // FormData의 key 확인
 /*  for (let key of formData.keys()) {
    console.log('key', key);
  }
  // FormData의 value 확인
  for (let value of formData.values()) {
    console.log('value', value);
  } */
  // console.log('서버 주소 저장된 어레이: ', urlArray);
  //console.log('srcArray: ', srcArray);

  // 만일 이미지를 업로드 했다면, 첫번쨰 srcArray가 있는 부분을 첫번째 url로 바꾸는 식으로 계속 바꿔라.
  if (srcArray.length > 0) {
    /*   console.log('실행은 됐음..'); */

    for (let i = 0; i < srcArray.length; i++) {
      console.log('실행중.. ' + i + ' 번째임');
      console.log('srcArray[i]: ', srcArray[i], 'urlArray[i]: ', urlArray[i]);
      let replace = endContent.replace(srcArray[i], urlArray[i]);
      endContent = replace;
    }
  } // 없다면 content=content
  console.log('endContent:', endContent);

  //
  /*  console.log('최종 urlArray', urlArray);
  console.log('최종 srcArray: ', srcArray);
  console.log('최종 blopArray: ', blopArray); */
}
const totalValue = { ...values, content: endContent };
console.log(totalValue, 'totalValue---');





  return (
    <ReactQuill
      ref={quillRef}
      style={style}
      modules={modules}
      value={value}
      onChange={onChange}
    />
  );
}

export default ProductEnrollFormComponent;