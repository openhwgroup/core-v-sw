# OpenHW CORE-V HAL Requirements Discussion Meeting Minutes

Thursday, Feb. 10th, 2022, 10:00 EST

## Attendees
Duncan Bees, Tim Saxe, Jeremy Bennet, Yunhai Shang, Vincent Cui, Robert Balas, Olive Zhao



## Actions Items

- **Yunhai and Duncan** to prepare for project lanuch.

- **Yunhai and Olive** to add short description on CSI coulum in the comparison table to explain how it meets/not meet each requirement.
   For Requirements not being met, add what and when to do?.

- **Yunhai** to discusses with Ali Baba regarding release CSI code and documents in OpenHW github to make it open source.



# Meeting Notes

- The comparison on existing standards and SDKs from different vendors are done.
- It is proposed to go with CSI; HAL reference implementation will be based in CSI implementation.
- S-3: Update from Yunhai: documents on CSI and comments in CSI code have been translated into English.
- Jeremy suggested Yunhai to share the english version of the CSI documents (standards, user manual etc.) for native english spoken folks to review.
- Update from Yunhai: Interactions between Alibaba and RISC-V International regarding CSI: a task group will be formed in about one month. (in March timeframe).
- Jeremy suggested Duncan to get in touch with RISC-V Inernational S/W Steering committee so that OpenHW's voice can be heard when HAL standards are created.
- S-4: RISC-V International might be the body to maintain the CSI HAL standards according to the interaction between Alibaba and RISC-V International
- T-2: limit the supported on-chip peripherals to basic on-chip prepherals such as UART.
- T-6: Not impemented in CSI. Chip information generated automatically by hardware design tools? or excel file format to provide chip information? Tim would like to search to see what example he can find.
- T-7: Not implemented in CSI. this requirement is similar to the SVD in CMSIS.






