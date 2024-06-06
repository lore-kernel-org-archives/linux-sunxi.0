Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19011003.outbound.protection.outlook.com [52.103.14.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225B3196DB0
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jun 2024 16:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717692943; cv=fail; b=sIyUKnckdtZgKvU8kObkAEC52H0xfZJHVq9Or5eDnvJObz0qRK+qnpD4SXPrMZBsVB8jXXzoM1IQvZCXyKjM3mIiNJN58gyVaHUjo4VQLcTynhFbrR7/ZP1JhCEm3Zeg0xmm1UmLqefmCMBVzpdUj/tP5Y8ArPLzWzboK4UOE8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717692943; c=relaxed/simple;
	bh=5wn3Q2/Ef0nvS8yEFvCEo1IjURTTuBozXRUxwiJGhWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GVlUrbX8ul22P6QbPrAyl0GcUPt8LQKsjF5dDBHsLX7LUcSS95OPRYQ4Porx03WxzUPHBnjH3sh/3TUvP5rDuXqhIKTGWI3lcuPuTWQsTO+1DNVJTUQngmgambMNWIkinEUDjYf54MlzxGAtFmdXTFyCVBrHGabYS/oQfMOea/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=YNaXV6Tc; arc=fail smtp.client-ip=52.103.14.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="YNaXV6Tc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XA9olBbKp9sHrKL5RsfEfzYpMyNOYDDsBknWY3HYIjrkvxQKl6UieoMD9Y9pkFiFEbGA/KbsS4mNMddc0GZYzzWkg1m4o4hW8gD2bn+3hqO/L4MWTBfzjW/QWTYOl7+pUU8tPciaBwMic4r3rz7ikINFvpilbKBdoeWbapAfxXMwQ0FGSf8xL5VqRZDZpvIGPL0Z2/9vviACB6V2qhpPagoQ2WXp1eVbh7r9LeCU2VFD8aKCmwOcR7rDb3C5r6FFSKjYag2N7FwdEZZ2AewxtYUR4tdjDmqwIzT/Imh/kXnkxuwx/0cebnYLopbhyANw0Yxq57Tws4u6AqF8Jit0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbEXpw2cYZGEKjpTxAc7P1fLQYtjU2U+uDYCyaCUoNs=;
 b=I2/0nAbya7cUp5x7iXUhPLHIRM+9qC49xIztLlplJYYV7hdSnkzIDe511K0Y2qDfK7LNhbgLundyJuOQQH8q23FCdXCuMoytXJ92e+aFFkFW5Br5rpY0PQsA5Le2WhBvuGcJFR1asEix8UwGyIh+nznK3+cO+meZ761DEmznDlF8yCozAT1jee1hXqLAzWpw4sYiys9nuV5MLv7Xyerw32me6M8iCizILMU06zeRns3z86sqtoxOjgPoQ5S7BtJzIZufFbTHl02A11pvyZ2JpWjNKJS+Jq7kCBxm7dA/lrKcr/sPUK8dzq3Nh/DY0qe9u8Q+uaajgFh2xIgXpCb+bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbEXpw2cYZGEKjpTxAc7P1fLQYtjU2U+uDYCyaCUoNs=;
 b=YNaXV6TcU9ShuqaGQSX5mAvKmCeK36YJmJFmzwyvaXtTqlimDgvs0MYFiMxLMT+DsUEpAbYJbjI1kifdjQ0EKIay4/ILSwNtMinM0CPsrGv061cP0Oe/+2F9E9wWUXTnay8DRYSSLPzIdDnAeJol/YXf5lvwfca5kgdjO+UqxmuicfZgO8Q6poANb6PozdkYeyaAc0P4wTWccrpbrf4HkP4cX/AJDQU4XehqyeC/kZOgLvDL+ZCdggN9uawLnIZtb12kzj8r+P1FVqXFjNxH06Mtu4BOxDk46T4FR35dQaHbPkCZt0LbuLJMG+01YwosjlDShyXW6esD1v0R9kpJ2g==
Received: from DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20) by
 SJ0PR05MB9301.namprd05.prod.outlook.com (2603:10b6:a03:44a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.17; Thu, 6 Jun
 2024 16:55:38 +0000
Received: from DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::d720:e9e5:929:c7ff]) by DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::d720:e9e5:929:c7ff%4]) with mapi id 15.20.7656.005; Thu, 6 Jun 2024
 16:55:38 +0000
Date: Thu, 6 Jun 2024 11:55:36 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, ryan@testtoast.com, samuel@sholland.org,
	jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
