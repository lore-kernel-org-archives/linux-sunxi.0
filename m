Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8902127B7A
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713265818; cv=none; b=EZb9ACQBkpHKLoKYOxzTd7Ugx+vIv3IjbfCW2i8tA3RCUkkJf6SLWphWwDXFkQO6UO1TBBZAiKYnVrLpz9NYmHvbn7rdxRdojKVMmWmG/hJmb1N7pOuRVFOGUOUQIuOvV8AIlbBIiHKwW1jsqD8DpmN/3WwZAdhrXhewe4w40fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713265818; c=relaxed/simple;
	bh=M4y/QeOJdAzEYk3ze4wM366a6QBcqilYjxc89HGKzzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlX/qO0vOTmoUsSw2ceAf4IDCj0kG14JWPfos/49KGrio3jd+kys1r+h8BFlFZBa7uJZpjt3uEku8J6WXIkXOZroOPihofwUhOUpML45QXMSblY7ZZm7PTlBiRBElbZevbXaJxrPIXqV7iHbh+geVR5RWKVHAzcV9HxAWSh+XQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mpef72Aa; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mpef72Aa"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-ddaad2aeab1so3559665276.3
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 04:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713265814; x=1713870614; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cg/W6RexwVx0V1pjyRKASaoYgzbczic9/7q5v4wFZtQ=;
        b=Mpef72AavcUf6Wv1M0bVmXWNmJTBA9gLxtt3u0lktft3TvutIc1RjDChvax1Sl5x18
         9j10Y80jhfNKVDKynDOKRvXNG1EAmWdTOfJYydnqeFJ0rAeLcq84z/g8L/dqEOCu1dLs
         ho8pAACZvqcsNrgbapbSpI3taWl0jAfTkU+irEwjnta7st/fUW0mu0dy1BZHe3omigqh
         il2NlJN0qJqwK0BoYLmtE68Ae4K28t1MXQcajzqdcoqET3+WZ/kvXm45jY55/W6IKcCm
         JBREu84qln1Q6gb8V5tvMAQtKQJF96t3jXTnhvlHowhWO2wSFSef6olCrNW39UyddiOQ
         NoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713265814; x=1713870614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cg/W6RexwVx0V1pjyRKASaoYgzbczic9/7q5v4wFZtQ=;
        b=TrT7j0NHm++yMag3NxVdWh7MXtHvw7evuCdlVnD4pMJPUtGpBGxpR0I1kSKPnm25Sd
         fCVfSJlEjv5uDQT3O9UFAJOIIp0zfUxP6YmZc3x/9DEgmKMXlZ3fgTldOqKHJDeQ+MAR
         F2LbuIed5N6V5YG+CPuuUGCFLJAgXHS/KVRgr0vhTDz6ULY4uMNn4esDQJgNmdks/0oP
         GR6z2kg1EJMe6e3bk3kvLeHzDGto/O6nPnBSP+k4Q7HsZCWYyexyNOdzn50z7IEa34yt
         4t3MEKrN0evsxQijflnTcSEbGqGQaMhjhgdMImnHa/tsyQYaWTqajMXkoIP9dLaj7kkL
         B+Ow==
X-Forwarded-Encrypted: i=1; AJvYcCW34KCYRXpuNFtLdCTwfF0KP9tdfCRXw6gMZDVKXQj1xmFZ8YTClS1q+VJYSS8Al8vlWfW43t7uzsL+LKDOavqmJyzTjZt9+Y7GWJU=
X-Gm-Message-State: AOJu0YyT+xd64bxQPJAs/bs5FTCKD+Ky8GS2eW43UmReXr7Kx2Vgy9st
	j8uHzKBms/Z1vIUFXsjQBaHOZQZE+5dbnjoJOKVlu5mK70GdMQXXQedXgCCA2tnRNqC8Ni0ataI
	rxHzrxYpH/S3McoNg5WjIABqNCQYv+TVtqJW0IA==
