Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2080.outbound.protection.outlook.com [40.92.98.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93C8C15F
	for <linux-sunxi@lists.linux.dev>; Wed, 24 May 2023 09:10:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLNPEGEXULdcCwBbZ3XDLXeLbrhuaXGs7KPlRsg2zPdkHgINL00t5nsoHDl0bXCfOJoMzEWwD5Tig+HBM5BwD5vJZAWzgkxmTN1VV6FZUwDE2fMr74SS6UXb8EZOLYW3fEqkUENt/hxbV8F7zoJkFwT+iKt+Nx8T8KZtKXm+KoG66UAuwhz9eDT8ZuOZt6UeOYeeXXR+CgSfifK211O53fkzYfZZ7YiXjGQnesseZDgV8fpQUAo8YdYUn7QkUDo+wkjz1KJZ1VttvsbazYb0C33jfEn4YffH4hvXKc5N8nP7IyMkuPlEkd5n8QgzurV0kag1txPdTpOkBDjGwFgUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3elneK6qpvV60+/YffkE8JrfOUgm/tWjKP1RD/OCsY=;
 b=dee8WvjtSpSMbE+ENdXV0D3E45nllCoCMdjmwS6ajy/lzCug2yi+1BJZ4FHkTxzzzJ0i4CteLTf+X3TkgFuQeAZRxDCq2QHTv5t9A7M4fPUOBSUiwuFln9jxspqR7afSV2bhigiho4TmENJnMD4M5uduPwZPo3MewqD8MY1XmSt/9rpaQScc/ry5PbnsmRTE9bv8QaLRPNnFraRXi7g3rx56JO7Amx9PIvPIMqtm47Bu7RjuKmuNyjVdaHQ0VQFntBBw6us6D0Ct301GzWWOYbO530k6hij5oueokrFVQ+Y1GTwoVzRu2p7OUdU+zdBYulTw3l5xakP5uuTYCPchSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3elneK6qpvV60+/YffkE8JrfOUgm/tWjKP1RD/OCsY=;
 b=pbPCYp2+7zzoMVOeQpTWl0/AuEhQfMb3Y9VmzAqZMYgOL85EU1nFfJ+QY50wZin1glnUyabdZGAs6IcDHd2QSpz1ZnP063otgbx5PBS0ppitY700ep/o3QWyuNG6qIcMUfgsN6Ih9TkJQF7d8fQlRhzbqKR2HLT9xWuW1TcdTdoqkcUMmUqJVVA7U8vvJG/0CxnKtV/rsXKQF0HUJTcQHkoxHo3JdN9E6Q5vCxY8bZhZ2PAdOqGyO0yCjj/1pYjHQ6ohJMNJzrAIryYjVU2ryPeeKIzLJqIuhRb/uS4xVwCzuVP1VV8jA5yLUZMYgNJKp2vrL+6Vh4xHjqm8EtNorA==
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:252::12)
 by TY3P286MB3565.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 09:10:31 +0000
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5805:16d6:6ab7:6639]) by TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5805:16d6:6ab7:6639%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 09:10:31 +0000
Message-ID:
 <TY3P286MB2611591D40912950F3ECB32E98419@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Date: Wed, 24 May 2023 17:10:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: wiagn233@outlook.com, Martin Botka <martin.botka@somainline.org>,
 martin.botka1@gmail.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>
References: <20230524000012.15028-1-andre.przywara@arm.com>
From: Shengyu Qu <wiagn233@outlook.com>
Subject: Re: [PATCH v11 0/3] regulator: Add X-Powers AXP15060/AXP313a PMIC
 support
In-Reply-To: <20230524000012.15028-1-andre.przywara@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GFuyO0VVExGc518Cz9O8fR8R"
X-TMN: [lgLARELR/dkBmAutdG2rvzqAj7PFXPHY]
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:252::12)
X-Microsoft-Original-Message-ID:
 <d91cda0b-11c8-ce88-e575-8cffeba58714@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3P286MB2611:EE_|TY3P286MB3565:EE_
