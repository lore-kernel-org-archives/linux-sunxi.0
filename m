Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9917F
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 14:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqU5tOiO34TbbUJfyoZbJF9fb3exTqZdABVtRTL+az0BqT6ZtORbTxx2Ns1u2QDEzvuARbrqSBR8x3DgPOUUNVRZiNjM/YZhTvYJbYOs5CKcHUPiI0zT/elePo4Otwk9Ns7eS0UWrfRJ04WB19V4pKXzcdUXELciL34wH03TwAvMGa19pFQnA508iYK4BYOyBQxyENvulTCBy6y3Vq7sDZVafztioIheivE1VENXrPJOBQI6h3Fw4cweo3m4mYVH0NjMlRvDPF+tWCSLOdciulqWVqdjDa4UFbhTpifs3Wt30CBd+MZAW/7sKgw985FaESQs3TcesxS0/w2qW7vgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/u/Xwx8p8YnFmZRzrXf2M38mnF1LKG2Z5I9kx5hT8c=;
 b=EZuHTwkF18Ot0QmvWFB325Xp+umsKENl53/20iS+UP2obEPCSgegpGsuTBbr5lpAYMLdugOKBETxx4EufTwOqC4lugpq9Q4FfHnP+AOdgn4SUBDiHS2p9qxWQcHpnN+KV9e4RjVOnuID4JyHedte4eyC6GXRf46LJRQQZHEDhbGPdkdcAlOMwNo+WAY4NbBSLsAirORXJwbLxM8ZwTrkmozk/9saNjXJG2GAqwinWkebDa+dqyL1WT6Zbgfc5kATinVF20z/Jksa8dbxa4VCMG8kolKZGStozXlNCYVfEExXg9dUBfAw/r8A0kvGn9HJiLriOx7cPZKF8fVe6rQ61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/u/Xwx8p8YnFmZRzrXf2M38mnF1LKG2Z5I9kx5hT8c=;
 b=eHO6CQCJDjt6zXkXSr1Sq7Y1sBnoZr1eM9Pc8gYnCYaqYRSi2qmNpP7MD3t4AIHNHEG6xACGO5tO9CKyXdymbCs/35oWG1DSABlvU7I77zspL/gMSYciHcwaVBsFog3fohO2C6FHPnT8GsAnZXB/S1XC7tei8oK42wHQr/eIKrc=
