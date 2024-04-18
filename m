Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35830156F54
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 16:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713457153; cv=none; b=By/AlWAnUsJWkr1id6n9RO32PL4B1FYlNVh3XkLzTS30Vva7/os+2Y4KBWWMjrqAO/Kc2vY//SNRfUc2OUBYiRksHI+dgJjUATcW/HlpJn3dvIQ4wrSZSQJo97BXwVQvHlkRT+5nQZK8ANA/MYpYQMH4B1u1RGesYS9Du9dJNSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713457153; c=relaxed/simple;
	bh=2K3hZcPlNgSiCsBF1htjIKpNIMlB2q5W+3OZ7ws8VWI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cf/1ZA7nsxDmqMgmfiX95mLEAvxbBqohIzHS9awxRJumWy7G2TC2iupdGlqVVHhjuVIAZ7BGXbRH3kk8nJ2gwQVHhRS16mkqIHQ4Ygs+4oYBCVWgBcvqQdB/hcyFoynvZ7YwwiLcrHlxBcqz7rHCodT5ogDqfU8lxwvXaLpyc68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BAD72F;
	Thu, 18 Apr 2024 09:19:39 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EEE43F64C;
	Thu, 18 Apr 2024 09:19:09 -0700 (PDT)
Date: Thu, 18 Apr 2024 17:19:07 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, ryan@testtoast.com
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h616: Add NMI device node
Message-ID: <20240418171907.27c0ef84@donnerap.manchester.arm.com>
In-Reply-To: <DM4PR05MB922973D047EB3BE774EEB943A50E2@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240414170424.614921-1-macroalpha82@gmail.com>
	<20240414170424.614921-3-macroalpha82@gmail.com>
	<20240415003740.666759d0@minigeek.lan>
	<DM4PR05MB922973D047EB3BE774EEB943A50E2@DM4PR05MB9229.namprd05.prod.outlook.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Apr 2024 10:59:13 -0500
Chris Morgan <macromorgan@hotmail.com> wrote:

Hi,

> On Mon, Apr 15, 2024 at 12:37:40AM +0100, Andre Przywara wrote:
> > On Sun, 14 Apr 2024 12:04:24 -0500
> > Chris Morgan <macroalpha82@gmail.com> wrote:
> > 
> > Hi Chris,
> >   
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > Add device node for the H616 Non Maskable Interrupt (NMI) controller.  
> > 
> > You might want to mention that the NMI pad is not exposed on the H616 variants, but on
> > the T507 and H700 packages.
> >   
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > index b2e85e52d1a1..1e066f3057be 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > @@ -775,6 +775,15 @@ r_ccu: clock@7010000 {
> > >  			#reset-cells = <1>;
> > >  		};
> > >  
> > > +		nmi_intc: interrupt-controller@7010320 {
> > > +			compatible = "allwinner,sun50i-h616-nmi",
> > > +				     "allwinner,sun9i-a80-nmi";
> > > +			reg = <0x07010320 0xc>;
> > > +			interrupt-controller;
> > > +			#interrupt-cells = <2>;
> > > +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > > +		};
> > > +  
> > 
> > I can confirm that this matches the manual, and the registers behave as
> > described in the A80 manual. I don't have access to a chip with the NMI
> > pad exposed or used, so I cannot test this fully, but Chris'
> > experiments with the AXP717 PMIC connected to that pin on on H700
> > board seem to confirm that it indeed works.
> > 
> > So with that small amendment to the commit message please take my:
> > 
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > 
> > Cheers,
> > Andre
> >   
> > >  		r_pio: pinctrl@7022000 {
> > >  			compatible = "allwinner,sun50i-h616-r-pinctrl";
> > >  			reg = <0x07022000 0x400>;  
> >   
> 
> Since the H616 doesn't have this functionality but the T507 and H700
> does, should I change the compatible string? It's all the same
> silicon die with just a different part number printed on it, but
> still...

I would stick to h616, since we use that for all the other devices. Also
the H616 *has* that NMI controller: I can confirm that the registers exist,
and I can trigger and acknowledge interrupts. So in the interest of
consistency: keep using "allwinner,sun50i-h616-nmi".

Cheers,
Andre
