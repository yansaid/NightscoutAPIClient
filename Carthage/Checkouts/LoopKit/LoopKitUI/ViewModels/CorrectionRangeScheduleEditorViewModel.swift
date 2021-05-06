//
//  CorrectionRangeScheduleEditorViewModel.swift
//  LoopKitUI
//
//  Created by Nathaniel Hamming on 2021-03-19.
//  Copyright © 2021 LoopKit Authors. All rights reserved.
//

import Foundation
import HealthKit
import LoopKit

struct CorrectionRangeScheduleEditorViewModel {

    let guardrail = Guardrail.correctionRange

    let mode: SettingsPresentationMode

    let glucoseTargetRangeSchedule: GlucoseRangeSchedule?

    let minValue: HKQuantity?

    var saveGlucoseTargetRangeSchedule: (_ glucoseTargetRangeSchedule: GlucoseRangeSchedule) -> Void

    init(therapySettingsViewModel: TherapySettingsViewModel,
         didSave: (() -> Void)? = nil)
    {
        self.mode = therapySettingsViewModel.mode
        self.glucoseTargetRangeSchedule = therapySettingsViewModel.glucoseTargetRangeSchedule
        self.minValue = Guardrail.minCorrectionRangeValue(suspendThreshold: therapySettingsViewModel.suspendThreshold)
        self.saveGlucoseTargetRangeSchedule = { [weak therapySettingsViewModel] glucoseTargetRangeSchedule in
            guard let therapySettingsViewModel = therapySettingsViewModel else {
                return
            }

            therapySettingsViewModel.saveCorrectionRange(range: glucoseTargetRangeSchedule)
            didSave?()
        }
    }
}
