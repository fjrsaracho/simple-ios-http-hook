import Foundation

let url = Bundle.main.object(forInfoDictionaryKey: "GET_HTTP_REQUEST_URL") as! String
func doHttpRequest(completion: @escaping (Bool) -> Void) {
    DispatchQueue.global().async {
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    completion(false)
                } else if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                    completion(true)
                }
            }
            task.resume()
        }
    }
}
