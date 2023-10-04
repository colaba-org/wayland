//
//  main.swift
//
//
//  Created by Artur Gurgul on 04.10.23.
//

import Foundation

//@main
//struct Desktop {
//  static func main() {
    print(Date())
//  }
//}


import MyPoint

test()

let p = MyPoint(x: 4, y: 20)

print(p)


import Curl





class Response {
    var data = Data()

    var body: String { String(data: data, encoding: .ascii)! }
}

var response = Response()

let handle = curl_easy_init()
curl_easy_setopt_string(handle, CURLOPT_URL, "http://www.google.com")

let pointerResult = curl_easy_setopt_pointer(handle, CURLOPT_WRITEDATA, &response)
guard pointerResult == CURLE_OK else {
    fatalError("Could not set response pointer")
}
curl_easy_setopt_func(handle, CURLOPT_WRITEFUNCTION) { buffer, size, n, reference in
    let length = size * n
    let data = buffer!.assumingMemoryBound(to: UInt8.self)
    let p = reference?.assumingMemoryBound(to: Response.self).pointee
    p?.data.append(data, count: length)
    return length
}

let ret = curl_easy_perform(handle)
guard ret == CURLE_OK else {
//    let error = curl_easy_strerror(ret)
//    print("error: ", error)
    fatalError("Something went wrong with the request")
}
curl_easy_cleanup(handle)

print(response.body)
