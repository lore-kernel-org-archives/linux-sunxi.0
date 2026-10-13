Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E323A514745
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Oct 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904089; cv=pass; b=PcICffGJxBT4h7hypux099AWb7S68FUXhRXMehwGx0flJ5+PqxqkAhNv8IFgZBGsY9fncX9O/AHUdQH0GzmVlx19DaMwyIHZHJZFyk5BTnGxDJT5gb/x1dAmaMOLV2NDgkt0IbatsWHsRdXRIqmf9ZkayGWPNxe9UpM7NqhHhPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904089; c=relaxed/simple;
	bh=kSeEty/pyx+v4Qu7BrqL5A6bwA+hTSmxB+Kegwde04I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPTRxT7ngJDXVxELXSeu132a4zy2pszLNrzio5skFDyGPU9tFD+vTdiBAWyRFTrfwvvA+lcLe/SQHIlU89RSOHWG5IjpCcBhtzzQfG8BEyxFrkSUNbjjqW02ZvHNyOETCnfg5x8A6U+9GpnDaa0X6TXfnGMBbAWVCNa2BknIov8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9qnzBoO; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9qnzBoO"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8d2574fd9so17024005ad.1
        for <linux-sunxi@lists.linux.dev>; Tue, 13 Oct 2026 08:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791904087; cv=none;
        d=google.com; s=arc-20260327;
        b=OdBeX++ImKM0Kq3KhNrIgsr+/bGtP+ONLDHojz8h2ErHnHOrdR/sdZJ8m1Ife0DUo1
         +Oyq2bUmmDpwbQ1xUnGKdKnFDqBMLgvqMpLWdaIuhXz1K3O+39U6w1Vxz5tbgpL4LNUX
         u6XtYUybS71/b/VA3R3urI2nTD2eavIrXx1EAQef4wJa/ZkfKmXgo0Vz7H3XnPj6P5F+
         UzyjfJI6DvZnXIUKUM0wRvymeJBE4gWD1K1z1JYCVf/O3jsFGrKpqvmoDSLwCckDAAtk
         uidioUHDhFZF03WTKSYtZE6Q79rB2E8V3Xmi8iDDjsy/3xfJ5FZeukSXkThDABznOEbf
         6KtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LQ5BAPQzf5De6H7G8HN1TYce8oTd+xAhm08KbGTjuS4=;
        fh=0VgAKZm7iS0o85eYpp0anjZA8GREtFVdc5LeomWgex0=;
        b=iHeDdCuHyTWjLmqtLlfRC9FyApb+ZH/NvUiGdWzTbbgGG1sgKaDJFgddt4piiOxCh5
         KpSj8kmK+D3M8KqSBPSv3lzpgBNJPzt432FErTey2W/Rg/lhHsVNwYHYpq/4us1isn0h
         Cb2OZzF21IuT8w1gUYjTo73h7fj1iywi40cHwyqo9jTJK0jIuXbCuBq20f2fgOXnSeXd
         cnPe8Ed71dY9ISROkgNsiZ5KOsleGGgZm4kXYXUwwyKmDh/XQOObPOdKW3UupdDaiHJS
         bp+Q0iLhWWijT+HIHvOR6vNRtlfUSlS9quTZV0YvUjDtYzXhFerdcGf0X3Va39ZRE7Hr
         42og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904087; x=1792508887; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQ5BAPQzf5De6H7G8HN1TYce8oTd+xAhm08KbGTjuS4=;
        b=L9qnzBoOufpzJpKxDacrDDZd5wUKpnsz8VLGc8uOa1jshSY2pFo6tks6p13HB7GMhj
         7Mlrx6qcvEl0I9t4s3YLF3UzhmXNfMboD2qmWDNhcuwXlb6ww5+VHgIuanU24ThGNpMG
         iiNmhAZ4eaf3RDnWqpgqNuTtpSeOrPw1CNZF5RfDeSnlrpyklYlbtgHTRVq9ds8IaZ+w
         TGMaT0PdkhzMn2Q7lFlZtmvzls/53lSP+0SDWYlomFevPb44ONc/yJ0bQN5UiWGqqjlg
         AceeHLh01cu/QXaHEv522VWR2ySB+UNEf2TVoPl4Dwc6a4OygOqeu+7EJd2KiQDLWw6M
         qPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904087; x=1792508887;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQ5BAPQzf5De6H7G8HN1TYce8oTd+xAhm08KbGTjuS4=;
        b=0doeB7rdXbvB0LXPTuY1nQP+xG0vci1vgGk6zufar4a+4ICw+LZiJWuo5YKz06MHtM
         jy+Mqwo06ENGWhkUNcYeUak2Y898h8TjdkROcm5uon7dSvHR1xUjwinFTTgpbQefN2Ry
         TPN0Mod9Ui0fmxXdq/iWhylaM23PXZX6CUIpZz276m8oW7Wn0hUHDeBhrrCPnCSvFxEi
         7CVL847dp9gEUR9sh5DgM3/i7EXOYYxqJBeZPQksEcrC/Ou7xy8fHGYx2SM7DyMZ4Wgz
         wPXmo0BDC/NfT48IXNZ0AG6DqAmAV1hyItjNxt1XnIkvbYaHd5hbEAojFNeT2zJF8HwL
         4Zzw==
