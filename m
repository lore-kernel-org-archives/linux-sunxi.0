Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F4D39B944
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 21:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141325; cv=none; b=JxyjIFt3SIaQknVO8nRa/+2hfrh3omy0SuQ1jXCqJHVa8C40WRFPoQFmlWYqu/XYUxf/KaXfaJkRvcLDC/0Wq6reK7paML1qsBNTugG+QBrFQMfXEPnaNAL8DFeIfIpH9tEvEXo1LjkoqR6jOAUVRjjU3KyUmOk/icbpzNoX6rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141325; c=relaxed/simple;
	bh=YD8ys6Cvuh2mZbnirI1fsh8QprXFw+273S/FOd5w6Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uw0lo+47IiUc2j8c87WvXbWsTtwEbzZZEDiJMU+gEANnvDqHgoxgaZySYSqSm8IeQ/8M521mtN/khOpMihJbRX8Jp3X73lpoQVRcFwb307Mo1JDpSeuD9AZgABKpX3AmuZfe2ksqkFSlXub+GvtxKJlASu82JTPY01J8rFnp6IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XxmKvM1K; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XxmKvM1K"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D4E832AC;
	Mon, 18 May 2026 14:55:17 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF1313F7B4;
	Mon, 18 May 2026 14:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779141322; bh=YD8ys6Cvuh2mZbnirI1fsh8QprXFw+273S/FOd5w6Kk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XxmKvM1Kytq9wmpk2HPJ0TY3hWfXQD4nJPkDZj7nb3h9B23qMrJU8MTQGMxMJJ9pY
	 uZRd7JxzqNLCnP+gCI74gIfE1GKZSZN3XHtrQTGvRWaTo0bUuQ6FbLZm3+WrE6zsca
	 whJVdCaKYHw4idToRhdsK05umXIIlpYXakZRt0tY=
Date: Mon, 18 May 2026 23:54:32 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
Message-ID: <20260518235432.07537260@ryzen.lan>
In-Reply-To: <04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	<20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	<agr9m_tidBr6Cu2h@collins>
	<04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 May 2026 22:05:25 +0200
Alexander Sverdlin <alexander.sverdlin@gmail.com> wrote:

Hi Paul, Alexander,

> thanks for the review!
> 
> On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
> >   
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > > new file mode 100644
> > > index 000000000000..65b094f30bf5
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi  
> 
> []
> 
> > You should add:
> > 
> > 	chosen {
> > 		stdout-path = "serial0:115200n8";
> > 	};  
> 
> I actually have it in .dts, but it's theoretically possible to deploy
> the core board in a way that serial0 is *not* a console, so the above
> probably will not be valid in all cases in .dtsi.

I am with Alexander here, to me the serial port belong into the
helper board .dts, not the SoM .dtsi.

> 
> > 
> > 
> >   
> > > +&reg_dcdc2 {
> > > +	regulator-always-on;
> > > +	regulator-min-microvolt = <500000>;
> > > +	regulator-max-microvolt = <1300000>;  
> > 
> > Should be:
> > 	regulator-min-microvolt = <900000>;
> > 	regulator-max-microvolt = <1300000>;  
> 
> 0.81..1.2v according to A133 Datasheet Revision 1.1 Jul.14, 2020?

Do you have the CPU OPPs for this board? Do they slightly
overclock/over-volt the core? We have seen this for some other boards.
But you could go with the safer 810mV...1200mV range, and we adjust
this when needed.

> 
> >   
> > > +&reg_dcdc4 {
> > > +	regulator-always-on;
> > > +	regulator-min-microvolt = <500000>;
> > > +	regulator-max-microvolt = <1300000>;
> > > +	regulator-name = "vdd-sys";  
> > 
> > Should be:
> > 	regulator-min-microvolt = <810000>;
> > 	regulator-max-microvolt = <990000>;
> > 	regulator-name = "vcc-usb-sys";  
> 
> I'm a bit puzzled here: datasheet says 0.9..1.0v
> and it has no "Typ" value, similar to VDD_CPU, but
> VDD_SYS is not part of OPP tables, so who is going
> to adjust this? Or shall it be just
> 
> regulator-min-microvolt = <950000>;
> regulator-max-microvolt = <950000>;

There is indeed no exact value to be found. Just go with whatever the
BSP used: either it's the PMIC reset value, or it's adjusted by boot0.
If you have a BSP kernel booted, check the value of this regulator on
the Linux prompt, then use this value. Chances are it's indeed 950mV,
as used by the Liontron board.

> 
> ?
> 
> >   
> > > +};
> > > +
> > > +&reg_dcdc5 {
> > > +	regulator-always-on;
> > > +	regulator-min-microvolt = <800000>;
> > > +	regulator-max-microvolt = <1840000>;
> > > +	regulator-name = "vcc-dram";  
> > 
> > Should be:
> > 	regulator-min-microvolt = <1100000>;
> > 	regulator-max-microvolt = <1100000>;
> > 	regulator-name = "vcc-dram-2";
> > 
> > ALDO2 is the main DRAM supply, this is the second one.  
> 
> Core schematics mentions 1.1V/1.2/1.35/1.5 on this rail...
> Currently U-Boot has CONFIG_AXP_DCDC5_VOLT=1100, but potentially
> this is adjustable, right? At some point LPDDR4 chips they
> are soldering today will be unavailable. And in the current
> market it will happen rather sooner than later...

We don't support multiple DRAM types for one board, really. If they
switch to another DRAM type, we will need a new DT or some other way to
adjust this (potentially runtime patched by U-Boot). But we can address
this when we get there, so just set the 1.1V that LPDDR4 requires for
the existing boards right now.

> 
> >   
> > > +};
> > > +
> > > +/* DCDC6 unused */
> > > +
> > > +&reg_dldo1 {
> > > +	regulator-min-microvolt = <700000>;
> > > +	regulator-max-microvolt = <3300000>;
> > > +	regulator-enable-ramp-delay = <1000>;  
> > 
> > Should be:
> > 	regulator-min-microvolt = <1800000>;
> > 	regulator-max-microvolt = <1800000>;
> > 	regulator-name = "vcc-pg";  
> 
> Do suggest to drop vendor's
> 
> regulator-enable-ramp-delay = <1000>;
> 
> in all cases?
> 

I don't see this used in many other mainline DTs, mostly it's just for
some picky peripherals (PHYs). So if that works stable for you without,
I'd drop all of them.

> > > 
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > > new file mode 100644
> > > index 000000000000..ccbca5d0a40c
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts  
> 
> []
> 
> > > +	aliases {
> > > +		serial0 = &uart0;  
> > 
> > The is best added to the core dtsi.
> >   
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path = "serial0:115200n8";  
> > 
> > Ditto.  
> 
> But it only physically materializes in Helperboard, the carrier.
> Potentially this one can be left floating or used for something else.

As mentioned above, I agree on this staying in the helper board .dts,
and it not being moved.

Cheers,
Andre
