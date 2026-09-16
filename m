Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD3F34F46F
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540184; cv=pass; b=fsTJppUL+GjMeURsT+GDFfYT/MRduiuHdJkAQJefqVcJ53e+YIcHtmdFZljr4AtnNayMUs+o7tAhLXjl+FCIjZDEtZtZe+xz+f7igz0T5n1VWyRZk4DCTsg4QhY2/nRP2nHUkc7krLfl65jMFVloypV2KMP6hMM1TLyorLcsEI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540184; c=relaxed/simple;
	bh=vxwJtKP5dyGMaNoczGK/7UXp394tRjI7aLg0dpu/cdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=meJ+EKSkxwePCcxE74gUCgHCcvU6EGZU1y8JjbGlIHBWS1jHO0gW1hnH2oG+bPIYQEmgcpSeDWyKS+HwYIYNbHzOKrUmmvfCGM1L/0D5RJj1xcCwPQwraGy+mp3IwS79ZEt8+1VsK4RINA7JOy5BwO2bHahqpqmbppAIM8DdQtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xyst+Ufy; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xyst+Ufy"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982dd15d169so288485241.2
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 23:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789540182; cv=none;
        d=google.com; s=arc-20260327;
        b=WifldnnRZANBOCEBDsO/UfRkSU/AoMqzuq7hC63C1xSALHSAkyMbEpdreGUzgeZpBl
         oFvsS52WEtNvmW8Tw6ncmXg0NRyOFTNZCWHXclKNYck88z+UHsW39KpQcCFZO6MBWbei
         3uQi8ye4zfsFx617AJZPCT5eWPu9J5L5MjtLljdaCvFHRqZDnvw6i43a8MmcLbB/yJOr
         hegI8rLEIRi03IaeUxjYriwer89/5eAyZaPuAcL1YUJmxxfeJek/3eAQxgNINlqdmNB/
         uw98Cir6eiA/Kp+VZ/NrN4qJug0xoAIim+urjlIaP2G4WwJc/3CFy/F43ZqPPbulfEEF
         bIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        fh=2+WfQSsWEwfrxKUpU33JY7ye+/K288XbSbg8IWsLljQ=;
        b=diF+dARmlogJn3f3e+6+egX1jR+C85Ad3ZnVia4Lbw67WMRJoRoQlGRTPQxtmwU3Nv
         3itMLpvtEm8r4EMlo4S/oQNtzpPCMyPK/HxRj4nw4kTsbAie9/ur3yvLlS/7MTlV4MkO
         IGKAIjxQA35HaCu9W1K0mduhx74suMMhavoQtkBTD8oYzjZSg0utejm06FdKz+gPESlT
         6nv/RsVUkS2N8ORUZJjHBZPFzTOyyBDLFk8P8P8FNxP4mulz/eWf4RH+jykf4rIHsY+v
         Mmv5+7nFDB/eFndqCfoWUuysv+vGmRo3sZfiZ2WJzWbvlcTse+OegZ8xmC+75XXP+vrS
         Bd5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789540182; x=1790144982; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        b=Xyst+UfyKi+osLHeOJNFn+UwuprCB1+W7pYDexY93St8RqZ/m3I6eFRteohvQJ9QLP
         j0yajEyWUY0+Dxj7/Lx3OL/0uUr+Dc8xICuTl3j4SWfGlVZtYzjGYn6WZIDyoEv1L7Nq
         Bc9uRky6Ac6yT/uC3EzqPLRcgpOMMfVVuyFttG2hoEYtqzZc6JA0XbF1wrDKUSi7GfIr
         im3fJHlzp7qB6PJJLif1eP/6it9hWkHfmNrYIwmAWZtM2OSPm4v7D1KZonw2Wxt5GcYQ
         ft4l86kGwrV45ex+eqFdOm9aeXnBMT+6GetUY5t+y0Y86rfHSeMfnwH3zbQJ+OG9P0Rs
         MXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540182; x=1790144982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        b=ImBM8u4l+/N1gEbeza8JqoVnD03wjtCBKcsbFI+89D9hngkUKqhGGEoD6d2sFT1LJr
         Cf5W0kCbvb/Fm37JbTCJHsxHmeuMSnYtpthetCgLxrGobWgxq2S9qPXzmBSwoz0Yd+CZ
         L3ojhrq/DKq2wnlABvhfYG/HlzN4p5jQEJGVnqIfWjHWS8nrYgSzMtDFmZiT8gWTR2Nz
         6FlR0o31MnigJPHT6cRxUfxiGHCGm9X+Lu6XugprDbmIUtoy45r6j8S/Y3JfzYvDBFmQ
         CAPto5EgY0P69fPlffi1kEoCGVwnndy91CtQHAYEQgeMOa7ESaDCkkW16gZJfolSlotZ
         Pxhw==
X-Forwarded-Encrypted: i=1; AKwUvBxI1emkHk0YmYjiN3imD2m2ivJvAJPJbH2io6WTFoSI68WSszIAv0jN8zgmcqVU0vMp7ZFzFtLbvRALdg==@lists.linux.dev
X-Gm-Message-State: AFuF++lHWvU9fpnBGIr2ZUlmA2fGZtzPNPkhKHiVjTv4AlkxoByWmpsw
	QrpJkATWcF+l/9SD2j6h4bw3l6d/4Ukx4NvS5qfMnaHX+imStbRfwUE2MvIKgd3xrTPeoBHLxwE
	p6lBtE3kz8ot6alxi6AgZfeNTixDq/GU=
