Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA4AEC2
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Jul 2023 11:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGhOhU0fxHMb8AKR+ZRfZN2Gyl0EY0q9O8uWnmmRawhRQtwhpyBY3y6dHh0xpXi2GgRE0yEPrkKeFs5SuIhAtb9FasUYbdDSsq3uzkNCxQQ+dCDo+LBJ8+aVyhedcFlOH0DSsl2RblKjSSjqy6vS92fRAlV+NK/FEwpSIygB8+73lKuK2M342x48yMOJAKXWQsgmzG7Slk5utmhH2rGn3uryYcn/xPlZxIrsh9nCPyrjIu6zkzjG4st1WLslXn6qYCFDk/IC8L+n3z8jhoX8ekBB01HkXXZkMyFJEnLLVpBymMwk6/5CNSJUvx+Kcer7nUE5/PqKuFIhejXvJtUn2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA3g5z17QC0ICi1Ps7mcMiMEMv3pVqELKzu8eIs9YWc=;
 b=n+GWwei2JpXZwKmCy8VW6uMzSJvKUlvBEI+S2t26ntpE2RVLW7mV/jBoed1ygI6wO26Iqs896AwyxtNtPwWdIn7aOsWTEk02OLBsriFRUE8wub8oQJTezNssGRkkfjRaiQ2iO9XIeFSxO/h+xCY6UgaaGRLn4hSBQlfLrBMEwbNbUANPDduiKdcHRY0FJGCMey88MnHAZUKcm1AUHYGtyF/JT8Y5VpDCwvL8ZxkBWFEQVtecg7tndy6+OtNgz80QPeKVZD2FU+yRBQGQkqZYRIB161/m2FRy/0cOdNMBPUSfE9WVOnJi1wKO/AuW3drRV+hNahOWNbzd6j7ZvD3uzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA3g5z17QC0ICi1Ps7mcMiMEMv3pVqELKzu8eIs9YWc=;
 b=XPc/7Cs1BZ1Yd3XHrESX/JnjwKlxkyNiwKBnE542G9tS8YbpZMqwSdp32ERjmzYdvNQg8kWm9lLbF0dTJD2uvGDmsJkf+SYKea5tGbOQswBLbMou7JaQyiVfRjBtfNFD+6ce794vTHusisHbQuIb9WaIppfA6PnQV7WCHwDyBqc=
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com (2603:1096:400:169::11)
 by TYWPR01MB11960.jpnprd01.prod.outlook.com (2603:1096:400:3fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 11:52:57 +0000
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::20b:248d:188d:a7ec]) by TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::20b:248d:188d:a7ec%3]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 11:52:57 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Rob Herring <robh@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Manivannan Sadhasivam <mani@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Michael Riesch
	<michael.riesch@wolfvision.net>, Rui Miguel Silva <rmfrfs@gmail.com>, Steve
 Longerbeam <slongerbeam@gmail.com>, Matt Ranostay
	<matt.ranostay@konsulko.com>, Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Ming Qian
	<ming.qian@nxp.com>, Shijie Qin <shijie.qin@nxp.com>, Zhou Peng
	<eagle.zhou@nxp.com>, Eddie James <eajames@linux.ibm.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bin Liu <bin.liu@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Minghsiu Tsai
	<minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@medi atek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Dmitry
 Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
	<agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konrad.dybcio@linaro.org>, =?iso-8859-1?Q?Niklas_S=F6derlund?=
	<niklas.soderlund@ragnatech.se>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Mikhail Ulyanov
	<mikhail.ulyanov@cogentembedded.com>, Jacopo Mondi <jacopo@jmondi.org>, Dafna
 Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Krz ysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
	Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski
	<paul.kocialkowski@bootlin.com>, Benoit Parrot <bparrot@ti.com>, Sean Young
	<sean@mess.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Sean Wang
	<sean.wang@mediatek.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>
Subject: RE: [PATCH v2] media: Explicitly include correct DT includes
Thread-Topic: [PATCH v2] media: Explicitly include correct DT includes
Thread-Index: AQHZuYSM6N0cICnlP0+GBEE3XuAcKK/I1dPA
Date: Mon, 24 Jul 2023 11:52:56 +0000
Message-ID:
 <TYWPR01MB87759F1E08CC1982E6A4866EC202A@TYWPR01MB8775.jpnprd01.prod.outlook.com>
