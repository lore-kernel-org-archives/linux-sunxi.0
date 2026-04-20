Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA3374E63
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Apr 2026 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694557; cv=fail; b=O+ynAwTv5JEkWW/zkD0l0gvDiqPzurjCrGWSzs63bzEVn/i1xjM15i1U0MJxsI8Hm0gcJOuSRYEdsTQMtCtXvMh26d9UxJPsQn9aDJ1FUk59xYpskW3b9CzI3hcB9gSMSd01s81x6AR83CE0OuxPthKgZJDMQ5cj/JBBl+F90DI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694557; c=relaxed/simple;
	bh=ZArEylO7O0/gLT7U44TR17tjCb0QBsxhaq/I/Qw/XA8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R14bZuRjTIIj1MOYOsjhZiHI64xlBs5Vupdx2RMRnY2yI/gqKcIuUxjHAaa6mwE4qCASfggIA9xUVuX2cBNa13fpSbpsEmsZ6Vct6+K6k3YS4ht1jZVONnNl6oBTg1ijU/StwgOhlJrRK+z6hk6sw0QZH0ZwjHs3/4LJRwZZLNM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Py2QIs2P; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Py2QIs2P; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Py2QIs2P";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Py2QIs2P"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=puqXnWaw+CQ+MFPl0qwVoG/mR2Eqb20Fth06ZPjVmXuu8V/miY86Ww6xV16X8GzyACZ+88g7W+Py1nDHS7NXkQivrBv4mBLZC8LErhTZPzXCnKNVs6KkaksWrukkREIS2NWgc1L2TUPEBI6ZdUFVWf/FHXlHG+86wybeECdmxVeqypgysVDmQDVh5pqneAlccrDmvU3DSnjqGXL2VgWApkT7QuBKgbMcsK8Nh4i2gLiqaII3Fb858nZdO9wZFxJa+oXP5waqTwNA+NbZSccn6gkXJ4105eG8lwi+a8mxBIshvnOJKzyyCzIaq4iF9MOP7g4CxofgIVffy/7vShlaow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vzXDw5cN4l/e7hGZPif8xxTxtJ/HCzXHiR2OmpIj9c=;
 b=BzCp37vx9NfgDqwv7l6nGdycvxpybiqci7ZigvpcGUMymyYI6Pn9yNMfqT9ql18ocgb/k6MG7+r2Bn1doAWiiWnAVH0CFKjHAnb58IGrQL0oVKeI3Ci7nEszvMEq9MCJnLgpe3FVxm3c1tcSRbt866noH3SUY+HlXxCY6Zhavn/rJWafHj+LGcWxbLY2iZiC5BbI8b2650AfppSzhUVcCVvTXmG51T8LOmQEkU7IQ3L8MpJox03Jd3y7Ioq0OdrEFEE3Q0XPUUBQzPmZgNezd5k52RVzvJCAw32FCS4GjfgblXM/2MgFbmzPJ7gkaoRbgJHJZCpJfmdtnTzBef7u7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=mmpsystems.pl smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vzXDw5cN4l/e7hGZPif8xxTxtJ/HCzXHiR2OmpIj9c=;
 b=Py2QIs2PsR6QZ3xBJHGk4waFB5besXRnkGBppNvRFsqqf3zS7lybAb5X52oQiwB1JkHZhOLVo3qFynMSesdEAT+PiU5NKJwEC2hDA0Izw2soXXXdLNQqw2PsMoZDwUpaP1DK0sfixLeltHDzYOoOrI9umAv80O5xzS1Wh1d/Jd8=
