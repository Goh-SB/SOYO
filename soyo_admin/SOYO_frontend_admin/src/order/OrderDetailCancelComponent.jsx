import axios from "axios";

function OrderDetailCancelComponent({ refundDate, refundReason }) {
  return (
    <div>
      <h3>환불 정보</h3>
      <br /><br />
      <table
        className="table"
        style={{
          width: "500px",
          border: "1px solid black",
          borderCollapse: "collapse",
          marginTop: "10px",
        }}
      >
        <tbody align="center">
          <tr>
            <th>환불 날짜</th>
            <td>{refundDate ? refundDate.slice(0, 10) : "-"}</td>
          </tr>
          <tr>
            <th>환불 사유</th>
            <td>{refundReason || "-"}</td>
          </tr>
        </tbody>
      </table>
    </div>
  );
}
export default OrderDetailCancelComponent;