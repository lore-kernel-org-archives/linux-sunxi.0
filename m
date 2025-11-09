Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013010.outbound.protection.outlook.com [52.103.33.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262D63CB
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Nov 2025 06:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762668271; cv=fail; b=RRwPUYoCF5OcKvAry3KN9Yws37NXY9n7ADRIxHlKMkpjtuxlVpPT4+J+2HgGM5BL3TWuwsOT8FKx9mSYCl9DsArQDMeu+Qt43lxJlamikcT3g/xzToGqwVsfZ13qESK7BZLRcWL26WhD/o2yAwRBVs15q9QaufJgBj1Lrt7ihyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762668271; c=relaxed/simple;
	bh=41PkwqMJwWXntgNpsAdGQ/9O7RO335dRsiRlB0yKymE=;
	h=Content-Type:Message-ID:Date:Subject:To:References:From:
	 In-Reply-To:MIME-Version; b=TJZqm3sVUgsVlE0WFCtPHJtXJGWKsVkSm1Xd55T6+rbTWPRHqQKFXDxXwmKqX3Caayx0xX30ZPWUr0Z7QbFNoeScorThBH89G7qztn+5VxWMYwyqGBLidMJCrsbTRxxd2MgC1x5crduEf18oGJN8sTkRrNgeuh8JGgNEQth62I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=niebz0e3; arc=fail smtp.client-ip=52.103.33.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="niebz0e3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dS2ZdR5QTjTuHfgybm3glrI6nAZ0xzWhHWhExwncZsWus7CwIOj/qatKGf1iGKONjV/fz5vBPmAX0NKh2rv9ChxVYKxh2mYvaDa1lUJsqoyIbUDTkMLilZwG710yiqoUUGTXZUsjGaBSuk3aeYTInaOEKEDKoBhN+PsZbQZdkjj5NSWTIYqadR2fQZkq/im/MKgdsCCvN8KeMyfv+oKprhcr1TWQdM5K87t7T1z5sdUMnk3gZcwX621wwVdyAPG6zkyHdaLSoMDMgNsozvNc8ox44ng5MqRxG9AFOPz3hk8x+ZIkGS5F+7WYq8l2JjNWz6HQl+MK6TV5U5LBzg6zxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQZGnzwKZaNgh1rlqCfAa8w0MEk04URnmo0/FRAWAhU=;
 b=B21hqqpFKpY+648cgFk5E/fpU5C6mj/jk9yo/u5+TfxECXKOI52YdCMfINOcIegOl5si24JZS5XQn5lwVEOPSKEyS1DLD4ACYb7L5UxjaQbNu99uEIkitVWIMa4bxkQozAEtL4WqtFMjgAbakLIvNLzTWETSIuwnn82ieN3APNZ2P4Tb9kV5GCpreAc/aVRUBSUKIVKZheDiJbULRS1urqae6rtcBsW1ODFL9i9aD536SmRBBugFmwQa+vSui11/An517SMV+KOwO1Ljav9ye57YeDUUBQWdILAmwbdBYngobWVy+XEfyTfojgkroChn7DaR0q02ku2FgHrA0Wy4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQZGnzwKZaNgh1rlqCfAa8w0MEk04URnmo0/FRAWAhU=;
 b=niebz0e3U6rzYO3S0JM4K1ldqGC94EKM9MTh0UMg3ZRJk+gGv8QjHwJviCo6B1cSSrBkMsEMolMiD/SOCTtkewj/zOr6FgldGjRy/hoyXmprNf//FunDJInpxi7ZfLG09PM6FVJ1IOkMKsMv/suv8+TApJRSnkCZxrEJJHuAWozi6amRLgnS0WQ/E6r+abK0sOHk8D3cJqPoZzk7fJ+BBqhu2hF2tE0uyerv7phkOq+mS9D8pmH2W+r/XjIl0wruKKUYR791Fmtg/c88csLTNTGg4bYM2SmonKRqQ4/n6zIM0EX/NTODrv6hjDYGxzDIrgOCPXbtVYv1Yyn/TbRh8w==
Received: from DU0P190MB2445.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:5a5::8) by
 DB9P190MB1130.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:22c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.11; Sun, 9 Nov 2025 06:04:25 +0000
Received: from DU0P190MB2445.EURP190.PROD.OUTLOOK.COM
 ([fe80::5dcd:351e:4e91:2380]) by DU0P190MB2445.EURP190.PROD.OUTLOOK.COM
 ([fe80::5dcd:351e:4e91:2380%5]) with mapi id 15.20.9320.013; Sun, 9 Nov 2025
 06:04:24 +0000
Content-Type: multipart/mixed; boundary="------------fKsynrSlSpH5MqTX4h0zmh0t"
Message-ID:
 <DU0P190MB2445118BA23CD7EABD3B9CA9BCC1A@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
Date: Sun, 9 Nov 2025 10:04:11 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: Colorly e708q1 and AXP20x support
To: =?UTF-8?Q?Horv=C3=A1th_Csaba?= <horvathcsabalaszlo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
References: <CADGuG04vCTWJNDj-fPaEO-dQmk_P_Z-E+AYbZBeYt+GJ8Dtqtg@mail.gmail.com>
 <DU0P190MB244572B5A5516B6BB3E053EEBC0EA@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
 <CADGuG04Bc8Dcv=GCZGsjkW7taS4VR0yTkp=BC9tC90HtkssVRw@mail.gmail.com>
 <20251108005631.75acf1c4@minigeek.lan>
 <CADGuG05CMpcZBC45fJHV4iqdsD8+x2c6yNzfBUnYKErCZrJYrA@mail.gmail.com>
Content-Language: en-US
From: Muhammed Subair <msubair@hotmail.com>
In-Reply-To: <CADGuG05CMpcZBC45fJHV4iqdsD8+x2c6yNzfBUnYKErCZrJYrA@mail.gmail.com>
X-ClientProxiedBy: DX1P273CA0002.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:21::7) To DU0P190MB2445.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:5a5::8)
X-Microsoft-Original-Message-ID:
 <0d475a5a-ce5b-4e81-8053-ad87f96fcdf1@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P190MB2445:EE_|DB9P190MB1130:EE_
X-MS-Office365-Filtering-Correlation-Id: 4930b617-c8dd-48f4-6374-08de1f55d333
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5072599009|19110799012|8060799015|8022599003|23021999003|12121999013|6092099016|15080799012|440099028|3412199025|4302099013|30101999003|18061999006|1602099012|20055399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qkl2N3RONi9ZRTI2SGdRVVQvNFhTWkU2dXI4YTZKa0JVcTR3Y1NZVGJMOEFD?=
 =?utf-8?B?UGFKUVA4K05WRnZDZUFIenF5OFJHaHpUZkN1UnJWV2NCbEV3Q1YyYmJ0d0VL?=
 =?utf-8?B?NWo0d2hTL3d5UWJmYkNESGRwN3dNRUJDSkV2NFQzQXR0N1VQWnlCcUdkclpE?=
 =?utf-8?B?RHl2bUxnNHVHVFV3cVh1d2trVUpCWWpuZkJ2OFZyUlhXRjdMckpCYkVtOWxx?=
 =?utf-8?B?MGNWdHo2R1dHMjNzVTVlUms3ZUxvVmM5NGp1Vy9kVXU0RWRjM1oxY0VJQitx?=
 =?utf-8?B?YkVVeGNXdzFTdkhFOXlZV0dlUU00UXY2THNIUnd1dDN3b1FRYklNU3pSWHFX?=
 =?utf-8?B?anpzdGpqRmdGdXNjNFVNWWQ2SFZ3WlRiVlcvOTBxWnl6SDBTYjRMWEpyRklr?=
 =?utf-8?B?aDdKVEtIVDc1QjAxSVVMUEZEUVhoZDdHZ0dPbk5CSXRoMEN0MmlFL1VsK3JI?=
 =?utf-8?B?WDlkdnZMKzBpTlhKZEE5dmRCUHRhNXVrVjN0NStXeVAxOG9SQWZUZmZUV2Jh?=
 =?utf-8?B?MEMzNEF0OXZTdy9SL3RwdkR4Q0c4UWtjNnZ5OFdVSS9ycDhGZjNJQ281dWQ0?=
 =?utf-8?B?clRGNEZkMFl1cmRqcmcrblhqQVpiMGl3V1cvVzBNejVOdU9mWGtvNFZaV0g0?=
 =?utf-8?B?NzZ2WjJtYUY5UFNUVW9JZjlrMytzV09xcUZYR2VvREthLzNxaGNOakNSRGl3?=
 =?utf-8?B?YnJzSGF6YmljcnU5NmprNDl1YjFDUGdsRHZYRUhIbFFQckVYRFErelFSaFNy?=
 =?utf-8?B?eUt4MDZkY2YzelFaWTdXUWo2MG9Kb1Z5Z1JCSG9NK0ozQ28zZzdITUJwVnhx?=
 =?utf-8?B?OU5OVUZlbTVKMjZ0SXl1L3ZKSVNuNFkrMFZZZG04bldsdHNwYURGRkY1Lzk3?=
 =?utf-8?B?c3RGQ0pyVFgxeTF2eG1KSENQMEpzNDVoRVVTU2N1a3kyK1ZkRXVST05rMjVa?=
 =?utf-8?B?OEVpdXFTSVNaOGJ0NUR2a2hkODNITDRNejdqb3FZZFYrWVdBWStZUUlXajQv?=
 =?utf-8?B?TWJEdm42NVZsb3VTajdId0xpaERTUkM0YjB0WmR0SDA2SE9QbDFia2pnOHNK?=
 =?utf-8?B?aWgyVERFZzN5MllQY0Z1NUo0YTZqdlRHRU1FMGUyQkF1cXJzZ01vVm9jSTdu?=
 =?utf-8?B?NG9hQ3dqa1BVdVFkWStlZnhQd2RablRPWWxtamJOelZNTHFNZ0VEbXh4K0RB?=
 =?utf-8?B?emw2LzcwR3VyNngrYXBneG52RXNMZ1FWZnQrQ3VsQW5YRXRmOFNpSGdMU0Rn?=
 =?utf-8?B?eXkra3hiTlRVTW9LQ1hpN3pvNldseWtQajJSR0NrZ01lb09NVEVkZFlvTVdi?=
 =?utf-8?B?RXBtMjduN0xnQ3NsODhEUXdIdnR0SllxUElCeWZkWEl5c3R4eERDUXVnS01U?=
 =?utf-8?B?NXo2L1BGeURpcDhPSkRia3d3djYvNGgrMzNKMzBiRkFUQ3lmRGhiQXhvUHNC?=
 =?utf-8?B?Rlh4NDhpYlNUWjBhL3U0RG1kSzVSVGs3RmR6OUcxK1VOTjFQbVVUSitoT2Ir?=
 =?utf-8?B?WDlzVmNnNVhtQ0NPMElZMm1ReFhJd0N2S2hzRC9CeWJrLzJXR3BEWVZnL1pP?=
 =?utf-8?B?QWtyaDYrRlA4SDVDMHZtSWVhSERHUDJQV2puUTlqdStjcDd1aEhwS0FlMnFy?=
 =?utf-8?B?WEdzVDkxcnhsV3NCQ2ZoRS9rNXZvSXBJNlFkWkZOVTNmTVk5djJFeDJkR0Fa?=
 =?utf-8?B?Wk0zZll2SlRoWnRBZVkyZCtRVUovcG5CeFFHcTEvWUlCY1hwWWpvcnc4ditm?=
 =?utf-8?B?WGVsdmQzTHorc3ZkN25YOENKRHEyZlVOOXB1dnc5Q045NUJaL0pwdm12TTlz?=
 =?utf-8?B?bEJoa3FvVWl0TmluU2JWeXpubmxUUGJsejlaWWMvOXpkcWFTTmViQjNFKzB5?=
 =?utf-8?B?M25veUg5NldpczJzUnE1ck9sN0VmRVI4cXYxZXJqKzZkTGc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmV6MmwxZmowc2wyYnA5d1YvTnJWck1hWHIwU0h3My9La2xnbHBnMmVLL0tT?=
 =?utf-8?B?cjU5bDJrTUhxRzZnMDNGSXJicVZ4ZmwxMDQwTEo4NlhFcklwek92bDRKNkZa?=
 =?utf-8?B?RGtjTVQrRlpKM2R1ZWErNC8xd0hqM05lWXRWQ21meWE3ZStzdVNNSlFXdW4x?=
 =?utf-8?B?UkUyeGhMOUJqZGxCYXB4Uk93RkgzbE16eVFYYkNWaFBMdXVuVnNZZVEwR0hT?=
 =?utf-8?B?cGkyditaUGNDZzcwY04zRzJUVlZLelBadzN4NExqS2lFLzBEMklVd1lueXdZ?=
 =?utf-8?B?SHlGT3k0VjJ6MFR3QlFyV1JMZHRpYzRpNGFEZlR1cklaRG5Zbm00QU5TbmV4?=
 =?utf-8?B?Z1hBQmJodEJRVW04WmdXZnh1TEFmblg0akVPandhM0RkNHh2azJNdGlOcytF?=
 =?utf-8?B?YjNudWRleTFwMklKUlR1eFAyZGw0YytmSDlyeFFpYjc2SzExWVM1Z1ZEeGVa?=
 =?utf-8?B?bDdieHZhTHFGbkNsNVBBdTg2UDBhTEI5VUVRbkxOR0lmS291LzNlQnFYNDd0?=
 =?utf-8?B?Ymx2ZkJEeU1jbFdqdFp0NzR6b2ZLcGVxQ0UvTHQzS01nNGo3ZDU0Z2ZpakdK?=
 =?utf-8?B?dWJQS2JoS2pyR0JXUis3MjFacXExUEVqalJHZlJjNm95Z1laVHMvVTdoSStB?=
 =?utf-8?B?NUVBTVFlWUxCcE0rR1dubXpvY0NPanBWQzFYZGZvc0hZeTNkY0dxSGNXOExN?=
 =?utf-8?B?dFpxdjJmY2pMcCt0QjN3MmRwemxEZVJsMEhVNlRoc1Q2bWpTVjUzQVNiMzZN?=
 =?utf-8?B?M2lpU0VkQ3dTRDQ0RU5MRTUrTU9aaU53YkNoTXpSVXNLc1E1WENMZ3ROTVRB?=
 =?utf-8?B?N3M5OVliMmdSUW1TYTlyeVhoUysyYmNjVXN6UnVRWTlnR0Y1UTdiTGZqbnlK?=
 =?utf-8?B?YktsRk1mL2syTU1rZStLd011SEorN2JXU3pHT3pieDdDWUZmd3JRNzYyVlFX?=
 =?utf-8?B?dCtoWGZCSXErLytxK08zejNwL1NVMWtaMGhMYTU2Z28wdkgrVjd5OGhEZ00y?=
 =?utf-8?B?dWtRUldDd2dWZS9iakhFWUtMTjJLSStqRGxnczJHRWpvZjBrbHF1YjAyS3pN?=
 =?utf-8?B?WEFmZXFlWEpBQ3FPMzFVNzNxemt6ZHNRRnVkM2RJL0p1V1VjS0poOEx0MTFW?=
 =?utf-8?B?WE80Q0FWZTVkSmZ6LzhwRmNlTDIyeTloakVKY3FCMHVpNUdxZnFJK21FcGNX?=
 =?utf-8?B?WVRVdlZnZjU1UGNDU3R1c1JPVUxOajg4Y0VsRWhxVTRDSFcxZmFVQXB1dVVr?=
 =?utf-8?B?dElUeVV1dlRpQVcyeGdESDBFcnd4dEJYdEp4MW1tNU1GbnhZNEdCUlBWTjFV?=
 =?utf-8?B?T3B0aTZjUXhvays0NTdzcnY5R1NqR3dVVkFrUFVuVFNDOGlLQWRCdHFUQmRX?=
 =?utf-8?B?WnBvTldBVVAzeTJWVlhrMExwbktnR1B3WW9wRVFDUGl3SDFWNHZtNFVrOVB1?=
 =?utf-8?B?ckl1anNsRWJBNlQ3bmhKQWJjVDh3ZEMrYnI5amRDWW05cVFmUVNVNkY4MHRF?=
 =?utf-8?B?QUhOMzF4NEpWd2lrVEVXZEIwbmNPbUIzSVFCYUsxYmMrWU5ycE9HY09ZYzJZ?=
 =?utf-8?B?Vk5teVJYQU1NalZCN3BvNWF5OCsvTGhHQWlRL092d3Rqb0EvYU1XYWZIQVQ4?=
 =?utf-8?Q?wXgrg+4CHUhhk69Hza6jiHA7VuJzb7RFgylZ4UIzZm4A=3D?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-e6540.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4930b617-c8dd-48f4-6374-08de1f55d333
X-MS-Exchange-CrossTenant-AuthSource: DU0P190MB2445.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2025 06:04:24.5279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1130

--------------fKsynrSlSpH5MqTX4h0zmh0t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Horvath

