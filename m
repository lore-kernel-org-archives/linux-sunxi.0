Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2023.outbound.protection.outlook.com [40.92.98.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE601367
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Apr 2022 13:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGvYxjvrXYYOHJxny5YTEDttCpcmjXI4rBl5x4FhWIYPnF4qpJ7/iA91bR+WtyT7rTXdzNQAi4yRRfNzGLif7NZINVA7hdCK30DzaDtIba9oGhp8l9KPS7DvfMhGbyIG6wWzqM9w1lfNRDy1Xfyuia7Gx7YID9krXCxRi/PhhuGlTXC09HLX+IRXOl5RABrIOfhpcBq6wAaQqBi3hqo3OF9325ZorGQf+lasa38B2TGXQcr6wc71/om0voGEjcGQGzInvqyXvJ5CoWfhRsg8mSYAwEKkVSAdKKLZVTVf9CiCJIkaI14IjUn5PuofqSx/mfS7cx9o8TFjYFgNOCeZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuImLI+D5Nvp9Fup78PHdF/vVUfCV1E6dGaVAWN+xko=;
 b=OsFT0GkXBg90tfm2tu/Gm7Qn1NJrpqxrUeySAO4WJDj7BHU3NpMNb0mH1v1u+wD1JJyFYHtGkjDphc5YkUJvElRFkkASQFiKrKIJSMQszgSoLjf9oX6Bzsz0DDzX0aL4AKrBlJjVfO6ITknIGzLjXYTWOBfvcozUDiDiGFKN3Yy05QABS8koFmhOxnFjZQznIq/tAShmhhNiePgHLxR1e9maq961DbvT7Z0Ea8H20/CQxK0VR3Dw3lRZ+apr+XnZ5e2yts8aGnKvwV5r82ohLBE5EHQn2IWtcVdJpSQg/barn8/ROPkt8kjyTSuurHwKiT3ow0eMMUokhX2CsnkDzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuImLI+D5Nvp9Fup78PHdF/vVUfCV1E6dGaVAWN+xko=;
 b=mzrZswtZ+DYuBQouBeZ6WnTH54JIPnZTvVUNq3ODZAvf5sxIZhjqC1nAwlclLy3S7voJMGwhJiGKHAGB2p5VbYjFc5aEq53z3TcenIpThZd5p+zXaOO6LAy/aZX9eIPkDJ1eRcAygUYRxTD6SCtwP9Oz7jMIMoGHTTOrajx2/4OXjxCxlSWTa7EXM399KN+vTRPsOpHwfxF7krUnEPukAE6FrRCuPFFbRzrYon1H/aACbG4E4exVBv2OoRhX5yz4QWxdFiyKhZe4YQ49zFe3p/AmJLUIqkTlTRvBEfzeYWVWtYUHsn17ddp6wVeqaP9W1ndvFRxc5r/FU8sW8c25Tg==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by TYBP286MB0111.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8026::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Fri, 1 Apr
 2022 13:10:09 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9561:8d97:d8de:60d0]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9561:8d97:d8de:60d0%6]) with mapi id 15.20.5123.028; Fri, 1 Apr 2022
 13:10:09 +0000
Date: Fri, 1 Apr 2022 21:10:03 +0800
From: Zhang Ning <zhangn1985@outlook.com>
To: linux-sunxi@lists.linux.dev
Subject: USB lost issue in OrangePi PC has gone, no code change.
Message-ID:
 <OS0P286MB0641963BB779FEA4212582D1CDE09@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TMN: [Zh/yCiWjWz1zQwW3+MVPNGf7DSMaYDrn5kTvhl5vK53QlmlK4LcJDCi/0A2Qxqfb]
X-ClientProxiedBy: HK2PR04CA0074.apcprd04.prod.outlook.com
 (2603:1096:202:15::18) To OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:cb::10)
