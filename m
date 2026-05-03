Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012044.outbound.protection.outlook.com [52.103.32.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F5038C2D7
	for <linux-sunxi@lists.linux.dev>; Sun,  3 May 2026 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823904; cv=fail; b=mYWVowWptvf3NcGvYHQmx3IMCUXP2/qSH68JXFoNNASTkMReKvzuSkLgCduL9985VDMNcTHEEkfnbvQPA+opIC0zd8/u3M9ggpBvyZBjz0+lcFZ8Z9BAo7Foz5MfY0cLjLu0GppCmpQ1GHDA/SiWVA9uWSFGmh7l8KNE7uSVVTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823904; c=relaxed/simple;
	bh=EG+zJuwK+tEjME9fcQ5EM/uWBPfd9IfJ4S0+lXb6xAE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dcVIpxPv0XQ/AW22t6aHci2C51T4VlHm69FeqrEDHQoKG7HO4tOhSleDqTIcuzBG42ofQ52w0anRxWz5jTeYwsEkZCQtYQMjqzT71+VFx8FxxRGL4w3WxZ3RMqQH1en30Zid2TUl01nEJHBdaTJaMHFq+om2nQQ3RWfLMftZo4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=onQB/c7V; arc=fail smtp.client-ip=52.103.32.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="onQB/c7V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5zIK/oEU3/hEFH3VcRvhgJ4XkyMKXuSx4oNgjtV4azaIeEcGH3ooRHVFCzpg5JSwnGiOrqwjWHhD/wOaTkXPrmBgJg3DX8Gg0/XXkhkmX/d5mHdC9GoTso+ATR+RRmqUAE7oUEzFnJtD9YfRcH0oypbm78H7AdM70FiprBqgKRnwQFdstrFzSQjBo5Ti1/UguLakKOBrIa3p9ZeNs0ya/JozImGvNkchFztah3VR+UGPH6wmx4Y3QAOiiGysHs2rETqIuWKoYo9jewIdQWx5EHD1tEpT2EhEqBI+E9v5bmNY5dZ7aTcXsNQGHjKnFUNjcYjf+tkoY0tBJJQOqz0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etF5tn2E51MwYzDGgYWsRmuS0AXnlUKq3jsc841pibc=;
 b=lrd3oL6iInN4+noWrejXECLtykFEH5C4Oz53JHqTp4LsKV1OKbshsFNOOXIv94BF6iwTvq5yFgpNrIELsdGQKhUTc2ut3+Z0JJ2d1MHPE2dbOyBmu7LTGhctuGyCNh3QKBcrVOFKiZqf2FbDWno0W9Hd83i9bfffI0zQVvIzvV/DVBFYAdTksDlEA8ZEfUEJTO9UbKNyCUtftWDfGnOUQ0iwylXHztHEuPaLA3Zg5Sqx5S9zFK9nebX6n5pGjUfD2iT+nc69YnDejDlGYeCeNNEh5eeeccCkoy/lWg2A91RCK6iM8uHnY93cs+9PSsyQPCbGwnoWnz6JCmmL34l/EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etF5tn2E51MwYzDGgYWsRmuS0AXnlUKq3jsc841pibc=;
 b=onQB/c7V//LrJ1aHsugi22T24Lnh4U8qHpgzzn1E2MFvW0TWjqwORsbUupUX3WeosRTBza3xsTxE3j4GpW4DIIFhypwaV/xvS1T0qq75RQt4zbV1rdwInP/RXv/+qISuFotnIb/5EHZZgxZy5HmRsyr6Tgf8Go0Tw2MDWzndw2yW745L+ZOet/VVZl1sNEpYebupPGT1ZkOBVJGSkwtPo8pInQmHndPAIizPYh1Mx7Igl+bUm5MKekLImQqExwf7YOv44UmOlfrsvoKL0bizOfFn8ZSBgXoo9efpsd93rLVyfp4CecdtEB1XU4mGMGSvyhl+q0xJ+m5xbjy2aNXEYw==
Received: from BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:ef::8)
 by DB9PR10MB7244.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Sun, 3 May
 2026 15:58:19 +0000
