Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2014.outbound.protection.outlook.com [40.92.19.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A969679F7
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 15:11:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ezfy2omof65oNM45Dva1L5RXlC8q4JJ0pCUeMZE64nqPziEku9JYfFjLEtna2tvR3uMtOkxvaSzmWpqOCOcNQ2i1er8/xlk6YBjG5pEoPwHeaKscJpLSZvS4hdJxNbZszZo8jozLXGbY8qNF8omdLou70L6Aw07C2rBS+JZ0xKqE+KcRdHGtg2qXijisxnujiX0Sj0+sytjEN0YbtNBJ02o7aBWOjeSDHjLRAeUTC1q0e/lpfl/Kvkvq9+cZjmaIPmjR/tAcjdzxcqajAZao2zvab87aKAZuyFX2uPLUSzmFjFUKsnRFXGBMMa0Q7A7kBHgvnGAAOAqZWNFJJGdaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYedrmrE8aKYPPI9lA1k2kXsxlWVbjAAL4xtHDcQsvo=;
 b=ntfOcDTKzamJ0CQheYU9b1Ggltp4+GrWZoxRzOpymg0Lbgfb5hGlI9AQ2CwaE+E0ZwAx+OeXFFJGWK9VTbenTuwrCY1lV5i7OalL8xPR0Fd8Otlbch61P6pa6DBVR4KNeYRQE8ly0CXT3njwEcxHsIozOymdLLPzSC8RadIewGJ6nOx074u9z+W0VhzL1LVAQv8qP8b5+uefiPdH/VhZdxkm417nnGCDVPy4WoztFwRb+1yGcWqsE4l1trr+jLfg56+ykJSJ6FJXfE3E6Njq/rc92lWsjEUxYQqrDWkvZN2mOPpp9YUmFi1jbjo8/y6WLGKi8zQoY3KuiydQb5Bhpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYedrmrE8aKYPPI9lA1k2kXsxlWVbjAAL4xtHDcQsvo=;
 b=UL18QIrFbgBf5Gh9sQJ9hMq/hLnQRKwCK0lOs1U+RC3XY9GeFALK9FVUPUayJVbA3WOI0sVKo+iSlbh7KYdxuN44U00wV8jG7GEu8GQjW629b2RWiQq6UsQKFb3jkKIZT1zFhrGMEN/JT/OUP0HK7jHyLByE2wo4SJxFfHvuBNJUtuZ4YxLEmuYSgoMOwTT6AMqIpTatTlSXsg5izMwcKUu68AzMAdK371+RDzQj43nhXO6YORVJZGSeltWOvR1vG1lxruSeGpQTwloXCHZh0NwVga+pIjuZRFvmwE7OpZwD7rHaUW8mcS93vuRSM2hgXqGcHFbQdlGSJ0k9NbHzSA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by MW5PR06MB8908.namprd06.prod.outlook.com (2603:10b6:303:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 15:11:44 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::20a7:a1ca:1ef2:ec9f%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 15:11:44 +0000
Date: Mon, 21 Aug 2023 10:11:40 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, mripard@kernel.org, me@crly.cz,
	uwu@icenowy.me, samuel@sholland.org, jernej.skrabec@gmail.com,
	wens@csie.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH V2 2/4] arm: dts: sun8i: V3s: Add pinctrl for pwm
Message-ID:
 <SN6PR06MB53423E0C8F00385E1339A18BA51EA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230819032105.67978-1-macroalpha82@gmail.com>
 <20230819032105.67978-3-macroalpha82@gmail.com>
 <20230819230126.7a9d92df@slackpad.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230819230126.7a9d92df@slackpad.lan>
X-TMN: [2zBe98AIYyW+apKCx6SVJloiR2Bv3pL3]
X-ClientProxiedBy: SA9PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:806:6e::17) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZON+rJiUa+0r8Jk0@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|MW5PR06MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5984e4-019d-4228-3227-08dba258ede4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/GSy7Q9fVzgl4q+jCjeoilDiklY50mbUfVvXV1mH8Fr8bDFH2tFIMDCDuAR3IiOR6QrrL0GPjnRbyR+DfawS4tBAed+pVt+0qNe0cnCZGxg5PMxI4oSMRb+yeEHFlikyhb263AKzDi/sIJV2sXxkEc4+G+h8lmxSOXCsMRgUjOnG6fsQsZCPDEQJ2HN6szCOfxjGE9OHwwuPy4xNJoVZD2VYWrSWlSootECvTu4wYB3DJl9dKn1aI52IeJi0wZm9CpfTskvfbZ9kZPsaqPTbSkjn8nlA8E1gHV5Lji2fv4LOL81DK11Ny3r4jxPHxAY8XyVt9RhK3F9qlwLatL5BEs3rqYPwZJfewSsrWP4lzozAIvQr2YQicrEPQ1CV9Jg3PGo+ERHHTDw+ezx7lWQL6jOyjORRSnt8WIMXySDri80P92GVxm9oI7aCnX80zASQ65hpqpDjmtB5BS7Rp6dnFq2N38TAUwx/sgLDHGLqUTl0yy3v8PZSo/p89GwPe6//ukPkvN9zjMl+mNwAQybL/14sN+/iCZww9XMRQgXpAEYWhiivWKBFyr2FSYNByHky
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9QtpLeZXvwpqN3hl/J/FMuwY5hgvsMyK82bVWiT7y3N5Hg4dzUE/MHiAgYeL?=
 =?us-ascii?Q?YosX9FLjrOERTEkVOsL3nNU4iOMnrq9cXTDohFb2WvCSpYPZnLY0+fhQarVn?=
 =?us-ascii?Q?V/2J8G61RWCnt/Zavdd1HQHLjTEx8qaIWyfSyph+B/13DlM7MkxRMwdQjUUL?=
 =?us-ascii?Q?F3JN1rqhQrTt/DjrJhynuTHtJIKt0Htv4h7nOQnZMA7a5E0HVYH3ULOXadi4?=
 =?us-ascii?Q?ibzTEr5Avi4zOh1Dh5RG19vs9LKTbSwlVIpNN3ChL4LPfO1KpYC3qJRKcI62?=
 =?us-ascii?Q?UIBASfq9AmdCFyXuZRy3FQ30fMUZEp4Q8DuWbrLnx5NzZxAox2mOUv42I/mY?=
 =?us-ascii?Q?NoXc6TozrF33UUk7iZhyp1ncsmaiGK95OdfTUoSDcjjLepH/Rph5hsr2ttTv?=
 =?us-ascii?Q?nc8s3adpFdNz998SZmLQNvaamZSMLJl0xmOLEn8UTfc0g8L8MCijpFuDtiAs?=
 =?us-ascii?Q?jCxdhOmFs9Mg+2CSd83/F4II+O1dbG+2w3DtQrVvsZZ5DFQYJe7t9Nc7KbNj?=
 =?us-ascii?Q?DEvNInbCR4GHOcwhB4pJ+sCm+1F5fwFIJ0Ux6X2nMHBuJFDUrrjLz73nQUVo?=
 =?us-ascii?Q?kRBWID2N3lkgl2j+XiaX2IlPyHPAJAe2YY7h69cUKBtbW37YxlsLlZnqCMkw?=
 =?us-ascii?Q?dBmdl0xyW8FYFZPI83Uee3vN1x5r0SxSkzjpN2L4YDe2JZTC3VPZle0/1uCa?=
 =?us-ascii?Q?7ltVEjt2aRXNdopL2EYCiXWlOi3q/2+wkvOAEenR0j//uIS2ctXSMlFKm3KK?=
 =?us-ascii?Q?Yo+r7t6of0oX4/FM3sY5aYFhVPWhsGzmC4byhO3etK/MHzLe1zjOfcftaX6A?=
 =?us-ascii?Q?augW750A9qJUkq8Eev0kYNBl933XK8VfVLvNZ6rY7qgR1n7vmKUEGV2puFNc?=
 =?us-ascii?Q?DvhgNLESaI1Pr44Hj/svw+M/H87AeS0hzdaGnuTt+Z1bRnDwLYW0pdsU0ppm?=
 =?us-ascii?Q?zCs1UU8di4KRWVY24NdMuG7WZlXomDHhqps4MEyne7YQ+9ZtRK2kYboqQJt/?=
 =?us-ascii?Q?hEQOU1KQml8QWDHcpdOI7g264wVdJ94NR2KgNHpKCgvR8uJvuAI8VpKTqL1G?=
 =?us-ascii?Q?7++ukJGI5TWhmg2f48r2yTariFn46oU7RLN80S3nR/oxivm6U6vFqje3OaiS?=
 =?us-ascii?Q?SSdipDU6cWovuWWqTlz9SOS6GpEQLw96rBLC9M14SB8RbJsFpkBt0DmYkRpR?=
 =?us-ascii?Q?B+4QxnpiMw4F6DSP3qmq443rvnIQKnFg+vD1kFIfqxvJnfexi1goYlvff0U?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5984e4-019d-4228-3227-08dba258ede4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 15:11:44.0247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR06MB8908