I was checking one of my sunxi sdk 5.10 and 5.14 which was for A527 chip,  and found below
the board is showing A31s chip, and on dtsi it has some cpu tuning.i have attached those dts files.
probably this will help, the SDK is around 15gb , if you need i can provide.


$ ls kernel/linux-5.10/arch/arm/boot/dts/ | grep a31
kirkwood-nsa310a.dts
kirkwood-nsa310.dts
sun6i-a31-app4-evb1.dts
sun6i-a31-colombus.dts
sun6i-a31.dtsi
sun6i-a31-hummingbird.dts
sun6i-a31-i7.dts
sun6i-a31-m9.dts
sun6i-a31-mele-a1000g-quad.dts
sun6i-a31s-colorfly-e708-q1.dts
sun6i-a31s-cs908.dts
sun6i-a31s.dtsi
sun6i-a31s-inet-q972.dts
sun6i-a31s-primo81.dts
sun6i-a31s-sina31s-core.dtsi
sun6i-a31s-sina31s.dts
sun6i-a31s-sinovoip-bpi-m2.dts
sun6i-a31s-yones-toptech-bs1078-v2.dts


$ ls kernel/linux-5.15/arch/arm/boot/dts/ | grep a31
kirkwood-nsa310a.dts
kirkwood-nsa310.dts
sun6i-a31-app4-evb1.dts
sun6i-a31-colombus.dts
sun6i-a31.dtsi
sun6i-a31-hummingbird.dts
sun6i-a31-i7.dts
sun6i-a31-m9.dts
sun6i-a31-mele-a1000g-quad.dts
sun6i-a31s-colorfly-e708-q1.dts
sun6i-a31s-cs908.dts
sun6i-a31s.dtsi
sun6i-a31s-inet-q972.dts
sun6i-a31s-primo81.dts
sun6i-a31s-sina31s-core.dtsi
sun6i-a31s-sina31s.dts
sun6i-a31s-sinovoip-bpi-m2.dts
sun6i-a31s-yones-toptech-bs1078-v2.dts



Subair

On 11/9/25 00:32, Horváth Csaba wrote:

> Hi,
>
> Thanks for your answer! :) I'll have a lot of questions, as i rarely
> did a successful kernel compilation in the past, but definitely want
> to learn.
>
> Now i managed to try the defconfig only option with latest kernel.
> Does not even boot i think, but at least  there is no output to LCD or
> HDMI at all. (I tried to do some autologin and output dmesg stuff to a
> file, but nothing happened.)
> I followed this guide, which seems to be partially outdated.
> https://linux-sunxi.org/Colorfly_e708q1 A lot of config changed in the
> kernel since it was written, and for example i think this is why i
> don't get display and PMIC. (So i don't know which displays to select
> to compile in, and so on.)
>
> I have managed to boot the device with an 5.5 stock kernel and Arch
> during the summer, get network, and can collect information from that
> instance.
> I tried to set frequency in U-Boot settings, but seems it did nothing.
> But, i did not tried with U-Boot compile options... so i'll give it a
> try, thanks.
> As a matter of interest, with the 5.5 kernel, there is no
> /sys/kernel/debug/regulator/regulator_summary .
> I have these  :
> [root@alarm alarm]# ls /sys/kernel/debug/regulator/
> 0-0068-ldo_io0  dldo4                      rtc_ldo     vcc-pg    vdd-cpus
> 0-0068-ldo_io1  eldo1                      supply_map  vcc-wifi  vdd-gpu
> aldo1           eldo2                      usb0-vbus   vcc3v0    vdd-sys-dll
> aldo2           eldo3                      vcc-3v0     vcc3v3
> avcc            reg-dummy-regulator-dummy  vcc-dram    vcc5v0
> dldo3           regulator_summary          vcc-lcd     vdd-cpu
>
> But as soon as i try to set something, it frrezes or does nothing
> (echoing freq to file, using cpufreq, etc.)
>
> dmesg contains only this regarding to AXP20x
> [root@alarm alarm]# dmesg |grep -i  axp
> [    2.120467] axp20x-i2c 0-0068: AXP20x variant AXP221 found
> [    2.150559] axp20x-usb-power-supply axp20x-usb-power-supply: DMA mask not set
> [    2.163684] axp20x-i2c 0-0068: AXP20X driver loaded
> [   10.652559] input: axp20x-pek as
> /devices/platform/soc/1f03400.i2c/i2c-0/0-0068/axp221-pek/input/input1
> [   10.720847] axp20x-adc axp22x-adc: DMA mask not set
>
> And a lot of dummy regulators. To be more accurate, only dummy regulators :D
> [root@alarm alarm]# dmesg |grep dummy
> [    0.002712] Console: colour dummy device 80x30
> [    2.035323] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
> supply vcc-pf not found, using dummy regulator
> [    2.111902] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
> supply vcc-pa not found, using dummy regulator
> [    2.119381] sun6i-a31-r-pinctrl 1f02c00.pinctrl: 1f02c00.pinctrl
> supply vcc-pl not found, using dummy regulator
> [    2.129470] dcdc1: supplied by regulator-dummy
> [    2.130898] dcdc2: supplied by regulator-dummy
> [    2.131746] dcdc3: supplied by regulator-dummy
> [    2.132585] dcdc4: supplied by regulator-dummy
> [    2.133448] dcdc5: supplied by regulator-dummy
> [    2.135439] aldo1: supplied by regulator-dummy
> [    2.136268] aldo2: supplied by regulator-dummy
> [    2.137123] aldo3: supplied by regulator-dummy
> [    2.138508] eldo1: supplied by regulator-dummy
> [    2.139374] eldo2: supplied by regulator-dummy
> [    2.140217] eldo3: supplied by regulator-dummy
> [    2.141077] dldo1: supplied by regulator-dummy
> [    2.141907] dldo2: supplied by regulator-dummy
> [    2.143906] dldo3: supplied by regulator-dummy
> [    2.144762] dldo4: supplied by regulator-dummy
> [    2.145619] rtc_ldo: supplied by regulator-dummy
> [    2.145905] ldo_io0: supplied by regulator-dummy
> [    2.146762] ldo_io1: supplied by regulator-dummy
> [    2.166336] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
> supply vcc-pf not found, using dummy regulator
> [    2.167370] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
> supply vcc-pa not found, using dummy regulator
> [    2.230116] usb_phy_generic usb_phy_generic.1.auto:
> usb_phy_generic.1.auto supply vcc not found, using dummy regulator
>
> Thanks in advance :)
>
> Cs.
>
> On Sat, Nov 8, 2025 at 1:57 AM Andre Przywara <andre.przywara@arm.com> wrote:
>> On Thu, 11 Sep 2025 21:29:36 +0200
>> Horváth Csaba <horvathcsabalaszlo@gmail.com> wrote:
>>
>>> Hi,
>>>
>>> Thanks!
>>> Strange, as i tried to compile mainline kernel half a year ago, but it
>>> had no support neither to display or the power chip. I don't even know
>>> what needs to be selected in the config in order to get them working.
>> I guess this is your problem: you are trying to compile a custom kernel
>> with apparently a made-up config, which isn't easy. As you figured, you
>> might miss many things, so it's best to use a well-known config as a
>> base, either sunxi_defconfig, multi_v7_defconfig, or probably the best:
>> the config from a distro kernel. The latter typically have all
>> drivers compiling as a module, so it would be able to load what it
>> needs automatically.
>>
>> But for a first experiment sunxi_defconfig should be alright,
>> especially for old SoCs, and compiles most things into the kernel, so
>> you don't need to mess with modules. You might just run into issues
>> with distros, though, as you might miss some (new) options there.
>>
>> Regarding cpufreq: that indeed requires a bunch of drivers to all work
>> (for instance a thermal sensor: CONFIG_MFD_SUN4I_GPADC), so try
>> sunxi_defconfig. To avoid running too hot quickly, you can lower the
>> initial frequency in U-Boot (CONFIG_SYS_CLK_FREQ), also you might want
>> to lower the initial voltage, for more power savings:
>> CONFIG_AXP_DCDC3_VOLT. Try 720 MHz at 1.1V, or 480 MHz at 1V, to be on
>> the safe side.
>>
>> If you get it booted with that, scan dmesg for PMIC messages, or check
>> /sys/kernel/debug/regulator/regulator_summary. Messages about dummy
>> supplies in dmesg are normal, when there are no port supplies in the
>> DT, and are not fatal.
>>
>> In general, to find a driver for a certain device:
>> $ git grep x-powers,axp221 drivers/
>> ...
>> drivers/mfd/axp20x-i2c.c:       { .compatible = "x-powers,axp221", .data = (void *)AXP221_ID },
>> ...
>> $ git grep axp20x-i2c.o drivers/mfd/Makefile
>> drivers/mfd/Makefile:obj-$(CONFIG_MFD_AXP20X_I2C)       += axp20x-i2c.o
>>                             ^^^^^^^^^^^^^^^^^^^^^
>> Specifically the AXP uses several driver files, make sure you get all
>> the options. Refer to dmesg and /sys/kernel/debug/devices_deferred to
>> find missing drivers.
>>
>> Hope that helps for a first step, please come back with more specific
>> information and questions, if needed.
>>
>> Cheers,
>> Andre
>>
>>> (Tried to compile numerous displays in it, but did not help.)
>>> Also, the AXP22x is referenced in the dts, and in the guide, there are
>>> some lines to add to the U-Boot config, but nothing to the kernel. And
>>> of course, does not work.
>>>
>>> So if anyone has any clue what to do (mostly what to compile in), i'll
>>> be thankful - i have done some kernel compiling before, but not an
>>> expert. Mostly not in devicetree objects. (It would be enough to have
>>> a stock kernel and OS to boot, as the device will be only a character
>>> display.)
>>>
>>> Thanks :)
>>>
>>> On Wed, Sep 10, 2025 at 6:33 PM Subair Mullappilly <msubair@hotmail.com> wrote:
>>>> Hi
>>>>
>>>> A31 has already upstream support,
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/allwinner?h=v6.17-rc5
>>>>
>>>> your tablet device tree is already there, use upstream kernel, and it
>>>> has support for display,
>>>>
>>>> i never used a31 chip, but used r40,a20 etc..
>>>>
>>>> Subair
>>>>
>>>> On 9/10/25 20:24, Horváth Csaba wrote:
>>>>> Hi,
>>>>>
>>>>> I'm building a wireless display on a Colorfly e708q1 tablet. This is
>>>>> an A31s device, supported by Linux-Sunxi.
>>>>> I have managed to install Arch and get Wifi with an 5.x (stock)
>>>>> kernel, because with newer kernels compiled according to the guide at
>>>>> https://linux-sunxi.org/Colorfly_e708q1 i had no display.  Debian also
>>>>> works, but the device overheats, or freezes because of other cause.
>>>>>
>>>>> With this kernel, the only problem is that the AXP20x power controller
>>>>> is not working, therefore the device is very hot. I could not find any
>>>>> information about how to get the AXP working. Basically i have no BAT
>>>>> device, or any trace of working power management in the /dev or /sys.
>>>>>
>>>>> Can someone please guide me how to get this working...?
>>>>>
>>>>> Thanks in advance :)
>>>>>
>>>>> Cs.
>>>>>

--------------fKsynrSlSpH5MqTX4h0zmh0t
Content-Type: text/plain; charset=UTF-8;
 name="sun6i-reference-design-tablet.dtsi"
Content-Disposition: attachment; filename="sun6i-reference-design-tablet.dtsi"
Content-Transfer-Encoding: base64

LyoKICogQ29weXJpZ2h0IDIwMTYgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4K
ICoKICogVGhpcyBmaWxlIGlzIGR1YWwtbGljZW5zZWQ6IHlvdSBjYW4gdXNlIGl0IGVpdGhlciB1
bmRlciB0aGUgdGVybXMKICogb2YgdGhlIEdQTCBvciB0aGUgWDExIGxpY2Vuc2UsIGF0IHlvdXIg
b3B0aW9uLiBOb3RlIHRoYXQgdGhpcyBkdWFsCiAqIGxpY2Vuc2luZyBvbmx5IGFwcGxpZXMgdG8g
dGhpcyBmaWxlLCBhbmQgbm90IHRoaXMgcHJvamVjdCBhcyBhCiAqIHdob2xlLgogKgogKiAgYSkg
VGhpcyBmaWxlIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9v
cgogKiAgICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXMKICogICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZQogKiAgICAgTGljZW5zZSwgb3IgKGF0IHlv
dXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KICoKICogICAgIFRoaXMgZmlsZSBpcyBkaXN0
cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAogKiAgICAgYnV0IFdJ
VEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YK
ICogICAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RS4gIFNlZSB0aGUKICogICAgIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRl
dGFpbHMuCiAqCiAqIE9yLCBhbHRlcm5hdGl2ZWx5LAogKgogKiAgYikgUGVybWlzc2lvbiBpcyBo
ZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24KICogICAgIG9idGFp
bmluZyBhIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9u
CiAqICAgICBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3
aXRob3V0CiAqICAgICByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0
aGUgcmlnaHRzIHRvIHVzZSwKICogICAgIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRp
c3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vcgogKiAgICAgc2VsbCBjb3BpZXMgb2YgdGhlIFNv
ZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKICogICAgIFNvZnR3YXJl
IGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nCiAqICAgICBj
b25kaXRpb25zOgogKgogKiAgICAgVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMg
cGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUKICogICAgIGluY2x1ZGVkIGluIGFsbCBjb3BpZXMg
b3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgogKgogKiAgICAgVEhFIFNP
RlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQs
CiAqICAgICBFWFBSRVNTIE9SIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8g
VEhFIFdBUlJBTlRJRVMKICogICAgIE9GIE1FUkNIQU5UQUJJTElUWSwgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UgQU5ECiAqICAgICBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5U
IFNIQUxMIFRIRSBBVVRIT1JTIE9SIENPUFlSSUdIVAogKiAgICAgSE9MREVSUyBCRSBMSUFCTEUg
Rk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksCiAqICAgICBXSEVUSEVS
IElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcKICog
ICAgIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRI
RSBVU0UgT1IKICogICAgIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KICovCgojaW5j
bHVkZSAic3VueGktY29tbW9uLXJlZ3VsYXRvcnMuZHRzaSIKCiNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9ncGlvL2dwaW8uaD4KI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lucHV0L2lucHV0Lmg+CgovIHsK
CWFsaWFzZXMgewoJCXNlcmlhbDAgPSAmdWFydDA7Cgl9OwoKCWNob3NlbiB7CgkJc3Rkb3V0LXBh
dGggPSAic2VyaWFsMDoxMTUyMDBuOCI7Cgl9Owp9OwoKJmNwdTAgewoJY3B1LXN1cHBseSA9IDwm
cmVnX2RjZGMzPjsKfTsKCiZlaGNpMCB7CgkvKiBXaWZpIGlzIGNvbm5lY3RlZCBoZXJlICovCglz
dGF0dXMgPSAib2theSI7Cn07CgombW1jMCB7CglwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJ
cGluY3RybC0wID0gPCZtbWMwX3BpbnM+OwoJdm1tYy1zdXBwbHkgPSA8JnJlZ19kY2RjMT47Cgli
dXMtd2lkdGggPSA8ND47CgljZC1ncGlvcyA9IDwmcGlvIDAgOCBHUElPX0FDVElWRV9MT1c+OyAv
KiBQQTggKi8KCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZwMndpIHsKCXN0YXR1cyA9ICJva2F5IjsK
CglheHAyMng6IHBtaWNANjggewoJCWNvbXBhdGlibGUgPSAieC1wb3dlcnMsYXhwMjIxIjsKCQly
ZWcgPSA8MHg2OD47CgkJaW50ZXJydXB0LXBhcmVudCA9IDwmcl9pbnRjPjsKCQlpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgMzIgSVJRX1RZUEVfTEVWRUxfTE9XPjsKCQlkcml2ZXZidXMtc3VwcGx5ID0g
PCZyZWdfdmNjNXYwPjsKCQl4LXBvd2Vycyxkcml2ZS12YnVzLWVuOwoJfTsKfTsKCiNpbmNsdWRl
ICJheHAyMnguZHRzaSIKCiZyZWdfYWxkbzMgewoJcmVndWxhdG9yLWFsd2F5cy1vbjsKCXJlZ3Vs
YXRvci1taW4tbWljcm92b2x0ID0gPDI3MDAwMDA+OwoJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQg
PSA8MzMwMDAwMD47CglyZWd1bGF0b3ItbmFtZSA9ICJhdmNjIjsKfTsKCiZyZWdfZGMxc3cgewoJ
cmVndWxhdG9yLW5hbWUgPSAidmNjLWxjZCI7Cn07CgomcmVnX2RjNWxkbyB7CglyZWd1bGF0b3It
YWx3YXlzLW9uOwoJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8NzAwMDAwPjsKCXJlZ3VsYXRv
ci1tYXgtbWljcm92b2x0ID0gPDEzMjAwMDA+OwoJcmVndWxhdG9yLW5hbWUgPSAidmRkLWNwdXMi
OyAvKiBUaGlzIGlzIGFuIGVkdWNhdGVkIGd1ZXNzICovCn07CgomcmVnX2RjZGMxIHsKCXJlZ3Vs
YXRvci1hbHdheXMtb247CglyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMDAwMDAwPjsKCXJl
Z3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMwMDAwMDA+OwoJcmVndWxhdG9yLW5hbWUgPSAidmNj
LTN2MCI7Cn07CgomcmVnX2RjZGMyIHsKCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDcwMDAw
MD47CglyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxMzIwMDAwPjsKCXJlZ3VsYXRvci1uYW1l
ID0gInZkZC1ncHUiOwp9OwoKJnJlZ19kY2RjMyB7CglyZWd1bGF0b3ItYWx3YXlzLW9uOwoJcmVn
dWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8NzAwMDAwPjsKCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0
ID0gPDEzMjAwMDA+OwoJcmVndWxhdG9yLW5hbWUgPSAidmRkLWNwdSI7Cn07CgomcmVnX2RjZGM0
IHsKCXJlZ3VsYXRvci1hbHdheXMtb247CglyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw3MDAw
MDA+OwoJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTMyMDAwMD47CglyZWd1bGF0b3ItbmFt
ZSA9ICJ2ZGQtc3lzLWRsbCI7Cn07CgomcmVnX2RjZGM1IHsKCXJlZ3VsYXRvci1hbHdheXMtb247
CglyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxNTAwMDAwPjsKCXJlZ3VsYXRvci1tYXgtbWlj
cm92b2x0ID0gPDE1MDAwMDA+OwoJcmVndWxhdG9yLW5hbWUgPSAidmNjLWRyYW0iOwp9OwoKJnJl
Z19kbGRvMSB7CglyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKCXJlZ3VsYXRv
ci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJcmVndWxhdG9yLW5hbWUgPSAidmNjLXdpZmki
Owp9OwoKJnJlZ19kcml2ZXZidXMgewoJcmVndWxhdG9yLW5hbWUgPSAidXNiMC12YnVzIjsKCXN0
YXR1cyA9ICJva2F5IjsKfTsKCiZzaW1wbGVmYl9sY2QgewoJdmNjLWxjZC1zdXBwbHkgPSA8JnJl
Z19kYzFzdz47Cn07CgomdXNiX290ZyB7Cglkcl9tb2RlID0gIm90ZyI7CglzdGF0dXMgPSAib2th
eSI7Cn07CgomdXNiX3Bvd2VyX3N1cHBseSB7CglzdGF0dXMgPSAib2theSI7Cn07CgomdXNicGh5
IHsKCXVzYjBfaWRfZGV0LWdwaW9zID0gPCZwaW8gMCAxNSAoR1BJT19BQ1RJVkVfSElHSCB8IEdQ
SU9fUFVMTF9VUCk+OyAvKiBQQTE1ICovCgl1c2IwX3ZidXNfcG93ZXItc3VwcGx5ID0gPCZ1c2Jf
cG93ZXJfc3VwcGx5PjsKCXVzYjBfdmJ1cy1zdXBwbHkgPSA8JnJlZ19kcml2ZXZidXM+OwoJdXNi
MV92YnVzLXN1cHBseSA9IDwmcmVnX2RsZG8xPjsKCXN0YXR1cyA9ICJva2F5IjsKfTsK

