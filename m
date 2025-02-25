Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1F61898F8
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 16:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740502491; cv=fail; b=NLEfTRqrK9ULNam/+5kVRz93O5NGwxAZx90zcaMj9v66PVNdx7jWWKJdfDq4Wb5HxD4VosGWTjKNbwBieOhXMW1uvBW+cZp+nP2ZVR57VLztmlcGvwHq/FHD88KFkkSQ4Kute6fUQAxZmzuMbEQBScK8zJXyIa0Ff1ujZpUtJm4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740502491; c=relaxed/simple;
	bh=8jws9EvKZKTDN1y/3DsSOn1grECoLyNYqbNv1gDrLqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TBi9+qLNO+CNgFSEeO5FCZHqPN1bBCBz7H9W2ZiyL5gyX1DPlEDjUvM8Z9nFW/Cx2/7NBu/DkwPgkRFJaAdvh00Z4+3jR9OPT+hlUyV4tH4jVtrUYeDjJBxB6pi9SUApNOvJgAv7dHx2LyNhPRml52m7XbRLZJK5MbkndC8mfWk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qfVd0Shb; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qfVd0Shb; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qfVd0Shb";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qfVd0Shb"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=c+PkS5+DUbAJq/2i3QhKhYnUVH57fZcsF/mye8jtOWslXw2xZyG1jQur7bgQD3M0XcQ55EXm7w0mN1xxErEdmtKzzAbcjcl6VZ7wuI7lA3iFHBBg2BoqOfAjZAzwG06dH4psyajAurkYFaoEAjzTwHUMYrpTaWiKBKxBqOakjAyACJdg7u2qq3yC17dlYfpfoRrqsdaOWgpgVUI+PzrqopdswOU2SSyrEfTAgVhv2hOHG4tLCf1GR4A20lCj+7qvvC/TjAp4Q0+aKpRWQpgnGHyTrSJGFkOE2CRg2sKPSQGkRRykuZMAd/gbhHyuCalduw8bK2Q+risaDyCuWkz1Kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZB5pDFatsKOQWOznAwDvwUSufnHI7vSoAyBJI9VFIc=;
 b=HYJq5AiAvwIDXnYxwRhWQ/LRTQb6ZXeRrtNVLHK35ECemlwgW51ZmV4KkebZkGgDA6qC6/mEbACegxOtUoHmKq7GVqtpi2TTVQ0hmVsoVh9Ah/B/e2l9wuZ85+JHfql9JBtYqT6vi/0Zm5f54Hv104yJLZWRUBSFBOE4sRLw5BXcTmQi+ZzpaVdQjnTyKg0od+cem99neVHIGxwhAbuFnt46yUHF3tpkjLHeyRgkbqC7cYKSsR77b+VSPB+wVAyu4VCVgMRPRnXJ33gw/RUd5RV0I3Uv6TCDuk8n/gbOvweU+ocSYFFglbk3NEVjARsCyCTI4y/YjYkQ4/LYbNzXfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZB5pDFatsKOQWOznAwDvwUSufnHI7vSoAyBJI9VFIc=;
 b=qfVd0Shb6Mk6NaC4kaO4p/zITvQ5ythgcpwu3XmRqwNA9/7ck7eqYHwNrSDIthK10bfNxxDnI0OYYw2TQPLzW+ygdPMtMq6hC8+IIA2qs3yFByRAD0D/Y82g+CXuKJrBMPE2QzUBFe22kLxIq2VXIVXBUNZCAdGhsiPFOb/sUxA=
