Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE4A3FFD
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 00:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772669756; cv=none; b=Jt/m1VegNsGdBzcDGJYXMC6qHcfK96LzPQTNWToeWaQprn4S9RCB8rt2RCMZaba3GsozruCSQRWg3dEwJsFAklBiw8M+B/3RI2R8/knzgfRfXdOPlYABhyp9np39VC2ddRSTXvKj9Ya78/rgyPwj6R+/M9DFbeIPgQKb+Zqno0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772669756; c=relaxed/simple;
	bh=4mR/9KpKWoTBbNEf/LhaL2JbInadCOam1v9oY17Zitw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlpMhH6pUZ1icTQETzV/5+D1cmlPgyr7+iNDJEUdbyDrhQOtl2n3H1Z+xc8VshC09nqM0sT7eBvlGXPo/9D36VyTdnG7KkaIXVFrbrK8BlDXULfXWLUKVp2V6zNWrFCMXCVLWqj3dDLTz6dvi15ZLbfYGm+YXs5NhXbLCvXpTQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOvSYlFt; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOvSYlFt"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cb3e0093e3so714785085a.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 16:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772669755; x=1773274555; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g0JXk9p5V1fGz1+f2197Ws9DW9uXumXoOAEt9xBTer0=;
        b=JOvSYlFt8Pi7X/pKF9uktyp4IpDaiqI4fs/7VTIHswZJrb/R4bM8h0NATTbt2dBO9W
         Z4cPQl3B1+zUMEooKLJ0jkEYs9/YGpGq7ovYuS2dUCrdBRCHpmc9nG0SpEmWr4Gtr6Ym
         /yY+wypiD1RaQi//Z6vQS6eV78Tg8f7RaAHVYdBu64XYQ13S/hYcIBSDVf0SefcPYGgb
         mZFXgnj9arr/9vXgPq+10Pl08T3TNXxLuSugQ/WNMXKlGCRuMb6zv9v6U9CYysAKlnCX
         Zcm0t7u1rMqvHM38ARkfM9N+wHyEhrRZQtnM2wxrLBcOC6w5JyjURkv5u6MOrIddqzcI
         Tkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772669755; x=1773274555;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0JXk9p5V1fGz1+f2197Ws9DW9uXumXoOAEt9xBTer0=;
        b=nIFvJB90I3kahyceOra9dDQgBRfjA5Eg6W4n5Obed6WmDygA7WLOjD5lhRCXsYY9bI
         q3kqiCJyyZm9ebVajNDHqNUClElBFHdXdzrcGwzlUfYCrYZALFPe7/q/siOyOwjwVQ35
         at6ppQKElu9TKq8ruI3FRPQPytgKBCr4QKA76X10u8upw8uzcPPVJn2u9DLrgpGOGxiK
         bGk++zwfYqh7gUz2xUiOgajxlOmgzNwGHV0fq9e+p9nSUvaq4LocxDT1Gxf3DRnzg5fW
         GbN+dKPBtjcDdDT0MR+LYS75upyqxeInXII4O8lpqlN/D3Pkggfb7huOGZDvpZsqEdst
         kH5g==
X-Forwarded-Encrypted: i=1; AJvYcCVAZjkyIr8XmX7QHmwdUALU+Zzh2lvplvRHg8CAvcgSBK8Y+uG9wGz7ncILwSZWJtlCktpqUW23u+vjRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxV6hIEVXuGN5KAEO0LhFDV11/1tZPH+Qmw+9F5u48lyQklsqu6
	bpvWI1cMDQvnce7ASPYGVvYMtGR08Y0V/FO7d8d/K2tLNog1isbVwtNn
X-Gm-Gg: ATEYQzz6VPc2OLadoBzRRLo2OBolDL72B43sM5xNCPOs1OFktmXWmqSOY17aZ5siVGN
	IEDj1MCxcwVPAcVQIw27lgwnp96SO8sxYWItq0FdVIPMJoWhO7ROYsLAdwHefyDNk8PyJo9CXwd
	lJ6nXFc3gDMBG+GWXew7OBgZs8tUlwFwIZDvZ71CSYZMyWw+kjrARlPTRnd3ev9Lqef1klfww/z
	DR9Nk8i0vWnDNgul59Z9v2l7VX5cdUoHEsJLYYR3UFeugRcQchxvvQ8vY21h26IlUzQPqbhgB/q
	nLHwAKiup5cRj+ihfLy5LOg74Y+2XE/ChreJHz+Lyyo46gnfz1cHYhHbWy6j/R+UltIn8cn7QCt
	8BgU2r8/v/vLDgTYIPCNena1LIPEbFoV6UVT/tBSbr5bnDwckbd++0GTyIw1FsvVZIYH5Jr0Nvz
	v37BCZlSc5nne7UBJFa3mFhZFYnrU=
X-Received: by 2002:a05:620a:4405:b0:8c7:fdc:e872 with SMTP id af79cd13be357-8cd5aef1d4fmr466089985a.19.1772669754629;
        Wed, 04 Mar 2026 16:15:54 -0800 (PST)
Received: from c67c70be8272 ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf7319bdsm1775385585a.43.2026.03.04.16.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:15:54 -0800 (PST)
Date: Thu, 5 Mar 2026 00:15:51 +0000
From: Yuanshen Cao <alex.caoys@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] pmdomain: sunxi: Add support for A733 to Allwinner
 PCK600 driver