X-Google-Smtp-Source: AGHT+IHkGB3C2+4FfBzhmvWVFLvfMD5mVP/o66UgenEguJLDFsTqtiY1+60tMZGABIg5qz4VzVJdPAuKmCJVEUPcx4c=
X-Received: by 2002:a25:6b43:0:b0:dcc:f0a:e495 with SMTP id
 o3-20020a256b43000000b00dcc0f0ae495mr10270736ybm.3.1713265813760; Tue, 16 Apr
 2024 04:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240225160616.15001-1-andre.przywara@arm.com>
 <20240225160616.15001-2-andre.przywara@arm.com> <CAPDyKFptmNcbOTEs052yLGLxObWy7975fgpM3Kfg1TjMPVmeyA@mail.gmail.com>
 <20240416000041.47a4ecb5@minigeek.lan>
In-Reply-To: <20240416000041.47a4ecb5@minigeek.lan>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 16 Apr 2024 13:09:37 +0200
Message-ID: <CAPDyKFqdeyckF0i2PfkavofSQX+0XtYLTW_Mfj43ZN7OwN+8QA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] clk: sunxi-ng: h6-r: add GPU power domain
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 01:00, Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Mon, 8 Apr 2024 14:55:04 +0200
> Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Hi Ulf,
>
> many thanks for having a look!
>
> > On Sun, 25 Feb 2024 at 17:08, Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > The Allwinner H616 features register 0x7010254 in the PRCM MMIO frame,
> > > where bit 0 needs to be cleared to enable operation of the Mali GPU.
> > > With this bit set (the reset default), any access to the Mali registers
> > > hangs the bus and thus the whole system. The BSP code clears this bit
> > > in U-Boot and their kernel never touches it again.
> >
> > Is the bit representing a reset or power-rail? If it's a reset, it's
> > probably better to model it like that.
>
> So there is no real documentation about this bit (or the whole "PRCM"
> device), but we are pretty sure it's a power rail and not a reset. There
> are other similar rails in neighbouring registers, and some BSP code
> hints at those being power gates. Samuel once condensed this to:
> https://github.com/crust-firmware/crust/blob/master/platform/h6/include/platform/prcm.h

Alright, I guess modeling this as a power-domain should be fine then.