On Sat, Aug 19, 2023 at 11:02:45PM +0100, Andre Przywara wrote:
> On Fri, 18 Aug 2023 22:21:03 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add pinctrl nodes for pwm0 and pwm1.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > index 2b76a5b8ec19..3276b3b5de19 100644
> > --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > @@ -414,6 +414,18 @@ mmc1_pins: mmc1-pins {
> >  				bias-pull-up;
> >  			};
> >  
> > +			/omit-if-no-ref/
> > +			pwm0_pins: pwm0-pins {
> 
> Since conceptually a certain PWM only drives one output pin, I see
> other DTs using singular for the names here, so:
> 			pwm0_pin: pwm0-pin {
> 
> The pins and function names match the manual and the driver, so that's
> correct.

Okay, I'll change the name from "pwm*_pins" to "pwm*_pin". Thank you.

> 
> Cheers,
> Andre.
> 
> > +				pins = "PB4";
> > +				function = "pwm0";
> > +			};
> > +
> > +			/omit-if-no-ref/
> > +			pwm1_pins: pwm1-pins {
> > +				pins = "PB5";
> > +				function = "pwm1";
> > +			};
> > +
> >  			spi0_pins: spi0-pins {
> >  				pins = "PC0", "PC1", "PC2", "PC3";
> >  				function = "spi0";
> 
