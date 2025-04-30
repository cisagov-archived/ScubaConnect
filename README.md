![ScubaConnect Logo](graphics/ScubaConnect%20GitHub%20Graphic.jpg)

[![GitHub Release](https://img.shields.io/github/v/release/cisagov/ScubaConnect?label=GitHub&logo=github)](https://github.com/cisagov/ScubaConnect/releases)
[![GitHub Downloads](https://img.shields.io/github/downloads/cisagov/ScubaConnect/total?logo=github)](https://github.com/cisagov/ScubaConnect/releases)
[![Issues](https://img.shields.io/github/issues/cisagov/ScubaConnect)](https://github.com/cisagov/ScubaConnect/issues)
[![License](https://img.shields.io/github/license/cisagov/ScubaConnect)](https://github.com/cisagov/ScubaConnect/blob/main/LICENSE)
[![GearConnect Workflow Status](https://img.shields.io/github/actions/workflow/status/cisagov/ScubaConnect/m365_image_build.yaml?label=GearConnect%20(M365)%20Image&labelColor=008ad7)
](https://github.com/cisagov/ScubaConnect/actions/workflows/m365_image_build.yaml)




ScubaConnect is cloud-native infrastructure that automates the execution of assessment tools [ScubaGear](https://github.com/cisagov/ScubaGear) and [ScubaGoggles](https://github.com/cisagov/ScubaGoggles) across multiple tenants from a central location, allowing administrators to maintain consistent and secure configurations

### Target Audience

ScubaConnect is for M365 and GWS administrators who want to streamline the assessment of their tenant environments against CISA Secure Configuration Baselines (SCBs), eliminating the need to manually update, configure, and run ScubaGear and ScubaGoggles.

### Federal Agencies

Following the release of CISA’s [Binding Operational Directive (BOD) 25-01: Implementing Secure Practices for Cloud Services](https://www.cisa.gov/news-events/directives/bod-25-01-implementation-guidance-implementing-secure-practices-cloud-services) on Dec. 17, 2024, which requires Federal Civilian Executive Branch (FCEB) agencies to deploy SCuBA assessment tools for in-scope cloud tenants no later than Friday, April 25, 2025 and begin continuous reporting, agencies can use ScubaConnect to ensure their cloud environments are properly configured and that reports are submitted automatically to CISA. For more information, please refer to the [SCuBA project webpage](https://www.cisa.gov/resources-tools/services/secure-cloud-business-applications-scuba-project) or email scuba@cisa.dhs.gov.

## Overview

ScubaConnect has two managed components for SCuBA’s two current assessment tools: GearConnect (for ScubaGear) and GogglesConnect (for ScubaGoggles).

### Getting Started with GearConnect

All code is provided in terraform for easy installation. For use with [ScubaGear](https://github.com/cisagov/ScubaGear) (Microsoft 365), see [`m365`](m365) directory.

### Getting Started with GogglesConnect

All code is provided in terraform for easy installation. For use with [ScubaGoggles](https://github.com/cisagov/ScubaGoggles) (Google Workspace), see [`gws`](gws) directory.

## Resources

* [BOD 25-01: Implementation Guidance for Implementing Secure Practices for Cloud Services](https://www.cisa.gov/news-events/directives/bod-25-01-implementation-guidance-implementing-secure-practices-cloud-services)
* For FCEB agencies, email scuba@cisa.dhs.gov to gain access to the SCuBA Slack Channel


## Project License

Unless otherwise noted, this project is distributed under the Creative Commons Zero license. With developer approval, contributions may be submitted with an alternate compatible license. If accepted, those contributions will be listed herein with the appropriate license.