X-Forwarded-Encrypted: i=1; AKwUvBwG122dIin8zlc7pAO4AtqmSRX+tcnxJJOxgK0q4jVhtOFzOGSilg+nKEgIx/jPCJFXjuK2Jcig3S7z0A==@lists.linux.dev
X-Gm-Message-State: AFq9FYK0VbR0gagE7eQySprLIV9/pYfObbEBLKMK0BEI3V2mhjHC0dbu
	GX1CpnF3BvdGPSmDZ2JYNB2a/KY2RcpI6dbqcqE13YIUBTcxpKd1ERWfJEWVdw4tXP8Vh8tWWd/
	8djMnWj8bw+VdzWEDE0FNUQY4C/9Ocl8=
X-Gm-Gg: AYBFou1V79Uhpi7srqoCWn8wS2sUE7cflLp4DSure9PBaE0Imr7GJO4b5CwXSrQR+mk
	JkkdFbo1fum1fCNX0EoS9SvTOv9RsT15Q6Nr11xX5SlEqRZ9mytTXyCTrOA3t1+xTJenQUOzU1u
	ZXMUb1e9VH1nit2A3YD/j4YtlyXRZv4QlPrKGXBb42si+8IKwwBhQlCtmVVL4C0GXs5KWv/hRJ2
	I2kgILnjKbZ5Ja3Z8bjzmROMEt2Yrkdo+pVIqHagNkZO3TTMnxynEP1SNhNKDoK4AyuDbucEy6A
	aMWxL4Y+1B9bSEWJcZGpzzOPpKyoET1ZK8cPQZQLMuhrvde74/Urk0QfGrttJFU251eJoj0=
X-Received: by 2002:a17:902:fc4e:b0:2dd:c170:2d4d with SMTP id
 d9443c01a7336-2e842abcb40mr130264665ad.24.1791904086913; Tue, 13 Oct 2026
 08:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012100816.331033-1-pmazzini@gmail.com> <20261012100816.331033-3-pmazzini@gmail.com>
 <sashiko-outbox-167950@kernel.org>
In-Reply-To: <sashiko-outbox-167950@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Tue, 13 Oct 2026 16:07:39 +0100
X-Gm-Features: AclHuK_pl3pWqTJLvh0wYDQbXNbwPmw0G3N4wD6Ym2FvqFNGBQBI95gOlewMvjs
Message-ID: <CAAxh=jvSRyW3XwnyV2RVHH9FZvq9A7A7ruXNSpAgXzdcCNjGeA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] clk: sunxi-ng: add Allwinner B288 CCU driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The B288 has pll-video0 and pll-video1 at TCON0 mux values 0 and 1, so
the plain mapping is right.

BSP: https://github.com/pocketbook/kernel-b288/blob/e30bb2ed149410ef2d3245e=
a01192833d44c4e46/drivers/clk/sunxi/clk-sun8iw10.c#L468
Wiki: https://linux-sunxi.org/B288/Clocks

On Mon, Oct 12, 2026 at 11:21=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] clk: sunxi-ng: missing parent index table for tcon0_clk
> --
>
> commit 3f9c552550550b015864167770907fa314ac3239
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> clk: sunxi-ng: add Allwinner B288 CCU driver
>
> This commit introduces the Allwinner B288 CCU driver, covering the PLLs,
> the CPU/AHB/APB tree, module clocks, bus gates, and resets. The driver
> is noted to be closely related to the A64 CCU.
>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-=
ng/ccu-sun8i-b288.c
> > new file mode 100644
> > index 0000000000000..c53afd6f9af98
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c
>
> [ ... ]
>
> > +/* DE_CFG @ 0x104, EE_CFG @ 0x108, EDMA_CFG @ 0x10c -- M[3:0] mux[26:2=
4] gate 31 */
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(de_clk, "de", de_parents, 0x104,
> > +                                   0, 4, 24, 3, BIT(31), CLK_SET_RATE_=
PARENT);
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ee_clk, "ee", de_parents, 0x108,
> > +                                   0, 4, 24, 3, BIT(31), CLK_SET_RATE_=
PARENT);
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(edma_clk, "edma", de_parents, 0x=
10c,
> > +                                   0, 4, 24, 3, BIT(31), CLK_SET_RATE_=
PARENT);
> > +
> > +/* TCON_CFG @ 0x118 -- mux[26:24] gate 31, no divider */
> > +static SUNXI_CCU_MUX_DATA_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents,=
 0x118,
> > +                                 24, 3,              /* mux */
> > +                                 BIT(31),            /* gate */
> > +                                 CLK_SET_RATE_PARENT);
>
> [Severity: Medium]
> Does the B288 hardware actually use a 1:1 index mapping (0 and 1) for thi=
s
> TCON mux?
>
> The closely related A64 SoC uses a {0, 2} index mapping for its TCON PLLs=
.
> Because SUNXI_CCU_MUX_DATA_WITH_GATE defaults to a 1:1 mapping, if a disp=
lay
> driver requests to use pll_video1 for the TCON, the CCU driver will write
> index 1 to the mux register. If the hardware maps the second parent to in=
dex
> 2 instead of 1, this will result in incorrect clock parent selection and =
could
> break video output.
>
> If a custom mapping is needed, it might be slightly tricky to define sinc=
e the
> ccu_mux.h framework currently lacks a SUNXI_CCU_MUX_DATA_TABLE_WITH_GATE
> macro to combine a table with clk_parent_data.
>
> > +
> > +/* MBUS_CFG @ 0x15c -- M[2:0] mux[25:24] gate 31 */
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(mbus_clk, "mbus", mbus_parents, =
0x15c,
> > +                                   0, 3, 24, 2, BIT(31), CLK_IS_CRITIC=
AL);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012100816.33=
1033-1-pmazzini@gmail.com?part=3D2
