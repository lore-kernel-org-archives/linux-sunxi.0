Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD208152196
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739695289; cv=none; b=YY/O96N8YqM/dP1qor3caeo6w8iWAH2wbAZc1IYKI1bB6x8s5tC9tWYIwagYCz1+gxaIhT0h8YpKuNQ4/Ju3fALAtasv/gtgOLG4N+amfiDwI70pdNAQ+Xy3i510csmRqpkc3O/27w24AllIrVD+H3b4+LurEwPS6U/8m/94lWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739695289; c=relaxed/simple;
	bh=NDauxWvP4zGEWLX2W+K6T7Oriu1jvS92cQC6yKTCz44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=byHkKr6MJ2x2dX8aNulR+dw+Km9aUaH6TZXR0T/WUNvBRloifXw5iGmDfjF080YBf+d3JBb+10a2T6EVqdHZa5KaMSU78/2Cw0vcIDiBtRolX+ePDkPRXr7Oou7WxIqf861XFD/FhCJ8OewMsduATVmB8aFnhqVF76X+BCNMMDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d14dec3236so10100105ab.0
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 00:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739695283; x=1740300083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dpo5WMvSHiZdUjnCU7ZcgyQ986Sd3fENuocGlx6aSZQ=;
        b=MOK4+3FfpVhQrrosVPoNePnxE+jh/SNHkFbOQO2Kydt3VcxO+sSEMp9OuJKpM84P3G
         Tn1R40+CZ/CKOSZNHiQi0XcYfjUIzKL6k67JlOi+0vF9APJFbIEXL5wa99uE0AojUT+P
         KAJE57Lc4Wi1zqHhvva9zUcrfYfYizbSD5JZC39rASc+g1Jeq7gQNREwJgoA7+g6yJXJ
         9TNIWiRPRoAfRW+FHfD5yVakcRE0AIu4K81tsGKor8TfYpBjWHp0o3iv9xK9j9//ZV0I
         S7DKix9ZnQfjklQ7uInhrCCmgMZCCcgvqmwCIr5oiKRzgwV3aifshRMSMnmdN2oabUS8
         rNhg==
X-Forwarded-Encrypted: i=1; AJvYcCXjVDNVROu5lWjK8K4YW3seMlKLfVP8cKAO2UmjYsyRgXO/lKfkoZQRuUp3j2oWAITeblxuZmvFmv8EDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHNxVR3uDRa4nAVtFJheQeBVmjLWx01tAmTsR1S85HzLDFZXBD
	PpECBUywstl/gsMkm7YrqQkZlm+cOmTsvVzSx0IZaxAWTGGYIPS2MpuVfa4lRAQ=
X-Gm-Gg: ASbGncsLCpMs2uMJ6ww6hA7PKmdZsf4yTs+w/St9Lf0ggxKvZsqtMAehv7WbLtjS9sD
	m+AHVB/ZuPR56BJ9RUIi3XO55ZUArf43jK5Kjuhpk58WMXBeKR9iZZSP9JpRr6SPAg8twJKzR4F
	kkX2IqI8ULQShCUZo/Nw56WLwudfxmZXvQQpY7A53BXnP/KVg7niAgJUyXiOIrPk3/AKUDQbbBg
	/hWivOta4n81XHPRIsOfM39GCntJMvRhsK3apDAy6klBY6CFfqffq9SBvENgMYoV1lRkKlFfAz5
	p5ac17PGB/4cpV29BII4jabZ3e7rN/xI2JXkJeeq6sAkCdNp