Authentication-Results: vrull.eu; dkim=none (message not signed)
 header.d=none;vrull.eu; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBBPR03MB7129.eurprd03.prod.outlook.com (2603:10a6:10:206::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 14:34:02 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:34:02 +0000
Subject: Re: [RFC PATCH 2/3] sunxi: Implement fastboot_get_mmc_device()
To: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher
 <hs@denx.de>, Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20210524003650.24469-1-andre.przywara@arm.com>
 <20210524003650.24469-3-andre.przywara@arm.com>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <c4cd77a4-5e61-d2a4-15e3-164024e0051f@seco.com>
Date: Mon, 24 May 2021 10:33:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210524003650.24469-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: MN2PR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:208:d4::47) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by MN2PR04CA0034.namprd04.prod.outlook.com (2603:10b6:208:d4::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend Transport; Mon, 24 May 2021 14:34:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5281c577-0717-4cda-c7c4-08d91ec0fa06
X-MS-TrafficTypeDiagnostic: DBBPR03MB7129:
X-Microsoft-Antispam-PRVS:
	<DBBPR03MB71296402DBEB72405407D9D796269@DBBPR03MB7129.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CfRL52xIfNKiRE+S4jxwIBKcpa1u01z0MPszk3wrCw3zL4/76xUUeV6i6vHVCS6GOaLqysoChnCS5Kv7J4j2v3vWLHSBD6EdhJTvaYFrdFfTvBXe18ofoKtE1/d7dd6RHQ1aDiABx6tcElBW74/imxKp66qzZxX4/Qz6AtQDANBW4jIlqH4Fd3vKKklpOabhXN1q7/Fg/VgEDWhQrAh1JOdl+ltllGA1Rv8uSh7ZeOxQ8JvM7ZEhJuolHD486SR6ohh0PluSrvKCeGOIbjkVzuOf8DBYHjnGC0JuCPRpstiBc1YXI6sud+QTRiHeBqWNLzb3Nab++dkeX47AxKr8cFwDSbeqttOb5PmKrdjdY0u7gnGNdYw9OfP3CoiyYH8qY3TyMwFNVJkFGM7eqIqDWd0qiNVj9T4ccfM5wjJ1S0EN+LIjbL6XksioJL0mrDUlMz7DvxFHLi97B8IpilP2Q8madyEkf0H7capGfZceWKZHzdlWd9sutztge4b0dDClhbBcQTr4qZzc2Z34szJL8NytYQiP6cMoHo2rVzaYNYiCwxSqI1JqPnY8lYYGqDRfC8kjMcTdu8lro/3o+leykWfyIORolHG5p5lUEvYMkkRYSZd2tUbfarPe8ZBFDhhlFKkyTURtyXDszfECKN8xX0UyG10XjGjM7LOZWuxAqWvDWYPeo1u0bBuCxq8iBJQqyR4zVm+Xll0gwvCXWKRwYnZSyOwWNvwnaJv54GYV0ho=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39840400004)(396003)(346002)(376002)(2906002)(31686004)(54906003)(316002)(16576012)(52116002)(110136005)(38100700002)(53546011)(38350700002)(86362001)(66946007)(956004)(26005)(44832011)(66476007)(66556008)(16526019)(186003)(4326008)(8676002)(2616005)(36756003)(5660300002)(6666004)(478600001)(31696002)(8936002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?cFBtYmZvSHlPVmxncnpNQnhURzdLcitHdXJtc2R6aWxzVmhwUzBHeUJPM2xw?=
 =?utf-8?B?Q1lZb0pIbjE2eVRhQ3pDVlFDVmtWWEZ4eTFBVEIzckFxcHdseE1Wa1A5aWhL?=
 =?utf-8?B?M0lEa2JkbWpaOWl6d3BBS1VHNi9JQkVNZjVBZFlacGNEWVl4TkRHcTZKZzNj?=
 =?utf-8?B?V2dOQ093d3BEWitVVlRocTRpaDdvSkV2YWw4YnVXODQ5TGxKUUdDOVUyejNN?=
 =?utf-8?B?MkZNZ21TemY1cXJ3enhTSXVEZEt6U1pVdVMvc0pWcGhTQ29qWHJaT2pTMXRj?=
 =?utf-8?B?WHBqSkI0NlVML2IwWElrd1VVcVZVVkpVL3VlTHRuTnhoUXpySUs3M2JCVjVl?=
 =?utf-8?B?L01KKzc5YWk0WEwrbTRrdGFYNkJDSWFrOXhTUmRSNCt0WFRXZGI1QUNiMnUr?=
 =?utf-8?B?SDZ3RDNxVXY4eXRTRjBIWTQyRFd1UFdkRmZNUXNQeFdQMWZuL1U5YUptaEZF?=
 =?utf-8?B?NXpuSzM2N2dJaExPMVh4N0FnYXNGd2t6MThpcTR6T2IvZWZkV1k5UmRHNzMz?=
 =?utf-8?B?QS9YZUt6NVhjcDNpUjRuRnE3N0xuQTdvTVNuMFpxRjdOQmdJVkF3K3AzSVNz?=
 =?utf-8?B?Y005WTFON1BkRWNRd0FRVWNXditaZkZQYk9Bc3FtTXJYTzFLTmxHRDArd3Ri?=
 =?utf-8?B?UThSendFYmswTit1NjNOczdCbmRQOXJNOVlsOThVelIvZHAzdWxMT1FaQ0ZZ?=
 =?utf-8?B?QURJWElQMGc4RFlWelQwOHRiVU5paDlTRU9pTFVZbWpteUlvellaZi9NYTdN?=
 =?utf-8?B?aXJmTVZMc0w1REhVNlZrSkFlNUVwSjFCMWE0clhqejRxUk8xSjBTcGFnYVNu?=
 =?utf-8?B?MDU0QzM4aU4rbFF3YmRMUmZOajBWZU5WVzR1YnhtZ0JuK24wUFBMZDZmWXhF?=
 =?utf-8?B?SXNZTElucmUzTjFsZFM0cHR6TmZObE5WOGpJdDFwV2RMSHUxRUlpWlVTQUdY?=
 =?utf-8?B?TjU3dU9DRy9GbURpbEZzdFJkUkpSZXhxMEw4TTZLVmZxckJzcUJBWFhQcm03?=
 =?utf-8?B?dWsxTGU4U1d0MU8vRVFSRHhBTE1wVHRSZnE1OXBZUyt1WU9LTGU0Y3pVaU9G?=
 =?utf-8?B?OXgzSmVSOU9MZEFWanFCZGlZOXRvaVEyL2hSTUZWZHMyR2k5Q0IrbGdrUUQz?=
 =?utf-8?B?QlU0ZUZQT2VOcWMwQnlsZEtyM05RdFpzRWFkMC9iek9NM3dBUk5HRlFXOTdP?=
 =?utf-8?B?V0JETERKTzhLQXVKUWlWSFdkdEpKcVR5REZsaFhpbU1rK0FxLytvNGY0ZThu?=
 =?utf-8?B?VFoyWGJhNWQ2RlllYkhOT1BwSzQ2dXQ3ZkQxY0ovUzFVWmo1RXRrUE9uOWVu?=
 =?utf-8?B?RmlJQkdrQ3haNWRXa2Nrd1YrcGNiam9MOEczSVVVeEg2dk1BQmk4MmpPVjdV?=
 =?utf-8?B?cXNMMGRNS2pic1F3b0JjY0I2TG9WSzNCRnZaLzVkNFYyOGJXVngrdU5lQ09X?=
 =?utf-8?B?SVBISGsrblNZVHBkTVNqSlFubngvc09BWjlWUDBOeEJZeGVhT1JxRmxocnYx?=
 =?utf-8?B?VVdhZHppTXhlelFodzlnNCtReWJscVNPOXRRSkpuYjFMOGphZXhBL1cwSXZI?=
 =?utf-8?B?RlJwTVREOWRjZ2pybTVvQXRzUllGaFRjMHJDY1QrenRLZUFqY2xTSHdsd0hv?=
 =?utf-8?B?ajgwa3hNdEwxNEx0SU1tVTU3NnB1YjFsRi9CdUNRaGdKV3o3UkJsS1huaW5t?=
 =?utf-8?B?K1EvKzdySCttcFlpQVMxVDJPT0NLNVVnaGtTZS8yeFBNZnhFSkhia1I0eFc4?=
 =?utf-8?Q?cdKXQpRAhVqQYDp0S4+lh4i+zwvPpZmAiKhWzkA?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5281c577-0717-4cda-c7c4-08d91ec0fa06
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:34:02.7857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8e/XhWeZ/jLZE/rTAC7fKDLDP1OTTWGLpA2flkZlsg3DE0tyQPnCYXEMazAnReVMzPDVKATg8NFWQJcvZbVjSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7129



On 5/23/21 8:36 PM, Andre Przywara wrote:
> The default MMC device to use for the fastboot flash command is hard to
> decide at runtime, since the numbering of the MMC devices depends on
> devicetree nodes. On the hardware side, the eMMC is connected to device
> 2, but this might be U-Boot's device 1 or 2, depending on whether the DT
> contains a WiFi node for the hardware MMC1 device.

Can you fix this with aliases? e.g.

aliases {
	mmc0 = &mmc0;
	mmc1 = &mmc1;
	mmc2 = &mmc2;
};

That way the mmcs will always have the same number even if (e.g.) hardware mmc 1 is absent.

--Sean

> 
> To avoid hardcoding this for each board, let's scan all MMC devices, and
> try to find the eMMC device, given that this is enabled. If not, we use
> the SD card.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   board/sunxi/board.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index 21651a1bfca..5f64887e48b 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -625,6 +625,43 @@ int board_mmc_init(struct bd_info *bis)
>   }
>   #endif
>   
> +#ifdef CONFIG_FASTBOOT_FLASH_MMC
> +int fastboot_get_mmc_device(void)
> +{
> +	struct udevice *dev;
> +	static int mmc_dev = -1;
> +	int sd_card = -1;
> +
> +	if (mmc_dev != -1)
> +		return mmc_dev;
> +
> +	for (uclass_first_device(UCLASS_MMC, &dev);
> +	     dev;
> +	     uclass_next_device(&dev)) {
> +		struct mmc *mmc = mmc_get_mmc_dev(dev);
> +
> +		mmc_init(mmc);
> +		if (!mmc->has_init)
> +			continue;
> +
> +		if (IS_SD(mmc)) {
> +			sd_card = dev->seq_;
> +			continue;
> +		} else {
> +			mmc_dev =  dev->seq_;
> +			break;
> +		}
> +	}
> +
> +	if (mmc_dev == -1)
> +		mmc_dev = sd_card;
> +	if (mmc_dev == -1)
> +		mmc_dev = 0;
> +
> +	return mmc_dev;
> +}
> +#endif
> +
>   #ifdef CONFIG_SPL_BUILD
>   
>   static void sunxi_spl_store_dram_size(phys_addr_t dram_size)
> 
