Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2078.outbound.protection.outlook.com [40.107.105.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C8B2A1AA
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jan 2025 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.78
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735828310; cv=fail; b=WzCoTs7Rsiw1whYfZUQW6E+EZk5jJ/spoGJaJn2aS+LWl+mzy65P+8O9slWWMoRK+sapggcZ2Du8gclO+Js8nhXduc0mo65OfU/SqnwBLqKeTIKP/mCff5VgaRhbxOzm/Dp4RJnROFFaL5j9V9fBxRL7K6PNyGSxwafEQUhDkME=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735828310; c=relaxed/simple;
	bh=FgTFrkVDlJtouSdpwmv/67mbRO7wRpG3pJAUzerqe7s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YuHz1u0ZbSotSIzuYrfOqvWJYI6XLRQ7LzW6oquY9Hqqg9G1zIb2FxpjrObsoi/I6fqg6ns/Sr2KKs0UgQI6KX887R4qLMLAoP0CKJ58hz3tIz+ppfGe3hC0vaTQoS+tnzc0+dl8rTA4YQF/tQP9qRKwJnRc2rT9dEfpIiUOoyw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KvjIUMJj; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KvjIUMJj; arc=fail smtp.client-ip=40.107.105.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KvjIUMJj";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KvjIUMJj"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OGqX6cdrgOhfhvL1Dtn8KSxNuZr86F23TrMah2HelT+VMkzRrjExFPAxrY614vBeIbY5ABjckFBbnPeSegkSAV0lzXO+8agU7GAQUdgd49jq+As3Sulq+l5ve9vaSnqTlGSGBKzmHqnaBs4mG66/nUAaXwKQ+6d5Ou+JqUIh33jzbmCQ73b9dPycCvR5hGE5hqY7gPkNZ12Q0kkOFR0KcLXEdTLmsnX50cwbpcRhkSEVAKUcR6Z0tsm59gmCkOp6NvPEu9N4YHDhoPAryQX1jTbu7Y/bLgglT78uyhErqp/HDIDZVUU7JeLwQ7xZLTxlZKSJwrX0rRg3ni2a3oH31A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SuytM2Q0N8F1FgAWOPuAyIzXthKeNYUSB/jDV9AIa8=;
 b=UVwDzAAUQGdm90Bg6FKnMjFzvkm8HdCujt5vVLwvcE38/xo9SnsSdmQM9t/6inYbIKXL6Yb4IwN6a3cHWGnobeFShTOT1iC4UDZF/jy1ayJ1n3wGt1TbHupL9Ks6QAZsQYmvrPQ0Hu6zTpsIAA+9wHkeJZM1U3iGj0vZ0jdJirbcFrq2DRVZBOpfqLhI1GsOCS0W53UcUmvFaTNXM4up+hNG/jTpmmyySlcAI8RRjhnKSJJX5xXhc5Rg+ez/ZCZS1Ro+bvWuejpyM1/EI3KNU7Ox5CrJ+wZQKVieQxaVG/MRrnUSW1NgMy6/006hDjgbVCrtPVyKehz6MC1ig+hDIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SuytM2Q0N8F1FgAWOPuAyIzXthKeNYUSB/jDV9AIa8=;
 b=KvjIUMJjDLuhwPmVxPDdIf/v/TSB6jz352k6h5oOqKdIIOqkw0mXTWRfVnUPBubT5V3NPUNdM6H8VR/4ZnVVqAfwigM8z2MxZon1e4CX2yF1hryuEoVCcu+g+64hkqk30CUtTHI2G6fsI7j9KPDeaQ+0b0PTF3GmZx4A8Y6uFGw=
Received: from DU7P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::31)
 by GV1PR08MB8238.eurprd08.prod.outlook.com (2603:10a6:150:5e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 14:31:33 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::ca) by DU7P251CA0016.outlook.office365.com
 (2603:10a6:10:551::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.13 via Frontend Transport; Thu,
 2 Jan 2025 14:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.11
 via Frontend Transport; Thu, 2 Jan 2025 14:31:33 +0000
Received: ("Tessian outbound ca676db6860d:v528"); Thu, 02 Jan 2025 14:31:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7dd6befaa785e1b5
X-TessianGatewayMetadata: t5r4fa2MAhqY/EcCdFqTbDD/D+yuGsQJdTVKANQr6At7oVIjAtP6bYXrtup7EHnd4JrKNviLz6wEmrhr6e0BcHEzag3E8PzmAbIuT9LeLkLkhpbOtITVNC0RC1sMm9Zsqh6vZdk/2qgYbw3PkTuEkGhh2J2vV440Be14GDnAHNk=
X-CR-MTA-TID: 64aa7808
Received: from Le2b7ea7ff8a0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6B575813-7C59-44EB-9F2B-047360451D4A.1;
	Thu, 02 Jan 2025 14:31:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le2b7ea7ff8a0.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 02 Jan 2025 14:31:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tpr8SR2vJ3pRkBN0o2witohtRt32xc8NS7aHQ/d98GgzQky+SpV5WkwLaC20ufdsi6uOBmNyQXcoQb2Ubhftm+BAJB9KoRdA6yixO6S4jI7G5x960Cvs//jIqsHrFsMJYoyXbf5ZK7pAqjmbzx8TDBBRBMuOuw3n0XP2rSh8oF4sCUTD4g1EysvzPmY0eAHPiZbEx0HMIwl5iZhoyea1Tl/2+Tkr2DRd/xtnbSHuZar214YDYyD7o6m093aoFOMNCQ3qxKIImq8XK6riX/lAm6WvT+t6GIOpPfSIYYYOLnGik4/W/4vBPA7HCBU2q6t5iRK2KrbaieD885AN8pp5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SuytM2Q0N8F1FgAWOPuAyIzXthKeNYUSB/jDV9AIa8=;
 b=y1jE0Dm474uA76CrgEYlDiAqHm/gEl6LjAjIE3hFIAdFrC5U3mdQI29vf4ChuTr4rvDN6+luVFF5/18WFiVCKXAfgEXCMmeZs2USEpobC4+f5E6RuiWoY2Milhw1YKJ/IxnSXLgxi/BLdnkaANspAvSvgj/CaF1/VxDr/KtP+ZDwsx6btckxTdv/AD7cH2etPx3W8ci+ALdj2aGOcBdE6dQroHVDvsKKUebbg2BwYJTzQjxrBiZbRebXyIqAIycfMTmOSU04gTHom+BGSW1p9Ti1nf0qXjYmtU76I6EwrRTWe3vkAn8DQVdENqS8U+nTA9x5fXblSTH7SDSCLuc/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SuytM2Q0N8F1FgAWOPuAyIzXthKeNYUSB/jDV9AIa8=;
 b=KvjIUMJjDLuhwPmVxPDdIf/v/TSB6jz352k6h5oOqKdIIOqkw0mXTWRfVnUPBubT5V3NPUNdM6H8VR/4ZnVVqAfwigM8z2MxZon1e4CX2yF1hryuEoVCcu+g+64hkqk30CUtTHI2G6fsI7j9KPDeaQ+0b0PTF3GmZx4A8Y6uFGw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM8PR08MB6372.eurprd08.prod.outlook.com (2603:10a6:20b:369::5)
 by AM9PR08MB6675.eurprd08.prod.outlook.com (2603:10a6:20b:300::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 14:31:20 +0000
Received: from AM8PR08MB6372.eurprd08.prod.outlook.com
 ([fe80::bc26:1950:c684:41d3]) by AM8PR08MB6372.eurprd08.prod.outlook.com
 ([fe80::bc26:1950:c684:41d3%4]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 14:31:20 +0000
Date: Thu, 2 Jan 2025 14:31:16 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: add support for NetCube Systems
 Kumquat
Message-ID: <20250102143116.1495cb77@donnerap.manchester.arm.com>
In-Reply-To: <20250102121859.3547-1-lukas.schmid@netcube.li>
References: <20250102121859.3547-1-lukas.schmid@netcube.li>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0596.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::10) To AM8PR08MB6372.eurprd08.prod.outlook.com
 (2603:10a6:20b:369::5)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM8PR08MB6372:EE_|AM9PR08MB6675:EE_|DB5PEPF00014B9F:EE_|GV1PR08MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: ab542be5-1fba-44f5-8176-08dd2b3a2813
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?wSszxelThoV6k/d2THNESaYmDIzayLg+oMwOQXF+LIImundO4UbBtRU2qmiI?=
 =?us-ascii?Q?oKgsI1QfG7o/9dImDFfzoyJdbBO4Xg64kU6fND0/Ap7tnotiQ4Lq+dPhESP9?=
 =?us-ascii?Q?ygdEyi6TF4s+fVtNHf4oDIyvBrw21nTej19MMPncAjG/ke5ULLB1eKA2GWvf?=
 =?us-ascii?Q?CO5lyfQpSlCI/IeyNkwwy4AF4e4XcxiZUMJzOEzZwGyeZstZZKO0yZ3o8nPu?=
 =?us-ascii?Q?F85Ts10PyX4UDzOn/YkMN4Ue82WWnVus/IS12z95qP4WJLJaiPoPuj/7IpOg?=
 =?us-ascii?Q?4ORb1DsTbNAunfAKUk1GK7hLwpofoQZcktgKEQbHClD/fPlY/qAJ3p+p5leB?=
 =?us-ascii?Q?lGB8KtLQ4tUbHoMbTY2ZDJ8f6pja+ljoK3IICdC9VC+r1ElLszZd3sLgNsdj?=
 =?us-ascii?Q?f8IEMmQdZOB9ysojT1Ltn3pxHEj6cdL74uOz0ajLZfzhnkpxYLwhEN78/3z/?=
 =?us-ascii?Q?MqtcG8iJw2oRkTMS3KREiZ6COTBq1g5uENkOaemLvcE4F0XOWgNGUot9b+C8?=
 =?us-ascii?Q?d+f4rd5/bLCjA6aXEJZEUNXkjYbP+8AjHdnzZ4+j3wGKVgMcmg89HCFpoVG6?=
 =?us-ascii?Q?EiFuiGI2lrGOBX/DWjMSDj9cQQmUKFLjfc+QeMWMxA5WnKY3z9Ok+d/8GwSe?=
 =?us-ascii?Q?1haGd/S/usXFSwv3rMlN0Q59TVq1NKj05Fu9bN8wFTSwfU3DW6/QLGIyp/sr?=
 =?us-ascii?Q?EUl6DKAshvMZAw1lPnDnKP1/33wqSTYZIEgBiEqzeqvSTTE0KH8qAIIpZ1cs?=
 =?us-ascii?Q?UReZgZhhfvYP0v0aWHekbrc6oJNFf17TwflVjT+83df+FgqEG18XqgHKXpbW?=
 =?us-ascii?Q?UjQxKmVhZLqrg53WNOOwAEt61yuwiOOnN76afSmtdcUxbSyfdN8DR30Oycmg?=
 =?us-ascii?Q?v56bhMLji3/jNMdMPI8ZtNQiFj/45cf7OLEZJ6QTy+lwYQBqrF1J2R7fkjhm?=
 =?us-ascii?Q?C/4ZxU0zzQkA2VHc8i+YQT/4WREWtLbyZXzV7+KjoivtcQRuU2rlon9DlWAP?=
 =?us-ascii?Q?LhpuPWUPL5KZEIUQNX6/1nKjm5n/O7+Pie6z8b1j5HwSXHFZlBWkr3CCk/4k?=
 =?us-ascii?Q?Ce6Xx2FgGd4Jc0PnUmkHJDAknLT33lorVPlEl6Ka9GcPQ2NkwiYoXYkUg63/?=
 =?us-ascii?Q?mrUrT4SHIlSwe0M1CLhAnNsNpH09TVp8u8l//RC+J1O5nUgYPjpEWeWWEqDY?=
 =?us-ascii?Q?SmdMUlRXA6pkApwWVQ5vFQ5CgOL+mVyJChn9XHpo4hSJLLujZWvk28BwGjPQ?=
 =?us-ascii?Q?biDwRQle7B1mO0PLyMa39QwF08koL596obiZ7sdc9v9Wp0YhCobl+1J1wad3?=
 =?us-ascii?Q?qcPWfJt6CCM3vfLWo5zqmkAOrpVuPx5BuGQa+fWknFXfbg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB6372.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6675
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:20b:369::5];domain=AM8PR08MB6372.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3d27d8d-f8c7-45a7-19a0-08dd2b3a1fd3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RY1bzPKCftZjtRemm7KUxeL/b2o2sMYJKfeV+14augjSWXbFYtLRbPjPacr+?=
 =?us-ascii?Q?tdRaxID5Rv9oibTd3u4kB/uS7ppFkL0lK59qfYrW6RgUbUpaAhb1+a/iaSEd?=
 =?us-ascii?Q?zZLEBYY/kAAhdws/k2ah3qLBpHcQXsBB1mAv1NLLyCTHuC5Evm9B1auOwbkX?=
 =?us-ascii?Q?TUTHN/VlBsCmx6+iojr8F9/HFSGV6cXBucw1v1PK6gJ/l5RLgi07Ce+8y9mS?=
 =?us-ascii?Q?RQ85IyDrbl4y1912wQgq0vrDddOHoeCvNAcl/d0O1CNH1zQiwZ0IOxzYYlRW?=
 =?us-ascii?Q?LNLQN7vVz1iozTDbHMTmeCVyteRpkhFYGM4UO/rRRnnk2wl0Dza7RwNMlZTN?=
 =?us-ascii?Q?RGpFuzWaVHcCU8ZWsL3qeuuzSeMlrlQt0IflbMmglcuIV7ZngX0zL/t69Ad+?=
 =?us-ascii?Q?YBW2iQVO1E+qcQTPqEWW/9D127hsC+mzWLxpfe18u3qCSl4oiLgLrcYxOGHy?=
 =?us-ascii?Q?JTWAU4YCS5UhcNLKymkH61HOzoLWOzE8yX1UsluA/6mHNXgTLOBto/nsb1SC?=
 =?us-ascii?Q?4fJ8rUHB78tCh4g8cCwZH5VmdULnnNNXqkXe6YtavPUNxdDMiSjv9fjnHfiL?=
 =?us-ascii?Q?e8CVAYobtSwN+CP56/B7+cnTWcZNTW9kMLYjPNxDmx2rkhEzx/BlTkiKED3v?=
 =?us-ascii?Q?N8XWrXtAC7uKV19O07mEyxu1FYadawce6w/qmenzbNzf9g6e2uLqBj9OSitV?=
 =?us-ascii?Q?fOwsHo5+ZxwlQWsL7/L2+z6dCyXg6EUP7gI2ltJMGWCvYt3WwKaiLije6g3F?=
 =?us-ascii?Q?56FPm7udvuzXV90vj22WG2gRApmIZkLMzK2SULNpiUgzijW+8kBusv8ZLNpj?=
 =?us-ascii?Q?ioWfzU/j+cb4tPF5Wl4kVOCmo6vv4BZYyM0cCV2CAtM/FuZHoyu7Y7PqLSSl?=
 =?us-ascii?Q?g32R0KtVO7jnjVkQvhXFK3kHZqgGM0G42mcH2WT6RTjiUG/ATvmlP3G+dAHc?=
 =?us-ascii?Q?tchbYI588ZXC2DsXTWpY7+OlOQeX3dTSAwLSvSAggIrOlxw/xIlGns1IrHrc?=
 =?us-ascii?Q?UrLigq2yWssWJUT+oOfEEYJthqY0kdi2bkFMo8kVgS+qtH6124fO37XLuyc6?=
 =?us-ascii?Q?D1tmqSCZsCXCi7yOL4iMK9kiurqW0wwD3A6v0hfYfOXM3QxxBdMSlPeehxqi?=
 =?us-ascii?Q?loxH4SiUmdmdKfUEbb5R/WALHjJbIJZuDrYrjcD10sgjp7PjYIkO1DY7pa8y?=
 =?us-ascii?Q?bcMLzq01Ws0yprV4Jc7DJsw6AGOA3BVKOrb5oHTlgXzgx0s8nsTBLTiCJvZA?=
 =?us-ascii?Q?5154qHbFN8IpIT4BXEW7xRufIrkYN3uS1x+YLj8WFp26hXwlVGkZ4c2EalcB?=
 =?us-ascii?Q?+WdQjWoqxaoxZKJ5sGFyRhxoyG8MzdqZSNDI5ikxa+/vZ6Ke8xU5EsiKa3Tv?=
 =?us-ascii?Q?SmgZNHa/wJBE8/VFf+abaOUBQbiNcFiRIV8uED0yAIGZsONE9cEml9BjFyrF?=
 =?us-ascii?Q?RJ68zKmrjTgBXDTe+m8eV4yeofbWpkgm1Glz3mIY3AmkyGL69kF3bQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 14:31:33.6942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab542be5-1fba-44f5-8176-08dd2b3a2813
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8238

On Thu,  2 Jan 2025 12:18:59 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

Hi Lukas,

thanks for taking care and sending a patch!

I guess you want the DT merged into the official repositories? Then you
would need to send the patch to the Linux kernel mailing lists, having the
sunxi maintainers in To:, and the lists in Cc:.
$ scripts/get_maintainer.pl 0001-name.patch
would give you the exact list.

Also you would need to add the vendor name and the board name to the
bindings, see patches 12 and 13 for an example here:
https://lore.kernel.org/linux-sunxi/20241111013033.22793-13-andre.przywara@=
arm.com/T/#u

So this would make this patch a 3-patch series (vendor prefix, board name,
dts file).

> NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
> including:
>
> - 64MB DDR2 included in SoC
> - 10/100 Mbps Ethernet
> - USB-C DRD
> - Audio Codec
> - Isolated CAN-FD
> - ESP32 over SDIO
> - 8MB SPI-NOR Flash for bootloader
> - I2C EEPROM for MAC addresses
> - SDIO Connector for eMMC or SD-Card
> - 8x 12/24V IOs, 4x normally open relays
> - DS3232 RTC
> - QWIIC connectors for external I2C devices
>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   2 +
>  .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 269 ++++++++++++++++++
>  2 files changed, 271 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat=
.dts
>
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index 48666f73e638..d799ad153b37 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 :=3D -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc :=3D -@
>  DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 :=3D -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc-plus :=3D -@
> +DTC_FLAGS_sun8i-v3s-netcube-kumquat :=3D -@
>  dtb-$(CONFIG_MACH_SUN8I) +=3D \
>       sun8i-a23-evb.dtb \
>       sun8i-a23-gt90h-v4.dtb \
> @@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>       sun8i-v3s-anbernic-rg-nano.dtb \
>       sun8i-v3s-licheepi-zero.dtb \
>       sun8i-v3s-licheepi-zero-dock.dtb \
> +     sun8i-v3s-netcube-kumquat.dtb \
>       sun8i-v40-bananapi-m2-berry.dtb
>  dtb-$(CONFIG_MACH_SUN9I) +=3D \
>       sun9i-a80-optimus.dtb \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/=
arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> new file mode 100644
> index 000000000000..1793a9b7f796
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0

DT files should have a dual license header:
        SPDX-License-Identifier: (GPL-2.0+ OR MIT)

> +/*
> + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-v3s.dtsi"
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/{
> +     model =3D "NetCube Systems Kumquat";
> +     compatible =3D "netcube,kumquat", "allwinner,sun8i-v3s";
> +
> +     aliases {
> +             serial0 =3D &uart0;
> +             ethernet0 =3D &emac;
> +             rtc0 =3D &ds3232;
> +     };
> +
> +     chosen {
> +             stdout-path =3D "serial0:115200n8";
> +     };
> +
> +     cpus {
> +             cpu0: cpu@0 {
> +                     clock-frequency =3D <1200000000>;
> +             };
> +     };

Please remove this node. I do understand that the kernel complains about
the missing property, but this warning is severely outdated (in the age of
DVFS) and should be removed instead.

> +
> +     leds {
> +             compatible =3D "gpio-leds";
> +
> +             heartbeat_led {
> +                     gpios =3D <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> +                     linux,default-trigger =3D "heartbeat";
> +                     function =3D LED_FUNCTION_HEARTBEAT;
> +                     color =3D <LED_COLOR_ID_GREEN>;
> +             };
> +
> +             mmc0_act_led {
> +                     gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +                     linux,default-trigger =3D "mmc0";
> +                     function =3D LED_FUNCTION_DISK;
> +                     color =3D <LED_COLOR_ID_GREEN>;
> +             };
> +     };
> +
> +     gpio-keys {
> +             compatible =3D "gpio-keys";
> +             autorepeat;
> +
> +             key-user {
> +                     label =3D "GPIO Key User";
> +                     linux,code =3D <KEY_PROG1>;
> +                     gpios =3D <&pio 1 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP=
)>; /* PB2 */
> +             };
> +     };
> +
> +     reg_vcc5v0: vcc5v0 {

Can you add a comment here where this voltage comes from? I guess it's the
primary board power supply, via some USB or barrel plug? Just add a
one-liner comment here to make it clear this is the root of the power tree.

> +             compatible =3D "regulator-fixed";
> +             regulator-name =3D "vcc5v0";
> +             regulator-min-microvolt =3D <5000000>;
> +             regulator-max-microvolt =3D <5000000>;
> +     };
> +
> +     reg_vcc3v3: vcc3v3 {

What kind of regulator is this? Some discrete linear or buck regulator?
Can you add a one-line comment stating the type, and maybe the model?

Those always-on fixed regulators are sometimes sketchy, so we would like
to know why they cannot be controlled.

> +             compatible =3D "regulator-fixed";
> +             regulator-name =3D "vcc3v3";
> +             regulator-min-microvolt =3D <3300000>;
> +             regulator-max-microvolt =3D <3300000>;
> +             vin-supply =3D <&reg_vcc5v0>;
> +     };
> +
> +     reg_vcc3v0: vcc3v0 {

Same here, please give people an idea what kind of regulator this is.

> +             compatible =3D "regulator-fixed";
> +             regulator-name =3D "vcc3v0";
> +             regulator-min-microvolt =3D <3000000>;
> +             regulator-max-microvolt =3D <3000000>;
> +             vin-supply =3D <&reg_vcc3v3>;
> +     };
> +
> +     can0_osc: can0_osc {

Is that a crystal oscillator on the board? Can you state that in a brief
comment, please?

> +             compatible =3D "fixed-clock";
> +             #clock-cells =3D <0>;
> +             clock-frequency  =3D <40000000>;
> +     };
> +};
> +
> +&mmc0 {
> +     pinctrl-names =3D "default";
> +     pinctrl-0 =3D <&mmc0_pins>;
> +     vmmc-supply =3D <&reg_vcc3v3>;
> +     bus-width =3D <4>;
> +     broken-cd;
> +     status =3D "okay";
> +};
> +
> +&mmc1 {
> +     pinctrl-names =3D "default";
> +     pinctrl-0 =3D <&mmc1_pins>;
> +     vmmc-supply =3D <&reg_vcc3v3>;
> +     bus-width =3D <4>;
> +     broken-cd;
> +     status =3D "okay";
> +};
> +
> +&usb_otg {
> +     extcon =3D <&tusb320 0>;
> +     dr_mode =3D "otg";
> +     status =3D "okay";
> +};
> +
> +&usbphy {
> +     usb0_id_det-gpios =3D <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
> +     status =3D "okay";
> +};
> +
> +&ehci {
> +     /delete-property/ phys;
> +     /delete-property/ phy-names;

Why is this?

> +     status =3D "okay";
> +};
> +
> +&ohci {
> +     /delete-property/ phys;
> +     /delete-property/ phy-names;
> +     status =3D "okay";
> +};
> +
> +&lradc {
> +     vref-supply =3D <&reg_vcc3v0>;
> +     status =3D "disabled";

Why would you specify the supply voltage, but then keep it disabled?
Either it's not working or not usable, then you wouldn't need to do
anything (since the status is already "disabled", so that's definitely
redundant), or it's good, then you should say 'status =3D "okay";'

> +};
> +
> +&codec {
> +     allwinner,audio-routing =3D
> +             "Headphone", "HP",
> +             "Headphone", "HPCOM",
> +             "MIC1", "Mic",
> +             "Mic", "HBIAS";
> +     status =3D "okay";
> +};
> +
> +&uart0 {
> +     pinctrl-0 =3D <&uart0_pb_pins>;
> +     pinctrl-names =3D "default";
> +     status =3D "okay";
> +};
> +
> +&uart1 {
> +     pinctrl-0 =3D <&uart1_pins>;
> +     pinctrl-names =3D "default";
> +     status =3D "okay";
> +};
> +
> +&i2c0 {
> +     pinctrl-0 =3D <&i2c0_pins>;
> +     pinctrl-names =3D "default";
> +     status =3D "okay";
> +
> +     eeprom0: eeprom@50 {
> +             compatible =3D "atmel,24c02";             /* actually it's =
a 24AA02E48 */
> +             pagesize =3D <16>;
> +             read-only;
> +             reg =3D <0x50>;
> +             vcc-supply =3D <&reg_vcc3v3>;
> +
> +             #address-cells =3D <1>;
> +             #size-cells =3D <1>;
> +
> +             eth0_macaddress: eth0_macaddress@FA {
> +                     reg =3D <0xFA 0x06>;
> +             };
> +     };
> +
> +     tusb320: tusb320@60 {
> +             compatible =3D "ti,tusb320";
> +             reg =3D <0x60>;
> +             interrupt-parent =3D <&pio>;
> +             interrupts =3D <1 5 IRQ_TYPE_EDGE_FALLING>;
> +     };
> +
> +     ds3232: rtc@68 {
> +             compatible =3D "dallas,ds3232";
> +             reg =3D <0x68>;
> +     };
> +};
> +
> +&emac {
> +     allwinner,leds-active-low;
> +     nvmem-cells =3D <&eth0_macaddress>;               /* custom nvmem r=
eference */
> +     nvmem-cell-names =3D "mac-address";               /* see ethernet-c=
ontroller.yaml */
> +     status =3D "okay";
> +};
> +
> +&spi0 {
> +     #address-cells =3D <1>;
> +     #size-cells =3D <0>;
> +     pinctrl-names =3D "default";
> +     pinctrl-0 =3D <&spi0_pins>;
> +     cs-gpios =3D <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
> +     status =3D "okay";
> +
> +     flash@0 {
> +             #address-cells =3D <1>;
> +             #size-cells =3D <1>;
> +             reg =3D <0>;
> +             compatible =3D "jedec,spi-nor";
> +             label =3D "firmware";
> +             spi-max-frequency =3D <40000000>;
> +     };
> +
> +     can@1 {
> +        compatible =3D "microchip,mcp2518fd";
> +        reg =3D <1>;

The indentation is not right for the two lines above.

> +             clocks =3D <&can0_osc>;
> +             pinctrl-names =3D "default";
> +             pinctrl-0 =3D <&can0_pins>;

What is this pin for? If I get this correctly, this is a SPI to CAN
bridge, right? Why would it require a GPIO on the host SoC?
(see below)

> +             spi-max-frequency =3D <20000000>;
> +             interrupt-parent =3D <&pio>;
> +             interrupts =3D <1 1 IRQ_TYPE_LEVEL_LOW>;

Ah, I guess it's for the interrupt? In this case I think you do not
declare this via pinctrl, as the PIO interrupt controller should reserve
this pin, configuring it with the EINT pinmux.

And please add a comment with the pin name in it (PB1).

> +             vdd-supply =3D <&reg_vcc3v3>;
> +             xceiver-supply =3D <&reg_vcc3v3>;
> +     };
> +};
> +
> +&rtc {
> +     status =3D "disabled";

I don't think you can do that, since we rely on some clocks provided by
the RTC device. I guess you want to say that the kernel should use the I2C
RTC instead of the built-in one, but this should already be covered by the
rtc0 alias above?

> +};
> +
> +&pio {
> +     vcc-pb-supply =3D <&reg_vcc3v3>;
> +     vcc-pc-supply =3D <&reg_vcc3v3>;
> +     vcc-pe-supply =3D <&reg_vcc3v3>;
> +     vcc-pf-supply =3D <&reg_vcc3v3>;
> +     vcc-pg-supply =3D <&reg_vcc3v3>;
> +
> +     gpio-reserved-ranges =3D <0 32>, <42 22>, <68 28>, <96 32>, <153 7>=
, <167 25>, <198 26>;
> +     gpio-line-names =3D "", "", "", "", "", "", "", "", "", "", "", "",=
 "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""=
, "", //PA
> +                                             "CAN_nCS", "CAN_nINT", "USE=
R_SW", "PB3", "USB_ID", "USBC_nINT", "I2C0_SCL", "I2C0_SDA", "UART0_TX", "U=
ART0_RX", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "=
", "", "", "", "", "", //PB
> +                                             "SPI_MISO", "SPI_SCK", "FLA=
SH_nCS", "SPI_MOSI", "", "", "", "", "", "", "", "", "", "", "", "", "", ""=
, "", "", "", "", "", "", "", "", "", "", "", "", "", "", //PC
> +                                             "", "", "", "", "", "", "",=
 "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""=
, "", "", "", "", "", "", //PD
> +                                             "Q12", "Q11", "Q10", "Q9", =
"LED_SYS0", "I1", "Q1", "Q2", "I2", "I3", "Q3", "Q4", "I4", "I5", "Q5", "Q6=
", "I6", "I7", "Q7", "Q8", "I8", "UART1_TXD", "UART1_RXD", "ESP_nRST", "ESP=
_nBOOT", "", "", "", "", "", "", "", //PE
> +                                             "SD_D1", "SD_D0", "SD_CLK",=
 "SD_CMD", "SD_D3", "SD_D2", "LED_SYS1", "", "", "", "", "", "", "", "", ""=
, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", //PF
> +                                             "ESP_CLK", "ESP_CMD", "ESP_=
D0", "ESP_D1", "ESP_D2", "ESP_D3", "", "", "", "", "", "", "", "", "", "", =
"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""; //PG
> +
> +     uart0_pins: uart0-pins {
> +             pins =3D "PB8", "PB9";
> +             function =3D "uart0";
> +     };

Why would you need that node? There is already uart0_pb_pins in the .dtsi.

> +
> +     uart1_pins: uart1-pins {
> +             pins =3D "PE21", "PE22";
> +             function =3D "uart1";
> +     };

Please specify those pinmux in the .dtsi file, as they can be shared
across boards. It's typically the first user adding them to the .dtsi. For
rare pins, we add a /omit-if-no-ref/ tag.

> +
> +     spi0_pins: spi0-pins {
> +             pins =3D "PC0", "PC1", "PC2", "PC3";
> +             function =3D "spi0";
> +     };

Same redundancy again, it's already in the .dtsi.

> +
> +     can0_pins: can0-pins {
> +             pins =3D "PB1";
> +             function =3D "gpio_in";
> +     };

As mentioned above, this wouldn't be needed, and in particular gpio_in
looks wrong. It would need to be the EINT pinmux (0x6), but the PIO IRQ
controller code takes care of that already.

Cheers,
Andre

> +};

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