X-Microsoft-Original-Message-ID: <Ykb4OCNmanU+fbEP@orangepipc>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c42ef4a-fba8-498f-3104-08da13e0f2f3
X-MS-TrafficTypeDiagnostic: TYBP286MB0111:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sN75IIxCveYRAcXRAx8bDgXKwo9Vm+pMP1/8vTpOIRBc3s93i1WpIFJOUbJw2oQ/LdOxAjVonmsf/Bf9gW1JqHZa3VhucmnQCWmLIQdwGfjZ/c6tSIkAhaddSMgSbaW6vwBYciAKM3sNa7bQob2JtRDKQV4FqL2ZZnuGLYxs0xOmpUDBvcj53N9eWkDnblSPVqY8UTW4RQtYHRgYLWV6M8wtGTEG1VFC4QU2l9jOpL+BoY4uPYy1PvNvL8DLK13G40FzejnGF4tVpBdcTIDocXodxt6XIEJKiPWp7OoLPVR/cEhE9SVoDq9i9rz9Gz+e6j7PaBsW1vKTXfFcIubbF1dOkNB5enuAdYkzNpU3WsWTd86vBHGoJG9uZAtsx+2YFvKBEhtZJwHzY0O3LJr4liesOBYThUZVm6HO+6JFdTw071n+i0mD/dPKF4CQR217LfLahGj3+wtX1Z8fhJwYIP6S4+zd1E6q/SDHpees2FGcz7aLoZF9M7uPooqldyYD7IAyoD6D9WOZatOjrqxfpJh+4bBLl1qPrIRgWq11FId+xpC1ApJqo5eLxDhhkYVqEz2sKfQb0sLYDH6OcQ1m+g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW5oMEFmTml2K0hBUkN5dmtkWFhuajc3Y2NEVExrMXhtZTFrbWU4dFhvYkZV?=
 =?utf-8?B?TDBKbDdROXRuMDFtUVVteTZWUUQ2M21qZTlhVy80U2E4TFlXS3dhMG5tMUlR?=
 =?utf-8?B?UXNLWGJYVFNUOU5LZ0pqNDEwb1ZSb2h2aXlUN0xTbkZtaTd5cnRGR1ZPTndX?=
 =?utf-8?B?M1RwSmdQNElNdGpoblVKQTVBMklXcGYxbmJnYVh5NkZNaW8yYnQ2YjlNSlBj?=
 =?utf-8?B?L2pGQ21Dc2RlQmVTWnUyeVN6MlR1NFJmTVFTa2dqenR0Q2VBZWk4ZFV2T2hq?=
 =?utf-8?B?U2ZVNjkwS2dDRW5KL0JxK3U0QTlJZ1RKLzNGS29uZEFOdzJYT0lhenliZElO?=
 =?utf-8?B?QmUvU1pUdTNJRUNrTWhwbG9oQlZhNmtPZFJ0Y0NvSWVTQVZXNFozVER3UGlN?=
 =?utf-8?B?WlhhdHhPQzUrd3ZEMGI4RjYvUUhvb0RrVW1vNHR4MzRSUFg3Qkc1WWkvSEtK?=
 =?utf-8?B?YWtEVys0TE5IeFR6YUpSVHJ6SWxTTEJoVWdZT043TWNBL01hZ1duZzU3TUNv?=
 =?utf-8?B?WFoycVM5OXhDS0UvOXJaVWtPQ2JnN2ExRDRQVGFLMnBSSGxyM2pFbUJ3dy9z?=
 =?utf-8?B?YTRxYVpQZHFpMGNHdWdUS1V5SzE0R3d3bEdKdStzQjEzdTJobDRZMGU2ZUN1?=
 =?utf-8?B?YS90clZEazRFaGd1YzZqNlJoSy9LYXJITk9Qd2ZaQzJCM3Y1Y0R3SmJ0N1lY?=
 =?utf-8?B?c3BWY2F5ZUUrQ2pSVmdOUUQ2Y0oveEx6bnZjbVNBcFk3bmVDSG5XYkFNSHAw?=
 =?utf-8?B?MFpIZTZIclhkMk42VUsyZVlxVVhHMm00UHRQdFNwVk94M2dGY1UxYk5sa0U0?=
 =?utf-8?B?Vi9ycDBubFdydEFLVENwVGE4bFhDeUp6RW5DTkc1ZnJoSFhJKzd2RjJlRWp5?=
 =?utf-8?B?T29pckJlNGp0cG9yYmkwMVZuYmpsVmU0T2gveGxWVnM3ZmUxVDNWcTY4ZFdt?=
 =?utf-8?B?RjlpS3FBOVg4ZkZZSzhLc3lUYTlZMkkwb1BwL3lnY1ZTUDNhQ1pqYU5CQTlo?=
 =?utf-8?B?QjVzSHZKd0ZIMS9xNm1OQjFnZDVBMHZrR1BUenF4bVZIZnhBVnE2dmxhMS95?=
 =?utf-8?B?UUJscGlRcmloazQxVFpHOXJRcXNjc1RESytqU2R4czFtajZ4YXdjVXdMTXZt?=
 =?utf-8?B?OTVQZkVwUGl3ZXJMRTZwUUZGenQvclpPbEFuM2RJamZpd3NlVEozd1lyZW13?=
 =?utf-8?B?akJEeHpWSFdMK1dsdERaSXpGQjJDcFVsakRxcTFlMzRVVUlTR3ZPZExYNHg5?=
 =?utf-8?B?RVo2Vm9sWEhxRjE5cE8xSm8xZGJNM09rR0s1bGI1dFpnZExCM0pma0M3czEx?=
 =?utf-8?B?VnBKb3BFOVlrY01nNHBOQ2MxYVFXcEVFZTB5UHFvakZiaThkMCtPbVc5eWNU?=
 =?utf-8?B?Z3ZXMUxBWTdFSVZHV0pJQ3RhS2xVZDBiTHN3WVVUK2RwS2FQdm5LME5PamVX?=
 =?utf-8?B?RnpEbTgxUERDUFk3bVVXRGlSVGJTdXJ1OTNHaEQ0MlNnTGZybTBLZ0o1SEJo?=
 =?utf-8?B?d2FjeEVzSUV2VExGbmIwMCtBb3F4MGd5K2VXMGRBQTYwVUhUelBzYVYwQ0Jq?=
 =?utf-8?B?NkdhYVB1U1c0OVU1dFJvZFNsSkJXTzN5b0c3OExPclRIY3c3TjBsS01rUS96?=
 =?utf-8?B?NWlWSHhQMVFJUnFOMExHQTM1VVU4K1k5SitIWGhYU01VbnhPZ2tod2RhQTZL?=
 =?utf-8?B?aFNCaSs4YjN5VTluNGFKQ0lEeXl4L1lreW8wRUh4Y2ZMMWIrTGN4bUhQL0tT?=
 =?utf-8?B?bklsZ1hPRjF1UGZBS1hFLzZqY050SEc1aC8xZGpOWHhxaGprQ2tkb05WSUdB?=
 =?utf-8?B?K1FkcytLSHlHcHNZSjVGRjBFOXNueWQ2TVBaZ1dxZ09YZHYwRFFPNVN3SEhH?=
 =?utf-8?B?dFVJZHViMzBNcUV6TWhjdC9YUTBnVzkyS09lbmREUWo4a0lBL1pqcW1OVW1C?=
 =?utf-8?B?UGx0cUtmZUhiWGIvWndVU1d0Sk1Ra2psY3lSd1RMVlY0c3B3MXpndjg1RUNh?=
 =?utf-8?Q?zWoH/AdGSc5zwqC4HlEKW7hHaGZSVU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c42ef4a-fba8-498f-3104-08da13e0f2f3
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:10:09.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0111

Hi, all

I reported USB driver can't use after upgrade to 5.16.

this issue is gone these days.

when I update my kernel to v5.17.1, the issue still happens.

but after I do 2 things,
1, switch musb to host mode
2, enable credus video decoder.

the issue is gone.