X-MS-Office365-Filtering-Correlation-Id: 846a181d-1188-480e-1b0c-08db5c36b922
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TXNxj/Xt5tX4sxVLZRBiLOUfWli3tU+zcqU6ulDl6LgBPhe3eTK2zvoFGiRdUxy+1hBx/fSaRYjLLlyI1WOl9Shbi1NiAJ3QGx/hPDXWzfRCUqeDPC+lgsj0mJ30+eBZ/2NF27yPCDGYQbi9ocJlWXa0/yadr0blomzA25NdHk2tBYz3GB5RbbJSFhe++pNgocfUsNzUmSZQW5lDIiD+8r8K3dvXLooKG7SGizwWDLVVnOs+OMzHgO7XZ+vzeZMiQL77DH1jg7+nJYuRtD0g/wv5a/4JrqB5jZdmVbMgqqmfmOmYkEcaWxq5zG6d+z6qQoX9FltZZnH03mdM8cqhOJDkTZ2NBakgScravBRXCHt8dXuJyggP2/Z3uA/c0ZvVWHRZ2HKJYgudll4TTraD7Fpr3fEu3woQ1FZL3l+BdELpgSCmRNY2EPtcV3Htg4sxkj+m/+yI6tlWRWaEBtny3unbSp2DnSls4ZKLRHcH8wRAjwNsDekTgPrepNi+EPEDiwthadPvqFzzr+iC/gNHgzcB/LDn1g53LCD6BHH1y9ianldcnKOSkAUkn+xpd9eSsVIFJC9MGR9U+Ym44nlvVQ51+5cvRTLf4elCKbSS5WJXTiPOxtLFyWhpxwYpncVHrrlW7L9D4ksKsn+bJxlEuPIdqKRkGDudTEOwNhtMvbYM6tcVimgyfPxwTmTxr3z/ovB+EzND/XIFoV13WjQ0TqBoeBOdUWNaYgUv9i0sYo9mmJtIdnZnCgHaYTdJdnhBhZLt/Ed5LKcGdd83lJquPyt9HaGbBVX/jY=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l1ltI5RyKv4FlzBELeUkp127E3l2Viu/co/s/lT/sN0h1Tij/SUf0PMnKo7v9bPsjIpJkR3OUpnl4RifGuSPTOUW26tah5nfioSMjPikzD82L0BtA4EQ/WhckRpQhlt2zKcgHc0J22sb9RUFeQtCpJSuDYk9cvPcalReuyE9ZGZO6PXKKqCOdQzyMWDCeWmoZUlA9/v/dMEFC/YY1+V+Ccx83EfzayQLaoykpg7PxC05tWQPe3/nefNyXkfkIE+feBDXIDr1IhAtbQGqEeiYt6SdmrYWdrMVUUGekNbWGU3/m+wbXILPVbldAT+Z9l+FK9TjW1ML4R8ymR9DneBugJ2E6BDfI+Q99w6Qt49doeksSmVODi8wFhZJeS++cRW+uwRC50MOxVrnIGNYPqwYUJO+EfFX7Q3U8bu7eLWeluF+NN0+AOk/qb6UcMS343+4/kSSHQpkXvhpykQ0SM3yRaDsnsGI4KJyiDlaAeS/09+r9c2VPy1yvtN7mWBuNeacEpCNDvq02WA+aks7fvy9vey6btzer+nryOlsNBl2ZLe/9w3tHW1eEULAqDvSCAhOb4/zWB2h6aB8iUMhYTKue2hP0mjHKdB/qLEsQitAP47v61zCB6Nc5EgBhdexdAwyETmETC8gzbeMTWKziu7AXA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckNPaUxKbk1YaVExbllKaVN4S1gvL2hiNElmdnJkcnJFRHJFQTZsT04rTTZI?=
 =?utf-8?B?aXRJYkp3VS9veVprNTZ0dElEM3l1eXlKWVV3NUhka0ZnUUgvc3M3Nk1LbmR1?=
 =?utf-8?B?SWhPbUIxNGN4enNLb04wbmppUFBOQ1NJSk1mNm5ranArL3lOR1Q4bWJqbG5o?=
 =?utf-8?B?elRxZCtPeUtkR0VJOEpWUFByQWNxK29GSzlWc25TODJnWXpSUFpOZlFUL0FS?=
 =?utf-8?B?UjdoTmo4Q1dIb0E1dmsrQVRiTEZMcWxkMGd6TDl6U3kxeXNZTHhVZHB6Y1Y2?=
 =?utf-8?B?QU9wMW53WU1JT2hDNnlUWk9GakxhRGczdTNNSTgyNmtZbUNYNmNHTWZQYXpi?=
 =?utf-8?B?RGwzUzRGakJpRVJRcSs0RmhsSHRFSHpySWVZUUd5T2ZDY253b1ZHalBRQmpB?=
 =?utf-8?B?VkRnNGN6a3hPZ1R4UHhydkZmYnk2aXRRYngrRTNmZ0U5RGNsamg1SUpMdjNF?=
 =?utf-8?B?QUE0U3A1am9aTE1UcHcraU9wc0tSZWhUWENOdnJheVRhZUloU0RDSm02UDZ5?=
 =?utf-8?B?NkhRbGdrbmtmMmtOb1Y5Wjk0Z3FCc1NDbnlIN2N5YWhZRXRUaGtuejZJYUpM?=
 =?utf-8?B?aE9sbE8xUkFFN09RaWxIa1dvcDQvTWpHeGY4dWZIZkN4WThtMjJOcllSWVVV?=
 =?utf-8?B?WEdRZWFRL0hPRWVoeitLbXBvNXVNR254OXlYRUI0R2NqUjRTTXBhK2lMSTBV?=
 =?utf-8?B?ajZUOEJnZWZsNVozV3BsR2s4QzFaRUppZGkvVHlXTE52aURnRDFYcnc0SUtR?=
 =?utf-8?B?QTMzZXcyKzl4MmdUYUVTRnZEUzVNV3poYW9NZXUvOHh4VDdrY094MUxSRjhu?=
 =?utf-8?B?bGR6Mm5sSm5IdzBmYlk4Vmc1VU1oVjBsZ09yS1ZGVWNaUG0ybzFHMDNTVEdq?=
 =?utf-8?B?TDRNUnhmemlUWnZMRFV2Zys4L2FyZ0V2U3dBZldHTjZpVll5RHR4TTZwN0ox?=
 =?utf-8?B?QUJHSHJhMmtkTFNYKzRNZUUrZG9hb21DNjhJWDZrMXFUeDRCa0pyVFRSWXdP?=
 =?utf-8?B?NXJDWTdmTDNTc0dkcVNERnVFYkxDWkxncE5iRktwTmJPeC90UlNqZlQ5YmxJ?=
 =?utf-8?B?ekdUS1dBRmh4cmlDNTVvNXRiMnUrSkJDMDMyQVhlMVAxUWJZSEJNTGlNVk9o?=
 =?utf-8?B?blljZ21qNHFSc0pmR2xBYUlMOXlUYkJ4RWkwN2lpZ1BmbVJKVlJXS21uOWw3?=
 =?utf-8?B?NHNtVFRXSHNKSXZka1VhRDhLekd0MEZBWENWVUJndDhzdWdraU52c2Irb3Ro?=
 =?utf-8?B?dk03RTl5aWxoTjdTSWlrdXhySXNTNDFuREpvUDZsbmY2OTczSGNhTGFKenFk?=
 =?utf-8?B?NkRydGdHWXpBc00xek9LUURzM1NRdWQ1d3ZjaWkyWVFjdlovK1dFUEw3dlh1?=
 =?utf-8?B?OTZBSHVKWkdYNS9hMTUzcHZMTTVMeTFMOXRlMzMzTHp0ZTNHbTdVTXBMUXB2?=
 =?utf-8?B?VTFmYjVwMmlLYWVvaGloL1NHODhrMHBVWFlhOHZrTWd3NDNIZUxGSEZtV2RP?=
 =?utf-8?B?cm9wWHBMdzE3TjZaTEorTXdOdUlyYWU3Q3Jmbm5NZmJudjUyMmp2cnZxcm05?=
 =?utf-8?B?Y3pwOXhEZGNhWm1VcDhScDUxQmJPODdsVkNTQkFrMDcvSTk5a2Rza1hDN2Y0?=
 =?utf-8?B?Y3Bsd21nY005K0wyejUzVDNBWkJ0S2c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846a181d-1188-480e-1b0c-08db5c36b922
