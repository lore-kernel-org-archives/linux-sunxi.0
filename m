Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24B823C4FC
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 03:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751946235; cv=none; b=hCPmwAAByvr8zNa5zJBDkGlwYTPgtK60IqBIIDzjrbVVyJiX2sE6gCQZeR3+kD+EB1gPX09q3PievkBokEDtqBaVPl5KbFAc8O97w/uaEbaJbToV4bg3wj2dDv0nng5mCzhstEgAJwI7DwAsXt8G8pDqdDsJipOteNtPisEr3Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751946235; c=relaxed/simple;
	bh=qDuUJYM1LJXP6KqTu/ry7W53Diu11Fscq4h73EvMeUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdlaKrLoahMCDRXSs1CPwgyaKakKYV2qP1JvlOyJHfXTqz5XEDu9gn2/SfWotNsdZykyopvdpbsZvMClQqQr6FHd6rfKYG/TaXW8qsmQwScAACI5Y9NOJlRUec34KMOPZKr0/aAfmmJSdNHy93/gfSLF1GH5+L0XgtG+7v8Nd2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b60de463so3920827e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jul 2025 20:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751946229; x=1752551029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6qI+uivx+bnd0zwfJl1YVkWkeyiKKg4Fij4wbpWozY=;
        b=b+7L7ZUdRLKixnKa3ngyUroTEH831QvVwHHNd9nG3RuxV/Zuq69MXp/z2q4it0GlZG
         pENEFdUkVMbb6jvJy4/re9z1TXvWFkndi4W0DTLAas3eGMV5E4BK2kOwTV4ow1w7ZLfz
         JaF0iDDiPE9yXILOdVXs8B4jrp6z+MXoP206+08vH444mLMds8MxiUEpPiAgVYez97uU
         5/+FEF76pAEqXY7R9YvzQhbu6DJ8igMFnaghcXXYwQ1t+WqJ86meUYWLO0LHY2v6ECtA
         KYtdQiG1XlcD97gkjrpwxAfCAndPCCfB+jzAku738V2dI+oSn3ejlNHzD3RSLs/gcY+i
         pE3A==
X-Forwarded-Encrypted: i=1; AJvYcCU4XPNtr+Xowj8unwWyeuY+faYEHu6juIGKa8Kp+m49r2JLjc+go2+Z1nqTklo7XotDgLBc51WTc7SdVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YytW+r5atHU2xdMAVFQytQcgZtF8CGpZvhN1QQP+DbvGe68mK16
	r/K4Gu4xVe4HT7QKh6j6cqjuSIH/tsClutBUhewofHft0n+FVtjeOBImOP28AkWi
X-Gm-Gg: ASbGncuXK10+L+pcF7EAQtbaEr5swLQnHMX8KPQR+agqK7yVw+WDiezr+xyFWcAk2Rr
	OZ6w9YlL+q8YnTLqwiIlKY+6k3tEfBbyqYX6AN6wtbvEGdCeGAyAGWq74MjcUjf7yi3paAj5y+s
	B4CfzYtKLiQzixOQz2u1Ke0z1JWT0mz+F1jH4nxr4x90EvgaXeUxeWShuYvh5Dh2H3QM81wPEvv
	WevTDQpd32z+T4/jD/vhFI3uG0+xL3LJQ6HrGCt5mwm3OzKuqtvNm7kd6/d3BQ9zsT+Fs62kNXg
	AiFIvaBfXKLI4LrvCYsseZrDt796fmfr447h9Lsd1UeiAnhoPhTyNkrSyTtdLNFZbiNiQpL4EFC
	43b+cD+/S7S38P3GOtZ4=