Received: from BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1847:57:5806:6cfe]) by BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1847:57:5806:6cfe%6]) with mapi id 15.20.9870.016; Sun, 3 May 2026
 15:58:19 +0000
From: Nisarg Rajput <rajputnisarg17@outlook.com>
To: "wens@csie.org" <wens@csie.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>
Subject: [PATCH] arm: dts: allwinner: enable overlay support for sun8i-h2-plus
 pi boards
Thread-Topic: [PATCH] arm: dts: allwinner: enable overlay support for
 sun8i-h2-plus pi boards
Thread-Index: AQHc2xVufzTjECkUg0GAU19lgOFLEA==
Date: Sun, 3 May 2026 15:58:19 +0000
Message-ID:
 <BESPR10MB922376BDC75D346412FC33E4D2302@BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BESPR10MB9223:EE_|DB9PR10MB7244:EE_
x-ms-office365-filtering-correlation-id: 1cd2cae5-046a-4251-80de-08dea92ccbdf
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|8062599012|51005399006|15030799006|8060799015|15080799012|19110799012|461199028|24021099003|102099032|440099028|3412199025|26104999006|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?yxGuAKyJ/StPaZXpNN1Z0Y7oguw/NfOr7qkxuFP2z0iYaNyLkeEeF7KFte?=
 =?iso-8859-1?Q?bfJgwUj+FQrl0IGg67SiLBsU4qTDrsSkhMbg21P9DR/kVFH9QwRl2RTSzf?=
 =?iso-8859-1?Q?Zg3MQnQi5RcHkq3j35YaIe7ueqC2evUdY9rJTzdJj+abBcf1DYzjytI04K?=
 =?iso-8859-1?Q?EitOQ9ijhpREsUY6shaxXB9Th3xgDYuiyPPgeF0A9Omm81uGiTIX4SW4Om?=
 =?iso-8859-1?Q?qI/KBsIxo+6fXD3fifFetCSPJoRDyPBNIhv7baKLqONwna/4yL5ejhwDhm?=
 =?iso-8859-1?Q?GfybYNaZb9k3dbeHCfkGIVxWf3EtxJrvY31lpm6yM1Luh9GiAkKtEaoKzb?=
 =?iso-8859-1?Q?tIz7fcOYSYb9LwrYMDjgqUH10LOXFLMhFMxRxxhSbGB5cDk8TZXm/iKbOD?=
 =?iso-8859-1?Q?JzGrg655JP1M9jyXyV1f8ozZO2abv0PAMGhTSzGT7Fxn6QKIng2IDDZP2Y?=
 =?iso-8859-1?Q?E/AZT2FLHTkmxxu6/gK3pH9ZHV/U3TjOSh/Myzir/rjf4Hz/9eV4xW8qC0?=
 =?iso-8859-1?Q?1M1xy0bsm4kxL73MrTvNkZ6wUfhxy/rjWPF0MTDn2Z9F+0IGYVJqINEuks?=
 =?iso-8859-1?Q?isl+6ID5glWe40sQGDzxH1e6++p257HzFu64ECbNCztgqrM6C6F/BBVbDm?=
 =?iso-8859-1?Q?VUcfypigdrwfz2fzh4BDJqak8nUhSO7ShXz+BgP74hp0g1Y4Lt1OZIhf+5?=
 =?iso-8859-1?Q?s4BVF4IJ6trAkWj7dTPh00P3ZN6wDNCzGD4Anak/Ih5tlfLRatVUs3IGbw?=
 =?iso-8859-1?Q?37EMfgAeYThe00YtFXhqS05i6jXq3SSc4JRmOe3pKkiuX1KRGp3XcBhXQk?=
 =?iso-8859-1?Q?SkN5Yb4YR/5p7OOaNgDrS36p4MtjQYkkkBguATkpYsIHZ25Do4RIUHqO3a?=
 =?iso-8859-1?Q?QxY70N5c7Ee0UL2AMlM7LoTf/ZluQODkunyY5mpxutIG2coUKzhrEUIvfi?=
 =?iso-8859-1?Q?xyI979gVRT8MXcbWY9HhqvdOUdIvosWNL6u2+2ooJff9V02R2EoeUiyRyW?=
 =?iso-8859-1?Q?63SWAx5DntDoyanEQIVzlh5eqQabGL2u/Ymj1c?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ytxCugBZquTvkcsQ6AsjULVAdvWOWmd4MN1OvIE4uDLpw1cj91b373FAD9?=
 =?iso-8859-1?Q?bQ5kslRwZpQtQfj9OtmiLSv+11OTHKUK4CulEGCuctx/eeH0Rjh9f8sS/t?=
 =?iso-8859-1?Q?iTZ/vukmbc0F9IhARfc4j6L01ZPv6VKQtoZ0eZUelWv11OZzhrIhLHVX6f?=
 =?iso-8859-1?Q?NsdmnYmzmU4Zhh24MiLvEkhkfQrSvg5ZjWZAeo73KveCjS0uFiYFAv2wx9?=
 =?iso-8859-1?Q?YIhmD+wcy6Pv6EBojSe5FGruvow3khIPf7XJkq580EYmLxYloV7LRjFcTb?=
 =?iso-8859-1?Q?12AxQg9czT3cswnMdrl1kNqpQ3NxDMN9mqT8EAu6cmTNVt9lqk0Jr9/ANb?=
 =?iso-8859-1?Q?Bufh3RH6Nzo4sBlEY15ldcCw8gkLnTPcdkIkXHiwDZmN9GOU4SE9Z3ymy+?=
 =?iso-8859-1?Q?AvpY70+4cYsetOqH6Z025MZCypxIAnYIZFvDJKheLY8rNWsEGU6ZEXYbaN?=
 =?iso-8859-1?Q?BG2vUdrcgJBBKg2qOnU9tfuM4z2SPsXUM1+g1097wdv3FYxz3rqP63X+fx?=
 =?iso-8859-1?Q?5NG+fpfzkFFmJZtJJ1G+2/Rt3RZ9QyT9Cki8CyBTAVW4+Uk1nB5Q+divZG?=
 =?iso-8859-1?Q?5q5RTSfJw8ciOwufM4hfMJj3VgwM72ptNdh2/i5k5JNj0LZqSfMRCO8yJn?=
 =?iso-8859-1?Q?tzgoLKyuaj3H4IxKbNCKVJImE6JwWlhDhyIrHqfBPTSTckBVVmxku6FB4v?=
 =?iso-8859-1?Q?fDcU/vLFZWwrJNZygepHXLGId7puoBmqD0jSN0F2ENIBO3F0xFYJ5A8DX7?=
 =?iso-8859-1?Q?g5+2p5s+d4/7wMN2lMA9obgZyNsMNi/wRpdQk5EgPszXAOtJa7XYT8fMhe?=
 =?iso-8859-1?Q?m3SoXh8EUonQOl/C1sVzuYWEGL7CNC273faRTYUg0PgEIDfg7RGhAgQitk?=
 =?iso-8859-1?Q?U/+yefo7LVB3pf2BVxDwt2VW/UqftXgwZUPNt2lGCO434ERcbZgLJTeWbl?=
 =?iso-8859-1?Q?EbYzdjIDFMZDNgmwGAqSHdYMWtz9HWUdiG9sJIteNv4/LwlxBl/YxXA8H4?=
 =?iso-8859-1?Q?PZlkH96mQhfyrDWLIA/sY8Wf7a98x746Ir7Ye5Bspj/pyiyhLRCw5Jwrap?=
 =?iso-8859-1?Q?SHY47ukAGJ5UQQ5hz1ggzPGncXr6lJmUrJplgZL1e6eJBrAtTVd3BHaa7t?=
 =?iso-8859-1?Q?JaWzRwzH4WHA4S6qT/7tHKjV9FNss+4kSdZTRbrM66gBrjC9KPAQ4ElLtQ?=
 =?iso-8859-1?Q?6KFKGO+w3zMGZzWxOrNfQwF5t6Gp1KAXrAu2BflCEmX+G8pJKyWVwX+9Sp?=
 =?iso-8859-1?Q?OkY2C81o5WyyxVad+dE2WzgNE3tI8hO+GvSe2Jk7A30D43QFYSuitfkBuH?=
 =?iso-8859-1?Q?dUeLaEH/Q4sRKTVcl9v+5/Y3bobiy3+t8yomNrMY1EQ9R7Oqczz4VrCRP8?=
 =?iso-8859-1?Q?uugy0mIMMg2cMCe2rKGlYk4EfXBp1f8JDEneOJ8GBbD+a9BxDqv7+1ZU/D?=
 =?iso-8859-1?Q?8OLAUGPL+3sk2PrqE5nWfJ0O9KDBHJ0Oxb6Uhkq8SGVhNNgukjVgaGN5cI?=
 =?iso-8859-1?Q?NHorbX/QN4R627scXGGWjJ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd2cae5-046a-4251-80de-08dea92ccbdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2026 15:58:19.7168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7244