X-MS-Exchange-CrossTenant-AuthSource: TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 09:10:31.3279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3565

--------------GFuyO0VVExGc518Cz9O8fR8R
Content-Type: multipart/mixed; boundary="------------g30Qyu88QrX9Zvip0B7v0kbD";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>
Cc: wiagn233@outlook.com, Martin Botka <martin.botka@somainline.org>,
 martin.botka1@gmail.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-ID: <d91cda0b-11c8-ce88-e575-8cffeba58714@outlook.com>
Subject: Re: [PATCH v11 0/3] regulator: Add X-Powers AXP15060/AXP313a PMIC
 support
References: <20230524000012.15028-1-andre.przywara@arm.com>
In-Reply-To: <20230524000012.15028-1-andre.przywara@arm.com>

--------------g30Qyu88QrX9Zvip0B7v0kbD
Content-Type: multipart/mixed; boundary="------------tpj16VSpqnulQG7340l3r2JR"

--------------tpj16VSpqnulQG7340l3r2JR
Content-Type: multipart/alternative;
 boundary="------------CHFVKwoKXfr4Um9Jabv3Jr46"

--------------CHFVKwoKXfr4Um9Jabv3Jr46
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQW5kcmUsDQoNClRoYW5rIHlvdSBmb3IgeW91ciB3b3JrLCB0ZXN0IHN1Y2NlZWRlZCBv
biBBWFAxNTA2MCB3aXRoIG5vIHByb2JsZW0uDQoNClRlc3RlZC1ieTogU2hlbmd5dSBRdSA8
d2lhZ24yMzNAb3V0bG9vay5jb20+DQoNCkJlc3QgcmVnYXJkcywNCg0KU2hlbmd5dQ0KDQo+
IEhpLA0KPg0KPiB0aGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBYLVBv
d2VycyBBWFAxNTA2MCBhbmQgQVhQMzEzYQ0KPiBQTUlDLCB3aGljaCBhcmUgZ2VuZXJhbCBw
dXJwb3NlIFBNSUNzIGFzIHNlZW4gb24gZGlmZmVyZW50IGJvYXJkcyB3aXRoDQo+IGRpZmZl
cmVudCBTT0NzLCBtb3N0bHkgZnJvbSBBbGx3aW5uZXIuDQo+DQo+IFRoaXMgaXMgbW9zdGx5
IGEgcmVwb3N0IG9mIHRoZSBwcmV2aW91cyBwYXRjaGVzLCBjb21iaW5pbmcgYm90aCB0aGUN
Cj4gQVhQMzEzYSBhbmQgQVhQMTUwNjAgc2VyaWVzLCByZWJhc2VkIG9uIHRvcCBvZiB2Ni40
LXJjMywgYW5kIG9taXR0aW5nDQo+IHRoZSBwYXRjaGVzIHRoYXQgYWxyZWFkeSBnb3QgbWVy
Z2VkLg0KPiBUaGUgZmlyc3QgdHdvIHBhdGNoZXMgYXJlIHRoZSBzdWNjZXNzb3JzIG9mIHRo
ZSBBWFAzMTNhIHYxMCBwb3N0LA0KPiB0aGUgdGhpcmQgcGF0Y2ggaXMgYmFzZWQgb24gU2hl
bmd5dSdzIEFYUDE1MDYwIHYzIHBvc3QuDQo+DQo+IFRoZXJlIHdlcmUgbm8gY29kZSBjaGFu
Z2VzLCBqdXN0IHNvbWUgdGlueSBjb250ZXh0IGRpZmZlcmVuY2VzIGR1ZSB0bw0KPiB0aGUg
cmViYXNlLCBwbHVzIEkgYWRkZWQgdGhlIG5ld2x5IGdhaW5lZCB0YWdzLg0KPg0KPiBBcyB0
aGUgRFQgYmluZGluZ3MgYW5kIHRoZSBBWFAxNTA2MCBNRkQgcGFydCBhcmUgYWxyZWFkeSBp
biB0aGUgdHJlZSwNCj4gdGhpcyBpcyBqdXN0IGNvbXBsZXRpbmcgc3VwcG9ydCB3aXRoIHRo
ZSBNRkQgcGFydCBmb3IgdGhlIEFYUDMxM2EsIGFuZA0KPiB0aGUgcmVndWxhdG9yIHN1cHBv
cnQgZm9yIGJvdGggUE1JQ3MuDQo+DQo+IFNoZW5neXUsIE1hcnRpbjogY2FuIHlvdSBwbGVh
c2UgZ2l2ZSB0aGlzIGEgZmluYWwgdGVzdD8NCj4NCj4gQ2hlZXJzLA0KPiBBbmRyZQ0KPg0K
PiBDaGFuZ2Vsb2c6DQo+DQo+IHYzL3YxMCAuLiB2MTE6DQo+IC0gYWRkIGJyb29uaWUncyBh
bmQgQ2hlbi1ZdSdzIHJldmlldyB0YWdzDQo+IC0gcmViYXNlIG9uIHRvcCBvZiB2Ni40LXJj
Mw0KPg0KPiBBWFAzMTNhOg0KPiB2OSAuLiB2MTA6DQo+IC0gdXNlIE1GRF9DRUxMX1JFUyBt
YWNybw0KPiAtIG1hcmsgZGNkYy1mcmVxIHByb3BlcnR5IGFzICJmYWxzZSIgZm9yIEFYUDMx
M2ENCj4gLSBhZGQgTGVlJ3MgQUNLDQo+DQo+IHY4IC4uIHY5Og0KPiAtIHVzZSBNRkRfQ0VM
TF9OQU1FIG1hY3JvDQo+IC0gZml4IExETyByZWd1bGF0b3IgbmFtZXMgdG8gbWF0Y2ggdGhl
IGRhdGFzaGVldA0KPiAtIG9ubHkgbWFyayBjaGFuZ2luZyByZWdpc3RlcnMgYXMgdm9sYXRp
bGUNCj4gLSB1c2UgY29ycmVjdCByZWdpc3RlciBmb3Igc2h1dGRvd24gb3BlcmF0aW9uDQo+
IC0gYWRkIHBvd2VyIGtleSByZXNvdXJjZXMNCj4gLSBkaXNhbGxvdyB4LXBvd2VycyxkY2Rj
LWZyZXEgaW4gdGhlIERUIGJpbmRpbmcNCj4gLSBkcm9wIHVudXNlZCBPVVRQVVRfTU9OSVRP
UiByZWdpc3RlciBuYW1lLCBhZGQgU0hVVERPV05fQ1RSTA0KPiAtIHJlcXVpcmUgZGNkY2Zy
ZXEgYmVpbmcgMCAobm9uLXByZXNlbnQgRFQgcHJvcGVydHkgZGVmYXVsdCkNCj4NCj4gdjcg
Li4gdjg6DQo+IC0gQWRkIGNoZWNrIGZvciBkY2RjZnJlcSBiZWluZyB6ZXJvDQo+DQo+IHY2
IC4uIHY3Og0KPiAtIFVzZSBhbHBoYWJldGljYWwgb3JkZXJpbmcNCj4NCj4gdjUgLi4gdjY6
DQo+IC0gY2hhbmdlIG5hbWUgZnJvbSBBWFAxNTMwIHRvIEFYUDMxM2ENCj4gLSBleHRlbmQg
Y29tbWl0IG1lc3NhZ2VzDQo+IC0gZHJvcCBBWFAqX0ZSRVFVRU5DWSByZWdpc3RlciAobm90
IHVzZWQgYW55d2F5KQ0KPiAtIGJldHRlciB2ZXJ0aWNhbGx5IGFsaWduIHN0cnVjdCBkZWZp
bml0aW9ucw0KPiAtIHJlbmFtZSBJUlFzIHRvIG1hdGNoIG5hbWVzIHVzZWQgZm9yIG90aGVy
IFBNSUNzDQo+IC0gYWRkIFJUQ19MRE8gcmVndWxhdG9yDQo+IC0gdXNlIGRlY2ltYWwgbnVt
YmVycyBmb3Igc2VsZWN0b3IgcmFuZ2VzDQo+IC0gdXNlIG1hY3JvIGRlZmluaXRpb25zIHRv
IG5hbWUgc29tZSB2YWx1ZXMNCj4gLSBmb3JjZSBEQy9EQyBzd2l0Y2hpbmcgZnJlcXVlbmN5
IHRvIGJlIGZpeGVkIGF0IDMgTUh6DQo+IC0gY2hhbmdlIExETyBzb3VyY2Ugc3VwcGx5IHRv
IFZJTjEgKGFzIHBlciBkYXRhc2hlZXQpDQo+DQo+IHY0IC4uIHY1Og0KPiAtIFVzZSBhbHBo
YWJldGljYWwgb3JkZXJpbmcgaW4gbWZkDQo+IC0gQ29ycmVjdCB7IHBsYWNlbWVudCBsaW5l
DQo+IC0gUmVwbGFjZSBzcGFjZXMgd2l0aCB0YWJzIGluIDEgc3RydWN0DQo+DQo+IHYzIC4u
IHY0Og0KPiAtIEZpeCBpbmRlbnRhdGlvbg0KPg0KPiB2MiAuLiB2MzoNCj4gLSBNb3ZlIEFY
UDE1MzAgZHQtYmluZGluZyB0byBhbHBoYWJldGljYWwgb3JkZXINCj4NCj4gdjEgLi4gdjI6
DQo+IC0gUmVtb3ZlIFJTQiBzdXBwb3J0Lg0KPiAtIERyb3AgLmlkID0gMA0KPiAtIEFkZCBk
dC1iaW5kaW5nIGZvciB0aGUgQVhQMTUzMA0KPg0KPiBBWFAxNTA2MDoNCj4gdjIgLi4gdjM6
DQo+IC0gUmViYXNlIHRvIEFYUDMxM2Egc2VyaWVzIHYxMCBbMV0gKyBuZXdlc3QgKDIwMjMw
NDIwKSAtbmV4dCBicmFuY2gNCj4gLSBEaXNhYmxlcyBEQy1EQyBmcmVxdWVuY3kgc2V0dGlu
Zw0KPiAtIEFkZCBheHBfcmVndWxhdG9yX29ubHlfY2VsbHMgcmF0aGVyIHRoYW4gZGlyZWN0
bHkgdXNpbmcgYXhwODA2X2NlbGxzDQo+ICAgIGZvciBjYXNlcyB0aGF0IElSUSBsaW5lIGlz
bid0IGNvbm5lY3RlZC4NCj4gLSBGaXggc29tZSB3aGl0ZXNwYWNlDQo+IC0gUmVuYW1lIHN3
b3V0IHRvIHN3IHRvIGtlZXAgdXAgd2l0aCBiaW5kaW5ncw0KPiAtIEFkZCBjaGVjayBmb3Ig
c2V0dGluZyBEQy1EQyBmcmVxdWVuY3kNCj4NCj4gdjEgLi4gdjI6DQo+IC0gTW92ZSBjcHVz
bGRvIGJlZm9yZSBkcml2ZXZidXMgKEtyenlzenRvZiBLb3psb3dza2kpDQo+DQo+DQo+IE1h
cnRpbiBCb3RrYSAoMik6DQo+ICAgIG1mZDogYXhwMjB4OiBBZGQgc3VwcG9ydCBmb3IgQVhQ
MzEzYSBQTUlDDQo+ICAgIHJlZ3VsYXRvcjogYXhwMjB4OiBBZGQgc3VwcG9ydCBmb3IgQVhQ
MzEzYSB2YXJpYW50DQo+DQo+IFNoZW5neXUgUXUgKDEpOg0KPiAgICByZWd1bGF0b3I6IGF4
cDIweDogQWRkIEFYUDE1MDYwIHN1cHBvcnQNCj4NCj4gICBkcml2ZXJzL21mZC9heHAyMHgt
aTJjLmMgICAgICAgICAgICAgfCAgIDIgKw0KPiAgIGRyaXZlcnMvbWZkL2F4cDIweC5jICAg
ICAgICAgICAgICAgICB8ICA3OCArKysrKystDQo+ICAgZHJpdmVycy9yZWd1bGF0b3IvYXhw
MjB4LXJlZ3VsYXRvci5jIHwgMjkwICsrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAg
IGluY2x1ZGUvbGludXgvbWZkL2F4cDIweC5oICAgICAgICAgICB8ICAzMiArKysNCj4gICA0
IGZpbGVzIGNoYW5nZWQsIDM5MyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPg0K

