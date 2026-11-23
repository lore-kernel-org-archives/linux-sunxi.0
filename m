Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.69.62
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795437386;
	b=wOFnyvJW7PCKk8ujRNFh59ytBjT1aKCCXMnvEcxSTYygHKNzPPW4hdO/oKYrhVZF0PHn
	 QvqNkEB7xYLqAo8DxnEwHsjCX3guTkdkVRLDbBnM9Yuv/uqeqbhofdLZEP89WbGoMugv+
	 lG1i4OTsPIkdcoNiJ/hao0hBZbJwEuzEoDjQUa7tYGviYZ+unri/ZTlYbWbceJr8JzeRD
	 4b948gHC2jV+litZ/7BqaoCWhndGNvCmY+OTvj8ySBUgHfUDewpaTlVU0SzVrQr3LICww
	 Dcj/vRue9FyL4nEKrB9AKZWFr65cCZUhlhZ0XAUOnq2/8WqU7rEykM2ZpRhJWmgVxSA==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437386;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 DKIM-Signature:Authentication-Results-Original:Received:Received:
	 Message-ID:Date:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:x-checkrecipientrouted:
	 NoDisclaimer:X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Yv6ybAiWCJ7JLIyWK84aqsBP/EYsFSMKlj9kIXF5s4I=;
	b=k6lFAH5w4j93vhviqFXnlSAb/elZ03rMPoPFtDIZdqgkcoiuB09w4Jh2HLwS3tmo5K1K
	 DNAowIItYpn7g/3YqT1N7gUXCI5muwVdVVd8SrH8RWvmwCnb1+1sQkCgWlZ1YeksvsW6g
	 6dduKYhtrHq9vTflSg76vhOH6jbfknYGtsZoi0pzp/1ERUUNlIKsVEjk9TOMBel3PUMK3
	 9CNo+YNKiJ7aIaF0Fuan0ibaE/JKDgZMfURLVFPTNUmSf+UJX4tctBLsy16BeJnNhu8a0
	 n4LDWTUlIvlfh2u4a9zhq/CdplKB7ZcHdq6DgiG+v7zJbT7QdAy39c8n+3cReCoaomA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=fI55uv3y;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=fI55uv3y;
	arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.69.62
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8CF606A334
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 12:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA8CF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=fI55uv3y;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=fI55uv3y
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gGJ19SrUhLWJzP98zizMpeViVhuRWS5KK63u5b6WEZjSgCxkqHqKmR+FII8afcUCWSQR8vr4MZ3QEH0kMiyLyAWmfN0KLpsVd92x+mgW0A/SYrKW5YDCUytmz0S3vBxZFSZOfcNHtLjoiABZBZMyJ1PdJFkzXz1xZFh8JpDsfRSiR4aeZVECJrsM+r8gYbYcWHuuxqSh/bz0VmeLWOtPrY4uuDZQkhBADMLDn5fz1CwpCw4dSCvjlPiq5iEm350Rr7PBwtN6mthT3Q0NKzMMy0ZwcQnl8SoEE/MjWBJighTBgRQvthsD52B1bzIjpwrpbFz3b0ydKA/WCk/jS2C+Pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv6ybAiWCJ7JLIyWK84aqsBP/EYsFSMKlj9kIXF5s4I=;
 b=gUh2pFV33IhERBw9Nl44mYoFMmrlmNQ1jKZS/F5l9xzaIg/SjPxKuZONReN919sexIDUH9On9tDWR4mKw9y8meyyZxe0Cf+LfzKqkiH5d6aKxQ3pSeWwI0yMbwB7AMtRIApXWPVjm+80AaZVQ8NMH2CNidgJy2nQKtr1Pqpjah7yYjgCAl2SKZrGwjpbxCApr9TpsZYeBFgzoo1oFhOPFr80dD3iVahnrbUNH4lTaTZG0hArvFvOCijMfH5QneujDlMgIOL/lBRqAk5REBC5S/334eGuqm5sE3DVo8c8gkgfNmIMcu62E9qg+zpdDL6+x0+FVgcJXB4+uMj6GNZeVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yv6ybAiWCJ7JLIyWK84aqsBP/EYsFSMKlj9kIXF5s4I=;
 b=fI55uv3ySIsglVkD+PKKta4a8CNz11N9eHfX7wK9wujr7mZb91YdL84lE6VYjUwYFACZlU+xX62EfdbUvty/tVP5i0UTgnj7UziCaaVZmrpdlVin4yEYzAGJ/URC8ITieU9n1+n02jgkt+9C+XnvXf5DsQi9h8R+tKrupQ/2z4s=