--------------fKsynrSlSpH5MqTX4h0zmh0t
Content-Type: audio/vnd.dts; name="sun6i-a31s-colorfly-e708-q1.dts"
Content-Disposition: attachment; filename="sun6i-a31s-colorfly-e708-q1.dts"
Content-Transfer-Encoding: base64

LyoKICogQ29weXJpZ2h0IDIwMTYgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4K
ICoKICogVGhpcyBmaWxlIGlzIGR1YWwtbGljZW5zZWQ6IHlvdSBjYW4gdXNlIGl0IGVpdGhlciB1
bmRlciB0aGUgdGVybXMKICogb2YgdGhlIEdQTCBvciB0aGUgWDExIGxpY2Vuc2UsIGF0IHlvdXIg
b3B0aW9uLiBOb3RlIHRoYXQgdGhpcyBkdWFsCiAqIGxpY2Vuc2luZyBvbmx5IGFwcGxpZXMgdG8g
dGhpcyBmaWxlLCBhbmQgbm90IHRoaXMgcHJvamVjdCBhcyBhCiAqIHdob2xlLgogKgogKiAgYSkg
VGhpcyBmaWxlIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9v
cgogKiAgICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXMKICogICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZQogKiAgICAgTGljZW5zZSwgb3IgKGF0IHlv
dXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KICoKICogICAgIFRoaXMgZmlsZSBpcyBkaXN0
cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAogKiAgICAgYnV0IFdJ
VEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YK
ICogICAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RS4gIFNlZSB0aGUKICogICAgIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRl
dGFpbHMuCiAqCiAqIE9yLCBhbHRlcm5hdGl2ZWx5LAogKgogKiAgYikgUGVybWlzc2lvbiBpcyBo
ZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24KICogICAgIG9idGFp
bmluZyBhIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9u
CiAqICAgICBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3
aXRob3V0CiAqICAgICByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0
aGUgcmlnaHRzIHRvIHVzZSwKICogICAgIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRp
c3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vcgogKiAgICAgc2VsbCBjb3BpZXMgb2YgdGhlIFNv
ZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKICogICAgIFNvZnR3YXJl
IGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nCiAqICAgICBj
b25kaXRpb25zOgogKgogKiAgICAgVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMg
cGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUKICogICAgIGluY2x1ZGVkIGluIGFsbCBjb3BpZXMg
b3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgogKgogKiAgICAgVEhFIFNP
RlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQs
CiAqICAgICBFWFBSRVNTIE9SIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8g
VEhFIFdBUlJBTlRJRVMKICogICAgIE9GIE1FUkNIQU5UQUJJTElUWSwgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UgQU5ECiAqICAgICBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5U
IFNIQUxMIFRIRSBBVVRIT1JTIE9SIENPUFlSSUdIVAogKiAgICAgSE9MREVSUyBCRSBMSUFCTEUg
Rk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksCiAqICAgICBXSEVUSEVS
IElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcKICog
ICAgIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRI
RSBVU0UgT1IKICogICAgIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KICovCgovZHRz
LXYxLzsKI2luY2x1ZGUgInN1bjZpLWEzMXMuZHRzaSIKI2luY2x1ZGUgInN1bjZpLXJlZmVyZW5j
ZS1kZXNpZ24tdGFibGV0LmR0c2kiCgovIHsKCW1vZGVsID0gIkNvbG9yZmx5IEU3MDggUTEgdGFi
bGV0IjsKCWNvbXBhdGlibGUgPSAiY29sb3JmbHksZTcwOC1xMSIsICJhbGx3aW5uZXIsc3VuNmkt
YTMxcyI7Cn07CgombHJhZGMgewoJdnJlZi1zdXBwbHkgPSA8JnJlZ19hbGRvMz47CglzdGF0dXMg
PSAib2theSI7CgoJYnV0dG9uLTEwMDAgewoJCWxhYmVsID0gIkhvbWUiOwoJCWxpbnV4LGNvZGUg
PSA8S0VZX0hPTUVQQUdFPjsKCQljaGFubmVsID0gPDA+OwoJCXZvbHRhZ2UgPSA8MTAwMDAwMD47
Cgl9Owp9OwoKJnJlZ19kbGRvMiB7CglyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAw
PjsKCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDE4MDAwMDA+OwoJcmVndWxhdG9yLW5hbWUg
PSAidmNjLXBnIjsKfTsKCiZzaW1wbGVmYl9sY2QgewoJdmNjLXBnLXN1cHBseSA9IDwmcmVnX2Rs
ZG8yPjsKfTsK

--------------fKsynrSlSpH5MqTX4h0zmh0t
Content-Type: text/plain; charset=UTF-8; name="sun6i-a31s.dtsi"
Content-Disposition: attachment; filename="sun6i-a31s.dtsi"
Content-Transfer-Encoding: base64

LyoKICogQ29weXJpZ2h0IDIwMTQgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4K
ICoKICogVGhpcyBmaWxlIGlzIGR1YWwtbGljZW5zZWQ6IHlvdSBjYW4gdXNlIGl0IGVpdGhlciB1
bmRlciB0aGUgdGVybXMKICogb2YgdGhlIEdQTCBvciB0aGUgWDExIGxpY2Vuc2UsIGF0IHlvdXIg
b3B0aW9uLiBOb3RlIHRoYXQgdGhpcyBkdWFsCiAqIGxpY2Vuc2luZyBvbmx5IGFwcGxpZXMgdG8g
dGhpcyBmaWxlLCBhbmQgbm90IHRoaXMgcHJvamVjdCBhcyBhCiAqIHdob2xlLgogKgogKiAgYSkg
VGhpcyBsaWJyYXJ5IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vcgogKiAgICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgYXMKICogICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZQogKiAgICAgTGljZW5zZSwgb3IgKGF0
IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KICoKICogICAgIFRoaXMgbGlicmFyeSBp
cyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAogKiAgICAg
YnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFu
dHkgb2YKICogICAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIg
UFVSUE9TRS4gIFNlZSB0aGUKICogICAgIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBt
b3JlIGRldGFpbHMuCiAqCiAqIE9yLCBhbHRlcm5hdGl2ZWx5LAogKgogKiAgYikgUGVybWlzc2lv
biBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24KICogICAg
IG9idGFpbmluZyBhIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVu
dGF0aW9uCiAqICAgICBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluIHRoZSBTb2Z0
d2FyZSB3aXRob3V0CiAqICAgICByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRh
dGlvbiB0aGUgcmlnaHRzIHRvIHVzZSwKICogICAgIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxp
c2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vcgogKiAgICAgc2VsbCBjb3BpZXMgb2Yg
dGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKICogICAgIFNv
ZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nCiAq
ICAgICBjb25kaXRpb25zOgogKgogKiAgICAgVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5k
IHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUKICogICAgIGluY2x1ZGVkIGluIGFsbCBj
b3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgogKgogKiAgICAg
VEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5Z
IEtJTkQsCiAqICAgICBFWFBSRVNTIE9SIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlU
RUQgVE8gVEhFIFdBUlJBTlRJRVMKICogICAgIE9GIE1FUkNIQU5UQUJJTElUWSwgRklUTkVTUyBG
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5ECiAqICAgICBOT05JTkZSSU5HRU1FTlQuIElOIE5P
IEVWRU5UIFNIQUxMIFRIRSBBVVRIT1JTIE9SIENPUFlSSUdIVAogKiAgICAgSE9MREVSUyBCRSBM
SUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksCiAqICAgICBX
SEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJ
TkcKICogICAgIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJF
IE9SIFRIRSBVU0UgT1IKICogICAgIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KICov
CgovKgogKiBUaGUgQTMxcyBpcyB0aGUgc2FtZSBkaWUgYXMgdGhlIEEzMSBpbiBhIGRpZmZlcmVu
dCBwYWNrYWdlLCB0aGlzIGlzCiAqIHJlZmxlY3RlZCBieSBpdCBoYXZpbmcgZGlmZmVyZW50IHBp
bmN0cmwgY29tcGF0aWJsZSBldmVyeXRoaW5nIGVsc2UgaXMKICogaWRlbnRpY2FsLgogKi8KCiNp
bmNsdWRlICJzdW42aS1hMzEuZHRzaSIKCiZkZSB7Cgljb21wYXRpYmxlID0gImFsbHdpbm5lcixz
dW42aS1hMzFzLWRpc3BsYXktZW5naW5lIjsKfTsKCiZwaW8gewoJY29tcGF0aWJsZSA9ICJhbGx3
aW5uZXIsc3VuNmktYTMxcy1waW5jdHJsIjsKfTsKCiZ0Y29uMCB7Cgljb21wYXRpYmxlID0gImFs
bHdpbm5lcixzdW42aS1hMzFzLXRjb24iOwp9Owo=

--------------fKsynrSlSpH5MqTX4h0zmh0t
Content-Type: text/plain; charset=UTF-8; name="sun6i-a31.dtsi"
Content-Disposition: attachment; filename="sun6i-a31.dtsi"
Content-Transfer-Encoding: base64