--------------CHFVKwoKXfr4Um9Jabv3Jr46
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Andre,</p>
    <p>Thank you for your work, test succeeded on AXP15060 with no
      problem.</p>
    <pre class=3D"content"><span class=3D"tested-by">Tested-by: Shengyu Q=
u <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:wiagn233@outlook.com"=
>&lt;wiagn233@outlook.com&gt;</a></span></pre>
    <p></p>
    <p>Best regards,</p>
    <p>Shengyu<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20230524000012.15028-1-andre.przywara@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Hi,

this patch series adds support for the X-Powers AXP15060 and AXP313a
PMIC, which are general purpose PMICs as seen on different boards with
different SOCs, mostly from Allwinner.

This is mostly a repost of the previous patches, combining both the
AXP313a and AXP15060 series, rebased on top of v6.4-rc3, and omitting
the patches that already got merged.
The first two patches are the successors of the AXP313a v10 post,
the third patch is based on Shengyu's AXP15060 v3 post.

There were no code changes, just some tiny context differences due to
the rebase, plus I added the newly gained tags.

As the DT bindings and the AXP15060 MFD part are already in the tree,
this is just completing support with the MFD part for the AXP313a, and
the regulator support for both PMICs.

Shengyu, Martin: can you please give this a final test?

Cheers,
Andre