Message-ID:
 <DM4PR05MB9229B137C69F3B2D2A9F7B64A5FA2@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240605185339.266833-1-macroalpha82@gmail.com>
 <20240605185339.266833-2-macroalpha82@gmail.com>
 <20240606112614.5380b2d1@donnerap.manchester.arm.com>
 <20240606-ludicrous-unyielding-gerbil-e23f41@houat>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-ludicrous-unyielding-gerbil-e23f41@houat>
X-TMN: [36meTmRqYtN232OhbFHSWvWC/ywlzYiB]
X-ClientProxiedBy: SA9PR13CA0063.namprd13.prod.outlook.com
 (2603:10b6:806:23::8) To DM4PR05MB9229.namprd05.prod.outlook.com
 (2603:10b6:8:88::20)
X-Microsoft-Original-Message-ID: <ZmHqCO65tsl3sCTl@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB9229:EE_|SJ0PR05MB9301:EE_
X-MS-Office365-Filtering-Correlation-Id: 913e402c-8e78-412b-272d-08dc86497dcf
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1602099003|56899024;
X-Microsoft-Antispam-Message-Info:
	6lS5nhgG7qyHxEfis5iZtkbj3is34Rzy+DddQQESONu1hWyO2NHEdIwwXF6xTuXTlnHxEovU2D3SOe8RXtlF8my979pzBnc7HRLwVpGeYKVQj5dqMcNdUFRTGTEjk5BDxhe6JpaY+bsmvkd4XXqUTEK0j/WvOg/0wov05ZxhLB5YMjtgCLvSKPW3PFFh4bcqP8wRNk/DUBL4Kvo6AlNa0iH59YecQG/BwoUiR6iKj+Iyi/WlrAoKrWq5B6/kPbj8IAgLn3+BLsG93cT12KHwu2USHRSU6jrp1UrhvHG4vltYmmsnBKQGWvEv/MmMOidIBhPg8h2qZ+k3R1XI1vsxIorOi07e+DOBGQFE14jqJ23Wa617XqXytBOZReGGwInR29VVkz4OvJ7KC8mRqhMuOwim2qVQNOl0VFU1hBEnH433myb7KgGW2rWdcu+zr7D8Nta2+IW04L9x8K3n8M2Eae11iQmoRldQ+nVK7k2bntYoIlvrPMQN6uWACJHwluOAwGqFPMN+YrHXqC4UEdrM+wnD6q3IU5yFppMKWg4bUl3rKTLsozoe5+AOfWSYjLkqeHX6YQvliEtksPROwh869KKdFYQWc6y9repVmF4qO0k5mRjoDzReR7giSo/Z3QStZ3CIyZiW/OOexbXgvKkyIUyIf1DrJxOTFNuviMAg1i89ulfrtHpb3iC9lQ1ERoJImVj+sTwiAa/ytAWJIe4GSg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IPFffwS+jN8/DLHpjG3W7/9BtHnIwjSxQku4vKX0G/yQ/fgBiS/SkDz2o0N7?=
 =?us-ascii?Q?Irb0oECFcUS2TpMpCq2J+UD3aNVQIaXOwb37LRu8QFB84qDh9D47KFlHG5Nb?=
 =?us-ascii?Q?O/+l7LHIom/qanoadoFoq0KRVG3JZjS9O8xhrdq9Ml2Wfciapd+J17GkzHU8?=
 =?us-ascii?Q?LTPAIF3v5XPKr7vcHAIzDOuc129yrTY3lRu9pLxPvOlj2qCSOjds/G0V3HnO?=
 =?us-ascii?Q?0yUNNQFqFx5eRDWlnXqLK0PcmwKpEgI7yr4kIRxIe/freS+BL6u9v4dqeMyz?=
 =?us-ascii?Q?fv0ndjoKyAEsB9jz2yXKOqs2W8gZfQqlLt88kC0uURsGbGijgTvTIGZMxdqq?=
 =?us-ascii?Q?a9pFvKHsvp61YEbJHAlBuYWCu9tZZtiAWjN+zP1dU9dfYbTuIN9t1KNw+i2M?=
 =?us-ascii?Q?OYSRKNWUnXE/bbV4o/pJkW+LfV4TPW5PA7Mz3t44ouP0ohARU061fAFyNTtv?=
 =?us-ascii?Q?78vv+XO2rEDTN4M2Mioz2a5NS2ON4gCwtB+rXrJ0K8UAbIJwU4ffpzc7R8Kr?=
 =?us-ascii?Q?VzzA89U2QYop6c+FbUlfBUxjZ7DwMNY0qYT+n3VD0QMNtgHkLD1yf0PVI/+q?=
 =?us-ascii?Q?uXGegA+er6Lei4aghNQcHctyIcia3AvKL7wLjyacWKVmRDT63azZ7BhsvizW?=
 =?us-ascii?Q?6vtvlQcRyEI42AeV9Hn27fadzcEalhfi4l86Ycb/iinGjZK7yMe9SoJHdi0g?=
 =?us-ascii?Q?LVUTy6sTw78sHp2x4SXVnNqIZoU+SL4aUeJja7kZiQKetaEf4nWvYToJN9vi?=
 =?us-ascii?Q?LLWuVR7Bs53ULdFaKrsw2pv18IE0Kd+zsNKFO1wkAZ4VfLBUQAEaCZeXYicw?=
 =?us-ascii?Q?if8CEczLP4HtDCxOLnTSod/WBQl18Am9BCpwvlbea7kEaRnj3NBtyKtzlXSv?=
 =?us-ascii?Q?/oLtcq9bVWZK+C78aXxbERfeYYtQpiPxMLYhjfPkrkiBqKO+/Kvhauwk46xV?=
 =?us-ascii?Q?0QVpuoShT8YktxYL4yxO1fJKGj8Qq1afnG01X9anPXKpRzidskytLfZWNVW5?=
 =?us-ascii?Q?nZcGb4Cgjd3xJ/oY8kwmy0cFN6lhJJjTM+i+TtFtYR2YTK3IEQWUkrkaHdnQ?=
 =?us-ascii?Q?cKQaYqOulLjD6UYano1+C71hoSnWxIfHciGGJeJ6kf+06O6yn1e4b2fAHAYV?=
 =?us-ascii?Q?VIUraJIbS00QF+0LgHxEEeUhVOQ3ry6BuY9eqb6xsqeSiyd91eNpGLaOOr3a?=
 =?us-ascii?Q?vX1p9O7TAsxlYUXvcHp4Hhvvl+Rwy1sURSRmwx1YjPnbZTJ5/zHPShr0taE?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 913e402c-8e78-412b-272d-08dc86497dcf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB9229.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 16:55:38.3921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB9301