X-Google-Smtp-Source: AGHT+IEDZMHDvUcw9tnni1/9SJr01Y0ugee+o4R9SHhFYk4VNpMs/uSa8gsT/udSGSxZ+LFAf7w4fw==
X-Received: by 2002:a05:6e02:3206:b0:3cf:ae67:4115 with SMTP id e9e14a558f8ab-3d2807bc8aamr45000935ab.8.1739695282760;
        Sun, 16 Feb 2025 00:41:22 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ee8f659824sm320065173.95.2025.02.16.00.41.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 00:41:22 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d14dec3236so10099995ab.0
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 00:41:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRdB5b5MsyJhHkgI2uXZ69Icmbfwf+JqWD10IZweyVi/G7BPyj5il5fu0xb/l0O7iA8cDa2Of9CvL3PA==@lists.linux.dev
X-Received: by 2002:a05:6e02:2610:b0:3d1:78f1:8a86 with SMTP id
 e9e14a558f8ab-3d2809471f1mr44082585ab.15.1739695282060; Sun, 16 Feb 2025
 00:41:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250214125359.5204-1-andre.przywara@arm.com> <20250214125359.5204-4-andre.przywara@arm.com>
In-Reply-To: <20250214125359.5204-4-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Feb 2025 16:41:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v64z4xVfDkwcgdc6Bp9k1GoN-DWH4vjSEwioMGrmE3Ywsg@mail.gmail.com>
X-Gm-Features: AWEUYZmw3abG4Std0u6pbgvDtbaKDpoG1yzPXqXz-ASh85n4DeWqACoMoRsm03w
Message-ID: <CAGb2v64z4xVfDkwcgdc6Bp9k1GoN-DWH4vjSEwioMGrmE3Ywsg@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] clk: sunxi-ng: mp: provide wrapper for setting
 feature flags
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 8:56=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> So far our sunxi clock instantiation macros set the required flags
> depending on the clock type, but the new "dual divider MP clock"
> requires us to pass that piece of information in by the user.
>
> Add a new wrapper macro that allows to specify a "features" field, to
> allow marking those dual-divider clocks accordingly.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu_mp.h | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.=
h
> index e235fdfde2d36..687bd2ec798e2 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.h
> +++ b/drivers/clk/sunxi-ng/ccu_mp.h
> @@ -100,11 +100,12 @@ struct ccu_mp {
>                                    _muxshift, _muxwidth,                \
>                                    0, _flags)
>
> -#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg, =
       \
> +#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents, _=
reg, \
>                                         _mshift, _mwidth,               \
>                                         _pshift, _pwidth,               \
>                                         _muxshift, _muxwidth,           \
> -                                       _gate, _flags)                  \
> +                                       _gate, _flags,                  \
> +                                       _features)                      \
>         struct ccu_mp _struct =3D {                                      =
 \
>                 .enable =3D _gate,                                       =
 \
>                 .m      =3D _SUNXI_CCU_DIV(_mshift, _mwidth),            =
 \
> @@ -112,13 +113,25 @@ struct ccu_mp {
>                 .mux    =3D _SUNXI_CCU_MUX(_muxshift, _muxwidth),        =
 \
>                 .common =3D {                                            =
 \
>                         .reg            =3D _reg,                        =
 \
> +                       .features       =3D _features,                   =
 \
>                         .hw.init        =3D CLK_HW_INIT_PARENTS_DATA(_nam=
e, \
>                                                                    _paren=
ts, \
> -                                                                  &ccu_m=
p_ops, \
> +                                                                  &ccu_m=
p_ops,\

Accidental change?

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

>                                                                    _flags=
), \
>                 }                                                       \
>         }
>
> +#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg, =
       \
> +                                       _mshift, _mwidth,               \
> +                                       _pshift, _pwidth,               \
> +                                       _muxshift, _muxwidth,           \
> +                                       _gate, _flags)                  \
> +       SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents,  \
> +                                            _reg, _mshift, _mwidth,    \
> +                                            _pshift, _pwidth,          \
> +                                            _muxshift, _muxwidth,      \
> +                                            _gate, _flags, 0)
> +
>  #define SUNXI_CCU_MP_DATA_WITH_MUX(_struct, _name, _parents, _reg,     \
>                                    _mshift, _mwidth,                    \
>                                    _pshift, _pwidth,                    \
> --
> 2.46.3
>
