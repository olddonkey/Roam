//
//  WorkflowManager.swift
//  Roam
//
//  Created by olddonkey on 2018/6/24.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Foundation

indirect enum WorkflowStep {
    case authentication(WorkflowStep, WorkflowStep)
    case timeline(WorkflowStep, WorkflowStep)
    case idle
}

class WorkflowManager {
    
    var authenticationManager: AuthenticationManager
    
    var currentStep: WorkflowStep = .idle
    
    init(authenticationManager: AuthenticationManager) {
        self.authenticationManager = authenticationManager
    }
    
    func execute(step: WorkflowStep) {
        switch step {
        case .authentication(let afterSucceeded, let afterFailed):
            //Do nothing
            startAuthentication { succeeded in
                if succeeded {
                    execute(step: afterSucceeded)
                }else {
                    execute(step: afterFailed)
                }
            }
        case .timeline(let afterSucceeded, let afterFailed):
            startTimeline { succeeded in
                if succeeded {
                    execute(step: afterSucceeded)
                }else {
                    execute(step: afterFailed)
                }
            }
        case .idle:
            break
        }
    }
    
    func startAuthentication(_ completion: (Bool) -> Void) {
        
    }
    
    func startTimeline(_ completion: (Bool) -> Void) {
        
    }
}