References: <20230718143118.1065743-1-robh@kernel.org>
In-Reply-To: <20230718143118.1065743-1-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB8775:EE_|TYWPR01MB11960:EE_
x-ms-office365-filtering-correlation-id: 5c61c4e7-5558-42de-e075-08db8c3c8589
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZtyWbRvFFwkPl9exDKslkLBQo7BEeAFTtfZS7Z8FcsjU/EClgNwY4Ubc/GhtcCbP01zbWhwUTYzThVrtpoQXlf6gIuNkKiO6xJfIdMfAX6lqPjDu4UJk7Wlg/BQTys7RjM4Nf3AOjYQ/xb1fYn0Dypqf9Twmi8/QLRCPgOaL01JInkNaVSwy4Z8BwmWcv7JH5mBAhlxO604f/TVsYQ1209jbGG2bpUlqzG1zDppWL3+yWpeR1bEwWztI1HEsXmvA5G6UQG94ux/0PjqBf8ZagGkVrH11/f0JsiZwgF4pw2RjAuzFQsUF0NxQVHnuUYum0XHDCsmmotpiYzsXAUFO2uoSuzlYEQvxgoqiuRDwXNugAr4MZKsV9Lu4kUwixAoOOLuudaxDzSQ91s75bc6y5zmX/GFTR9m1OxTAst4CsQSh3lcgtnBtZN/0okjH6aVMMaiqMDCB+MYARInRHh40W2jrfITLMkN+S8RXgCTnSVxaz5U0HaYRiH8JGzRPbUmto5eoE3pCp1JYAnWrgcvdoZg7HpGw8jKjrEmzGbb1D/unKLE+LKPScSysbdC6/X2cpP2UNsRJBnQwapnTsX/4drT5oY6JPH1zOmBzUxAMU2kF2VSzjbqEPoRy/GANQ/ZKORMPykRBq2GfJrmbzPb5FA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB8775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(1191002)(38100700002)(921005)(122000001)(55016003)(83380400001)(7406005)(7416002)(8676002)(110136005)(8936002)(7336002)(7366002)(5660300002)(52536014)(478600001)(64756008)(54906003)(66556008)(66476007)(66446008)(316002)(4326008)(76116006)(66946007)(41300700001)(186003)(26005)(6506007)(71200400001)(2906002)(9686003)(7696005)(4744005)(33656002)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?t7a9t4T2evsfg6HYE42uyzUdcWfxdPBXEOj0lj16aCv+9l2rsDvrqaevaN?=
 =?iso-8859-1?Q?1T83st+Yn5c9UlMI02T+Zz/ILOxTRZITNG4RyCMdJqsVw+HFxt/v+kBjsy?=
 =?iso-8859-1?Q?laqlkaRdmVY+DS10kI7XM8xzKsZYWa5bXzMD9N7lZhzVtQht4K/iy1Oh32?=
 =?iso-8859-1?Q?5TG/1ivvSVUljrwAcIuQ5rZy0c+PJSC6HzzCDjQa16oQ0Rod2LryaJt6Ga?=
 =?iso-8859-1?Q?xbY32iO1+KESW5rflfu3VWhdqyW3DtF8/uteQRt0BPHsc4430kKHFtop48?=
 =?iso-8859-1?Q?cuXlV68/3AI1vh8odaMfuClOK6PjFMdQqdaNb2DGBOXBp7Kd6dieSrEQkp?=
 =?iso-8859-1?Q?QWz5IG57fFaHMwIkari0O1wP53VlQDsmRh6cvbQRoU06AJFY19q+blKa7Z?=
 =?iso-8859-1?Q?XBWooUUnxStXIuCtyf0OGd0q0VS8LP5hkg8V4KBtzK+v1FMPBY/8H8kk98?=
 =?iso-8859-1?Q?wDLogDDEVLBE0R9EysN/9M3gVfFXZDkvbk5aCImLPs+enbTMNkVJYqafYh?=
 =?iso-8859-1?Q?K6t2RFr5WbZ1ThbBEH/1VLkuHIvzvMw+mYHl/dqs54LlxAo4MaNgGUG6qf?=
 =?iso-8859-1?Q?YOo44Fi8pvr9D7+f6ynTNsr3U9KS1HeuyYMB6tBnWTeyoVWQP21A+p+Z/D?=
 =?iso-8859-1?Q?0nIN166vHsto+WfBDvqYPn2ja7aj+9LD7OPpoePviYe/x2YVKIQM6sqbGu?=
 =?iso-8859-1?Q?t39PamSKa+kksd9epnxN51sO6OeG0TWxEQOwrqqj3tCIxlBT+gQ5OdxTdS?=
 =?iso-8859-1?Q?ob2YltCL1RRQNzcCViVwFg2St6h2d4nZXN+a/mwfRp2p2S5vZaYGfGhu8A?=
 =?iso-8859-1?Q?3awxrYdWZM16zNdQoKxPTEPUSIhWaIJ5BC3/OJA/hCr2b98dnVP+mKrsIG?=
 =?iso-8859-1?Q?toejNz1Su9lTM+gYeTUc8FWcXk0pQ4cEW5vQrLlprVzULo93n0Y5BA2ypY?=
 =?iso-8859-1?Q?utZBc0AGSW4oINdRj+lAyqhq6sYuT2TSUqoPcS0uKt+tJ4MIooa8knWXc2?=
 =?iso-8859-1?Q?MWxZ7VulmVGhjBmeR2UxxmkSZBuI0r2gcd8yGHKggqzKo0zKVPs60QvCdd?=
 =?iso-8859-1?Q?PAWHYHhAC2QBPCYgCZ/7PhfohJTQSpNmiQ6pNaYWnkacZFxFN/dxafjwlj?=
 =?iso-8859-1?Q?N72ideRW8bWVYVThbQgJ2ezSH+84fE1Z2mUzDSX8naSZ0Yb8qZAa78cwoK?=
 =?iso-8859-1?Q?D2c5KrBtoxz1BlYaEBq32LWHtG4VzWI8mbPrfLU64J/qWvpsTPcEo9lnu8?=
 =?iso-8859-1?Q?Xt8MgqDQn/dG+oMCCPyn8U7rrcL6lIYC4uTrgrfhWyAZu9zvRJD9ODNRkd?=
 =?iso-8859-1?Q?YL0G0tA35l2um/a4FWPMbO/XcUtEynWYXk+ChWQLKw0POcmVxZhECzxLaf?=
 =?iso-8859-1?Q?EJ552ycapsKNNdUh2auES0wAvOWx0pKlP14ra9caf2zPR9F/lhni01Eri4?=
 =?iso-8859-1?Q?LstSrv1kyklYHHGG/GfMyo+JNjFP/30MZwEfSneLfUVffhVJXQi1j6tJ64?=
 =?iso-8859-1?Q?0BNbOKicmvqiU6wuqYje/EO5Srge82UYVwo3JqNsHgDPTFH0o50yoXfc83?=
 =?iso-8859-1?Q?VDMu5yiUD7/2jynvgJSPKwsllVKILSnUJ/hcUMUt7qCIiYlFnNil6c4q+e?=
 =?iso-8859-1?Q?jouWMCpscY0C/583cuHdsFM+l6ayR/mUuPWpyAiZOaLm/mdTEbnDJVeQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB8775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c61c4e7-5558-42de-e075-08db8c3c8589
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 11:52:56.8801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3PdYsuyDzWGH7IMeyFSjn2fn3bvIdabUvlVZzyCT8nCZgWufSalSX9PwdXFBOdniUASN+fah/zGWVm4cJQpI52ys1GIGX2fVgNjRPTVpFB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11960

Hi Rob,

Thanks for your patch!

> From: Rob Herring <robh@kernel.org>
> Subject: [PATCH v2] media: Explicitly include correct DT includes
>=20
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
> - Fix double include of of.h
> ---

For

>  drivers/media/platform/renesas/rcar_drif.c                    | 3 ++-

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