X-Google-Smtp-Source: AGHT+IENATEMEbwAzO3JXXEnwae+q8xITanDuSazNL/R2kbiOv8Wk1BoLt2zTzvbUd9GEkj6MXuoQw==
X-Received: by 2002:a05:6512:6193:b0:553:3a0a:1892 with SMTP id 2adb3069b0e04-556e6e2e504mr4272926e87.15.1751946228929;
        Mon, 07 Jul 2025 20:43:48 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384d5e71sm1526513e87.259.2025.07.07.20.43.48
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 20:43:48 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32e14cf205cso31362001fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jul 2025 20:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuQXWiEev7/VEC017H+LN6+zxkDi7OjBE71CzLsIvdhmWCtwfzc/FgVfVq2n1iT+nw+kPVMDJiUTjRXg==@lists.linux.dev
X-Received: by 2002:a2e:a7ca:0:b0:32c:102a:f02d with SMTP id
 38308e7fff4ca-32e5f61e89emr40266751fa.30.1751946228111; Mon, 07 Jul 2025
 20:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250706025625.2707073-1-iuncuim@gmail.com> <20250708004458.15a2feae@minigeek.lan>
In-Reply-To: <20250708004458.15a2feae@minigeek.lan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 8 Jul 2025 11:43:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Pu7CTJx3K=3CVSbQ9mNB-4Vrq+iaA+hUWtxdwS2aD0Q@mail.gmail.com>
X-Gm-Features: Ac12FXyZmm99FipGMPnPhGzlT7tlbKyfxwlUr8RD3z4V1vxu7PoX_X4yAfDEgUg
Message-ID: <CAGb2v67Pu7CTJx3K=3CVSbQ9mNB-4Vrq+iaA+hUWtxdwS2aD0Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: sunxi: a523: Enable Mali GPU
To: Andre Przywara <andre.przywara@arm.com>
Cc: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 7:46=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Sun,  6 Jul 2025 10:56:21 +0800
> iuncuim <iuncuim@gmail.com> wrote:
>
> > From: Mikhail Kalashnikov <iuncuim@gmail.com>
> >
> > This patch adds gpu support on devices with a523 processor. Since there=
 is
> > no support for image output yet, the gpu is disabled after boot up.
> >
> > $ dmesg | grep panfrost
> > [    3.826968] panfrost 1800000.gpu: clock rate =3D 432000000
> > [    3.832305] panfrost 1800000.gpu: bus_clock rate =3D 200000000
> > [    3.838353] panfrost 1800000.gpu: mali-g57 id 0x9091 major 0x0 minor=
 0x1
> >                status 0x0
> > [    3.846050] panfrost 1800000.gpu: features: 00000000,000019f7, issue=
s:
> >                00000001,80000400
> > [    3.854134] panfrost 1800000.gpu: Features: L2:0x07110206 Shader:0x0=
0000000
> >                Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> > [    3.866011] panfrost 1800000.gpu: shader_present=3D0x1 l2_present=3D=
0x1
> > [    3.874108] [drm] Initialized panfrost 1.3.0 for 1800000.gpu on mino=
r 0
>
> So what confidence do we have that this really works, apart from these
> successful initialisation messages? Has this been shown to work with
> some (yet-out-of-tree) DRM patches, to produce 3D rendered output? I
> wonder if we should wait with upstreaming until we can really test this
> on some kind of screen.

I ran glmark2-es2-drm using vkms, and it seemed to run correctly.
The GPU job interrupt was triggering frequently, and the GPU mmu
interrupt was triggered twice for each run. This was with Mesa
25.0.2 from Debian bookworm backports.

So this is sort of

Tested-by: Chen-Yu Tsai <wens@csie.org>

If anyone has some idea about how to capture the output, I can give that
a try.

> Cheers,
> Andre
>
> >
> > Tested on x96qproplus and walnutpi 2b devices.
> >
> > Based on v6.16-rc4 with patches:
> > https://lore.kernel.org/all/20250628054438.2864220-1-wens@kernel.org
> > https://lore.kernel.org/linux-sunxi/20250628161608.3072968-1-wens@kerne=
l.org
> > https://lore.kernel.org/linux-sunxi/20250627152918.2606728-1-wens@kerne=
l.org/
> >
> >
> > iuncuim (2):
> >   arm64: dts: allwinner: a523: add Mali GPU node
> >   arm64: dts: allwinner: a523: enable Mali GPU for all boards
> >
> >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi    | 15 +++++++++++++++
> >  .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  |  5 +++++
> >  .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts   |  5 +++++
> >  .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts  |  5 +++++
> >  .../dts/allwinner/sun55i-t527-orangepi-4a.dts     |  5 +++++
> >  5 files changed, 35 insertions(+)
> >
>