Changelog:

v3/v10 .. v11:
- add broonie's and Chen-Yu's review tags
- rebase on top of v6.4-rc3

AXP313a:
v9 .. v10:
- use MFD_CELL_RES macro
- mark dcdc-freq property as "false" for AXP313a
- add Lee's ACK

v8 .. v9:
- use MFD_CELL_NAME macro
- fix LDO regulator names to match the datasheet
- only mark changing registers as volatile
- use correct register for shutdown operation
- add power key resources
- disallow x-powers,dcdc-freq in the DT binding
- drop unused OUTPUT_MONITOR register name, add SHUTDOWN_CTRL
- require dcdcfreq being 0 (non-present DT property default)

v7 .. v8:
- Add check for dcdcfreq being zero

v6 .. v7:
- Use alphabetical ordering

v5 .. v6:
- change name from AXP1530 to AXP313a
- extend commit messages
- drop AXP*_FREQUENCY register (not used anyway)
- better vertically align struct definitions
- rename IRQs to match names used for other PMICs
- add RTC_LDO regulator
- use decimal numbers for selector ranges
- use macro definitions to name some values
- force DC/DC switching frequency to be fixed at 3 MHz
- change LDO source supply to VIN1 (as per datasheet)

v4 .. v5:
- Use alphabetical ordering in mfd
- Correct { placement line
- Replace spaces with tabs in 1 struct

v3 .. v4:
- Fix indentation

v2 .. v3:
- Move AXP1530 dt-binding to alphabetical order

v1 .. v2:
- Remove RSB support.
- Drop .id =3D 0
- Add dt-binding for the AXP1530

AXP15060:
v2 .. v3:
- Rebase to AXP313a series v10 [1] + newest (20230420) -next branch
- Disables DC-DC frequency setting
- Add axp_regulator_only_cells rather than directly using axp806_cells
  for cases that IRQ line isn't connected.
- Fix some whitespace
- Rename swout to sw to keep up with bindings
- Add check for setting DC-DC frequency

v1 .. v2:
- Move cpusldo before drivevbus (Krzysztof Kozlowski)


Martin Botka (2):
  mfd: axp20x: Add support for AXP313a PMIC
  regulator: axp20x: Add support for AXP313a variant

Shengyu Qu (1):
  regulator: axp20x: Add AXP15060 support

 drivers/mfd/axp20x-i2c.c             |   2 +
 drivers/mfd/axp20x.c                 |  78 ++++++-
 drivers/regulator/axp20x-regulator.c | 290 ++++++++++++++++++++++++++-
 include/linux/mfd/axp20x.h           |  32 +++
 4 files changed, 393 insertions(+), 9 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------CHFVKwoKXfr4Um9Jabv3Jr46--
--------------tpj16VSpqnulQG7340l3r2JR
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
lMSoVV3z1s8dA1DK95ykSdIFtVZT
=3Dr4B8
-----END PGP PUBLIC KEY BLOCK-----

--------------tpj16VSpqnulQG7340l3r2JR--

--------------g30Qyu88QrX9Zvip0B7v0kbD--

--------------GFuyO0VVExGc518Cz9O8fR8R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmRt1HsACgkQX75KBAfJ
sRng2hAAjh72NMSLS8GV264PewbnZuR4yKIsl4vrakZRmg0hxFMxlTvLvQ/ulf8R
SxyD0Ci1sMEKV4pvunENwncRVyxXgHnamPM33GVmUnBDBgV7VCN4wnRxizgsfWSN
/v99SgeevE/9qqC4iW8iTxu375GOp+IL1QQUQVQNxW7J1MyKZAfkBXAdQ24G+zhE
JE2R4drCRuB8A8jo7pi6vBJ9LOZzAkZj6JvoyZGScsL8IiorcvzyQtAbbtUqnZf7
oQVwxBf0rHQLHRmg4bpUyxK89bHhIReGNH9HnkdwWkbJOIH16WnOaLaO5DcgOYg5
hIxorAW0/dIvtK5hhYGnpjIhk8yb8DaLFU03UVLs0YoKW+zLpAkqLek7vAWbXHwF
0emj6T7ZFIyYGgMH+qKyZHZKCF9Mx76M3DZdr9kL13ro+4lqjq7HhsMRZ8iDIQYY
Mn2l4S7Pz8sBuDTIXBc2s6BPlLd3sVj9bLBAcwbjJk1e7do+tGdBefXrm0KSfsLF
5jFtaeGeWm3qYBuEUBZxHwo/pM/e7HAmaBuovfJ+RqBe19Yo1goCKo6l4gKswGRJ
cOQny/J/HZb9sXEGNZB7/XJIYCKvsNip7VWgUvDn4hJZofUXn2e5odN6jIky4Mkz
SrcUGunO8mE8p11ylszwL8jKwMUdZ4u2hcmS8aIYxlUCKBa2Xic=
=P6v9
-----END PGP SIGNATURE-----

--------------GFuyO0VVExGc518Cz9O8fR8R--