Message-ID: <aajLNxYvDrpT-qqC@c67c70be8272>
References: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
 <20260304-b4-pck600-a733-v1-2-2f54efdb8cc2@gmail.com>
 <CAGb2v64n_8RyWDieUKvbpkTikipB9ZvqEscYRRLowe+rvaJKCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64n_8RyWDieUKvbpkTikipB9ZvqEscYRRLowe+rvaJKCQ@mail.gmail.com>

On Wed, Mar 04, 2026 at 10:33:23PM +0900, Chen-Yu Tsai wrote:
> On Wed, Mar 4, 2026 at 12:44 PM Yuanshen Cao <alex.caoys@gmail.com> wrote:
> >
> > The Allwinner A733 PCK600, similar to A523 PCK600, is likely a
> > customized version of ARM PCK-600 power controller. It shares
> > the same BSP driver with A523. According to the BSP provided
> > by Radxa, unlike A523, it doesn't require reset.
> >
> > Make reset optional in the sunxi pck600 driver and add support
> > for A733.
> >
> > Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> > ---
> >  drivers/pmdomain/sunxi/sun55i-pck600.c | 53 ++++++++++++++++++++++++++++++----
> >  1 file changed, 48 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/sunxi/sun55i-pck600.c
> > index c7ab51514531..8f9fdc3915bd 100644
> > --- a/drivers/pmdomain/sunxi/sun55i-pck600.c
> > +++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
> > @@ -52,6 +52,7 @@ struct sunxi_pck600_desc {
> >         u32 logic_power_switch0_delay;
> >         u32 logic_power_switch1_delay;
> >         u32 off2on_delay;
> > +       bool has_rst_clk;
> >  };
> >
> >  struct sunxi_pck600_pd {
> > @@ -151,9 +152,11 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
> >         if (IS_ERR(base))
> >                 return PTR_ERR(base);
> >
> > -       rst = devm_reset_control_get_exclusive_released(dev, NULL);
> > -       if (IS_ERR(rst))
> > -               return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n");
> > +       if (desc->has_rst_clk) {
> > +               rst = devm_reset_control_get_exclusive_released(dev, NULL);
> > +               if (IS_ERR(rst))
> > +                       return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n");
> > +       }
> >
> >         clk = devm_clk_get_enabled(dev, NULL);
> >         if (IS_ERR(clk))
> > @@ -193,7 +196,14 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
> >  }
> >
> >  static const char * const sun55i_a523_pck600_pd_names[] = {
> > -       "VE", "GPU", "VI", "VO0", "VO1", "DE", "NAND", "PCIE"
> > +       "VE",
> > +       "GPU",
> > +       "VI",
> > +       "VO0",
> > +       "VO1",
> > +       "DE",
> > +       "NAND",
> > +       "PCIE",
> 
> No need to change this part.
> 

Yes, I agree. But since A733 has more pd_names, that line will be too
long if we stick with one line. And we also used this format in
sun20i-ppu. It might make more sense if we align with ppu. Please let
me know what you think. Thanks!

> >  };
> >
> >  static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
> > @@ -206,7 +216,36 @@ static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
> >         .device_ctrl1_delay = 0xffff,
> >         .logic_power_switch0_delay = 0x8080808,
> >         .logic_power_switch1_delay = 0x808,
> > -       .off2on_delay = 0x8
> > +       .off2on_delay = 0x8,
> > +       .has_rst_clk = true,
> > +};
> > +
> > +static const char * const sun60i_a733_pck600_pd_names[] = {
> > +       "VI",
> > +       "DE_SYS",
> > +       "VE_DEC",
> > +       "VE_ENC",
> > +       "NPU",
> > +       "GPU_TOP",
> > +       "GPU_CORE",
> > +       "PCIE",
> > +       "USB2",
> > +       "VO",
> > +       "VO1",
> > +};
> > +
> > +static const struct sunxi_pck600_desc sun60i_a733_pck600_desc = {
> > +       .pd_names = sun60i_a733_pck600_pd_names,
> > +       .num_domains = ARRAY_SIZE(sun60i_a733_pck600_pd_names),
> > +       .logic_power_switch0_delay_offset = 0xc00,
> > +       .logic_power_switch1_delay_offset = 0xc04,
> > +       .off2on_delay_offset = 0xc10,
> > +       .device_ctrl0_delay = 0x1f1f1f,
> > +       .device_ctrl1_delay = 0x1f1f,
> > +       .logic_power_switch0_delay = 0x8080808,
> > +       .logic_power_switch1_delay = 0x808,
> > +       .off2on_delay = 0x8,
> > +       .has_rst_clk = false,
> >  };
> >
> >  static const struct of_device_id sunxi_pck600_of_match[] = {
> > @@ -214,6 +253,10 @@ static const struct of_device_id sunxi_pck600_of_match[] = {
> >                 .compatible     = "allwinner,sun55i-a523-pck-600",
> >                 .data           = &sun55i_a523_pck600_desc,
> >         },
> > +       {
> > +               .compatible     = "allwinner,sun60i-a733-pck-600",
> > +               .data           = &sun60i_a733_pck600_desc,
> > +       },
> >         {}
> >  };
> >  MODULE_DEVICE_TABLE(of, sunxi_pck600_of_match);
> >
> > --
> > 2.53.0
> >
