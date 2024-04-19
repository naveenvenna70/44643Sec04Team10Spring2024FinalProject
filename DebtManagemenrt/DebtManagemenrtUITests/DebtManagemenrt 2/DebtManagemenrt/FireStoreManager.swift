
import UIKit
import FirebaseCore
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift


class FireStoreManager {
   
   public static let shared = FireStoreManager()

   var db: Firestore!
   var dbRef : CollectionReference!
   
   init() {
       let settings = FirestoreSettings()
       Firestore.firestore().settings = settings
       db = Firestore.firestore()
       dbRef = db.collection("Users")
   }
      
    func addDebtDataToFirestore(_ loanData: LoanData, completion: @escaping (Bool) -> Void) {
        // Query Firestore for existing documents with the specified useremail
        let query = db.collection("DebtTracking").whereField("useremail", isEqualTo: loanData.useremail ?? "")
        
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error querying Firestore: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            // Check if any documents were found with the specified useremail
            if let documents = querySnapshot?.documents, !documents.isEmpty {
                // If a document is found, show an alert message
                showAlerOnTop(message: "You have already added one loan!!")
                completion(false)
            } else {
                // If no document is found, proceed to add the new data to Firestore
                let data = [
                    "ServiceNo": loanData.serviceNo ?? "",
                    "LoanIssuedDate": loanData.loanIssuedDate ?? "",
                    "LoanAmount": loanData.loanAmount ?? "",
                    "InterestRate": loanData.interestRate ?? "",
                    "NoOfYears": loanData.noOfYears ?? "",
                    "NoOfInstallment": loanData.noOfInstallment ?? "",
                    "TypeofLoan": loanData.typeOfLoan ?? "",
                    "paymentDate": loanData.paymentDate ?? "",
                    "useremail": loanData.useremail ?? ""
                ] as [String: Any]
                
                self.addDataToFireStore(data: data) { success in
                    if success {
                        showOkAlertAnyWhereWithCallBack(message: "Loan Added Successfully") {
                            completion(true)
                        }
                    } else {
                        completion(false)
                    }
                }
            }
        }
    }

    func addDataToFireStore(data: [String: Any], completionHandler: @escaping (Bool) -> Void) {
        let dbr = db.collection("DebtTracking")
        dbr.addDocument(data: data) { error in
            if let error = error {
                print("Error adding document: \(error.localizedDescription)")
                showAlerOnTop(message: "Error adding document: \(error.localizedDescription)")
                completionHandler(false)
            } else {
                completionHandler(true)
            }
        }
    }

    func addUserDataToFireStore(data:[String:Any] ,completionHandler:@escaping (Any) -> Void){
        let dbr = db.collection("User")
        dbr.addDocument(data: data) { err in
                   if let err = err {
                       showAlerOnTop(message: "Error adding document: \(err)")
                   } else {
                       completionHandler("success")
                   }
     }
        
        
    }
    
    func getQueryFromFirestore(field:String,compareValue:String,completionHandler:@escaping (QuerySnapshot) -> Void){
        
        dbRef.whereField(field, isEqualTo: compareValue).getDocuments { querySnapshot, err in
            
            if let err = err {
                
                showAlerOnTop(message: "Error getting documents: \(err)")
                            return
            }else {
                
                if let querySnapshot = querySnapshot {
                    return completionHandler(querySnapshot)
                }else {
                    showAlerOnTop(message: "Something went wrong!!")
                }
               
            }
        }
        
    }
}
