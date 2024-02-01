Received: from a.peacevolution.org (a.peacevolution.org [206.189.193.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E0F4417
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Feb 2024 01:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.193.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706751411; cv=none; b=G7zHM3KTN2WqOMSwZlRPG+B2lIPFToCTtwYhBu63D5XUFaIamGkRLVYNMJctX47cXOhfVMBT9LBN5D+I2nAqROUYk+rD56QATLr1By2T1r+5X/8v6sfrM97E4aK+OEUPN2Pl0TUOnZ2B4kqVcm7br1lA0RP7MwjAQvWy0FakKp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706751411; c=relaxed/simple;
	bh=FNd+cBC8I6vC/ro/gYb55xZFXFPkiMNYkcnk7OWZ0Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GU7JVblHB4dZomIZYadqNbyxxVl0SqNVuAK0F3zTHZdjLzxcBAxG2xY64T193WIuyW0hXZCnkwvtKSrNn39JUOcNYcuPjqPrser5XgZYEcjxl30UQdFUFbhwyfJCCdxwmkUuvJcwGrJvzVGIIAO5AlJidWVN8kXdwovaF4Ch7Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org; spf=pass smtp.mailfrom=peacevolution.org; dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b=WEZg7y7e; arc=none smtp.client-ip=206.189.193.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b="WEZg7y7e"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 7930B4661F;
	Thu,  1 Feb 2024 01:36:48 +0000 (UTC)
Date: Wed, 31 Jan 2024 20:36:46 -0500
From: Aren <aren@peacevolution.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, Miles Alan <m@milesalan.com>, 
	Ondrej Jirman <megi@xff.cz>, Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/4] arm64: dts: sun50i-a64-pinephone: Retain leds state
 in suspend
Message-ID: <sbcg74hktwv5x7hookeb4su27xut7swarl3d5mbs3i5cqxtq4g@4evugu43ctiv>
References: <20240128204740.2355092-1-aren@peacevolution.org>
 <20240128204740.2355092-2-aren@peacevolution.org>
 <4892315.31r3eYUQgx@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4892315.31r3eYUQgx@jernej-laptop>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1706751409;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references;
	bh=YSppDkR8PnytdKdGLPZ10vxgzIiHiNL8+3cRAaam16Q=;
	b=WEZg7y7ewDgh4/WmhTmPmLBuwIm+JJMAW4goBLZJzr4/eyOtc9w3/CDsyBKt8Y4p0Fn9sf
	OnVp10PhOJrthHM65fbrEDxKHQ8PdlQUBDoxSPtlMMD1GU5DNOKMWpi79KKtYuPwZCNKvJ
	fdBy61LU8P7x2X7CPZVKgZn5JS1dptw=

On Tue, Jan 30, 2024 at 08:06:24PM +0100, Jernej Škrabec wrote:
> Dne nedelja, 28. januar 2024 ob 21:45:08 CET je Aren Moynihan napisal(a):
> > From: Miles Alan <m@milesalan.com>
> > 
> > Allows user to set a led before entering suspend to know that
> > the phone is still on (or could be used for notifications etc.)
> > 
> > Signed-off-by: Miles Alan <m@milesalan.com>
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > Signed-off-by: Aren Moynihan <aren@peacevolution.org>
> 
> Where is patch 1 and possibly cover letter? Please resend with all patches.

Oops, sorry about that, I'm still getting used to get_maintainer.pl.
I'll resend this properly when I have time this weekend, until then the
patch you missed is available at
https://lore.kernel.org/lkml/20240128204740.2355092-1-aren@peacevolution.org/

> However, this particular patch is:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thanks
 - Aren

> Best regards,
> Jernej
> 
> > ---
> > 
> >  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > index 87847116ab6d..ad2476ee01e4 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > @@ -43,18 +43,21 @@ led-0 {
> >  			function = LED_FUNCTION_INDICATOR;
> >  			color = <LED_COLOR_ID_BLUE>;
> >  			gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
> > +			retain-state-suspended;
> >  		};
> >  
> >  		led-1 {
> >  			function = LED_FUNCTION_INDICATOR;
> >  			color = <LED_COLOR_ID_GREEN>;
> >  			gpios = <&pio 3 18 GPIO_ACTIVE_HIGH>; /* PD18 */
> > +			retain-state-suspended;
> >  		};
> >  
> >  		led-2 {
> >  			function = LED_FUNCTION_INDICATOR;
> >  			color = <LED_COLOR_ID_RED>;
> >  			gpios = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
> > +			retain-state-suspended;
> >  		};
> >  	};
> >  
> > 
> 
> 
> 
> 