From a0c7eaa6032748bb79953282a984064a922c916f Mon Sep 17 00:00:00 2001=0A=
From: ixnisarg <rajputnisarg17@outlook.com>=0A=
Date: Sun, 3 May 2026 15:42:38 +0000=0A=
Subject: [PATCH] arm: dts: allwinner: enable overlay support for sun8i-h2-p=
lus=0A=
 pi boards=0A=
=0A=
Add DTC_FLAGS -@ for all H2+ pi-class devices to enable device-tree=0A=
overlay support. This follows the same approach used for H3 pi boards=0A=
in commit 0801a3a9f35854c91f1f3ab8e879c3d14912d214 ("arm: dts: Enable=0A=
device-tree overlay support for sun8i-h3 pi devices").=0A=
=0A=
The -@ flag populates the __symbols__ node in the DTB which is required=0A=
for applying device-tree overlays from the bootloader or firmware.=0A=
=0A=
Boards affected:=0A=
- sun8i-h2-plus-bananapi-m2-zero=0A=
- sun8i-h2-plus-libretech-all-h3-cc=0A=
- sun8i-h2-plus-orangepi-r1=0A=
- sun8i-h2-plus-orangepi-zero=0A=
=0A=
Signed-off-by: ixnisarg <rajputnisarg17@outlook.com>=0A=
---=0A=
 arch/arm/boot/dts/allwinner/Makefile | 6 ++++++=0A=
 1 file changed, 6 insertions(+)=0A=
=0A=
diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwi=
nner/Makefile=0A=
index 296be33ec934..2e0cc454df74 100644=0A=
--- a/arch/arm/boot/dts/allwinner/Makefile=0A=
+++ b/arch/arm/boot/dts/allwinner/Makefile=0A=
@@ -198,6 +198,12 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 :=3D -@=0A=
 DTC_FLAGS_sun8i-h3-orangepi-pc :=3D -@=0A=
 DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 :=3D -@=0A=
 DTC_FLAGS_sun8i-h3-orangepi-pc-plus :=3D -@=0A=
+=0A=
+# Enables support for device-tree overlays for H2+ pi boards=0A=
+DTC_FLAGS_sun8i-h2-plus-bananapi-m2-zero :=3D -@=0A=
+DTC_FLAGS_sun8i-h2-plus-libretech-all-h3-cc :=3D -@=0A=
+DTC_FLAGS_sun8i-h2-plus-orangepi-r1 :=3D -@=0A=
+DTC_FLAGS_sun8i-h2-plus-orangepi-zero :=3D -@=0A=
 dtb-$(CONFIG_MACH_SUN8I) +=3D \=0A=
 	sun8i-a23-evb.dtb \=0A=
 	sun8i-a23-gt90h-v4.dtb \=0A=
-- =0A=
2.43.0=0A=
=0A=
=0A=
=0A=
Thanks,=0A=
Nisarg...=