Received: from AM7PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:20b:100::20)
 by DB9PR08MB9945.eurprd08.prod.outlook.com (2603:10a6:10:3d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 16:54:44 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:100:cafe::27) by AM7PR02CA0010.outlook.office365.com
 (2603:10a6:20b:100::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Tue,
 25 Feb 2025 16:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Tue, 25 Feb 2025 16:54:43 +0000
Received: ("Tessian outbound 93a06e49d4fd:v585"); Tue, 25 Feb 2025 16:54:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e01c1bf24950067
X-TessianGatewayMetadata: 43OHMBN9iuTKAcy75Lv77N+8xoBE5AnYHZaTu2h/xjBRNAk4845SwJT+2NSL+XLExLPNLJpfAtpXb3wniNqE5Lq+mssq2gUbDvg4wKSqlytTDjEZAxQzVj7HSTN1cNcC/PYSAaoJRJdJussl1o1TRcb50hDLN5pm3thb6kNChlY=
X-CR-MTA-TID: 64aa7808
Received: from L06cc359b1343.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9B01B736-F482-44E9-A100-5A630741DD84.1;
	Tue, 25 Feb 2025 16:54:35 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L06cc359b1343.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 25 Feb 2025 16:54:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQZXhkHV0cgq+jRhr8Mu4Eze7TFxZAavgzJgC1V7wGwqPSJ/MgqYlInSulBa2NgbvrSDmvDk91jjk2n1wRHLntoABjlnY/m0zFmgYSS25DXp50gAD64y/IfjU/ATsnR4fXD2GPrWFzCq3sIqvveIVAHzvT/UgInuTixhEwJGdqE+j+YjPSh+yEanzSemLFct4vY/YK3n+QirVPhoOD6/8LgfX7OvjvyIOMBMC/ABXPHgZdoKoLNMpNF8rrZt4od+2IAXLAl1dt/bipPqVSvVatkUWj7w77/a8DCrYVJO+jOH7aUolWD4byoC00h2GjvNHMnyznMbYHGK72OQri+IDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZB5pDFatsKOQWOznAwDvwUSufnHI7vSoAyBJI9VFIc=;
 b=b9DaCfBWeQ9OOsjhNS26jnASlyxCMf3ziNJje8w4aCAKP4JjgSELBZJzSgNdQwKSp7hebG3f0Amhb4F7CihPivv62diFNbJb2Ow7HIKBEVFcZxkaYcq1n9rpN2KYtQ9vZBIm0zhhztx2EHWQlPKoKWmi6CoUM+NxZdsP/FKcdaShJ+WcJ0+Ah2gkrQUtNH5KZLb98+n5FymFFo0DwUESEvQgUldv0wbCBd2s6MwEK8RkcF5qCgKC2gAs3TuBj6r1afdIE/pGr3TcihrhV/3UTqHqm68XQpJGLQW8OEneOnncnV0D24mL8fA6c+skXYyUY9BAQo9pPoItsyqoKGUKbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZB5pDFatsKOQWOznAwDvwUSufnHI7vSoAyBJI9VFIc=;
 b=qfVd0Shb6Mk6NaC4kaO4p/zITvQ5ythgcpwu3XmRqwNA9/7ck7eqYHwNrSDIthK10bfNxxDnI0OYYw2TQPLzW+ygdPMtMq6hC8+IIA2qs3yFByRAD0D/Y82g+CXuKJrBMPE2QzUBFe22kLxIq2VXIVXBUNZCAdGhsiPFOb/sUxA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM8PR08MB6372.eurprd08.prod.outlook.com (2603:10a6:20b:369::5)
 by DU4PR08MB10960.eurprd08.prod.outlook.com (2603:10a6:10:56f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 16:54:33 +0000
Received: from AM8PR08MB6372.eurprd08.prod.outlook.com
 ([fe80::bc26:1950:c684:41d3]) by AM8PR08MB6372.eurprd08.prod.outlook.com
 ([fe80::bc26:1950:c684:41d3%5]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 16:54:33 +0000
Date: Tue, 25 Feb 2025 16:54:30 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>,
 <linux-sunxi@lists.linux.dev>, Chris Morgan <macroalpha82@gmail.com>,
 <devicetree@vger.kernel.org>, <samuel@sholland.org>, <wens@csie.org>,
 <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: allwinner: h700: Add MMC2 for Anbernic
 RG35XX
Message-ID: <20250225165430.1b4e7580@donnerap.manchester.arm.com>
In-Reply-To: <DM6PR19MB3722684AEFDAC7C57927F58EA5C02@DM6PR19MB3722.namprd19.prod.outlook.com>
References: <20241018160617.157083-1-macroalpha82@gmail.com>
	<20241018160617.157083-2-macroalpha82@gmail.com>
	<1884930.atdPhlSkOF@jernej-laptop>
	<DM6PR19MB3722684AEFDAC7C57927F58EA5C02@DM6PR19MB3722.namprd19.prod.outlook.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::16) To AM8PR08MB6372.eurprd08.prod.outlook.com
 (2603:10a6:20b:369::5)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM8PR08MB6372:EE_|DU4PR08MB10960:EE_|AM3PEPF00009B9E:EE_|DB9PR08MB9945:EE_
X-MS-Office365-Filtering-Correlation-Id: e93d48c5-1061-411d-f9a2-08dd55bd1a15
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?S1JHOVVaUXV2NS9QVmtSYjdhS3hDdkVHbkRNYU01L0ZrQjQ2SjlGa3pLY1h0?=
 =?utf-8?B?YlQ3dTVPUXlteGU1OFFEK3MwMjNzYlp6RVhxaDh2OThsZVFaVDBzc1l4NkFB?=
 =?utf-8?B?eU9XclFzME9PckNBWmF2aHFPYUZuYk5jbmRZbkNXMlNadk0yQkJ0K3VRL3Ez?=
 =?utf-8?B?UW4zM3FnT1Rpem5KM3VWSlpqZUNmS2M2YklKci9ncGM0YXU3MkRyemRzRXpW?=
 =?utf-8?B?Y0o1VlZleEVOL0dCMVRZRFJnOG9SdlNETHJzYVNWZ2k5OGl5bHJ2cEtsaE96?=
 =?utf-8?B?Q3p3aW5iUDRJRUlaYlkvblRMR3FXVFpVOC9JcDJhc3BhYzB6ekFLYStMZEc2?=
 =?utf-8?B?bkNiS1BYQVkvVFhHS1llSlZDenpjQTMxbTN1RytVT3ZJTm42T0trOW9nSElK?=
 =?utf-8?B?WnBjNExlM3M4RElGVW9JUVBaSStHZExqcnJtdXRQbnBKelp5YnArUFZDSmhT?=
 =?utf-8?B?bjFZK1VXd3c1YlJ4c2o0T0FlZml0WmlWZzA5Tm9xNFY3Zk90bGtrTElmdSto?=
 =?utf-8?B?OUlRZU84bUNTNGJIQkZLd1hVSWpOOGtISFRYWm41MGRpdWpvOFQvaTN3Zng2?=
 =?utf-8?B?UUVoSVFwZ0dvT1M2WXZadVJvWlN1ZTlTeHUxbms5bFY1enlHNlhXTytlbFFi?=
 =?utf-8?B?SEJkRjBWUFl2dGJ3ckJlNXVYSCtGRWQ0cldsb2NOVVhyRjdqeXBUakpnZWdR?=
 =?utf-8?B?UURsR2xxcjRwd2Q0RTVOb2xvZGl2dkx6eFd6MGgxdlRuWFV3SlFDbTZuY3BW?=
 =?utf-8?B?NGFlYzZSZ3VKS0JYUmwxUmsrVjBCYWlWejNjTURUbndqUWtMQmI2aG5EVVNm?=
 =?utf-8?B?bVJudzc2U08raGFwbEZqSjBESDZwWjZGR2hWb3RzcC9hRjhCTkw1ZVBXMWRt?=
 =?utf-8?B?MXo5RmEyTkFyNVdROVZ4WnI1OERqeGRMb1FGTmdheGpCWXcxd0M4UE9kS0I1?=
 =?utf-8?B?VENYczhnd051OXljTERaNWhka21Wbm5PV1ZGcWh1bVZOcnpwSWpKUmNKNzZZ?=
 =?utf-8?B?cmJXOFZEUlNTTGJhWUVkcFNTei9ZSVY5WHNicmo3V3M4U0o5NndaTWpRakVs?=
 =?utf-8?B?T2tEY2ZGc1FBc3JFMUdua2hRYWhZeElNQTA4MmJ6cUpXUUNFYi9heUxBV1RW?=
 =?utf-8?B?cUMvNnYyOXkxRDU2bjd2MHBmZ1RxMkFnbFRvcmtSU1VNNnpwNkxPR2hIbm96?=
 =?utf-8?B?RGF3SldtQjkza3ZNb0hqUTNlY1ZmbjAwcVVhVmMrT1hrRGlaMEZNSVBodmcy?=
 =?utf-8?B?MDkwZmlmeEozZVlPYjNqUG5CQnFXbHBWTnVNc2Nnc1ZySUd1NHMzdFMzM0pY?=
 =?utf-8?B?enBWNEVBSG9Bc3pLTHMxcUtVMWtiNXpxRnc2Y1BOcjlUYnlYUHhuNGJBeHhZ?=
 =?utf-8?B?bmFNcG56dU1OU3FmVTZ6dTdHRnFERmhsT3R3OERaYVJ2QlM2c0ZEc21wRHhn?=
 =?utf-8?B?V29WT1RvN0JTSlFhQkZyZm9qVlZYMkVNek1iZ1hXemVhTVZOTGI4aE10VCs2?=
 =?utf-8?B?ZVhSZUxmRFBXb0tIU3JnWk5oOWgwallDOElGNmo1bEZMdHlWRFRNblJZNlJy?=
 =?utf-8?B?TFB6bGZTVGhFdVVxTUh0OVQ5SStRdHVxdW0ybi9Sa3FGVFRLYlhST1haekFT?=
 =?utf-8?B?ZE12cFlUNzdSdlp6d3BNSmh6bjVrV3lvbTVTR01ac0RIRVNqVGw4dVRGL0g3?=
 =?utf-8?B?emxUaFB5blhVRXByT2hNYWtxblRxRlZnaFIxQ0tkYkE3a2w4cFJEcGpoUWx6?=
 =?utf-8?B?T3hTdlMwVzNGa1E4TGdxK1plS3JmOFM3a2Q5Q2dTeDNFQ2xLRVVMR2pPZHhU?=
 =?utf-8?B?YXdsMWhqdHhhdmQ4VjRTa25SMVRsbUhvRGNHdmFQNElLbXV3SFIrVDBFWi9C?=
 =?utf-8?Q?fjHD5iAlZuoze?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB6372.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10960
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:20b:369::5];domain=AM8PR08MB6372.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5e187185-6acf-494c-6065-08dd55bd1414
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|376014|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWF0S2pMN2ZlSDhya2U1NkRUUXhRczhONlh2Q2hOUVUzd2dCcVFjcmVRSjdU?=
 =?utf-8?B?NDFUWXFJb2tnTU5SaXVoNTBhcnlDMjV5Tk45UXNRdEM1V1czQkRweWxsMUxs?=
 =?utf-8?B?d21QV0lvY2ZjMGIwRk5qb085cU54UkovUXd0bEgyMkJXTlg3WW9NZHcvLzlX?=
 =?utf-8?B?T2FvNnRSVXp1M0RQTzgvOWNvdzZBTGtxYTNSelBHdnFod0NSc3hBR2IzR2t1?=
 =?utf-8?B?ajZ0VGdDSEdUSTJtV1NaM01mdTRMTVdDTDk3ZGkvckxkenBoM1N3VE1xTjJQ?=
 =?utf-8?B?bStZa0V1R0tGUHhCVGk0UWVrNTNYM3BNcHVNZTNPUkhTZUlyOHhGTWZ5UDhT?=
 =?utf-8?B?U05Eb3RFdUhseHIwQ1lvK2p6SFZtRVVjQmJGZ3BKaHNoTlUxS2tmakc0QXZ4?=
 =?utf-8?B?VUVZeWo5SEpMWDFNS2E0RFJDQ0kwS1FyTkJpa29CWUFtL1dyTDJUbkk0VDVx?=
 =?utf-8?B?bzJiKzZCcjBGRnYycFR2dzlxUjZlS2pKWTF6MzJZb1hPKytzSVd5T004Unhk?=
 =?utf-8?B?L2gzTFMxWHBuc3lXVHJPb2ZYbGxRNjJJK2I5d1dIV0FjK3JyK3oxb2o1Y08x?=
 =?utf-8?B?TW5VQndhQkl1SzhyQkw4U1kyRE9xaTkrdmVHU1dSMlk3YzJUdCtyY2lxaGFF?=
 =?utf-8?B?VUFVa2M4YU9KRktyckVld3ArdHNFNi9OdFRPUmJaNE1wdlVMOHc5REZxV1NR?=
 =?utf-8?B?dWJqVlRpUDdlenJuUGxoNms2czVDVElzdmNvQ01uSFNleGxoLzcxMXhDZTY2?=
 =?utf-8?B?SVJhTFhFQnBIckhPMzNmd2xqVWRsTUV1NC9QQVpyOTQweHZVTG9iOCtmcTJD?=
 =?utf-8?B?TzgyWHNCWUNRVU9YU3N2bGpYdHdoWWVBL1lxc2F2ajBNeGR6MFR2YmRJN2V3?=
 =?utf-8?B?RVVkZVNES1JjYzZUMWhidHMyakxweGFXSnpHNUJHTmxaSTJjMnJXdlNwTWdH?=
 =?utf-8?B?d1k4Mlk5NDY5N1JOZ3dSZFBrVXlKcDRXTlpROWk5dWozZUVWM1ZCQnRieDUy?=
 =?utf-8?B?Um1oelowaElKcElLZVI5VjdjakFZOFJCQ2hMUWpQa0p1Vk9mTjh0WklOZFpK?=
 =?utf-8?B?a1N2dVU3NmhDa29vUFZQK2haa0lGVm5kN250RUZSMmhsVG83aEtyZ1hUTWdR?=
 =?utf-8?B?NkkxR3J5RStNSzViMFM4QU5IamNXWUVnS0pNUjFwbkVJR3BiZnlEdWVpVjdU?=
 =?utf-8?B?MjBaVUNWM0V5alo4NEdEUWNseDk5MU1SQ3l0cmdtRnNVbmk3eDd3dFh3ZnA0?=
 =?utf-8?B?UGlGSzYybkxsQWNTWDIzN2hCQmhESE5WazB2N1VHbzFsM0lJSE9qZmNpZW1y?=
 =?utf-8?B?aVhjUTdpL2N5MVcrV0xDZnZtNlkzczdKR0x5RGRzTEV1OVA2OFd0K2dLRUVn?=
 =?utf-8?B?ZzViWWFRUjUzb1k4RjlsVjFwLzlrZ2x3RUVnTTBHeWJYTDc4d0xxcG8vdGJk?=
 =?utf-8?B?YzBVcXYvMmc4TXpEaE00cWJwSXhkSWt6RUkvWU5rbFpNWE9CbDlmcC93dVZo?=
 =?utf-8?B?WDF5WmQ3blE2ZERlRVQvQXRLMkM5MGptQ3FvWnprVWpEMHpjMnBuVFJFNXYy?=
 =?utf-8?B?TXQxQnhuazZ4dTA1VkJQQWtSU2dDN2xBSnh1bHV1c01FSFc2MU4wWDBqWGtn?=
 =?utf-8?B?LzBRR0JRRElsVTBPZ09wQWlqazlaT285VW1VSUxKa3lUcm5kbDFUd3Y2RkJF?=
 =?utf-8?B?YklHT0VTU0tpVUxnMXA5cU5IdzlqTlc0RFJiVnIremZtVVhJTFNlTXEwaFhq?=
 =?utf-8?B?c0tsNXJEZC9hS2xJN2lwcXQrVGIwQjBZVTBpY3hJNEkyOFloODhlaFNkT2Nl?=
 =?utf-8?B?bFRsUHJkVUlpeDhzakxKUks5OGpldWNYY05NR2E0cGZxWC9rY1N1SHVBUU93?=
 =?utf-8?B?cnpCcEF3U295TDhtVFRqdTlveUpUSllmL1FHTHNnOVk2QXorM09EN2UrdzEz?=
 =?utf-8?B?b0tmb2VYMUhiaUZ0NWo1K0ZGQWIrc3N0RGpNaDJmeVVGMmNaSktCVkJHeVNu?=
 =?utf-8?Q?YvHH8AeUsNuMU/j635KvwPXTQ4Vphw=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 16:54:43.0524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e93d48c5-1061-411d-f9a2-08dd55bd1a15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9945

On Mon, 24 Feb 2025 12:17:42 -0600
Chris Morgan <macromorgan@hotmail.com> wrote:

> On Sat, Feb 22, 2025 at 11:44:39AM +0100, Jernej =C5=A0krabec wrote:
> > Hi Chris,
> >
> > sorry it took so long.
> >
> > Dne petek, 18. oktober 2024 ob 18:06:14 Srednjeevropski standardni =C4=
=8Das je Chris Morgan napisal(a):
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >
> > > Add support for the second MMC slot on the Anbernic RG35XX series.
> > > The second MMC card is connected to MMC2 (WiFi if present is MMC1).
> > > The MMC logic is powered by cldo3 via the power domain to which
> > > it is connected, and also has an external 3.3v GPIO controlled
> > > regulator required for functionality.
> > >
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 27 +++++++++++++++++=
--
> > >  1 file changed, 25 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35x=
x-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024=
.dts
> > > index 80ccab7b5ba7..e2039fd76b3d 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > @@ -18,6 +18,9 @@ / {
> > >   compatible =3D "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
> > >
> > >   aliases {
> > > +         mmc0 =3D &mmc0;
> > > +         mmc1 =3D &mmc2;
> > > +         mmc2 =3D &mmc1;
> >
> > Please drop those. As a rule, we don't have it in any DT, since there a=
re more
> > universal to identify root partition than a relying on device order.
>
> Would it be okay at least to keep the mmc2 alias mapped to physical
> device mmc1?
> Confusingly enough, this device is such that mmc0 is the
> first mmc card, mmc1 is the SDIO wifi card (not always present depending
> on device), and mmc2 is the second mmc card.

As Jernej mentioned, this is due to subtle hardware limitations in the
Allwinner SoC. I think SDIO and/or the SDIO IRQs only work on MMC1, and
MMC2 is typically the only one with 8 data lines.
So this order is actually expected.

> That way the WiFi at least
> when present is always predictably at the mmc2 alias.

Why would you want that, exactly? I do understand the desire to have fixed
names for the storage devices, but for the WiFi? Doesn't the networking
device get named independently from the MMC device number?

And, FYI: if you really want the aliases, just pull this DT into U-Boot,
and use U-Boot's DT copy when booting the kernel, as U-Boot's build system
adds those MMC aliases automatically (since it's somewhat required for U-Bo=
ot's own operation):

> >
> > >           serial0 =3D &uart0;
> > >   };
> > >
> > > @@ -175,6 +178,15 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power inpu=
t */
> > >           regulator-min-microvolt =3D <5000000>;
> > >           regulator-max-microvolt =3D <5000000>;
> > >   };
> > > +
> > > + reg_vcc3v3_mmc2: regulator-vcc3v3-mmc2 {
> > > +         compatible =3D "regulator-fixed";
> > > +         enable-active-high;
> > > +         gpio =3D <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> > > +         regulator-min-microvolt =3D <3300000>;
> > > +         regulator-max-microvolt =3D <3300000>;
> > > +         regulator-name =3D "vcc3v3-mmc2";
> > > + };
> > >  };
> > >
> > >  &cpu0 {
> > > @@ -186,10 +198,21 @@ &ehci0 {
> > >  };
> > >
> > >  &mmc0 {
> > > - vmmc-supply =3D <&reg_cldo3>;
> > > - disable-wp;
> > > + bus-width =3D <4>;
> > >   cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> > > + disable-wp;
> > > + no-1-8-v;
> >
> > Please leave properties in same order to minimize patch size. From
> > what I can see, only above property is added, which is not needed anywa=
y.
> >
>
> Acknowledged. I just figured I'd alphabetize them, but you're right
> it's a bit anal.
>
> > > + vmmc-supply =3D <&reg_cldo3>;
> > > + status =3D "okay";
> > > +};
> > > +
> > > +&mmc2 {
> > >   bus-width =3D <4>;
> > > + cd-gpios =3D <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
> > > + disable-wp;
> > > + no-1-8-v;
> > > + vmmc-supply =3D <&reg_vcc3v3_mmc2>;
> > > + vqmmc-supply =3D <&reg_cldo3>;
> >
> > Is this another SD card slot or eMMC? You configured it as it would be =
SD card,
> > but mmc2 slots are usually used for eMMC, which needs different configu=
ration.
> >
>
> Physical bus mmc0 is the TF1 slot, physical bus mmc2 is the TF2 slot,
> and physical bus mmc1 is the SDIO wifi card (which is present on most
> but not all devices in the 35xx series).
>
> > Best regards,
> > Jernej
> >
> > >   status =3D "okay";
> > >  };
> > >
> > >
> >
> >
> >
> >
>
> Please let me know about setting alias mmc2, thank you.
> Chris
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
