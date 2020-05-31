//
//  CloudKitCoordinator.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/12/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit
import CloudKit

protocol CKSyncable {
    var ckRecord: CKRecord { get }
    var recordID: CKRecord.ID { get set }
    static var recordType: CKRecord.RecordType { get }
    init?(record: CKRecord)
}

enum CKError: Error {
    case ckError(Error)
    case couldNotUnwrap
}

protocol CKServicing {
    typealias SingleItemHandler<T> = (Result<T, CKError>) -> Void
    typealias ArrayHandler<T> = (Result<[T], CKError>) -> Void
    var publicDB: CKDatabase { get }
    func save<T: CKSyncable>(object: T, completion: @escaping SingleItemHandler<T>)
    func fetch<T: CKSyncable>(predicate: NSCompoundPredicate, completion: @escaping ArrayHandler<T>)
    func update<T: CKSyncable>(object: T, completion: @escaping SingleItemHandler<T>)
    func delete<T: CKSyncable>(object: T, completion: @escaping SingleItemHandler<Bool>)
}

extension CKServicing {
    var publicDB: CKDatabase {
        CKContainer.default().publicCloudDatabase
    }
    func save<T: CKSyncable>(object: T, completion: @escaping SingleItemHandler<T>) {
        let record = object.ckRecord
        publicDB.save(record) { (record, error) in
            if let error = error {
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
                completion(.failure(.ckError(error)))
                return
            }
            
            guard let record = record,
                let savedObject = T(record: record)
                else {
                    completion(.failure(.couldNotUnwrap))
                    return
            }
            
            completion(.success(savedObject))
        }
    }
    
    func fetch<T: CKSyncable>(predicate: NSCompoundPredicate, completion: @escaping ArrayHandler<T>) {
        let query = CKQuery(recordType: T.recordType, predicate: predicate)
        publicDB.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
                completion(.failure(.ckError(error)))
            }
            
            guard let objects = records?.compactMap({ T(record: $0) }) else {
                completion(.failure(.couldNotUnwrap))
                return
            }
            
            completion(.success(objects))
        }
    }
    
    func update<T: CKSyncable>(object: T, completion: @escaping SingleItemHandler<T>) {
        let operation = CKModifyRecordsOperation(recordsToSave: [object.ckRecord], recordIDsToDelete: nil)
        operation.savePolicy = .changedKeys
        operation.qualityOfService = .userInteractive
        operation.modifyRecordsCompletionBlock = { (records, _, error) in
            if let error = error {
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
                completion(.failure(.ckError(error)))
            }
            
            guard let objects = records?.compactMap({ T(record: $0) }),
                let object = objects.first
                else {
                    completion(.failure(.couldNotUnwrap))
                    return
            }
            completion(.success(object))
        }
        publicDB.add(operation)
    }
    
    func delete<T: CKSyncable>(object: T, completion: @escaping SingleItemHandler<Bool>) {
        let operation = CKModifyRecordsOperation(recordsToSave: nil, recordIDsToDelete: [object.recordID])
        operation.qualityOfService = .userInteractive
        operation.modifyRecordsCompletionBlock = { (_, recordIDs, error) in
            if let error = error {
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
                completion(.failure(.ckError(error)))
            }
            
            guard let recordIDs = recordIDs, recordIDs.count > 0 else {
                completion(.failure(.couldNotUnwrap))
                return
            }
            completion(.success(true))
        }
        publicDB.add(operation)
    }
}

protocol CKPhotoAssetAttachable where Self: CKSyncable {
    var photo: UIImage? { get set }
    var photoData: Data? { get }
    var photoAsset: CKAsset? { get }
}

extension CKPhotoAssetAttachable {
    var photoData: Data? {
        guard let photo = photo else { return nil }
        return photo.jpegData(compressionQuality: 0.5)
    }
    
    var photoAsset: CKAsset? {
        guard let photoData = photoData else { return nil }
        let tempDirectory = NSTemporaryDirectory()
        let directoryURL = URL(fileURLWithPath: tempDirectory)
        let fileURL = directoryURL.appendingPathComponent(UUID().uuidString).appendingPathExtension("jpg")
        do {
            try photoData.write(to: fileURL)
        } catch {
            print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
        }
        return CKAsset(fileURL: fileURL)
    }
}

extension CKAsset {
    func getImageForAsset() -> UIImage? {
        guard let data = try? Data(contentsOf: self.fileURL!) else { return nil }
        return UIImage(data: data)
    }
}