On Thu, Jun 06, 2024 at 01:30:45PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Jun 06, 2024 at 11:26:14AM GMT, Andre Przywara wrote:
> > On Wed,  5 Jun 2024 13:53:38 -0500
> > Chris Morgan <macroalpha82@gmail.com> wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > Add the Anbernic RG35XXSP variant device and consolidate the Anbernic
> > > H700 devices.
> > > 
> > > The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
> > > clamshell form-factor.
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  .../devicetree/bindings/arm/sunxi.yaml        | 24 +++++++------------
> > >  1 file changed, 9 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > index c2a158b75e49..1ae77e5edf9a 100644
> > > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > @@ -51,25 +51,19 @@ properties:
> > >            - const: allwinner,parrot
> > >            - const: allwinner,sun8i-a33
> > >  
> > > -      - description: Anbernic RG-Nano
> > > -        items:
> > > -          - const: anbernic,rg-nano
> > > -          - const: allwinner,sun8i-v3s
> > > -
> > > -      - description: Anbernic RG35XX (2024)
> > > -        items:
> > > -          - const: anbernic,rg35xx-2024
> > > -          - const: allwinner,sun50i-h700
> > > -
> > > -      - description: Anbernic RG35XX Plus
> > > +      - description: Anbernic H700 Handheld Gaming Console
> > 
> > So that's certainly an interesting optimisation, but so far we were using
> > one entry per device, it seems.
> > I am not entirely sure what the purpose of this file is, exactly: just to
> > document the compatible names
> 
> That was the initial intent, yes.
> 
> > to reserve them and avoid clashes in the future?
> 
> And I guess it helps with that too :)
> 
> > Or also to put some official names to each device? That seems to
> > somewhat overlap with the root node's model property in the respective
> > device .dts, though.
> 
> I guess it's a fair criticism. It would be hard to collect all the
> compatibles without describing which device they belong too though. So
> yeah, there's some redundancy, but removing the descriptions entirely
> would be worse imo.
> 
> > It would be good to clarify this, and establish how to group those devices.
> > I mean technically we could for instance put *all* H6 devices into one
> > entry, using the same scheme as below.
> > Not sure that's desired, though.
> 
> I don't really have a say there anymore, but I always tend to prefer
> consistency in documentation as a user. Even more so since that kind of
> categorization tends to be very subjective and thus super inconsistent.
> 
> Maxime

This is how I was asked to do it in the rockchip.yaml file [1], but I
know different teams have different style requests. Just let me know
what you prefer and I'll get it done that way.

[1] https://lore.kernel.org/all/20240123212111.202146-3-macroalpha82@gmail.com/

Thank you,
Chris.