Received: from DUZP191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::14)
 by AS8PR08MB6149.eurprd08.prod.outlook.com (2603:10a6:20b:29d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 14:15:49 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::ee) by DUZP191CA0047.outlook.office365.com
 (2603:10a6:10:4f8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 14:15:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 14:15:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7GZXqNuQqZ8y1ijc2xfMgfBA5WrSvbQ2btgZD4XlGzfmC+yJgY1aQ78cLPkWgm/zAIBFU2H2d8TdqV0sIFtSh4RfUQnf+8mZKNEIz9vheoqxfP/1QeUNUZCexxAOkljfLN035amcaVEtSwLjaLxt2eEfIevEpX7eQav5f9TIWj+M9Iu8JTYOMcufQ6hjFfcloeCNPqO0vuYVtp/9y9bnVSmJxxW/hop9BVTC8uaBPA+7AgecpRrpLsGqaL/UOVcDQjHDqO0iIF2O0f4hf0i/4jptpOmGLnvDwrK6sLOzzFlyDWUm9f38gtT+WmOVO0eIs1ofuirHiU3wQxHFohy9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vzXDw5cN4l/e7hGZPif8xxTxtJ/HCzXHiR2OmpIj9c=;
 b=vOB6Jvtzb7Hr+ovh4ijPj9yN+PYOFTTcOX4KcDSIeCLFEKy42o19I7rqhd1UEPO57z1HxVCgXie5tXLKoqRI8qEdC8TBF9wO27py5xxushXtfJOyg4YTY8l4gBJtHYc5t466Oba9bVk/C2SA59tpUiPaeAskl8cJfbnGUqiwVCDxKl+1a7nsePZeiU0dDDDg8FD0kWYjPERXB/NKcCoigKvjK+WoevMNs3dlRZNbWWuKidfoExkIpiMA/xKnuDByIzN2vr8i+Ptg7rh8CCrvIRfqyz20S0Swixco+6jcUWT0JlJixtV+90mzoLQJwdvkIsz9dY82QqxdqRPfpNxpyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vzXDw5cN4l/e7hGZPif8xxTxtJ/HCzXHiR2OmpIj9c=;
 b=Py2QIs2PsR6QZ3xBJHGk4waFB5besXRnkGBppNvRFsqqf3zS7lybAb5X52oQiwB1JkHZhOLVo3qFynMSesdEAT+PiU5NKJwEC2hDA0Izw2soXXXdLNQqw2PsMoZDwUpaP1DK0sfixLeltHDzYOoOrI9umAv80O5xzS1Wh1d/Jd8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB8847.eurprd08.prod.outlook.com (2603:10a6:102:2fd::5)
 by DU0PR08MB8187.eurprd08.prod.outlook.com (2603:10a6:10:3ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 14:14:46 +0000
Received: from PAVPR08MB8847.eurprd08.prod.outlook.com
 ([fe80::2913:9fff:5b76:b7b4]) by PAVPR08MB8847.eurprd08.prod.outlook.com
 ([fe80::2913:9fff:5b76:b7b4%6]) with mapi id 15.20.9818.031; Mon, 20 Apr 2026
 14:14:45 +0000
Message-ID: <b89c1c8b-2678-4f4f-a63c-03b92cf7617c@arm.com>
Date: Mon, 20 Apr 2026 16:14:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add hstimer support for H616 and T113-S3
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
 <20260419225539.718367e0@ryzen.lan>
 <xlvldmapdoql7nt3swube5vd6fdiosq7rt5afg246xertko5fa@4irmzupkar23>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <xlvldmapdoql7nt3swube5vd6fdiosq7rt5afg246xertko5fa@4irmzupkar23>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0449.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::13) To PAVPR08MB8847.eurprd08.prod.outlook.com
 (2603:10a6:102:2fd::5)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR08MB8847:EE_|DU0PR08MB8187:EE_|DU2PEPF00028D04:EE_|AS8PR08MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b577e37-3e40-4565-1ab0-08de9ee7526b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 Wrhuee9WblNw2exXpqA0CwZOXIgpVu46MVjRvwzlHnXjN9wbqQLm98xRH3rcvCbDsAH0Kf/nLl0VPFU6zhWkmrNkY17Y+ahg1FVe4DmSyOTmXWaewpELvGNfqTq6nagx84jMf/mOl3DReH78dy4+2NNW22OxEnZgiEzz/WG6+XNVIazc1K4UW1U6aTUC2iQwJVDCj13649qCtNXRGyVYJmncyLBWD1o/iMRmFriKtA9wTcidkFZnX19vxubKqTSBgJITi3VlSRpwP9AJwAZw+qcVJTpaW+/JqIuPocaWNRaaCTfe64ym1NiLszze77H5B3TSxHivUNTVIuYeg+TPErteh0gHlXlS1EcrSuwQE3I8GFSpVDzI2XjRzwO62NS1u/8fPw4BfQ7Eu5qqNdIEHFd5N3IG5EqFdrBYJAf8R00Y1BgY7hz+HEX+DfTpLyIhb9rs6kggUTsimcMlUAedSve2fPFRA7PURadq4HHX+Lyl70OiwIUln7vz78/ykYEqmdPBW1OQmxdi/T0QEqSmxpyFQWR7T47v6tP9TxAfhIVJyMEH0z6snC5UZSunAtRxFp4AOm+YGQwR0DNQNiqGpHxgGUfRDPXcfTrT0OOJW7tiXCynT7Br3Q0A/igCkbpU7xKKM07oGgnr2vsajC4bHlsE1sdtdrmA09+JVmargPSGnMX44a+aBu8ej/9/KORj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB8847.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 djlWrNlBPkc3kt4KSujhzBVH5APZBRP8oXiLPTGQCMbF36YqkBOi+odiIQN0XB1fWQmyJuMSbm+4r8jq9hdgRW9zekAA7fONJn+1ulmArrrlhvjNLjoHDGEvozUldqbQLNqDzGIUVbqJoSyMFMtSMK5BRXVHXsezB+k7UIJZ8qNfcpL6uDGuI/7q32Yo8SLoRFYcPsQrhsnJ+PExl7zFlZG2Orb3bEmzahn9/k59DA9Yim6mMBxDYVZyOif9zgGL2laj3l5adxxV377XQLXjIZzO+t5PcFlI0IzY1ohl/kc6c7SjmD3FMyly7F/DP7OKcodip0LfdlyA+cZFu6432w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8187
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55d86bf5-2822-40dd-b4f1-08de9ee72c3b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|14060799003|82310400026|35042699022|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L2NZWH5IXtv1TSpI7ipBROpk1bv9ufr75f+oiYKOOuBlOFYedZrSP8W7nERd5Ec78pEfjRFTIt/irH8IYlkOtMvsS8v49HZGBKOHZ8eDaKjYuED9EekA3zRUlByc9VnOqXgj4USR8BaFWNU9AT0B2htXR0cEsRzNb75NZPyepmwwodxYZUGIQEcGkiK0CcwAUtKesJte4GwdXuNbZ2HuKFyTQ5nH6hhrWQ+eoH7heXv9UVogSybue7EHsL+eCY57MgS0s5MOcTShhzVedGY4eAuqArKlryjtij5nD8LS43oIOXbZBs2gil2FgGZZjrKHhUcvRka9uuMy8fENfxCPxIWN9lHlTqNE/64rVVPUckE9YxWhKj1cy4XGvVlaH0nW6DdDJFNfO+frMHJFSsEbh++Ll1QOn/JJgYxgO3sq1o4B7xa2/vQhM5H05WeGEQr1snOEzNoLR47q4lLfci83D3a68l7VXjZp1iv0zPs8T7Atec9hJPnLQbkEpQ2sGxf0gkI+74JskxglVscSRDdtEnet9LQKKW2HM3d/D5Jpm7LNOvvtSBMcVmbXbMo/ePAtmYiHj0ReN6sOwzBpxtdq+xAcVyZKow8J6JOxwQV5iRvq6nW7VMoxhzkX8s8GG3v41ETYjt4lz4Yn3PrhPqPIhRl5Muf0WvfIlownbJOcmsoZSVTWf+Jp6IuDuo9cYNfxlJsE5BhkZMMQEWZZw8fybQSAQk5vjMk3dLs88+pMmNg=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(14060799003)(82310400026)(35042699022)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kwrcBS+/uZwGvVQb+jVB7xHqfQGVTYgL1F/drfT5hDOjPG+MUGVL29AoXorSV6A3oNZ9JfT+rQPpfTeIS3pUSQoiEnkKX8JhcA0go8a7sU2RqtTQDGR9kYivfjNCzLAAw+gWck2FpInAtS2mL8458yXIA8Qu0BMUURNbX5I9FOGUPFHm9wDk1FXwA4KZOz2FdJpzG+c2lPcE6yjrN/BH1cvFA29KkN4TW/+0h8oP3hzkQXnAunjXfR9oM+aKZFZOOsPASJ8KcMPuxzG+yXNJrVIg06hl/i76i40OtXvzkERiCDPZU79jy2vdRyD5SyhibCgalEQRHF92eu46jAxy5WYv1L33jrbuHSGdqRGmDzv6rZPto6PxmmoofCXD9kZoPVr4W2Bwc23jnL6xQv4ETwwofw71hpyHN/afeAFfvA4x4MHuoYNcvXHmb0yYADFT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 14:15:48.9459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b577e37-3e40-4565-1ab0-08de9ee7526b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6149

Hi Michal,

On 4/20/26 13:27, Michal Piekos wrote:
> On Sun, Apr 19, 2026 at 10:55:39PM +0200, Andre Przywara wrote:
>> On Sun, 19 Apr 2026 14:46:06 +0200
>> Michal Piekos <michal.piekos@mmpsystems.pl> wrote:
>>
>> Hi Michal,
>>
>>> Add support for Allwinner H616 high speed timer in sun5i hstimer driver
>>> and describe corresponding nodes in dts for H616 and T113-S3.
>>>
>>> H616 uses same model as existing driver except register shift compared
>>> to older variants.
>>>
>>> Added register layout abstraction in the driver, extended the binding
>>> with new compatibles and wired up dts nodes for H616 and T113-S3 which
>>> uses H616 as fallback compatible.
>>
>> Can you say *why* we need this? IIUC Linux only ever uses one clock
>> source, and selects the (non-optional) Generic Timer (aka arch timer)
>> for that? So can you say what this hstimer clock source adds? I guess
>> higher resolution, but what is your use case, so why would you need the
>> 200 MHz? And does this offset the higher access cost of an MMIO
>> access, compared to the arch timer's sysreg based access? Also, IIUC,
>> people would need to manually select this as the clocksource, why and
>> when would they do so? (Given they even know about it in the first
>> place).
>> Also the hstimer hasn't been used since the A20, so nobody seemed to
>> have missed it meanwhile?
>>
>> Cheers,
>> Andre
>>
> I took the table from https://linux-sunxi.org/Linux_mainlining_effort as
> a todo list and wanted to help with it. I do not have own use case for
> this timer. If it is not needed then I will spin v2 to include your
> comments and abandon it.

Ah, that's good to know, and thanks for picking things from that list! I 
don't think there is a particular need to abandon your work, we could as 
well upstream it. At least the DT changes should be added, so that other 
DT users could make use of the timers - after all it's a Linux 
implementation choice to utilise just one timer. But please go ahead and 
post a complete v2, I don't think it hurts to have HSTIMER support in 
the kernel.
And while you are at it: can you figure out what the need is for using 
two timers? One is a clock source, the other is for clock events? And 
why do we limit the counters and timers to 32 bit? Even the A13 manual 
lists them as 56 bits, and a wraparound time of roughly 21 seconds (with 
32 bit counters) does not sound very long to me.


Not sure what your primary motivation for fixing Allwinner support is, 
but we could probably find more worthwhile targets. Do you have 
Allwinner boards other than the OrangePi Zero 3? There are not many low 
hanging fruits on the H616 left (MBUS and LDOs(?) maybe), but the A523 
has quite some missing drivers still, some of them probably more on the 
easy side.

If you are stuck with the OpiZero3, then you could just look and check 
the existing devices, and verify their operation. For instance I think 
USB-OTG is still broken - across most Allwinner SoCs actually, so it's a 
sunxi driver issue.

Thanks,
Andre

> 
> Michal
> 
>>>
>>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
>>> ---
>>> Michal Piekos (4):
>>>        dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and T113-S3
>>>        clocksource/drivers/sun5i: add H616 hstimer support
>>>        arm64: dts: allwinner: h616: add hstimer node
>>>        arm: dts: allwinner: t113s: add hstimer node
>>>
>>>   .../timer/allwinner,sun5i-a13-hstimer.yaml         |  8 +++-
>>>   arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 12 +++++
>>>   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  9 ++++
>>>   drivers/clocksource/timer-sun5i.c                  | 56 +++++++++++++++++++---
>>>   4 files changed, 78 insertions(+), 7 deletions(-)
>>> ---
>>> base-commit: faeab166167f5787719eb8683661fd41a3bb1514
>>> change-id: 20260413-h616-t113s-hstimer-62939948f91c
>>>
>>> Best regards,
>>
>>