Received: from MA3P292CA0040.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:46::12)
 by AS8PR08MB6453.eurprd08.prod.outlook.com (2603:10a6:20b:31b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 12:36:19 +0000
Received: from MA3PEPF00000407.eurprd04.prod.outlook.com
 (2603:10a6:250:46:cafe::4c) by MA3P292CA0040.outlook.office365.com
 (2603:10a6:250:46::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 12:36:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MA3PEPF00000407.mail.protection.outlook.com (10.167.241.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Mon, 23 Nov 2026 12:36:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQFpkzaTlT17Yjz/Ptn7+CoPSHjzT6BAP92at3hsyS1niWYUkTpkdYSKT1F/EyMKajOVYFVkrCBEhMGeWj9RH69drwcw2xzwEwIXjKnxogjWRvHU17hi7PiH1Nt4eoWN1GtRnJAPuEiE3OpskcASQ+R5ElLsbaQ9rJ/sBTsIJ4OgQM9+OLbViPfoTyx5qVfHMN9DJuu5+yzZDqY0GJc3FvtC+boEmLg27glk4kGkn1uIcyvenIHzObftzV0wrIUiQjUZ+2OqtwdxRmS0YWzJjtcNL66S1SBenel/YXUJsYkrRj88mg8MqoDPVSMJzw7DSXzR7PCrH5hs2qlBn2djGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv6ybAiWCJ7JLIyWK84aqsBP/EYsFSMKlj9kIXF5s4I=;
 b=a0LsNGUHzlTLitvtWHUQU9NFrLRewY9174C2oho3etdpu2IHW62oKQrbj2pyjdOkwY7omDp4ie/mdSe1+pO2HlDzlrkXESr+L4shOK7iHYTfzNdiieAI/YhQtG/3GgIEpC42BJlN7e2BkEn5qSlPUz8gjPdY2zYKcg2ddKbTpbTsZBfclYvw9OeXz3fwzi9Envi4zrXFIhEUYVtxHnPI2DOT53qTXFFy2EbN1hPRSbdTErkGg88uyNErwPQy6Xj3ZsWiy82G12jFSVzP+qVuTgl8wXSKhk57yXHUGBufZ3zt54H4+PInVvfkhgWHB6zcmrK8tOCC3a0uLtB/sg6S/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yv6ybAiWCJ7JLIyWK84aqsBP/EYsFSMKlj9kIXF5s4I=;
 b=fI55uv3ySIsglVkD+PKKta4a8CNz11N9eHfX7wK9wujr7mZb91YdL84lE6VYjUwYFACZlU+xX62EfdbUvty/tVP5i0UTgnj7UziCaaVZmrpdlVin4yEYzAGJ/URC8ITieU9n1+n02jgkt+9C+XnvXf5DsQi9h8R+tKrupQ/2z4s=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10370.eurprd08.prod.outlook.com (2603:10a6:150:a7::7)
 by AS2PR08MB10180.eurprd08.prod.outlook.com (2603:10a6:20b:62d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 12:35:45 +0000
Received: from GV1PR08MB10370.eurprd08.prod.outlook.com
 ([fe80::722:98ea:caeb:b988]) by GV1PR08MB10370.eurprd08.prod.outlook.com
 ([fe80::722:98ea:caeb:b988%6]) with mapi id 15.21.0615.009; Mon, 23 Nov 2026
 12:35:44 +0000
Message-ID: <8f9f9752-4c23-48de-9483-63268627ff3c@arm.com>
Date: Mon, 23 Nov 2026 13:35:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: allwinner: add Radxa Cubie A7Z board
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261111134919.90264-3-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261111134919.90264-3-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0438.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::18) To GV1PR08MB10370.eurprd08.prod.outlook.com
 (2603:10a6:150:a7::7)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10370:EE_|AS2PR08MB10180:EE_|MA3PEPF00000407:EE_|AS8PR08MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: e7df7923-3557-4c08-901f-08df495e5f53
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|7416014|376014|18002099003|22082099003|3023799007|56012099006|4143699003|5023799004|11063799006|261102123227099003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261021135927099003|261026140227099003|261026121527099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 D/XG8NKUhg6z7SDoL+J0egEJc3snJ6TAaWsIQBER8+gKLrFyEecPjyWaT5DfzHkHL6QgrNWXeZ2cQW+2Ux7lMUdFU8VpY3ctCCu67TBu5gU0xnfU1SioeYDhWp02O7+db5A/b9LXxUpvuobA9Cy7F9IKN/fImiQ0SUstxHyO1Hz6EExjVVE+ShVrQSARyoEy/qomZRRMHdfEowZDFUbJk1ewTCTRoQ1ntQ3T4F5Ym/1Fqc0TjwBdSA/BnIvRrUUIGmRS5sCpju0fQgaOXaxooODRWCh38OJ9bX1TGXwb8y2XPUeIdXgyzRjKCpI7we+7Z0pwRHGL7chFoK3vk6HX47TnCHSH/mPMJE3h8nrbKm5H318PQ2kbir/U/eP3Vpy8UMP+VWjxCb9A4LjmRtDOqLwztzkTxkhtNs4cACN42r+gyl4HwAqr7XpJR48j63Z4UT/aTe2tjEmBBG66JHbfmrlkHnIKOQLhvj57qjkpHIQj/v1ufMSkHeYIoEwGkZo8KJR+Efe7Fvr5KbnzatIX1g3CfaQazRQfcrh6PXIrJJiMGZCqAM+R+M+Vqf+v67uDrG7n5Uu1XU1ThugBashjPmcsCXEa7Be8mZzPctGcIBjAHONj25VmEzLUnb/EEcXUoS660YhMBTjVL3xGvBdPQ9dY2N4HKhBrdqWm2I1NYn4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10370.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(5023799004)(11063799006)(261102123227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261021135927099003)(261026140227099003)(261026121527099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 BDDLnOjiU9nwFON9bYNCbpRf5RK64GW2yE8KGkhbdAVrDPDXmFsWq91usozb7iD74rI19Le2W2i8f6mNdYWzqLBsb4e9SENwxxijvyMV+QD5Zv5/EXPF5Egcl1pUShlJoTrZwImPCrv8sZy/DdB+L/xEritX6KRuRB9rZy6Eej/2V8JnF50qSJLfHqVqdKFA6yPxVHKnIHZLVsi0/Ot0XvRK3zuZtn5b2bbVSGEBbH63FQNG4loacV5FEDVkb1p0im94H+Q/jBeehL35bu7e92MucggMTkwSp0g5BQtBp9k3sqjGHMl0EVUabblcpFg4GjiU9yV50LHvNKWQCfKajQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10180
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MA3PEPF00000407.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e77a0588-8c4a-465f-f623-08df495e4b04
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|14060799003|82310400026|1800799024|36860700016|35042699022|376014|7416014|18002099003|22082099003|261009223027099003|3023799007|4143699003|11063799006|5023799004|56012099006|261026121527099003|261028144727099003|261021135927099003|261021121427099003|261021123027099003|261102123227099003|261022075727099003|261022105027099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	wrXwC1qq1bL7XQrVk6bORaRpFTiSgA6aTtEqnHQgE1755TG+YgcAQGkCF1xla3R/+EPp38FrEQfdla032+JNg2wkBJIpRQnqqi9hEsfFweqCsTTkA+FmkPxitq669RDrxu5qGkYfVH+XQHYEqOLVjS/CtOs6raiw3kMQxk8PcjOXp2W3dUBA79MbZrxW1db7vu4THfs5La+IRvSnEH2+Dwo+NXrsSR+3ht4tx4qN2wqkCZoU10AcuH3z+l2PHQPHr6gSzew1YZrCc8+l2pKLXO8SJJQlSYoyh0jmXh9nA+YvP/+AH/fKGAbN/oPzATwbYWE5AitveHtMPYaKJEbeyp0JrixkdyjOWbg/5mdNTad7xZEG266jb/ydgDEO3EU8MJow6PiVRv8PTHFu94bjs4fniyZZxNVLlKItoYuTE5v3Uvk20fJ5GgF5k6XCyXAPXk5++HIIu4OzLIkMn81MnX+mAo7k7NqPrxqS3RuZKT7uZz40wz4rNbaxhIFMKUemaO2EMmcY/omC/mkEUEaB5Bs7H9roy/nM8kgym2TO7dkSOy5sGMEMxvWHjYEbMZIsGlptPHbahCjNvUyrXUTm6kczJ/k9/MM1BAoR4FUcf5JOhEmkkTPbccZEvRBakxMi1y5XYENYJM8CYnIQLx1epfJmcIkXVsBU5V9kWp392XaAjcg5Gv0Ettp4m6wlUCXyCKUcCfAXbMr35eWfVRgn7A==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(82310400026)(1800799024)(36860700016)(35042699022)(376014)(7416014)(18002099003)(22082099003)(261009223027099003)(3023799007)(4143699003)(11063799006)(5023799004)(56012099006)(261026121527099003)(261028144727099003)(261021135927099003)(261021121427099003)(261021123027099003)(261102123227099003)(261022075727099003)(261022105027099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lQFURTOeGp52T5e8dfnc6jwwcHA2y6M13D8PEIpSln/yeLxS5hqpD7uz2X6VYD7t86IebdZ/+tJFPXTjbRJbqTceUxexjGoNZeXDYdZNdEMxzNybMFkfcAq/gED9ZkERpzjUuhkw+ge2oPiOJmv8wnIaev+mPiNrRbp3fyI2c+YNbu4QL1ZuepChaFmvYDyjJ3OVTYYANZsbqojfVu/tqrJeVOPXBgbNTTVTecEPne5MexBELsWaSJ/IiUTTBB6FKPt/gdhww0xLM2qfwTID0KOJtTWo4C6XCJD9qMgDhav74NwnurLwgofEIc0OTixGnLlUUmSgP3fIckPXsNAsXCqHy5TeC7Ls2QBOV9RgMKLcjCgIUdfaHKtC37nhb9uB/3wYN1kZFfB30y6giWTm0YdDpktC/psw/vIMcwSVetXOMI/THIOvXGP4pCkWSVFT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:36:18.3135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7df7923-3557-4c08-901f-08df495e5f53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MA3PEPF00000407.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6453

Hi Vinicius,

sorry, I missed your post earlier, so made my own version of the DT 
yesterday. So this is more like comparing this to yours ;-)
As you saw my reply to Enzo's .dtsi and A7S .dts, I will keep the same 
issues I mentioned there brief.

On 11/11/26 14:49, Vinicius Pedrosa wrote:
> Add the device tree for the Radxa Cubie A7Z. Describe UART0, the AXP318W
> PMIC over R-I2C0, MMC0, RTC and the bank supplies. It is based on the
> Cubie A7S DT.
> 
> Unlike the A7S, this board uses BLDO5 for PG and a SY8089 regulator for
> the PMIC's BLDO and CLDO inputs, and the microSD card-detect line has an
> external pull-up, so no internal pull-down is used. ELDO1 only supplies
> VDD2L for LPDDR5 and this board uses LPDDR4, so it is not described.
> SWOUT1 only feeds ports D and J on the 40-pin header, so it is not kept
> always-on.

I think this stanza does not belong into the commit message, as 
comparing to some different board is not relevant here.
Instead you should briefly list the features/connectors of this board, 
look at other commit messages for board .dts files.

> 
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> ---
>   arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>   .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 286 ++++++++++++++++++
>   2 files changed, 287 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 792152525b43..2eee91dcbd77 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
> new file mode 100644
> index 000000000000..ab3d3d70f9ff
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)

I think you need a copyright line here.

Also please explain the situation with the v1.10 and v1.11 versions here.

> +/dts-v1/;
> +
> +#include "sun60i-a733.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Radxa Cubie A7Z";
> +	compatible = "radxa,cubie-a7z", "allwinner,sun60i-a733";
> +
> +	aliases {
> +		mmc0 = &mmc0;

Please remove.

> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reg_ps: regulator-system-power {

Please add a short comment where this power comes from (USB-C connector).

> +		compatible = "regulator-fixed";
> +		regulator-name = "ps";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +

As mentioned in the other mail, please add a comment that this has been 
added in v1.11, and v1.10 doesn't have it.

> +	reg_ldo_input: regulator-ldo-input {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ldo2v5-input";
> +		/* SY8089: 0.6 V * (1 + RP11 / RP6), 30k / 10k. */
> +		regulator-min-microvolt = <2400000>;
> +		regulator-max-microvolt = <2400000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_ps>;
> +	};
> +
> +	osc32k: osc32k-clk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu4 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu5 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu6 {
> +	cpu-supply = <&reg_dcdc3>;
> +};
> +
> +&cpu7 {
> +	cpu-supply = <&reg_dcdc3>;
> +};
> +
> +&mmc0 {
> +	bus-width = <4>;
> +	cap-sd-highspeed;

Same as the A7S, please add the others.

> +	/* PF6 has an external 10k pull-up and reads high with a card. */

"reads high with a card" is a redundant comment, since this is what 
GPIO_ACTIVE_HIGH already says.
Please explain the situation with the v1.10 vs. v1.11 versions here.
And my v1.10 board needs GPIO_PULL_DOWN

> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> +	disable-wp;
> +	max-frequency = <50000000>;
> +	no-1-8-v;

Please remove both.

> +	vmmc-supply = <&reg_swout2>;
> +	/* The 3.3 V path uses VCC-IO; no Port F voltage switching yet. */
> +	vqmmc-supply = <&reg_swout2>;

Please remove those two lines, we will add vqmmc later.

> +	status = "okay";
> +};
> +
> +&osc {
> +	clock-frequency = <26000000>;
> +};
> +
> +&pio {
> +	vcc-pb-supply = <&reg_swout2>;

Please add a comment that this comes from VCC-IO. See the Cubie A5E DT.

> +	vcc-pc-supply = <&reg_cldo5>;
> +	vcc-pd-supply = <&reg_swout1>;
> +	vcc-pe-supply = <&reg_bldo1>;
> +	/* CLDO5 feeds VCC18-PF; the 3.3 V path uses VCC-IO. */
> +	vcc-pf-supply = <&reg_cldo5>;

As it stands this is VCC-IO, so swout2, please change that, plus the 
VCC-IO comment.

> +	vcc-pg-supply = <&reg_bldo5>;
> +	vcc-ph-supply = <&reg_swout2>;

VCC-IO comment, please.

> +	vcc-pj-supply = <&reg_swout1>;
> +	vcc-pk-supply = <&reg_bldo1>;
> +};
> +
> +&r_i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&r_i2c0_pl_pins>;
> +
> +	axp318w: pmic@36 {
> +		compatible = "x-powers,axp318w";
> +		reg = <0x36>;
> +		interrupt-parent = <&nmi_intc>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		aldo156in-supply = <&reg_ps>;
> +		aldo234in-supply = <&reg_aldo1>;
> +		bldoin-supply = <&reg_ldo_input>;
> +		cldoin-supply = <&reg_ldo_input>;

Please add a comment about v1.10 differing.

> +		dldoin-supply = <&reg_ps>;
> +		eldoin-supply = <&reg_dcdc9>;
> +		ips-supply = <&reg_ps>;
> +		vin19-supply = <&reg_ps>;
> +		vin23-supply = <&reg_ps>;
> +		vin45-supply = <&reg_ps>;
> +		vin678-supply = <&reg_ps>;
> +
> +		regulators {
> +			reg_dcdc1: dcdc1 {
> +				regulator-name = "vcc-3v3";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc2: dcdc2 {
> +				regulator-name = "vdd-sys";

Please add the voltage: 0.8V.

> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc3: dcdc3 {
> +				regulator-name = "vdd-cpub";

 From the OPP tables I could find in the Radxa repo on github, the range 
should be 0.8V - 1.05V. We can adjust this later when we add proper DVFS 
support, if needed.
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc4: dcdc4 {
> +				regulator-name = "vdd-gpu";
> +				regulator-always-on;

Voltage range should be 0.8V - 0.96V, and drop the always-on.

> +			};
> +
> +			reg_dcdc5: dcdc5 {
> +				regulator-name = "vdd-cpul";

Voltage range 0.8V - 1.05V.

> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc6: dcdc6 {
> +				regulator-name = "vcc-draml";
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc7: dcdc7 {
> +				regulator-name = "vcc-dram";
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc8: dcdc8 {
> +				regulator-name = "vcc-ufs-io";

The voltage is 1.2V, and please drop the always-on.

> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc9: dcdc9 {
> +				regulator-name = "eldo-input";

The schematic says 1.1V/1.25V. Can you check what it is on your board, 
at runtime? If in doubt, go with 1.1V, this should be enough headroom 
for the ELDO6 this supplies, with outputs 0.8V.

> +				regulator-always-on;

Please remove.

> +			};
> +
> +			reg_swout1: swout1 {
> +				regulator-name = "vcc33-lcd";

Please use "vcc-pd-pj" as the name.

> +			};
> +
> +			reg_swout2: swout2 {
> +				regulator-name = "vcc-io-card";

I used "vcc-io-ph-usb", "card" does not seem to be used.

> +				regulator-always-on;
> +			};
> +
> +			reg_aldo1: aldo1 {
> +				regulator-name = "vcc-pl";

Also USB it seems, so I used "vcc-pl-usb".

> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_bldo1: bldo1 {
> +				regulator-name = "vcc-pe-pk-mcsi";

Voltage is 1.8V.

> +			};
> +
> +			reg_bldo2: bldo2 {
> +				regulator-name = "vcc-lvds0";

1.8V as well.

> +				regulator-always-on;
> +			};
> +
> +			reg_bldo4: bldo4 {
> +				regulator-name = "vcc18-codec";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +
> +			reg_bldo5: bldo5 {
> +				regulator-name = "vcc-pg";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +
> +			reg_cldo1: cldo1 {
> +				regulator-name = "vcc33-18-usb";

That is a confusing name ;-) "vcc-pm-lpddr" should explain the always-on.

> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_cldo2: cldo2 {
> +				regulator-name = "vcc18-hdmi";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +
> +			reg_cldo3: cldo3 {
> +				regulator-name = "vcc-pll-dram";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_cldo5: cldo5 {
> +				regulator-name = "vcc18-pf-pc";

"pf" is somewhat misleading. I had "vcc-pc-combo".
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_dldo1: dldo1 {
> +				regulator-name = "vcc-efuse";

Voltage is 1.8V.

> +				regulator-always-on;
> +			};
> +
> +			reg_dldo6: dldo6 {
> +				regulator-name = "vcc-ufs";

Voltage is 2.5V, and no always-on should be needed.

> +				regulator-always-on;
> +			};
> +
> +			reg_eldo6: eldo6 {
> +				regulator-name = "vdd-cpus";

Voltage is 0.8V.

> +				regulator-always-on;
> +			};
> +
> +			reg_rtc_ldo: rtc-ldo {
> +				regulator-name = "vcc-rtc";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +&r_pio {
> +	/* PL powers the PMIC bus itself; firmware must keep ALDO1 enabled. */

Probably better to copy the comment from the other DTs, and have the 
"would-be" line inside the comment (vcc-pl-supply = <&reg_aldo1>;)

Cheers,
Andre

> +	vcc-pm-supply = <&reg_aldo1>;
> +};
> +
> +&rtc {
> +	clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>,
> +		 <&osc32k>;
> +	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	status = "okay";
> +};