LyoKICogQ29weXJpZ2h0IDIwMTMgTWF4aW1lIFJpcGFyZAogKgogKiBNYXhpbWUgUmlwYXJkIDxt
YXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ryb25zLmNvbT4KICoKICogVGhpcyBmaWxlIGlzIGR1YWwt
bGljZW5zZWQ6IHlvdSBjYW4gdXNlIGl0IGVpdGhlciB1bmRlciB0aGUgdGVybXMKICogb2YgdGhl
IEdQTCBvciB0aGUgWDExIGxpY2Vuc2UsIGF0IHlvdXIgb3B0aW9uLiBOb3RlIHRoYXQgdGhpcyBk
dWFsCiAqIGxpY2Vuc2luZyBvbmx5IGFwcGxpZXMgdG8gdGhpcyBmaWxlLCBhbmQgbm90IHRoaXMg
cHJvamVjdCBhcyBhCiAqIHdob2xlLgogKgogKiAgYSkgVGhpcyBmaWxlIGlzIGZyZWUgc29mdHdh
cmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogKiAgICAgbW9kaWZ5IGl0IHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICogICAgIHB1
Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAy
IG9mIHRoZQogKiAgICAgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVy
c2lvbi4KICoKICogICAgIFRoaXMgZmlsZSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0
IGl0IHdpbGwgYmUgdXNlZnVsLAogKiAgICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRo
b3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKICogICAgIE1FUkNIQU5UQUJJTElUWSBv
ciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKICogICAgIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCiAqCiAqIE9yLCBhbHRlcm5h
dGl2ZWx5LAogKgogKiAgYikgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBj
aGFyZ2UsIHRvIGFueSBwZXJzb24KICogICAgIG9idGFpbmluZyBhIGNvcHkgb2YgdGhpcyBzb2Z0
d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uCiAqICAgICBmaWxlcyAodGhlICJTb2Z0
d2FyZSIpLCB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0CiAqICAgICByZXN0cmljdGlv
biwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzIHRvIHVzZSwKICogICAg
IGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFu
ZC9vcgogKiAgICAgc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBl
cnNvbnMgdG8gd2hvbSB0aGUKICogICAgIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBzbywg
c3ViamVjdCB0byB0aGUgZm9sbG93aW5nCiAqICAgICBjb25kaXRpb25zOgogKgogKiAgICAgVGhl
IGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwg
YmUKICogICAgIGluY2x1ZGVkIGluIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMg
b2YgdGhlIFNvZnR3YXJlLgogKgogKiAgICAgVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJ
UyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsCiAqICAgICBFWFBSRVNTIE9SIElNUExJ
RUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMKICogICAgIE9G
IE1FUkNIQU5UQUJJTElUWSwgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5ECiAq
ICAgICBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRSBBVVRIT1JTIE9SIENP
UFlSSUdIVAogKiAgICAgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBP
UiBPVEhFUiBMSUFCSUxJVFksCiAqICAgICBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFD
VCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcKICogICAgIEZST00sIE9VVCBPRiBPUiBJTiBD
T05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IKICogICAgIE9USEVSIERF
QUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KICovCgojaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgojaW5jbHVkZSA8ZHQtYmluZGluZ3MvdGhlcm1hbC90
aGVybWFsLmg+CgojaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc3VuNmktYTMxLWNjdS5oPgoj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvc3VuNmktYTMxLWNjdS5oPgoKLyB7CglpbnRlcnJ1
cHQtcGFyZW50ID0gPCZnaWM+OwoJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cgkjc2l6ZS1jZWxscyA9
IDwxPjsKCglhbGlhc2VzIHsKCQlldGhlcm5ldDAgPSAmZ21hYzsKCX07CgoJY2hvc2VuIHsKCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsKCQkjc2l6ZS1jZWxscyA9IDwxPjsKCQlyYW5nZXM7CgoJCXNp
bXBsZWZiX2hkbWk6IGZyYW1lYnVmZmVyLWxjZDAtaGRtaSB7CgkJCWNvbXBhdGlibGUgPSAiYWxs
d2lubmVyLHNpbXBsZS1mcmFtZWJ1ZmZlciIsCgkJCQkgICAgICJzaW1wbGUtZnJhbWVidWZmZXIi
OwoJCQlhbGx3aW5uZXIscGlwZWxpbmUgPSAiZGVfYmUwLWxjZDAtaGRtaSI7CgkJCWNsb2NrcyA9
IDwmY2N1IENMS19BSEIxX0JFMD4sIDwmY2N1IENMS19BSEIxX0xDRDA+LAoJCQkJIDwmY2N1IENM
S19BSEIxX0hETUk+LCA8JmNjdSBDTEtfRFJBTV9CRTA+LAoJCQkJIDwmY2N1IENMS19JRVBfRFJD
MD4sIDwmY2N1IENMS19CRTA+LAoJCQkJIDwmY2N1IENMS19MQ0QwX0NIMT4sIDwmY2N1IENMS19I
RE1JPjsKCQkJc3RhdHVzID0gImRpc2FibGVkIjsKCQl9OwoKCQlzaW1wbGVmYl9sY2Q6IGZyYW1l
YnVmZmVyLWxjZDAgewoJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzaW1wbGUtZnJhbWVidWZm
ZXIiLAoJCQkJICAgICAic2ltcGxlLWZyYW1lYnVmZmVyIjsKCQkJYWxsd2lubmVyLHBpcGVsaW5l
ID0gImRlX2JlMC1sY2QwIjsKCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0FIQjFfQkUwPiwgPCZjY3Ug
Q0xLX0FIQjFfTENEMD4sCgkJCQkgPCZjY3UgQ0xLX0RSQU1fQkUwPiwgPCZjY3UgQ0xLX0lFUF9E
UkMwPiwKCQkJCSA8JmNjdSBDTEtfQkUwPiwgPCZjY3UgQ0xLX0xDRDBfQ0gwPjsKCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKCQl9OwoJfTsKCgl0aW1lciB7CgkJY29tcGF0aWJsZSA9ICJhcm0sYXJt
djctdGltZXIiOwoJCWludGVycnVwdHMgPSA8R0lDX1BQSSAxMyAoR0lDX0NQVV9NQVNLX1NJTVBM
RSg0KSB8IElSUV9UWVBFX0xFVkVMX0xPVyk+LAoJCQkgICAgIDxHSUNfUFBJIDE0IChHSUNfQ1BV
X01BU0tfU0lNUExFKDQpIHwgSVJRX1RZUEVfTEVWRUxfTE9XKT4sCgkJCSAgICAgPEdJQ19QUEkg
MTEgKEdJQ19DUFVfTUFTS19TSU1QTEUoNCkgfCBJUlFfVFlQRV9MRVZFTF9MT1cpPiwKCQkJICAg
ICA8R0lDX1BQSSAxMCAoR0lDX0NQVV9NQVNLX1NJTVBMRSg0KSB8IElSUV9UWVBFX0xFVkVMX0xP
Vyk+OwoJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47CgkJYXJtLGNwdS1yZWdpc3RlcnMt
bm90LWZ3LWNvbmZpZ3VyZWQ7Cgl9OwoKCWNwdXMgewoJCWVuYWJsZS1tZXRob2QgPSAiYWxsd2lu
bmVyLHN1bjZpLWEzMSI7CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8
MD47CgoJCWNwdTA6IGNwdUAwIHsKCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE3IjsKCQkJ
ZGV2aWNlX3R5cGUgPSAiY3B1IjsKCQkJcmVnID0gPDA+OwoJCQljbG9ja3MgPSA8JmNjdSBDTEtf
Q1BVPjsKCQkJY2xvY2stbGF0ZW5jeSA9IDwyNDQxNDQ+OyAvKiA4IDMyayBwZXJpb2RzICovCgkJ
CW9wZXJhdGluZy1wb2ludHMgPSA8CgkJCQkvKiBrSHoJICB1ViAqLwoJCQkJMTAwODAwMAkxMjAw
MDAwCgkJCQk4NjQwMDAJMTIwMDAwMAoJCQkJNzIwMDAwCTExMDAwMDAKCQkJCTQ4MDAwMAkxMDAw
MDAwCgkJCQk+OwoJCQkjY29vbGluZy1jZWxscyA9IDwyPjsKCQl9OwoKCQljcHUxOiBjcHVAMSB7
CgkJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNyI7CgkJCWRldmljZV90eXBlID0gImNwdSI7
CgkJCXJlZyA9IDwxPjsKCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0NQVT47CgkJCWNsb2NrLWxhdGVu
Y3kgPSA8MjQ0MTQ0PjsgLyogOCAzMmsgcGVyaW9kcyAqLwoJCQlvcGVyYXRpbmctcG9pbnRzID0g
PAoJCQkJLyoga0h6CSAgdVYgKi8KCQkJCTEwMDgwMDAJMTIwMDAwMAoJCQkJODY0MDAwCTEyMDAw
MDAKCQkJCTcyMDAwMAkxMTAwMDAwCgkJCQk0ODAwMDAJMTAwMDAwMAoJCQkJPjsKCQkJI2Nvb2xp
bmctY2VsbHMgPSA8Mj47CgkJfTsKCgkJY3B1MjogY3B1QDIgewoJCQljb21wYXRpYmxlID0gImFy
bSxjb3J0ZXgtYTciOwoJCQlkZXZpY2VfdHlwZSA9ICJjcHUiOwoJCQlyZWcgPSA8Mj47CgkJCWNs
b2NrcyA9IDwmY2N1IENMS19DUFU+OwoJCQljbG9jay1sYXRlbmN5ID0gPDI0NDE0ND47IC8qIDgg
MzJrIHBlcmlvZHMgKi8KCQkJb3BlcmF0aW5nLXBvaW50cyA9IDwKCQkJCS8qIGtIegkgIHVWICov
CgkJCQkxMDA4MDAwCTEyMDAwMDAKCQkJCTg2NDAwMAkxMjAwMDAwCgkJCQk3MjAwMDAJMTEwMDAw
MAoJCQkJNDgwMDAwCTEwMDAwMDAKCQkJCT47CgkJCSNjb29saW5nLWNlbGxzID0gPDI+OwoJCX07
CgoJCWNwdTM6IGNwdUAzIHsKCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE3IjsKCQkJZGV2
aWNlX3R5cGUgPSAiY3B1IjsKCQkJcmVnID0gPDM+OwoJCQljbG9ja3MgPSA8JmNjdSBDTEtfQ1BV
PjsKCQkJY2xvY2stbGF0ZW5jeSA9IDwyNDQxNDQ+OyAvKiA4IDMyayBwZXJpb2RzICovCgkJCW9w
ZXJhdGluZy1wb2ludHMgPSA8CgkJCQkvKiBrSHoJICB1ViAqLwoJCQkJMTAwODAwMAkxMjAwMDAw
CgkJCQk4NjQwMDAJMTIwMDAwMAoJCQkJNzIwMDAwCTExMDAwMDAKCQkJCTQ4MDAwMAkxMDAwMDAw
CgkJCQk+OwoJCQkjY29vbGluZy1jZWxscyA9IDwyPjsKCQl9OwoJfTsKCgl0aGVybWFsLXpvbmVz
IHsKCQljcHUtdGhlcm1hbCB7CgkJCS8qIG1pbGxpc2Vjb25kcyAqLwoJCQlwb2xsaW5nLWRlbGF5
LXBhc3NpdmUgPSA8MjUwPjsKCQkJcG9sbGluZy1kZWxheSA9IDwxMDAwPjsKCQkJdGhlcm1hbC1z
ZW5zb3JzID0gPCZydHA+OwoKCQkJY29vbGluZy1tYXBzIHsKCQkJCW1hcDAgewoJCQkJCXRyaXAg
PSA8JmNwdV9hbGVydDA+OwoJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHUwIFRIRVJNQUxfTk9f
TElNSVQgVEhFUk1BTF9OT19MSU1JVD4sCgkJCQkJCQkgPCZjcHUxIFRIRVJNQUxfTk9fTElNSVQg
VEhFUk1BTF9OT19MSU1JVD4sCgkJCQkJCQkgPCZjcHUyIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1B
TF9OT19MSU1JVD4sCgkJCQkJCQkgPCZjcHUzIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19M
SU1JVD47CgkJCQl9OwoJCQl9OwoKCQkJdHJpcHMgewoJCQkJY3B1X2FsZXJ0MDogY3B1X2FsZXJ0
MCB7CgkJCQkJLyogbWlsbGlDZWxzaXVzICovCgkJCQkJdGVtcGVyYXR1cmUgPSA8NzAwMDA+OwoJ
CQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47CgkJCQkJdHlwZSA9ICJwYXNzaXZlIjsKCQkJCX07CgoJ
CQkJY3B1X2NyaXQ6IGNwdV9jcml0IHsKCQkJCQkvKiBtaWxsaUNlbHNpdXMgKi8KCQkJCQl0ZW1w
ZXJhdHVyZSA9IDwxMDAwMDA+OwoJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47CgkJCQkJdHlwZSA9
ICJjcml0aWNhbCI7CgkJCQl9OwoJCQl9OwoJCX07Cgl9OwoKCXBtdSB7CgkJY29tcGF0aWJsZSA9
ICJhcm0sY29ydGV4LWE3LXBtdSI7CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDEyMCBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwKCQkJICAgICA8R0lDX1NQSSAxMjEgSVJRX1RZUEVfTEVWRUxfSElHSD4s
CgkJCSAgICAgPEdJQ19TUEkgMTIyIElSUV9UWVBFX0xFVkVMX0hJR0g+LAoJCQkgICAgIDxHSUNf
U1BJIDEyMyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKCX07CgoJY2xvY2tzIHsKCQkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKCQkjc2l6ZS1jZWxscyA9IDwxPjsKCQlyYW5nZXM7CgoJCW9zYzI0TTogY2xr
LTI0TSB7CgkJCSNjbG9jay1jZWxscyA9IDwwPjsKCQkJY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9j
ayI7CgkJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47CgkJCWNsb2NrLWFjY3VyYWN5ID0g
PDUwMDAwPjsKCQkJY2xvY2stb3V0cHV0LW5hbWVzID0gIm9zYzI0TSI7CgkJfTsKCgkJb3NjMzJr
OiBjbGstMzJrIHsKCQkJI2Nsb2NrLWNlbGxzID0gPDA+OwoJCQljb21wYXRpYmxlID0gImZpeGVk
LWNsb2NrIjsKCQkJY2xvY2stZnJlcXVlbmN5ID0gPDMyNzY4PjsKCQkJY2xvY2stYWNjdXJhY3kg
PSA8NTAwMDA+OwoJCQljbG9jay1vdXRwdXQtbmFtZXMgPSAiZXh0X29zYzMyayI7CgkJfTsKCgkJ
LyoKCQkgKiBUaGUgZm9sbG93aW5nIHR3byBhcmUgZHVtbXkgY2xvY2tzLCBwbGFjZWhvbGRlcnMK
CQkgKiB1c2VkIGluIHRoZSBnbWFjX3R4IGNsb2NrLiBUaGUgZ21hYyBkcml2ZXIgd2lsbAoJCSAq
IGNob29zZSBvbmUgcGFyZW50IGRlcGVuZGluZyBvbiB0aGUgUEhZIGludGVyZmFjZQoJCSAqIG1v
ZGUsIHVzaW5nIGNsa19zZXRfcmF0ZSBhdXRvLXJlcGFyZW50aW5nLgoJCSAqCgkJICogVGhlIGFj
dHVhbCBUWCBjbG9jayByYXRlIGlzIG5vdCBjb250cm9sbGVkIGJ5IHRoZQoJCSAqIGdtYWNfdHgg
Y2xvY2suCgkJICovCgkJbWlpX3BoeV90eF9jbGs6IGNsay1taWktcGh5LXR4IHsKCQkJI2Nsb2Nr
LWNlbGxzID0gPDA+OwoJCQljb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKCQkJY2xvY2stZnJl
cXVlbmN5ID0gPDI1MDAwMDAwPjsKCQkJY2xvY2stb3V0cHV0LW5hbWVzID0gIm1paV9waHlfdHgi
OwoJCX07CgoJCWdtYWNfaW50X3R4X2NsazogY2xrLWdtYWMtaW50LXR4IHsKCQkJI2Nsb2NrLWNl
bGxzID0gPDA+OwoJCQljb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKCQkJY2xvY2stZnJlcXVl
bmN5ID0gPDEyNTAwMDAwMD47CgkJCWNsb2NrLW91dHB1dC1uYW1lcyA9ICJnbWFjX2ludF90eCI7
CgkJfTsKCgkJZ21hY190eF9jbGs6IGNsa0AxYzIwMGQwIHsKCQkJI2Nsb2NrLWNlbGxzID0gPDA+
OwoJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW43aS1hMjAtZ21hYy1jbGsiOwoJCQlyZWcg
PSA8MHgwMWMyMDBkMCAweDQ+OwoJCQljbG9ja3MgPSA8Jm1paV9waHlfdHhfY2xrPiwgPCZnbWFj
X2ludF90eF9jbGs+OwoJCQljbG9jay1vdXRwdXQtbmFtZXMgPSAiZ21hY190eCI7CgkJfTsKCX07
CgoJZGU6IGRpc3BsYXktZW5naW5lIHsKCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1h
MzEtZGlzcGxheS1lbmdpbmUiOwoJCWFsbHdpbm5lcixwaXBlbGluZXMgPSA8JmZlMD4sIDwmZmUx
PjsKCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJfTsKCglzb2MgewoJCWNvbXBhdGlibGUgPSAic2lt
cGxlLWJ1cyI7CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MT47CgkJ
cmFuZ2VzOwoKCQlkbWE6IGRtYS1jb250cm9sbGVyQDFjMDIwMDAgewoJCQljb21wYXRpYmxlID0g
ImFsbHdpbm5lcixzdW42aS1hMzEtZG1hIjsKCQkJcmVnID0gPDB4MDFjMDIwMDAgMHgxMDAwPjsK
CQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDUwIElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9j
a3MgPSA8JmNjdSBDTEtfQUhCMV9ETUE+OwoJCQlyZXNldHMgPSA8JmNjdSBSU1RfQUhCMV9ETUE+
OwoJCQkjZG1hLWNlbGxzID0gPDE+OwoJCX07CgoJCXRjb24wOiBsY2QtY29udHJvbGxlckAxYzBj
MDAwIHsKCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNmktYTMxLXRjb24iOwoJCQlyZWcg
PSA8MHgwMWMwYzAwMCAweDEwMDA+OwoJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgODYgSVJRX1RZ
UEVfTEVWRUxfSElHSD47CgkJCWRtYXMgPSA8JmRtYSAxMT47CgkJCXJlc2V0cyA9IDwmY2N1IFJT
VF9BSEIxX0xDRDA+LAoJCQkJIDwmY2N1IFJTVF9BSEIxX0xWRFM+OwoJCQlyZXNldC1uYW1lcyA9
ICJsY2QiLAoJCQkJICAgICAgImx2ZHMiOwoJCQljbG9ja3MgPSA8JmNjdSBDTEtfQUhCMV9MQ0Qw
PiwKCQkJCSA8JmNjdSBDTEtfTENEMF9DSDA+LAoJCQkJIDwmY2N1IENMS19MQ0QwX0NIMT4sCgkJ
CQkgPCZjY3UgMTU+OwoJCQljbG9jay1uYW1lcyA9ICJhaGIiLAoJCQkJICAgICAgInRjb24tY2gw
IiwKCQkJCSAgICAgICJ0Y29uLWNoMSIsCgkJCQkgICAgICAibHZkcy1hbHQiOwoJCQljbG9jay1v
dXRwdXQtbmFtZXMgPSAidGNvbjAtcGl4ZWwtY2xvY2siOwoJCQkjY2xvY2stY2VsbHMgPSA8MD47
CgoJCQlwb3J0cyB7CgkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJCSNzaXplLWNlbGxzID0g
PDA+OwoKCQkJCXRjb24wX2luOiBwb3J0QDAgewoJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJ
CQkJCSNzaXplLWNlbGxzID0gPDA+OwoJCQkJCXJlZyA9IDwwPjsKCgkJCQkJdGNvbjBfaW5fZHJj
MDogZW5kcG9pbnRAMCB7CgkJCQkJCXJlZyA9IDwwPjsKCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZkcmMwX291dF90Y29uMD47CgkJCQkJfTsKCgkJCQkJdGNvbjBfaW5fZHJjMTogZW5kcG9pbnRA
MSB7CgkJCQkJCXJlZyA9IDwxPjsKCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkcmMxX291dF90
Y29uMD47CgkJCQkJfTsKCQkJCX07CgoJCQkJdGNvbjBfb3V0OiBwb3J0QDEgewoJCQkJCSNhZGRy
ZXNzLWNlbGxzID0gPDE+OwoJCQkJCSNzaXplLWNlbGxzID0gPDA+OwoJCQkJCXJlZyA9IDwxPjsK
CgkJCQkJdGNvbjBfb3V0X2hkbWk6IGVuZHBvaW50QDEgewoJCQkJCQlyZWcgPSA8MT47CgkJCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaV9pbl90Y29uMD47CgkJCQkJCWFsbHdpbm5lcix0Y29u
LWNoYW5uZWwgPSA8MT47CgkJCQkJfTsKCQkJCX07CgkJCX07CgkJfTsKCgkJdGNvbjE6IGxjZC1j
b250cm9sbGVyQDFjMGQwMDAgewoJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1hMzEt
dGNvbiI7CgkJCXJlZyA9IDwweDAxYzBkMDAwIDB4MTAwMD47CgkJCWludGVycnVwdHMgPSA8R0lD
X1NQSSA4NyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKCQkJZG1hcyA9IDwmZG1hIDEyPjsKCQkJcmVz
ZXRzID0gPCZjY3UgUlNUX0FIQjFfTENEMT4sCgkJCQkgPCZjY3UgUlNUX0FIQjFfTFZEUz47CgkJ
CXJlc2V0LW5hbWVzID0gImxjZCIsICJsdmRzIjsKCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0FIQjFf
TENEMT4sCgkJCQkgPCZjY3UgQ0xLX0xDRDFfQ0gwPiwKCQkJCSA8JmNjdSBDTEtfTENEMV9DSDE+
LAoJCQkJIDwmY2N1IDE1PjsKCQkJY2xvY2stbmFtZXMgPSAiYWhiIiwKCQkJCSAgICAgICJ0Y29u
LWNoMCIsCgkJCQkgICAgICAidGNvbi1jaDEiLAoJCQkJICAgICAgImx2ZHMtYWx0IjsKCQkJY2xv
Y2stb3V0cHV0LW5hbWVzID0gInRjb24xLXBpeGVsLWNsb2NrIjsKCQkJI2Nsb2NrLWNlbGxzID0g
PDA+OwoKCQkJcG9ydHMgewoJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJCQkjc2l6ZS1jZWxs
cyA9IDwwPjsKCgkJCQl0Y29uMV9pbjogcG9ydEAwIHsKCQkJCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKCQkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCQkJCQlyZWcgPSA8MD47CgoJCQkJCXRjb24xX2lu
X2RyYzA6IGVuZHBvaW50QDAgewoJCQkJCQlyZWcgPSA8MD47CgkJCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmZHJjMF9vdXRfdGNvbjE+OwoJCQkJCX07CgoJCQkJCXRjb24xX2luX2RyYzE6IGVuZHBv
aW50QDEgewoJCQkJCQlyZWcgPSA8MT47CgkJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHJjMV9v
dXRfdGNvbjE+OwoJCQkJCX07CgkJCQl9OwoKCQkJCXRjb24xX291dDogcG9ydEAxIHsKCQkJCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCQkJCQlyZWcgPSA8
MT47CgoJCQkJCXRjb24xX291dF9oZG1pOiBlbmRwb2ludEAxIHsKCQkJCQkJcmVnID0gPDE+OwoJ
CQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfaW5fdGNvbjE+OwoJCQkJCQlhbGx3aW5uZXIs
dGNvbi1jaGFubmVsID0gPDE+OwoJCQkJCX07CgkJCQl9OwoJCQl9OwoJCX07CgoJCW1tYzA6IG1t
Y0AxYzBmMDAwIHsKCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuN2ktYTIwLW1tYyI7CgkJ
CXJlZyA9IDwweDAxYzBmMDAwIDB4MTAwMD47CgkJCWNsb2NrcyA9IDwmY2N1IENMS19BSEIxX01N
QzA+LAoJCQkJIDwmY2N1IENMS19NTUMwPiwKCQkJCSA8JmNjdSBDTEtfTU1DMF9PVVRQVVQ+LAoJ
CQkJIDwmY2N1IENMS19NTUMwX1NBTVBMRT47CgkJCWNsb2NrLW5hbWVzID0gImFoYiIsCgkJCQkg
ICAgICAibW1jIiwKCQkJCSAgICAgICJvdXRwdXQiLAoJCQkJICAgICAgInNhbXBsZSI7CgkJCXJl
c2V0cyA9IDwmY2N1IFJTVF9BSEIxX01NQzA+OwoJCQlyZXNldC1uYW1lcyA9ICJhaGIiOwoJCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgNjAgSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJCXBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7CgkJCXBpbmN0cmwtMCA9IDwmbW1jMF9waW5zPjsKCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJCSNzaXplLWNlbGxzID0g
PDA+OwoJCX07CgoJCW1tYzE6IG1tY0AxYzEwMDAwIHsKCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5u
ZXIsc3VuN2ktYTIwLW1tYyI7CgkJCXJlZyA9IDwweDAxYzEwMDAwIDB4MTAwMD47CgkJCWNsb2Nr
cyA9IDwmY2N1IENMS19BSEIxX01NQzE+LAoJCQkJIDwmY2N1IENMS19NTUMxPiwKCQkJCSA8JmNj
dSBDTEtfTU1DMV9PVVRQVVQ+LAoJCQkJIDwmY2N1IENMS19NTUMxX1NBTVBMRT47CgkJCWNsb2Nr
LW5hbWVzID0gImFoYiIsCgkJCQkgICAgICAibW1jIiwKCQkJCSAgICAgICJvdXRwdXQiLAoJCQkJ
ICAgICAgInNhbXBsZSI7CgkJCXJlc2V0cyA9IDwmY2N1IFJTVF9BSEIxX01NQzE+OwoJCQlyZXNl
dC1uYW1lcyA9ICJhaGIiOwoJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNjEgSVJRX1RZUEVfTEVW
RUxfSElHSD47CgkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CgkJCXBpbmN0cmwtMCA9IDwm
bW1jMV9waW5zPjsKCQkJc3RhdHVzID0gImRpc2FibGVkIjsKCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47CgkJCSNzaXplLWNlbGxzID0gPDA+OwoJCX07CgoJCW1tYzI6IG1tY0AxYzExMDAwIHsKCQkJ
Y29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuN2ktYTIwLW1tYyI7CgkJCXJlZyA9IDwweDAxYzEx
MDAwIDB4MTAwMD47CgkJCWNsb2NrcyA9IDwmY2N1IENMS19BSEIxX01NQzI+LAoJCQkJIDwmY2N1
IENMS19NTUMyPiwKCQkJCSA8JmNjdSBDTEtfTU1DMl9PVVRQVVQ+LAoJCQkJIDwmY2N1IENMS19N
TUMyX1NBTVBMRT47CgkJCWNsb2NrLW5hbWVzID0gImFoYiIsCgkJCQkgICAgICAibW1jIiwKCQkJ
CSAgICAgICJvdXRwdXQiLAoJCQkJICAgICAgInNhbXBsZSI7CgkJCXJlc2V0cyA9IDwmY2N1IFJT
VF9BSEIxX01NQzI+OwoJCQlyZXNldC1uYW1lcyA9ICJhaGIiOwoJCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgNjIgSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCQl9OwoKCQltbWMz
OiBtbWNAMWMxMjAwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjdpLWEyMC1tbWMi
OwoJCQlyZWcgPSA8MHgwMWMxMjAwMCAweDEwMDA+OwoJCQljbG9ja3MgPSA8JmNjdSBDTEtfQUhC
MV9NTUMzPiwKCQkJCSA8JmNjdSBDTEtfTU1DMz4sCgkJCQkgPCZjY3UgQ0xLX01NQzNfT1VUUFVU
PiwKCQkJCSA8JmNjdSBDTEtfTU1DM19TQU1QTEU+OwoJCQljbG9jay1uYW1lcyA9ICJhaGIiLAoJ
CQkJICAgICAgIm1tYyIsCgkJCQkgICAgICAib3V0cHV0IiwKCQkJCSAgICAgICJzYW1wbGUiOwoJ
CQlyZXNldHMgPSA8JmNjdSBSU1RfQUhCMV9NTUMzPjsKCQkJcmVzZXQtbmFtZXMgPSAiYWhiIjsK
CQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDYzIElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOwoJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJI3NpemUtY2VsbHMg
PSA8MD47CgkJfTsKCgkJaGRtaTogaGRtaUAxYzE2MDAwIHsKCQkJY29tcGF0aWJsZSA9ICJhbGx3
aW5uZXIsc3VuNmktYTMxLWhkbWkiOwoJCQlyZWcgPSA8MHgwMWMxNjAwMCAweDEwMDA+OwoJCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgODggSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJCWNsb2NrcyA9
IDwmY2N1IENMS19BSEIxX0hETUk+LCA8JmNjdSBDTEtfSERNST4sCgkJCQkgPCZjY3UgQ0xLX0hE
TUlfRERDPiwKCQkJCSA8JmNjdSBDTEtfUExMX1ZJREVPMF8yWD4sCgkJCQkgPCZjY3UgQ0xLX1BM
TF9WSURFTzFfMlg+OwoJCQljbG9jay1uYW1lcyA9ICJhaGIiLCAibW9kIiwgImRkYyIsICJwbGwt
MCIsICJwbGwtMSI7CgkJCXJlc2V0cyA9IDwmY2N1IFJTVF9BSEIxX0hETUk+OwoJCQlkbWEtbmFt
ZXMgPSAiZGRjLXR4IiwgImRkYy1yeCIsICJhdWRpby10eCI7CgkJCWRtYXMgPSA8JmRtYSAxMz4s
IDwmZG1hIDEzPiwgPCZkbWEgMTQ+OwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoKCQkJcG9ydHMg
ewoJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCgkJCQlo
ZG1pX2luOiBwb3J0QDAgewoJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkJCSNzaXplLWNl
bGxzID0gPDA+OwoJCQkJCXJlZyA9IDwwPjsKCgkJCQkJaGRtaV9pbl90Y29uMDogZW5kcG9pbnRA
MCB7CgkJCQkJCXJlZyA9IDwwPjsKCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZ0Y29uMF9vdXRf
aGRtaT47CgkJCQkJfTsKCgkJCQkJaGRtaV9pbl90Y29uMTogZW5kcG9pbnRAMSB7CgkJCQkJCXJl
ZyA9IDwxPjsKCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZ0Y29uMV9vdXRfaGRtaT47CgkJCQkJ
fTsKCQkJCX07CgoJCQkJaGRtaV9vdXQ6IHBvcnRAMSB7CgkJCQkJcmVnID0gPDE+OwoJCQkJfTsK
CQkJfTsKCQl9OwoKCQl1c2Jfb3RnOiB1c2JAMWMxOTAwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxs
d2lubmVyLHN1bjZpLWEzMS1tdXNiIjsKCQkJcmVnID0gPDB4MDFjMTkwMDAgMHgwNDAwPjsKCQkJ
Y2xvY2tzID0gPCZjY3UgQ0xLX0FIQjFfT1RHPjsKCQkJcmVzZXRzID0gPCZjY3UgUlNUX0FIQjFf
T1RHPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDcxIElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJ
CQlpbnRlcnJ1cHQtbmFtZXMgPSAibWMiOwoJCQlwaHlzID0gPCZ1c2JwaHkgMD47CgkJCXBoeS1u
YW1lcyA9ICJ1c2IiOwoJCQlleHRjb24gPSA8JnVzYnBoeSAwPjsKCQkJZHJfbW9kZSA9ICJvdGci
OwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJCX07CgoJCXVzYnBoeTogcGh5QDFjMTk0MDAgewoJ
CQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1hMzEtdXNiLXBoeSI7CgkJCXJlZyA9IDww
eDAxYzE5NDAwIDB4MTA+LAoJCQkgICAgICA8MHgwMWMxYTgwMCAweDQ+LAoJCQkgICAgICA8MHgw
MWMxYjgwMCAweDQ+OwoJCQlyZWctbmFtZXMgPSAicGh5X2N0cmwiLAoJCQkJICAgICJwbXUxIiwK
CQkJCSAgICAicG11MiI7CgkJCWNsb2NrcyA9IDwmY2N1IENMS19VU0JfUEhZMD4sCgkJCQkgPCZj
Y3UgQ0xLX1VTQl9QSFkxPiwKCQkJCSA8JmNjdSBDTEtfVVNCX1BIWTI+OwoJCQljbG9jay1uYW1l
cyA9ICJ1c2IwX3BoeSIsCgkJCQkgICAgICAidXNiMV9waHkiLAoJCQkJICAgICAgInVzYjJfcGh5
IjsKCQkJcmVzZXRzID0gPCZjY3UgUlNUX1VTQl9QSFkwPiwKCQkJCSA8JmNjdSBSU1RfVVNCX1BI
WTE+LAoJCQkJIDwmY2N1IFJTVF9VU0JfUEhZMj47CgkJCXJlc2V0LW5hbWVzID0gInVzYjBfcmVz
ZXQiLAoJCQkJICAgICAgInVzYjFfcmVzZXQiLAoJCQkJICAgICAgInVzYjJfcmVzZXQiOwoJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOwoJCQkjcGh5LWNlbGxzID0gPDE+OwoJCX07CgoJCWVoY2kwOiB1
c2JAMWMxYTAwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1laGNpIiwg
ImdlbmVyaWMtZWhjaSI7CgkJCXJlZyA9IDwweDAxYzFhMDAwIDB4MTAwPjsKCQkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDcyIElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3MgPSA8JmNjdSBD
TEtfQUhCMV9FSENJMD47CgkJCXJlc2V0cyA9IDwmY2N1IFJTVF9BSEIxX0VIQ0kwPjsKCQkJcGh5
cyA9IDwmdXNicGh5IDE+OwoJCQlwaHktbmFtZXMgPSAidXNiIjsKCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKCQl9OwoKCQlvaGNpMDogdXNiQDFjMWE0MDAgewoJCQljb21wYXRpYmxlID0gImFsbHdp
bm5lcixzdW42aS1hMzEtb2hjaSIsICJnZW5lcmljLW9oY2kiOwoJCQlyZWcgPSA8MHgwMWMxYTQw
MCAweDEwMD47CgkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA3MyBJUlFfVFlQRV9MRVZFTF9ISUdI
PjsKCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0FIQjFfT0hDSTA+LCA8JmNjdSBDTEtfVVNCX09IQ0kw
PjsKCQkJcmVzZXRzID0gPCZjY3UgUlNUX0FIQjFfT0hDSTA+OwoJCQlwaHlzID0gPCZ1c2JwaHkg
MT47CgkJCXBoeS1uYW1lcyA9ICJ1c2IiOwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJCX07CgoJ
CWVoY2kxOiB1c2JAMWMxYjAwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEz
MS1laGNpIiwgImdlbmVyaWMtZWhjaSI7CgkJCXJlZyA9IDwweDAxYzFiMDAwIDB4MTAwPjsKCQkJ
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDc0IElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3Mg
PSA8JmNjdSBDTEtfQUhCMV9FSENJMT47CgkJCXJlc2V0cyA9IDwmY2N1IFJTVF9BSEIxX0VIQ0kx
PjsKCQkJcGh5cyA9IDwmdXNicGh5IDI+OwoJCQlwaHktbmFtZXMgPSAidXNiIjsKCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKCQl9OwoKCQlvaGNpMTogdXNiQDFjMWI0MDAgewoJCQljb21wYXRpYmxl
ID0gImFsbHdpbm5lcixzdW42aS1hMzEtb2hjaSIsICJnZW5lcmljLW9oY2kiOwoJCQlyZWcgPSA8
MHgwMWMxYjQwMCAweDEwMD47CgkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA3NSBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsKCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0FIQjFfT0hDSTE+LCA8JmNjdSBDTEtf
VVNCX09IQ0kxPjsKCQkJcmVzZXRzID0gPCZjY3UgUlNUX0FIQjFfT0hDSTE+OwoJCQlwaHlzID0g
PCZ1c2JwaHkgMj47CgkJCXBoeS1uYW1lcyA9ICJ1c2IiOwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQi
OwoJCX07CgoJCW9oY2kyOiB1c2JAMWMxYzQwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVy
LHN1bjZpLWEzMS1vaGNpIiwgImdlbmVyaWMtb2hjaSI7CgkJCXJlZyA9IDwweDAxYzFjNDAwIDB4
MTAwPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDc3IElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJ
CQljbG9ja3MgPSA8JmNjdSBDTEtfQUhCMV9PSENJMj4sIDwmY2N1IENMS19VU0JfT0hDSTI+OwoJ
CQlyZXNldHMgPSA8JmNjdSBSU1RfQUhCMV9PSENJMj47CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
CgkJfTsKCgkJY2N1OiBjbG9ja0AxYzIwMDAwIHsKCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIs
c3VuNmktYTMxLWNjdSI7CgkJCXJlZyA9IDwweDAxYzIwMDAwIDB4NDAwPjsKCQkJY2xvY2tzID0g
PCZvc2MyNE0+LCA8JnJ0YyAwPjsKCQkJY2xvY2stbmFtZXMgPSAiaG9zYyIsICJsb3NjIjsKCQkJ
I2Nsb2NrLWNlbGxzID0gPDE+OwoJCQkjcmVzZXQtY2VsbHMgPSA8MT47CgkJfTsKCgkJcGlvOiBw
aW5jdHJsQDFjMjA4MDAgewoJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1hMzEtcGlu
Y3RybCI7CgkJCXJlZyA9IDwweDAxYzIwODAwIDB4NDAwPjsKCQkJaW50ZXJydXB0LXBhcmVudCA9
IDwmcl9pbnRjPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExIElSUV9UWVBFX0xFVkVMX0hJ
R0g+LAoJCQkJICAgICA8R0lDX1NQSSAxNSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKCQkJCSAgICAg
PEdJQ19TUEkgMTYgSVJRX1RZUEVfTEVWRUxfSElHSD4sCgkJCQkgICAgIDxHSUNfU1BJIDE3IElS
UV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3MgPSA8JmNjdSBDTEtfQVBCMV9QSU8+LCA8Jm9z
YzI0TT4sIDwmcnRjIDA+OwoJCQljbG9jay1uYW1lcyA9ICJhcGIiLCAiaG9zYyIsICJsb3NjIjsK
CQkJZ3Bpby1jb250cm9sbGVyOwoJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKCQkJI2ludGVycnVw
dC1jZWxscyA9IDwzPjsKCQkJI2dwaW8tY2VsbHMgPSA8Mz47CgoJCQlnbWFjX2dtaWlfcGluczog
Z21hYy1nbWlpLXBpbnMgewoJCQkJcGlucyA9ICJQQTAiLCAiUEExIiwgIlBBMiIsICJQQTMiLAoJ
CQkJCQkiUEE0IiwgIlBBNSIsICJQQTYiLCAiUEE3IiwKCQkJCQkJIlBBOCIsICJQQTkiLCAiUEEx
MCIsICJQQTExIiwKCQkJCQkJIlBBMTIiLCAiUEExMyIsICJQQTE0IiwJIlBBMTUiLAoJCQkJCQki
UEExNiIsICJQQTE3IiwgIlBBMTgiLCAiUEExOSIsCgkJCQkJCSJQQTIwIiwgIlBBMjEiLCAiUEEy
MiIsICJQQTIzIiwKCQkJCQkJIlBBMjQiLCAiUEEyNSIsICJQQTI2IiwgIlBBMjciOwoJCQkJZnVu
Y3Rpb24gPSAiZ21hYyI7CgkJCQkvKgoJCQkJICogZGF0YSBsaW5lcyBpbiBHTUlJIG1vZGUgcnVu
IGF0IDEyNU1IeiBhbmQKCQkJCSAqIG1pZ2h0IG5lZWQgYSBoaWdoZXIgc2lnbmFsIGRyaXZlIHN0
cmVuZ3RoCgkJCQkgKi8KCQkJCWRyaXZlLXN0cmVuZ3RoID0gPDMwPjsKCQkJfTsKCgkJCWdtYWNf
bWlpX3BpbnM6IGdtYWMtbWlpLXBpbnMgewoJCQkJcGlucyA9ICJQQTAiLCAiUEExIiwgIlBBMiIs
ICJQQTMiLAoJCQkJCQkiUEE4IiwgIlBBOSIsICJQQTExIiwKCQkJCQkJIlBBMTIiLCAiUEExMyIs
ICJQQTE0IiwgIlBBMTkiLAoJCQkJCQkiUEEyMCIsICJQQTIxIiwgIlBBMjIiLCAiUEEyMyIsCgkJ
CQkJCSJQQTI0IiwgIlBBMjYiLCAiUEEyNyI7CgkJCQlmdW5jdGlvbiA9ICJnbWFjIjsKCQkJfTsK
CgkJCWdtYWNfcmdtaWlfcGluczogZ21hYy1yZ21paS1waW5zIHsKCQkJCXBpbnMgPSAiUEEwIiwg
IlBBMSIsICJQQTIiLCAiUEEzIiwKCQkJCQkJIlBBOSIsICJQQTEwIiwgIlBBMTEiLAoJCQkJCQki
UEExMiIsICJQQTEzIiwgIlBBMTQiLCAiUEExOSIsCgkJCQkJCSJQQTIwIiwgIlBBMjUiLCAiUEEy
NiIsICJQQTI3IjsKCQkJCWZ1bmN0aW9uID0gImdtYWMiOwoJCQkJLyoKCQkJCSAqIGRhdGEgbGlu
ZXMgaW4gUkdNSUkgbW9kZSB1c2UgRERSIG1vZGUKCQkJCSAqIGFuZCBuZWVkIGEgaGlnaGVyIHNp
Z25hbCBkcml2ZSBzdHJlbmd0aAoJCQkJICovCgkJCQlkcml2ZS1zdHJlbmd0aCA9IDw0MD47CgkJ
CX07CgoJCQlpMmMwX3BpbnM6IGkyYzAtcGlucyB7CgkJCQlwaW5zID0gIlBIMTQiLCAiUEgxNSI7
CgkJCQlmdW5jdGlvbiA9ICJpMmMwIjsKCQkJfTsKCgkJCWkyYzFfcGluczogaTJjMS1waW5zIHsK
CQkJCXBpbnMgPSAiUEgxNiIsICJQSDE3IjsKCQkJCWZ1bmN0aW9uID0gImkyYzEiOwoJCQl9OwoK
CQkJaTJjMl9waW5zOiBpMmMyLXBpbnMgewoJCQkJcGlucyA9ICJQSDE4IiwgIlBIMTkiOwoJCQkJ
ZnVuY3Rpb24gPSAiaTJjMiI7CgkJCX07CgoJCQlsY2QwX3JnYjg4OF9waW5zOiBsY2QwLXJnYjg4
OC1waW5zIHsKCQkJCXBpbnMgPSAiUEQwIiwgIlBEMSIsICJQRDIiLCAiUEQzIiwKCQkJCQkJICJQ
RDQiLCAiUEQ1IiwgIlBENiIsICJQRDciLAoJCQkJCQkgIlBEOCIsICJQRDkiLCAiUEQxMCIsICJQ
RDExIiwKCQkJCQkJICJQRDEyIiwgIlBEMTMiLCAiUEQxNCIsICJQRDE1IiwKCQkJCQkJICJQRDE2
IiwgIlBEMTciLCAiUEQxOCIsICJQRDE5IiwKCQkJCQkJICJQRDIwIiwgIlBEMjEiLCAiUEQyMiIs
ICJQRDIzIiwKCQkJCQkJICJQRDI0IiwgIlBEMjUiLCAiUEQyNiIsICJQRDI3IjsKCQkJCWZ1bmN0
aW9uID0gImxjZDAiOwoJCQl9OwoKCQkJbW1jMF9waW5zOiBtbWMwLXBpbnMgewoJCQkJcGlucyA9
ICJQRjAiLCAiUEYxIiwgIlBGMiIsCgkJCQkJCSAiUEYzIiwgIlBGNCIsICJQRjUiOwoJCQkJZnVu
Y3Rpb24gPSAibW1jMCI7CgkJCQlkcml2ZS1zdHJlbmd0aCA9IDwzMD47CgkJCQliaWFzLXB1bGwt
dXA7CgkJCX07CgoJCQltbWMxX3BpbnM6IG1tYzEtcGlucyB7CgkJCQlwaW5zID0gIlBHMCIsICJQ
RzEiLCAiUEcyIiwgIlBHMyIsCgkJCQkJCSAiUEc0IiwgIlBHNSI7CgkJCQlmdW5jdGlvbiA9ICJt
bWMxIjsKCQkJCWRyaXZlLXN0cmVuZ3RoID0gPDMwPjsKCQkJCWJpYXMtcHVsbC11cDsKCQkJfTsK
CgkJCW1tYzJfNGJpdF9waW5zOiBtbWMyLTRiaXQtcGlucyB7CgkJCQlwaW5zID0gIlBDNiIsICJQ
QzciLCAiUEM4IiwgIlBDOSIsCgkJCQkJCSAiUEMxMCIsICJQQzExIjsKCQkJCWZ1bmN0aW9uID0g
Im1tYzIiOwoJCQkJZHJpdmUtc3RyZW5ndGggPSA8MzA+OwoJCQkJYmlhcy1wdWxsLXVwOwoJCQl9
OwoKCQkJbW1jMl84Yml0X2VtbWNfcGluczogbW1jMi04Yml0LWVtbWMtcGlucyB7CgkJCQlwaW5z
ID0gIlBDNiIsICJQQzciLCAiUEM4IiwgIlBDOSIsCgkJCQkJCSAiUEMxMCIsICJQQzExIiwgIlBD
MTIiLAoJCQkJCQkgIlBDMTMiLCAiUEMxNCIsICJQQzE1IiwKCQkJCQkJICJQQzI0IjsKCQkJCWZ1
bmN0aW9uID0gIm1tYzIiOwoJCQkJZHJpdmUtc3RyZW5ndGggPSA8MzA+OwoJCQkJYmlhcy1wdWxs
LXVwOwoJCQl9OwoKCQkJbW1jM184Yml0X2VtbWNfcGluczogbW1jMy04Yml0LWVtbWMtcGlucyB7
CgkJCQlwaW5zID0gIlBDNiIsICJQQzciLCAiUEM4IiwgIlBDOSIsCgkJCQkJCSAiUEMxMCIsICJQ
QzExIiwgIlBDMTIiLAoJCQkJCQkgIlBDMTMiLCAiUEMxNCIsICJQQzE1IiwKCQkJCQkJICJQQzI0
IjsKCQkJCWZ1bmN0aW9uID0gIm1tYzMiOwoJCQkJZHJpdmUtc3RyZW5ndGggPSA8NDA+OwoJCQkJ
Ymlhcy1wdWxsLXVwOwoJCQl9OwoKCQkJc3BkaWZfdHhfcGluOiBzcGRpZi10eC1waW4gewoJCQkJ
cGlucyA9ICJQSDI4IjsKCQkJCWZ1bmN0aW9uID0gInNwZGlmIjsKCQkJfTsKCgkJCXVhcnQwX3Bo
X3BpbnM6IHVhcnQwLXBoLXBpbnMgewoJCQkJcGlucyA9ICJQSDIwIiwgIlBIMjEiOwoJCQkJZnVu
Y3Rpb24gPSAidWFydDAiOwoJCQl9OwoJCX07CgoJCXRpbWVyQDFjMjBjMDAgewoJCQljb21wYXRp
YmxlID0gImFsbHdpbm5lcixzdW40aS1hMTAtdGltZXIiOwoJCQlyZWcgPSA8MHgwMWMyMGMwMCAw
eGEwPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE4IElSUV9UWVBFX0xFVkVMX0hJR0g+LAoJ
CQkJICAgICA8R0lDX1NQSSAxOSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKCQkJCSAgICAgPEdJQ19T
UEkgMjAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCgkJCQkgICAgIDxHSUNfU1BJIDIxIElSUV9UWVBF
X0xFVkVMX0hJR0g+LAoJCQkJICAgICA8R0lDX1NQSSAyMiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwK
CQkJCSAgICAgPEdJQ19TUEkgMjMgSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJCWNsb2NrcyA9IDwm
b3NjMjRNPjsKCQl9OwoKCQl3ZHQxOiB3YXRjaGRvZ0AxYzIwY2EwIHsKCQkJY29tcGF0aWJsZSA9
ICJhbGx3aW5uZXIsc3VuNmktYTMxLXdkdCI7CgkJCXJlZyA9IDwweDAxYzIwY2EwIDB4MjA+OwoJ
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjUgSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJCWNsb2Nr
cyA9IDwmb3NjMjRNPjsKCQl9OwoKCQlzcGRpZjogc3BkaWZAMWMyMTAwMCB7CgkJCSNzb3VuZC1k
YWktY2VsbHMgPSA8MD47CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1zcGRp
ZiI7CgkJCXJlZyA9IDwweDAxYzIxMDAwIDB4NDAwPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDEyIElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3MgPSA8JmNjdSBDTEtfQVBCMV9TUERJ
Rj4sIDwmY2N1IENMS19TUERJRj47CgkJCXJlc2V0cyA9IDwmY2N1IFJTVF9BUEIxX1NQRElGPjsK
CQkJY2xvY2stbmFtZXMgPSAiYXBiIiwgInNwZGlmIjsKCQkJZG1hcyA9IDwmZG1hIDI+LCA8JmRt
YSAyPjsKCQkJZG1hLW5hbWVzID0gInJ4IiwgInR4IjsKCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
CQl9OwoKCQlpMnMwOiBpMnNAMWMyMjAwMCB7CgkJCSNzb3VuZC1kYWktY2VsbHMgPSA8MD47CgkJ
CWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1pMnMiOwoJCQlyZWcgPSA8MHgwMWMy
MjAwMCAweDQwMD47CgkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMyBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsKCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0FQQjFfREFVRElPMD4sIDwmY2N1IENMS19EQVVE
SU8wPjsKCQkJcmVzZXRzID0gPCZjY3UgUlNUX0FQQjFfREFVRElPMD47CgkJCWNsb2NrLW5hbWVz
ID0gImFwYiIsICJtb2QiOwoJCQlkbWFzID0gPCZkbWEgMz4sIDwmZG1hIDM+OwoJCQlkbWEtbmFt
ZXMgPSAicngiLCAidHgiOwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJCX07CgoJCWkyczE6IGky
c0AxYzIyNDAwIHsKCQkJI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsKCQkJY29tcGF0aWJsZSA9ICJh
bGx3aW5uZXIsc3VuNmktYTMxLWkycyI7CgkJCXJlZyA9IDwweDAxYzIyNDAwIDB4NDAwPjsKCQkJ
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDE0IElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3Mg
PSA8JmNjdSBDTEtfQVBCMV9EQVVESU8xPiwgPCZjY3UgQ0xLX0RBVURJTzE+OwoJCQlyZXNldHMg
PSA8JmNjdSBSU1RfQVBCMV9EQVVESU8xPjsKCQkJY2xvY2stbmFtZXMgPSAiYXBiIiwgIm1vZCI7
CgkJCWRtYXMgPSA8JmRtYSA0PiwgPCZkbWEgND47CgkJCWRtYS1uYW1lcyA9ICJyeCIsICJ0eCI7
CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJfTsKCgkJbHJhZGM6IGxyYWRjQDFjMjI4MDAgewoJ
CQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW40aS1hMTAtbHJhZGMta2V5cyI7CgkJCXJlZyA9
IDwweDAxYzIyODAwIDB4MTAwPjsKCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmcl9pbnRjPjsKCQkJ
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDMwIElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOwoJCX07CgoJCXJ0cDogcnRwQDFjMjUwMDAgewoJCQljb21wYXRpYmxlID0g
ImFsbHdpbm5lcixzdW42aS1hMzEtdHMiOwoJCQlyZWcgPSA8MHgwMWMyNTAwMCAweDEwMD47CgkJ
CWludGVycnVwdHMgPSA8R0lDX1NQSSAyOCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKCQkJI3RoZXJt
YWwtc2Vuc29yLWNlbGxzID0gPDA+OwoJCX07CgoJCXVhcnQwOiBzZXJpYWxAMWMyODAwMCB7CgkJ
CWNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItdWFydCI7CgkJCXJlZyA9IDwweDAxYzI4MDAwIDB4
NDAwPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDAgSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJ
CXJlZy1zaGlmdCA9IDwyPjsKCQkJcmVnLWlvLXdpZHRoID0gPDQ+OwoJCQljbG9ja3MgPSA8JmNj
dSBDTEtfQVBCMl9VQVJUMD47CgkJCXJlc2V0cyA9IDwmY2N1IFJTVF9BUEIyX1VBUlQwPjsKCQkJ
ZG1hcyA9IDwmZG1hIDY+LCA8JmRtYSA2PjsKCQkJZG1hLW5hbWVzID0gInJ4IiwgInR4IjsKCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKCQl9OwoKCQl1YXJ0MTogc2VyaWFsQDFjMjg0MDAgewoJCQlj
b21wYXRpYmxlID0gInNucHMsZHctYXBiLXVhcnQiOwoJCQlyZWcgPSA8MHgwMWMyODQwMCAweDQw
MD47CgkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxIElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQly
ZWctc2hpZnQgPSA8Mj47CgkJCXJlZy1pby13aWR0aCA9IDw0PjsKCQkJY2xvY2tzID0gPCZjY3Ug
Q0xLX0FQQjJfVUFSVDE+OwoJCQlyZXNldHMgPSA8JmNjdSBSU1RfQVBCMl9VQVJUMT47CgkJCWRt
YXMgPSA8JmRtYSA3PiwgPCZkbWEgNz47CgkJCWRtYS1uYW1lcyA9ICJyeCIsICJ0eCI7CgkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CgkJfTsKCgkJdWFydDI6IHNlcmlhbEAxYzI4ODAwIHsKCQkJY29t
cGF0aWJsZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsKCQkJcmVnID0gPDB4MDFjMjg4MDAgMHg0MDA+
OwoJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKCQkJcmVn
LXNoaWZ0ID0gPDI+OwoJCQlyZWctaW8td2lkdGggPSA8ND47CgkJCWNsb2NrcyA9IDwmY2N1IENM
S19BUEIyX1VBUlQyPjsKCQkJcmVzZXRzID0gPCZjY3UgUlNUX0FQQjJfVUFSVDI+OwoJCQlkbWFz
ID0gPCZkbWEgOD4sIDwmZG1hIDg+OwoJCQlkbWEtbmFtZXMgPSAicngiLCAidHgiOwoJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOwoJCX07CgoJCXVhcnQzOiBzZXJpYWxAMWMyOGMwMCB7CgkJCWNvbXBh
dGlibGUgPSAic25wcyxkdy1hcGItdWFydCI7CgkJCXJlZyA9IDwweDAxYzI4YzAwIDB4NDAwPjsK
CQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMgSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJCXJlZy1z
aGlmdCA9IDwyPjsKCQkJcmVnLWlvLXdpZHRoID0gPDQ+OwoJCQljbG9ja3MgPSA8JmNjdSBDTEtf
QVBCMl9VQVJUMz47CgkJCXJlc2V0cyA9IDwmY2N1IFJTVF9BUEIyX1VBUlQzPjsKCQkJZG1hcyA9
IDwmZG1hIDk+LCA8JmRtYSA5PjsKCQkJZG1hLW5hbWVzID0gInJ4IiwgInR4IjsKCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKCQl9OwoKCQl1YXJ0NDogc2VyaWFsQDFjMjkwMDAgewoJCQljb21wYXRp
YmxlID0gInNucHMsZHctYXBiLXVhcnQiOwoJCQlyZWcgPSA8MHgwMWMyOTAwMCAweDQwMD47CgkJ
CWludGVycnVwdHMgPSA8R0lDX1NQSSA0IElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQlyZWctc2hp
ZnQgPSA8Mj47CgkJCXJlZy1pby13aWR0aCA9IDw0PjsKCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0FQ
QjJfVUFSVDQ+OwoJCQlyZXNldHMgPSA8JmNjdSBSU1RfQVBCMl9VQVJUND47CgkJCWRtYXMgPSA8
JmRtYSAxMD4sIDwmZG1hIDEwPjsKCQkJZG1hLW5hbWVzID0gInJ4IiwgInR4IjsKCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKCQl9OwoKCQl1YXJ0NTogc2VyaWFsQDFjMjk0MDAgewoJCQljb21wYXRp
YmxlID0gInNucHMsZHctYXBiLXVhcnQiOwoJCQlyZWcgPSA8MHgwMWMyOTQwMCAweDQwMD47CgkJ
CWludGVycnVwdHMgPSA8R0lDX1NQSSA1IElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQlyZWctc2hp
ZnQgPSA8Mj47CgkJCXJlZy1pby13aWR0aCA9IDw0PjsKCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0FQ
QjJfVUFSVDU+OwoJCQlyZXNldHMgPSA8JmNjdSBSU1RfQVBCMl9VQVJUNT47CgkJCWRtYXMgPSA8
JmRtYSAyMj4sIDwmZG1hIDIyPjsKCQkJZG1hLW5hbWVzID0gInJ4IiwgInR4IjsKCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKCQl9OwoKCQlpMmMwOiBpMmNAMWMyYWMwMCB7CgkJCWNvbXBhdGlibGUg
PSAiYWxsd2lubmVyLHN1bjZpLWEzMS1pMmMiOwoJCQlyZWcgPSA8MHgwMWMyYWMwMCAweDQwMD47
CgkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA2IElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9j
a3MgPSA8JmNjdSBDTEtfQVBCMl9JMkMwPjsKCQkJcmVzZXRzID0gPCZjY3UgUlNUX0FQQjJfSTJD
MD47CgkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CgkJCXBpbmN0cmwtMCA9IDwmaTJjMF9w
aW5zPjsKCQkJc3RhdHVzID0gImRpc2FibGVkIjsKCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJ
CSNzaXplLWNlbGxzID0gPDA+OwoJCX07CgoJCWkyYzE6IGkyY0AxYzJiMDAwIHsKCQkJY29tcGF0
aWJsZSA9ICJhbGx3aW5uZXIsc3VuNmktYTMxLWkyYyI7CgkJCXJlZyA9IDwweDAxYzJiMDAwIDB4
NDAwPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDcgSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJ
CWNsb2NrcyA9IDwmY2N1IENMS19BUEIyX0kyQzE+OwoJCQlyZXNldHMgPSA8JmNjdSBSU1RfQVBC
Ml9JMkMxPjsKCQkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQkJcGluY3RybC0wID0gPCZp
MmMxX3BpbnM+OwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKCQkJI3NpemUtY2VsbHMgPSA8MD47CgkJfTsKCgkJaTJjMjogaTJjQDFjMmI0MDAgewoJCQlj
b21wYXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1hMzEtaTJjIjsKCQkJcmVnID0gPDB4MDFjMmI0
MDAgMHg0MDA+OwoJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgOCBJUlFfVFlQRV9MRVZFTF9ISUdI
PjsKCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0FQQjJfSTJDMj47CgkJCXJlc2V0cyA9IDwmY2N1IFJT
VF9BUEIyX0kyQzI+OwoJCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJCQlwaW5jdHJsLTAg
PSA8JmkyYzJfcGlucz47CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJCSNhZGRyZXNzLWNlbGxz
ID0gPDE+OwoJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCQl9OwoKCQlpMmMzOiBpMmNAMWMyYjgwMCB7
CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1pMmMiOwoJCQlyZWcgPSA8MHgw
MWMyYjgwMCAweDQwMD47CgkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA5IElSUV9UWVBFX0xFVkVM
X0hJR0g+OwoJCQljbG9ja3MgPSA8JmNjdSBDTEtfQVBCMl9JMkMzPjsKCQkJcmVzZXRzID0gPCZj
Y3UgUlNUX0FQQjJfSTJDMz47CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJCSNhZGRyZXNzLWNl
bGxzID0gPDE+OwoJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCQl9OwoKCQlnbWFjOiBldGhlcm5ldEAx
YzMwMDAwIHsKCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuN2ktYTIwLWdtYWMiOwoJCQly
ZWcgPSA8MHgwMWMzMDAwMCAweDEwNTQ+OwoJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgODIgSVJR
X1RZUEVfTEVWRUxfSElHSD47CgkJCWludGVycnVwdC1uYW1lcyA9ICJtYWNpcnEiOwoJCQljbG9j
a3MgPSA8JmNjdSBDTEtfQUhCMV9FTUFDPiwgPCZnbWFjX3R4X2Nsaz47CgkJCWNsb2NrLW5hbWVz
ID0gInN0bW1hY2V0aCIsICJhbGx3aW5uZXJfZ21hY190eCI7CgkJCXJlc2V0cyA9IDwmY2N1IFJT
VF9BSEIxX0VNQUM+OwoJCQlyZXNldC1uYW1lcyA9ICJzdG1tYWNldGgiOwoJCQlzbnBzLHBibCA9
IDwyPjsKCQkJc25wcyxmaXhlZC1idXJzdDsKCQkJc25wcyxmb3JjZV9zZl9kbWFfbW9kZTsKCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKCgkJCW1kaW86IG1kaW8gewoJCQkJY29tcGF0aWJsZSA9ICJz
bnBzLGR3bWFjLW1kaW8iOwoJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJCQkjc2l6ZS1jZWxs
cyA9IDwwPjsKCQkJfTsKCQl9OwoKCQljcnlwdG86IGNyeXB0by1lbmdpbmVAMWMxNTAwMCB7CgkJ
CWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1jcnlwdG8iLAoJCQkJICAgICAiYWxs
d2lubmVyLHN1bjRpLWExMC1jcnlwdG8iOwoJCQlyZWcgPSA8MHgwMWMxNTAwMCAweDEwMDA+OwoJ
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgODAgSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJCWNsb2Nr
cyA9IDwmY2N1IENMS19BSEIxX1NTPiwgPCZjY3UgQ0xLX1NTPjsKCQkJY2xvY2stbmFtZXMgPSAi
YWhiIiwgIm1vZCI7CgkJCXJlc2V0cyA9IDwmY2N1IFJTVF9BSEIxX1NTPjsKCQkJcmVzZXQtbmFt
ZXMgPSAiYWhiIjsKCQl9OwoKCQljb2RlYzogY29kZWNAMWMyMmMwMCB7CgkJCSNzb3VuZC1kYWkt
Y2VsbHMgPSA8MD47CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1jb2RlYyI7
CgkJCXJlZyA9IDwweDAxYzIyYzAwIDB4NDAwPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI5
IElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3MgPSA8JmNjdSBDTEtfQVBCMV9DT0RFQz4s
IDwmY2N1IENMS19DT0RFQz47CgkJCWNsb2NrLW5hbWVzID0gImFwYiIsICJjb2RlYyI7CgkJCXJl
c2V0cyA9IDwmY2N1IFJTVF9BUEIxX0NPREVDPjsKCQkJZG1hcyA9IDwmZG1hIDE1PiwgPCZkbWEg
MTU+OwoJCQlkbWEtbmFtZXMgPSAicngiLCAidHgiOwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJ
CX07CgoJCXRpbWVyQDFjNjAwMDAgewoJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1h
MzEtaHN0aW1lciIsCgkJCQkgICAgICJhbGx3aW5uZXIsc3VuN2ktYTIwLWhzdGltZXIiOwoJCQly
ZWcgPSA8MHgwMWM2MDAwMCAweDEwMDA+OwoJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNTEgSVJR
X1RZUEVfTEVWRUxfSElHSD4sCgkJCQkgICAgIDxHSUNfU1BJIDUyIElSUV9UWVBFX0xFVkVMX0hJ
R0g+LAoJCQkJICAgICA8R0lDX1NQSSA1MyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKCQkJCSAgICAg
PEdJQ19TUEkgNTQgSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJCWNsb2NrcyA9IDwmY2N1IENMS19B
SEIxX0hTVElNRVI+OwoJCQlyZXNldHMgPSA8JmNjdSBSU1RfQUhCMV9IU1RJTUVSPjsKCQl9OwoK
CQlzcGkwOiBzcGlAMWM2ODAwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEz
MS1zcGkiOwoJCQlyZWcgPSA8MHgwMWM2ODAwMCAweDEwMDA+OwoJCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgNjUgSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJCWNsb2NrcyA9IDwmY2N1IENMS19BSEIx
X1NQSTA+LCA8JmNjdSBDTEtfU1BJMD47CgkJCWNsb2NrLW5hbWVzID0gImFoYiIsICJtb2QiOwoJ
CQlkbWFzID0gPCZkbWEgMjM+LCA8JmRtYSAyMz47CgkJCWRtYS1uYW1lcyA9ICJyeCIsICJ0eCI7
CgkJCXJlc2V0cyA9IDwmY2N1IFJTVF9BSEIxX1NQSTA+OwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQi
OwoJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJI3NpemUtY2VsbHMgPSA8MD47CgkJfTsKCgkJ
c3BpMTogc3BpQDFjNjkwMDAgewoJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1hMzEt
c3BpIjsKCQkJcmVnID0gPDB4MDFjNjkwMDAgMHgxMDAwPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDY2IElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3MgPSA8JmNjdSBDTEtfQUhCMV9T
UEkxPiwgPCZjY3UgQ0xLX1NQSTE+OwoJCQljbG9jay1uYW1lcyA9ICJhaGIiLCAibW9kIjsKCQkJ
ZG1hcyA9IDwmZG1hIDI0PiwgPCZkbWEgMjQ+OwoJCQlkbWEtbmFtZXMgPSAicngiLCAidHgiOwoJ
CQlyZXNldHMgPSA8JmNjdSBSU1RfQUhCMV9TUEkxPjsKCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
CQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJCSNzaXplLWNlbGxzID0gPDA+OwoJCX07CgoJCXNw
aTI6IHNwaUAxYzZhMDAwIHsKCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNmktYTMxLXNw
aSI7CgkJCXJlZyA9IDwweDAxYzZhMDAwIDB4MTAwMD47CgkJCWludGVycnVwdHMgPSA8R0lDX1NQ
SSA2NyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0FIQjFfU1BJ
Mj4sIDwmY2N1IENMS19TUEkyPjsKCQkJY2xvY2stbmFtZXMgPSAiYWhiIiwgIm1vZCI7CgkJCWRt
YXMgPSA8JmRtYSAyNT4sIDwmZG1hIDI1PjsKCQkJZG1hLW5hbWVzID0gInJ4IiwgInR4IjsKCQkJ
cmVzZXRzID0gPCZjY3UgUlNUX0FIQjFfU1BJMj47CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCQl9OwoKCQlzcGkz
OiBzcGlAMWM2YjAwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1zcGki
OwoJCQlyZWcgPSA8MHgwMWM2YjAwMCAweDEwMDA+OwoJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
NjggSVJRX1RZUEVfTEVWRUxfSElHSD47CgkJCWNsb2NrcyA9IDwmY2N1IENMS19BSEIxX1NQSTM+
LCA8JmNjdSBDTEtfU1BJMz47CgkJCWNsb2NrLW5hbWVzID0gImFoYiIsICJtb2QiOwoJCQlkbWFz
ID0gPCZkbWEgMjY+LCA8JmRtYSAyNj47CgkJCWRtYS1uYW1lcyA9ICJyeCIsICJ0eCI7CgkJCXJl
c2V0cyA9IDwmY2N1IFJTVF9BSEIxX1NQSTM+OwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJI3NpemUtY2VsbHMgPSA8MD47CgkJfTsKCgkJZ2ljOiBp
bnRlcnJ1cHQtY29udHJvbGxlckAxYzgxMDAwIHsKCQkJY29tcGF0aWJsZSA9ICJhcm0sZ2ljLTQw
MCI7CgkJCXJlZyA9IDwweDAxYzgxMDAwIDB4MTAwMD4sCgkJCSAgICAgIDwweDAxYzgyMDAwIDB4
MjAwMD4sCgkJCSAgICAgIDwweDAxYzg0MDAwIDB4MjAwMD4sCgkJCSAgICAgIDwweDAxYzg2MDAw
IDB4MjAwMD47CgkJCWludGVycnVwdC1jb250cm9sbGVyOwoJCQkjaW50ZXJydXB0LWNlbGxzID0g
PDM+OwoJCQlpbnRlcnJ1cHRzID0gPEdJQ19QUEkgOSAoR0lDX0NQVV9NQVNLX1NJTVBMRSg0KSB8
IElSUV9UWVBFX0xFVkVMX0hJR0gpPjsKCQl9OwoKCQlmZTA6IGRpc3BsYXktZnJvbnRlbmRAMWUw
MDAwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1kaXNwbGF5LWZyb250
ZW5kIjsKCQkJcmVnID0gPDB4MDFlMDAwMDAgMHgyMDAwMD47CgkJCWludGVycnVwdHMgPSA8R0lD
X1NQSSA5MyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0FIQjFf
RkUwPiwgPCZjY3UgQ0xLX0ZFMD4sCgkJCQkgPCZjY3UgQ0xLX0RSQU1fRkUwPjsKCQkJY2xvY2st
bmFtZXMgPSAiYWhiIiwgIm1vZCIsCgkJCQkgICAgICAicmFtIjsKCQkJcmVzZXRzID0gPCZjY3Ug
UlNUX0FIQjFfRkUwPjsKCgkJCXBvcnRzIHsKCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkJ
I3NpemUtY2VsbHMgPSA8MD47CgoJCQkJZmUwX291dDogcG9ydEAxIHsKCQkJCQkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKCQkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCQkJCQlyZWcgPSA8MT47CgoJCQkJ
CWZlMF9vdXRfYmUwOiBlbmRwb2ludEAwIHsKCQkJCQkJcmVnID0gPDA+OwoJCQkJCQlyZW1vdGUt
ZW5kcG9pbnQgPSA8JmJlMF9pbl9mZTA+OwoJCQkJCX07CgoJCQkJCWZlMF9vdXRfYmUxOiBlbmRw
b2ludEAxIHsKCQkJCQkJcmVnID0gPDE+OwoJCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmJlMV9p
bl9mZTA+OwoJCQkJCX07CgkJCQl9OwoJCQl9OwoJCX07CgoJCWZlMTogZGlzcGxheS1mcm9udGVu
ZEAxZTIwMDAwIHsKCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNmktYTMxLWRpc3BsYXkt
ZnJvbnRlbmQiOwoJCQlyZWcgPSA8MHgwMWUyMDAwMCAweDIwMDAwPjsKCQkJaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDk0IElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3MgPSA8JmNjdSBDTEtf
QUhCMV9GRTE+LCA8JmNjdSBDTEtfRkUxPiwKCQkJCSA8JmNjdSBDTEtfRFJBTV9GRTE+OwoJCQlj
bG9jay1uYW1lcyA9ICJhaGIiLCAibW9kIiwKCQkJCSAgICAgICJyYW0iOwoJCQlyZXNldHMgPSA8
JmNjdSBSU1RfQUhCMV9GRTE+OwoKCQkJcG9ydHMgewoJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47
CgkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCgkJCQlmZTFfb3V0OiBwb3J0QDEgewoJCQkJCSNhZGRy
ZXNzLWNlbGxzID0gPDE+OwoJCQkJCSNzaXplLWNlbGxzID0gPDA+OwoJCQkJCXJlZyA9IDwxPjsK
CgkJCQkJZmUxX291dF9iZTA6IGVuZHBvaW50QDAgewoJCQkJCQlyZWcgPSA8MD47CgkJCQkJCXJl
bW90ZS1lbmRwb2ludCA9IDwmYmUwX2luX2ZlMT47CgkJCQkJfTsKCgkJCQkJZmUxX291dF9iZTE6
IGVuZHBvaW50QDEgewoJCQkJCQlyZWcgPSA8MT47CgkJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
YmUxX2luX2ZlMT47CgkJCQkJfTsKCQkJCX07CgkJCX07CgkJfTsKCgkJYmUxOiBkaXNwbGF5LWJh
Y2tlbmRAMWU0MDAwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1kaXNw
bGF5LWJhY2tlbmQiOwoJCQlyZWcgPSA8MHgwMWU0MDAwMCAweDEwMDAwPjsKCQkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDk2IElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3MgPSA8JmNjdSBD
TEtfQUhCMV9CRTE+LCA8JmNjdSBDTEtfQkUxPiwKCQkJCSA8JmNjdSBDTEtfRFJBTV9CRTE+OwoJ
CQljbG9jay1uYW1lcyA9ICJhaGIiLCAibW9kIiwKCQkJCSAgICAgICJyYW0iOwoJCQlyZXNldHMg
PSA8JmNjdSBSU1RfQUhCMV9CRTE+OwoKCQkJcG9ydHMgewoJCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47CgkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCgkJCQliZTFfaW46IHBvcnRAMCB7CgkJCQkJI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47CgkJCQkJI3NpemUtY2VsbHMgPSA8MD47CgkJCQkJcmVnID0gPDA+
OwoKCQkJCQliZTFfaW5fZmUwOiBlbmRwb2ludEAwIHsKCQkJCQkJcmVnID0gPDA+OwoJCQkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8JmZlMF9vdXRfYmUxPjsKCQkJCQl9OwoKCQkJCQliZTFfaW5fZmUx
OiBlbmRwb2ludEAxIHsKCQkJCQkJcmVnID0gPDE+OwoJCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8
JmZlMV9vdXRfYmUxPjsKCQkJCQl9OwoJCQkJfTsKCgkJCQliZTFfb3V0OiBwb3J0QDEgewoJCQkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkJCSNzaXplLWNlbGxzID0gPDA+OwoJCQkJCXJlZyA9
IDwxPjsKCgkJCQkJYmUxX291dF9kcmMxOiBlbmRwb2ludEAxIHsKCQkJCQkJcmVnID0gPDE+OwoJ
CQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRyYzFfaW5fYmUxPjsKCQkJCQl9OwoJCQkJfTsKCQkJ
fTsKCQl9OwoKCQlkcmMxOiBkcmNAMWU1MDAwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVy
LHN1bjZpLWEzMS1kcmMiOwoJCQlyZWcgPSA8MHgwMWU1MDAwMCAweDEwMDAwPjsKCQkJaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDkxIElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3MgPSA8JmNj
dSBDTEtfQUhCMV9EUkMxPiwgPCZjY3UgQ0xLX0lFUF9EUkMxPiwKCQkJCSA8JmNjdSBDTEtfRFJB
TV9EUkMxPjsKCQkJY2xvY2stbmFtZXMgPSAiYWhiIiwgIm1vZCIsCgkJCQkgICAgICAicmFtIjsK
CQkJcmVzZXRzID0gPCZjY3UgUlNUX0FIQjFfRFJDMT47CgoJCQlwb3J0cyB7CgkJCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKCQkJCSNzaXplLWNlbGxzID0gPDA+OwoKCQkJCWRyYzFfaW46IHBvcnRA
MCB7CgkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJCQkJI3NpemUtY2VsbHMgPSA8MD47CgkJ
CQkJcmVnID0gPDA+OwoKCQkJCQlkcmMxX2luX2JlMTogZW5kcG9pbnRAMSB7CgkJCQkJCXJlZyA9
IDwxPjsKCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZiZTFfb3V0X2RyYzE+OwoJCQkJCX07CgkJ
CQl9OwoKCQkJCWRyYzFfb3V0OiBwb3J0QDEgewoJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJ
CQkJCSNzaXplLWNlbGxzID0gPDA+OwoJCQkJCXJlZyA9IDwxPjsKCgkJCQkJZHJjMV9vdXRfdGNv
bjA6IGVuZHBvaW50QDAgewoJCQkJCQlyZWcgPSA8MD47CgkJCQkJCXJlbW90ZS1lbmRwb2ludCA9
IDwmdGNvbjBfaW5fZHJjMT47CgkJCQkJfTsKCgkJCQkJZHJjMV9vdXRfdGNvbjE6IGVuZHBvaW50
QDEgewoJCQkJCQlyZWcgPSA8MT47CgkJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGNvbjFfaW5f
ZHJjMT47CgkJCQkJfTsKCQkJCX07CgkJCX07CgkJfTsKCgkJYmUwOiBkaXNwbGF5LWJhY2tlbmRA
MWU2MDAwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1kaXNwbGF5LWJh
Y2tlbmQiOwoJCQlyZWcgPSA8MHgwMWU2MDAwMCAweDEwMDAwPjsKCQkJaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDk1IElSUV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3MgPSA8JmNjdSBDTEtfQUhC
MV9CRTA+LCA8JmNjdSBDTEtfQkUwPiwKCQkJCSA8JmNjdSBDTEtfRFJBTV9CRTA+OwoJCQljbG9j
ay1uYW1lcyA9ICJhaGIiLCAibW9kIiwKCQkJCSAgICAgICJyYW0iOwoJCQlyZXNldHMgPSA8JmNj
dSBSU1RfQUhCMV9CRTA+OwoKCQkJcG9ydHMgewoJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJ
CQkjc2l6ZS1jZWxscyA9IDwwPjsKCgkJCQliZTBfaW46IHBvcnRAMCB7CgkJCQkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47CgkJCQkJI3NpemUtY2VsbHMgPSA8MD47CgkJCQkJcmVnID0gPDA+OwoKCQkJ
CQliZTBfaW5fZmUwOiBlbmRwb2ludEAwIHsKCQkJCQkJcmVnID0gPDA+OwoJCQkJCQlyZW1vdGUt
ZW5kcG9pbnQgPSA8JmZlMF9vdXRfYmUwPjsKCQkJCQl9OwoKCQkJCQliZTBfaW5fZmUxOiBlbmRw
b2ludEAxIHsKCQkJCQkJcmVnID0gPDE+OwoJCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmZlMV9v
dXRfYmUwPjsKCQkJCQl9OwoJCQkJfTsKCgkJCQliZTBfb3V0OiBwb3J0QDEgewoJCQkJCXJlZyA9
IDwxPjsKCgkJCQkJYmUwX291dF9kcmMwOiBlbmRwb2ludCB7CgkJCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmZHJjMF9pbl9iZTA+OwoJCQkJCX07CgkJCQl9OwoJCQl9OwoJCX07CgoJCWRyYzA6IGRy
Y0AxZTcwMDAwIHsKCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNmktYTMxLWRyYyI7CgkJ
CXJlZyA9IDwweDAxZTcwMDAwIDB4MTAwMDA+OwoJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgOTEg
SVJRX1RZUEVfTEVWRUxfSElHSD47CgkJCWNsb2NrcyA9IDwmY2N1IENMS19BSEIxX0RSQzA+LCA8
JmNjdSBDTEtfSUVQX0RSQzA+LAoJCQkJIDwmY2N1IENMS19EUkFNX0RSQzA+OwoJCQljbG9jay1u
YW1lcyA9ICJhaGIiLCAibW9kIiwKCQkJCSAgICAgICJyYW0iOwoJCQlyZXNldHMgPSA8JmNjdSBS
U1RfQUhCMV9EUkMwPjsKCgkJCXBvcnRzIHsKCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkJ
I3NpemUtY2VsbHMgPSA8MD47CgoJCQkJZHJjMF9pbjogcG9ydEAwIHsKCQkJCQlyZWcgPSA8MD47
CgoJCQkJCWRyYzBfaW5fYmUwOiBlbmRwb2ludCB7CgkJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
YmUwX291dF9kcmMwPjsKCQkJCQl9OwoJCQkJfTsKCgkJCQlkcmMwX291dDogcG9ydEAxIHsKCQkJ
CQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCQkJCQlyZWcg
PSA8MT47CgoJCQkJCWRyYzBfb3V0X3Rjb24wOiBlbmRwb2ludEAwIHsKCQkJCQkJcmVnID0gPDA+
OwoJCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnRjb24wX2luX2RyYzA+OwoJCQkJCX07CgoJCQkJ
CWRyYzBfb3V0X3Rjb24xOiBlbmRwb2ludEAxIHsKCQkJCQkJcmVnID0gPDE+OwoJCQkJCQlyZW1v
dGUtZW5kcG9pbnQgPSA8JnRjb24xX2luX2RyYzA+OwoJCQkJCX07CgkJCQl9OwoJCQl9OwoJCX07
CgoJCXJ0YzogcnRjQDFmMDAwMDAgewoJCQkjY2xvY2stY2VsbHMgPSA8MT47CgkJCWNvbXBhdGli
bGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1ydGMiOwoJCQlyZWcgPSA8MHgwMWYwMDAwMCAweDU0
PjsKCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmcl9pbnRjPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDQwIElSUV9UWVBFX0xFVkVMX0hJR0g+LAoJCQkJICAgICA8R0lDX1NQSSA0MSBJUlFfVFlQ
RV9MRVZFTF9ISUdIPjsKCQkJY2xvY2tzID0gPCZvc2MzMms+OwoJCQljbG9jay1vdXRwdXQtbmFt
ZXMgPSAib3NjMzJrIjsKCQl9OwoKCQlyX2ludGM6IGludGVycnVwdC1jb250cm9sbGVyQDFmMDBj
MDAgewoJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1hMzEtci1pbnRjIjsKCQkJaW50
ZXJydXB0LWNvbnRyb2xsZXI7CgkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mz47CgkJCXJlZyA9IDww
eDAxZjAwYzAwIDB4NDAwPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMyIElSUV9UWVBFX0xF
VkVMX0hJR0g+OwoJCX07CgoJCXByY21AMWYwMTQwMCB7CgkJCWNvbXBhdGlibGUgPSAiYWxsd2lu
bmVyLHN1bjZpLWEzMS1wcmNtIjsKCQkJcmVnID0gPDB4MDFmMDE0MDAgMHgyMDA+OwoKCQkJYXIx
MDA6IGFyMTAwX2NsayB7CgkJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1hMzEtYXIx
MDAtY2xrIjsKCQkJCSNjbG9jay1jZWxscyA9IDwwPjsKCQkJCWNsb2NrcyA9IDwmcnRjIDA+LCA8
Jm9zYzI0TT4sCgkJCQkJIDwmY2N1IENMS19QTExfUEVSSVBIPiwKCQkJCQkgPCZjY3UgQ0xLX1BM
TF9QRVJJUEg+OwoJCQkJY2xvY2stb3V0cHV0LW5hbWVzID0gImFyMTAwIjsKCQkJfTsKCgkJCWFo
YjA6IGFoYjBfY2xrIHsKCQkJCWNvbXBhdGlibGUgPSAiZml4ZWQtZmFjdG9yLWNsb2NrIjsKCQkJ
CSNjbG9jay1jZWxscyA9IDwwPjsKCQkJCWNsb2NrLWRpdiA9IDwxPjsKCQkJCWNsb2NrLW11bHQg
PSA8MT47CgkJCQljbG9ja3MgPSA8JmFyMTAwPjsKCQkJCWNsb2NrLW91dHB1dC1uYW1lcyA9ICJh
aGIwIjsKCQkJfTsKCgkJCWFwYjA6IGFwYjBfY2xrIHsKCQkJCWNvbXBhdGlibGUgPSAiYWxsd2lu
bmVyLHN1bjZpLWEzMS1hcGIwLWNsayI7CgkJCQkjY2xvY2stY2VsbHMgPSA8MD47CgkJCQljbG9j
a3MgPSA8JmFoYjA+OwoJCQkJY2xvY2stb3V0cHV0LW5hbWVzID0gImFwYjAiOwoJCQl9OwoKCQkJ
YXBiMF9nYXRlczogYXBiMF9nYXRlc19jbGsgewoJCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIs
c3VuNmktYTMxLWFwYjAtZ2F0ZXMtY2xrIjsKCQkJCSNjbG9jay1jZWxscyA9IDwxPjsKCQkJCWNs
b2NrcyA9IDwmYXBiMD47CgkJCQljbG9jay1vdXRwdXQtbmFtZXMgPSAiYXBiMF9waW8iLCAiYXBi
MF9pciIsCgkJCQkJCSJhcGIwX3RpbWVyIiwgImFwYjBfcDJ3aSIsCgkJCQkJCSJhcGIwX3VhcnQi
LCAiYXBiMF8xd2lyZSIsCgkJCQkJCSJhcGIwX2kyYyI7CgkJCX07CgoJCQlpcl9jbGs6IGlyX2Ns
ayB7CgkJCQkjY2xvY2stY2VsbHMgPSA8MD47CgkJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixz
dW40aS1hMTAtbW9kMC1jbGsiOwoJCQkJY2xvY2tzID0gPCZydGMgMD4sIDwmb3NjMjRNPjsKCQkJ
CWNsb2NrLW91dHB1dC1uYW1lcyA9ICJpciI7CgkJCX07CgoJCQlhcGIwX3JzdDogYXBiMF9yc3Qg
ewoJCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNmktYTMxLWNsb2NrLXJlc2V0IjsKCQkJ
CSNyZXNldC1jZWxscyA9IDwxPjsKCQkJfTsKCQl9OwoKCQljcHVjZmdAMWYwMWMwMCB7CgkJCWNv
bXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1jcHVjb25maWciOwoJCQlyZWcgPSA8MHgw
MWYwMWMwMCAweDMwMD47CgkJfTsKCgkJaXI6IGlyQDFmMDIwMDAgewoJCQljb21wYXRpYmxlID0g
ImFsbHdpbm5lcixzdW42aS1hMzEtaXIiOwoJCQljbG9ja3MgPSA8JmFwYjBfZ2F0ZXMgMT4sIDwm
aXJfY2xrPjsKCQkJY2xvY2stbmFtZXMgPSAiYXBiIiwgImlyIjsKCQkJcmVzZXRzID0gPCZhcGIw
X3JzdCAxPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM3IElSUV9UWVBFX0xFVkVMX0hJR0g+
OwoJCQlyZWcgPSA8MHgwMWYwMjAwMCAweDQwPjsKCQkJc3RhdHVzID0gImRpc2FibGVkIjsKCQl9
OwoKCQlyX3BpbzogcGluY3RybEAxZjAyYzAwIHsKCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIs
c3VuNmktYTMxLXItcGluY3RybCI7CgkJCXJlZyA9IDwweDAxZjAyYzAwIDB4NDAwPjsKCQkJaW50
ZXJydXB0LXBhcmVudCA9IDwmcl9pbnRjPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQ1IElS
UV9UWVBFX0xFVkVMX0hJR0g+LAoJCQkJICAgICA8R0lDX1NQSSA0NiBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsKCQkJY2xvY2tzID0gPCZhcGIwX2dhdGVzIDA+LCA8Jm9zYzI0TT4sIDwmcnRjIDA+OwoJ
CQljbG9jay1uYW1lcyA9ICJhcGIiLCAiaG9zYyIsICJsb3NjIjsKCQkJcmVzZXRzID0gPCZhcGIw
X3JzdCAwPjsKCQkJZ3Bpby1jb250cm9sbGVyOwoJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKCQkJ
I2ludGVycnVwdC1jZWxscyA9IDwzPjsKCQkJI2dwaW8tY2VsbHMgPSA8Mz47CgoJCQlzX2lyX3J4
X3Bpbjogcy1pci1yeC1waW4gewoJCQkJcGlucyA9ICJQTDQiOwoJCQkJZnVuY3Rpb24gPSAic19p
ciI7CgkJCX07CgoJCQlzX3Ayd2lfcGluczogcy1wMndpLXBpbnMgewoJCQkJcGlucyA9ICJQTDAi
LCAiUEwxIjsKCQkJCWZ1bmN0aW9uID0gInNfcDJ3aSI7CgkJCX07CgkJfTsKCgkJcDJ3aTogaTJj
QDFmMDM0MDAgewoJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1hMzEtcDJ3aSI7CgkJ
CXJlZyA9IDwweDAxZjAzNDAwIDB4NDAwPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM5IElS
UV9UWVBFX0xFVkVMX0hJR0g+OwoJCQljbG9ja3MgPSA8JmFwYjBfZ2F0ZXMgMz47CgkJCWNsb2Nr
LWZyZXF1ZW5jeSA9IDwxMDAwMDA+OwoJCQlyZXNldHMgPSA8JmFwYjBfcnN0IDM+OwoJCQlwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOwoJCQlwaW5jdHJsLTAgPSA8JnNfcDJ3aV9waW5zPjsKCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJCSNzaXplLWNl
bGxzID0gPDA+OwoJCX07Cgl9Owp9Owo=

--------------fKsynrSlSpH5MqTX4h0zmh0t--
