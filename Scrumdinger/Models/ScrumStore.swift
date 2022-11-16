//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Alexander Spurlock on 11/16/22.
//

import Foundation
import SwiftUI

// view model?
// contains objectWillChange that tells to listeners when @Published is about to change
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager
            .default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrums.data")
    }
    
    static func load(completion: @escaping (Result<[DailyScrum], Error>) -> Void) {
        // perform longer tasks in the background
        DispatchQueue.global(qos: .background).async {
            do {
                let fileUrl = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileUrl) else {
                    DispatchQueue.main.async {
                        completion(.success([])) // create file if error
                    }
                    return
                }
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(dailyScrums))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(scrums: [DailyScrum], completion: @escaping (Result<Int, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(scrums)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(scrums.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
