# G Weather Forecast - Bài test thực tập sinh Flutter tại Golden Owl

## Thông tin cá nhân

- **Họ và tên:** An Quốc Việt
- **Năm sinh:** 2003
- **Email:** [anq.viet203@gmail.com](mailto:anq.viet203@gmail.com)
- **Số điện thoại:** [0393504301](tel:0393504301)

## Mô tả ứng dụng web:

- **Tên ứng dụng:** G Weather Forecast
- **Demo:** [https://g-weather-forecast-fb647.web.app/](https://g-weather-forecast-fb647.web.app/)
- **Mô tả:** Ứng dụng dự báo thời tiết cho người dùng.
  Người dùng có thể xem thời tiết hiện tại và dự báo thời tiết 5 ngày tiếp theo của một thành phố
  bất kỳ trên thế giới.
  Ứng dụng sử dụng API của WeatherAPI để lấy dữ liệu thời tiết.
- **Chức năng:**
    - Tìm kiếm thành phố để xem thời tiết.
      Khi nhập tên thành phố vào ô tìm kiếm sẽ được gợi ý các thành phố có tên tương tự.
    - Xem thời tiết hiện tại của một thành phố bất kỳ trên thế giới.
    - Xem dự báo thời tiết 4 ngày tiếp theo của một thành phố bất kỳ trên thế giới.
      Có thể xem những ngày tiếp theo.
    - Lưu lại các thành phố đã xem trong ngày để dễ dàng xem lại.
    - Đăng ký và hủy nhận thông báo qua email về thời tiết hàng ngày. Có xác thực email.

## Cấu trúc project

- Kiến trúc project: **MVVM**
- Một số thư viện sử dụng:
    - **Provider:** Quản lý state của ứng dụng.
    - **Dio:** Thực hiện các request API.
    - **Shared_preferences:** Lưu trữ dữ liệu local.
    - **Dart_ipify:** Lấy IP của người dùng.
    - **Freezed:** Tạo các class immutable.
    - **Firebase:** Gửi mail thông báo thời tiết hàng ngày và xác thực email. Deploy ứng dụng.

## Mô tả hướng dẫn sử dụng:

- **Trang chủ:** Hiển thị thời tiết hiện tại của thành phố mặc định sẽ lấy theo vị trí của người
  dùng thông qua IP.
    - **Chức năng:**
        - Xem thời tiết hiện tại.
        - Xem dự báo thời tiết 4 ngày tiếp theo.
        - Chọn thành phố khác để xem thời tiết.
          Khi nhập tên thành phố vào ô tìm kiếm sẽ được gợi ý các thành phố có tên tương tự.
        - Lưu lại thành phố đã xem trong ngày.
        - Đăng ký và hủy nhận thông báo qua email về thời tiết hàng ngày.

## Demo ứng dụng
<video width="320" height="240" controls>
  <source src="/assets/videos/demo.mp4" type="video/mp4">
</video>

- **Trang chủ:**
  ![Home](/assets/images/home_page.png)
- **Tìm kiếm thành phố:**
  ![Search](/assets/images/search_location.png)
- **Đăng ký nhận thông báo qua email:**
  ![Register](/assets/images/register_daily_weather.png)
- **Thông báo qua email:**
  ![Email](/assets/images/email.png)
- **Xác thực email và chuyển hướng đến ứng dụng:**
  ![Verify](/assets/images/verify_email.png)
  ![Verify](/assets/images/verified_email.png)
- **Responsive:**
    - Tablet:
      ![Responsive](/assets/images/responsive_tablet.png)
    - Mobile:
      ![Responsive](/assets/images/responsive_mobile.png)