>
> > > Register a power-domain device to control this bit. Since we claim this
> > > MMIO region in the H6 R-CCU driver, add the code here, so that we don't
> > > need to artificially split the MMIO range in the DT.
> > > Since there seems to be at least one other register with similar behaviour
> > > nearby (0x7010260), make the power domain take one cell, even though we
> > > only support domain #0 for now.
> >
> > Seems like we need some updated DT bindings too to cover this?
>
> That's right (and I mentioned this in the cover letter), but I omitted
> this from this first RFC post. I will include binding patches in the v1
> post.
>
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c | 84 ++++++++++++++++++++++++++
> > >  1 file changed, 84 insertions(+)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
> > > index 02b28cfc5525e..363fb7a71e9f5 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
> > > @@ -4,9 +4,11 @@
> > >   */
> > >
> > >  #include <linux/clk-provider.h>
> > > +#include <linux/io.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/pm_domain.h>
> > >
> > >  #include "ccu_common.h"
> > >  #include "ccu_reset.h"
> > > @@ -217,6 +219,86 @@ static const struct sunxi_ccu_desc sun50i_h616_r_ccu_desc = {
> > >         .num_resets     = ARRAY_SIZE(sun50i_h616_r_ccu_resets),
> > >  };
> > >
> > > +#define        PD_H616_GPU_REG                 0x254
> > > +
> > > +struct sun50i_h616_ppu_pd {
> > > +       struct generic_pm_domain        genpd;
> > > +       void __iomem                    *base;
> > > +};
> > > +
> > > +#define to_sun50i_h616_ppu_pd(_genpd) \
> > > +       container_of(_genpd, struct sun50i_h616_ppu_pd, genpd)
> > > +
> > > +static bool sun50i_h616_ppu_power_status(const struct sun50i_h616_ppu_pd *pd)
> > > +{
> > > +       return !readl(pd->base + PD_H616_GPU_REG);
> > > +}
> > > +
> > > +static int sun50i_h616_ppu_pd_set_power(const struct sun50i_h616_ppu_pd *pd,
> > > +                                       bool power_on)
> > > +{
> > > +       if (power_on)
> > > +               writel(0, pd->base + PD_H616_GPU_REG);
> > > +       else
> > > +               writel(1, pd->base + PD_H616_GPU_REG);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int sun50i_h616_ppu_pd_power_on(struct generic_pm_domain *genpd)
> > > +{
> > > +       const struct sun50i_h616_ppu_pd *pd = to_sun50i_h616_ppu_pd(genpd);
> > > +
> > > +       return sun50i_h616_ppu_pd_set_power(pd, true);
> > > +}
> > > +
> > > +static int sun50i_h616_ppu_pd_power_off(struct generic_pm_domain *genpd)
> > > +{
> > > +       const struct sun50i_h616_ppu_pd *pd = to_sun50i_h616_ppu_pd(genpd);
> > > +
> > > +       return sun50i_h616_ppu_pd_set_power(pd, false);
> > > +}
> > > +
> > > +static int sun50i_h616_register_ppu(struct platform_device *pdev,
> > > +                                   void __iomem *base)
> > > +{
> > > +       struct device *dev = &pdev->dev;
> > > +       struct genpd_onecell_data *ppu;
> > > +       struct sun50i_h616_ppu_pd *pd;
> > > +       int ret;
> > > +
> > > +       pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> > > +       if (!pd)
> > > +               return -ENOMEM;
> > > +
> > > +       ppu = devm_kzalloc(dev, sizeof(*ppu), GFP_KERNEL);
> > > +       if (!ppu)
> > > +               return -ENOMEM;
> > > +
> > > +       ppu->domains = devm_kzalloc(dev, sizeof(*ppu->domains), GFP_KERNEL);
> > > +       if (!ppu->domains)
> > > +               return -ENOMEM;
> > > +
> > > +       ppu->num_domains = 1;
> > > +       pd->genpd.name          = "GPU";
> > > +       pd->genpd.power_off     = sun50i_h616_ppu_pd_power_off;
> > > +       pd->genpd.power_on      = sun50i_h616_ppu_pd_power_on;
> > > +       pd->base                = base;
> > > +
> > > +       ret = pm_genpd_init(&pd->genpd, NULL, !sun50i_h616_ppu_power_status(pd));
> > > +       if (ret) {
> > > +               dev_warn(dev, "Failed to add GPU power domain: %d\n", ret);
> > > +               return ret;
> > > +       }
> > > +
> > > +       ppu->domains[0] = &pd->genpd;
> > > +       ret = of_genpd_add_provider_onecell(dev->of_node, ppu);
> > > +       if (ret)
> > > +               dev_warn(dev, "Failed to add provider: %d\n", ret);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static int sun50i_h6_r_ccu_probe(struct platform_device *pdev)
> > >  {
> > >         const struct sunxi_ccu_desc *desc;
> > > @@ -230,6 +312,8 @@ static int sun50i_h6_r_ccu_probe(struct platform_device *pdev)
> > >         if (IS_ERR(reg))
> > >                 return PTR_ERR(reg);
> > >
> > > +       sun50i_h616_register_ppu(pdev, reg);
> > > +
> > >         return devm_sunxi_ccu_probe(&pdev->dev, reg, desc);
> > >  }
> > >
> >
> > In general (for maintenance reasons) it's a good idea to put genpd
> > providers under drivers/pmdomain/*. It looks like that should work
> > this case too, right?
>
> Well, this question was the main reason to mark this as an RFC.
> This patch here lives in the R-CCU driver, since this device is using
> the same MMIO frame. The manual calls this device "PRCM" (Power Reset
> Clock Management), so this covers more than just those essential
> clocks, but those were all we needed and knew about until now.
>
> For simplicity (since this is indeed just a single bit to flip), I
> put the code into this existing R-CCU driver. This avoids splitting up
> the MMIO frame (at some potentially arbitrary point), and avoids the
> churn for an extra driver and DT node.

If this isn't a separate register range, we shouldn't have a separate
driver, but rather just to keep the genpd provider specific parts in
drivers/pmdomain/*.

Of course, it means that we need to share a couple of functions
between the subsystems, but that looks quite okay, I think.

>
> Now just last week we found another separate component in this PRCM: an
> NMI interrupt controller[1], for which we already have a separate
> binding (and driver) in the tree, so we split this MMIO range
> up anyway.
> So that means at this point we might as well make this a separate
> driver, tied to a separate DT compatible string. I originally made a
> version of this driver as a separate file in drivers/pmdomain, so will
> just dig this out and post it.

Seems reasonable to me and looks like the preferred option, assuming
the MMIO range can be split up independently from each other.

>
> Unless people disagree, then please let me know.
>
> Thanks for the comments!
>
> Cheers,
> Andre

Kind regards
Uffe