X-Gm-Gg: AYBFou1eQ+qe8+sgW1yq21tL/W0pfFGptYnFRh+Lg+Kv96uSG318DieIEjTu4rp/dmM
	fkgBMQjymmEGsCMooqifkQZp/amNFc4/FG9HT9lrBPZte/9gM0j9EowVobx+2Llxr8HbZIdxISx
	Id0sDIeAMoXAST9mcFEWsTnbk9909wsI0Wzi62ZB3u0aNJBzWqP3gzaX7fmFOCGWf/qlHvurRHu
	l8BMSBaAEyox9/enIHRgQdIsNBjzzYIAk5DwVrMYf25qNziSag99XLaRwX/L2+0tHSyWIVlODt2
	xxHqJSfT4LWV9SKS43yTExKGdLarglg6O4jxiLs8x1lpcu2FAgciaOBBjE0Hd+CyKYMsx58TC7e
	8Xo1n/UgkKtSNTCGw3UKgTieZWg7eKnMJrRL9CyWyPGBZ+8TTHtyqJHadxS+XpcuQADfe4LBl+V
	3j1PcfM7fprRF1dUlga+3jDyUi8jbKtkECLXthA0D0yOxT
X-Received: by 2002:a05:6102:3ec7:b0:79b:b116:2c5 with SMTP id
 ada2fe7eead31-7a023d19677mr1268443137.2.1789540182266; Tue, 15 Sep 2026
 23:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916044119.475666-1-alastair@d-silva.org> <20260916044119.475666-5-alastair@d-silva.org>
 <579d7650-583e-49bd-aa51-02fc52940ea1@bootlin.com>
In-Reply-To: <579d7650-583e-49bd-aa51-02fc52940ea1@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 16 Sep 2026 00:29:29 -0600
X-Gm-Features: AcwNN1UffeYUy4Pp1zpzsKWqvpGpKHs9ZXj5jRY360cdZ_TOsQDRhTD1ZCtKs60
Message-ID: <CADvTj4pC2xGn4m5Medhpn16wwLj34uatw7v266CCmYWOyWPAZw@mail.gmail.com>
Subject: Re: [PATCH net-next 4/4] net: stmmac: dwmac-sun8i: Add Allwinner H616
 EMAC clock index and internal PHY support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Alastair D'Silva" <alastair@d-silva.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	richard.genoud@bootlin.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:25=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 9/16/26 06:41, Alastair D'Silva wrote:
> > Support EMAC1 and the internal Fast Ethernet PHY (AC300) on Allwinner
> > H616 and H618 SoCs:
> > - Allow reading a register index from the syscon property to offset the
> >   regmap field for EMAC1's dedicated clock control register.
> > - Add emac_variant_h616_internal with support for internal PHY, MII,
> >   RMII, and RGMII modes.
> > - Delay the MAC software reset until sun8i_dwmac_init() when using the
> >   internal PHY, ensuring the PHY has powered on and begun generating
> >   the receive clock before the MAC attempts to reset.
> > - Skip setting H3_EPHY_SELECT for H616 internal EMAC, which does not
> >   use the H3-style EPHY select bit.
> > - Handle -EPROBE_DEFER cleanly during clock and reset control acquisiti=
on
> >   in get_ephy_nodes().
> >
> > Assisted-by: LLM
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
>
> Even if this is a duplicate some of the work done by James Hilliard, this
> raises interesting points.
>
> > Notes:
> >     Tested on Mellow Fly-C5 (Allwinner H618) under Armbian, verifying s=
table
> >     EMAC1 probe, deferred soft reset with the internal AC300 EPHY, and =
100M full
> >     duplex operation under load.
> >
> >  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 65 ++++++++++++++++---
> >  1 file changed, 55 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > index 48c52eb96233..1728893589a6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > @@ -130,6 +130,16 @@ static const struct emac_variant emac_variant_a64 =
=3D {
> >       .tx_delay_max =3D 7,
> >  };
> >
> > +static const struct emac_variant emac_variant_h616_internal =3D {
> > +     .syscon_field =3D &sun8i_syscon_reg_field,
> > +     .soc_has_internal_phy =3D true,
> > +     .support_mii =3D true,
> > +     .support_rmii =3D true,
> > +     .support_rgmii =3D true,
> > +     .rx_delay_max =3D 31,
> > +     .tx_delay_max =3D 7,
> > +};
> James's series [1] says this SoC only supports RMII (yet includes RGMII t=
iming
> control), and here for seemingly the same device, there's MII and RGMII
> support listed.
>
> [1] : https://lore.kernel.org/r/20260915-submit-h616-emac1-v1-v1-0-195de0=
bb1f8a@gmail.com
>
> Maybe you can coordinate with one another, can we connect that SoC to a n=
on-internal PHY ?

The SoC, yes, on emac0 for H616, but not for emac1.

> If so, can we use MII, RMII and RGMII ? or is it just RMII ?

Looks like it's just RMII.

>
> Maxime
