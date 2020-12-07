// Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit

class GroceryItem {
    
    var id: Int!
    var image: String!
    var title: String!
    var price: Double!
    
    init(_ id: Int, _ image: String!, _ title: String!, price: Double!) {
        self.id = id
        self.image = image
        self.title = title
        self.price = price
    }
    
}
