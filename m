Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B701F9EAB
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Dec 2024 15:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733240085; cv=none; b=m9HuTKZS94Wd3bLqXCpb0SxEetmq1fvm5piIKoDuDRDscO3cr2O0DNXp5zTPqdkr48LHwW/oV/e2DSscb/A5URQJrnowioWftOGTQmpn6kMMTyq4dUXDkbRAejDIQRVCZ97x3+IroJmHB1TFe/eDJLzFkBk7B+8K1YUlODBswL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733240085; c=relaxed/simple;
	bh=/t81Kipm80KSB2ytCFacecH45iV4Rgpz9NMkvjdx3oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+lU9OW1pktp8rWsOwUWCgoGjoJRSdzNheOYNVkam/6RLF5vprjvOPeub4JBbl1rjrokQUaaDNG6YsDfFNs7sQ+SoLgIgoprQ6tDCnwB8hB0k8jI2q6NlgSHXSOA7xp25OzQQAeh4L5YVTmJOwaX80d6NhiH6tFMH6qmobvek6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffd6882dcbso44611361fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Dec 2024 07:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733240078; x=1733844878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N9ct1kVI68mHIDVHyGKkb/UxzcQ9qI2NSHiJbGWgjuE=;
        b=QMupq9h+nQX0MA0TkWY1OIf6yepNybmtvHlQuNvKNdFezh4MPyXM4L37AnCW8soVQ9
         eMDHabeXc3PkBTzfsApzMoGmJxy7KevQswA63KfMK5M6dLVIOE8kouYnArTAqrX602DF
         n2BRLqtmYR6ZSStfLYnBNZR8kfKGgBf64AjQjNVCRn+OUyDsnklTi4i2t7ujuFbw5J1w
         Eiqt0tKohjv37pReWCMRNSEfEOAB/8Gm9p4XqO8M44zfyzbDmJb3UkUwoDEm1+Unf6H/
         mOrMKYfu7cGa3rY8e0W0DFmyoF/+2PWy4TSb96BL5qJaadJqj1VyUwol3N7aqj6+7+37
         tAHw==
X-Forwarded-Encrypted: i=1; AJvYcCXPwt1WjMgCSO13UXcxisAadaTKpMP8ERaZUV8sa+YPlbWHP/ac6eVnjFDEUZ+pouebDiJVshMutgPeZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjLHulnYkKbYwXoOtH+6CGkCbl8yvWgisbzsLeijzaejYJM2qZ
	p6tqLPYVPORamVp/OXQF5ojmxkTE3GfsItKrNZSCC8Gw6e4XkGPTD4otS0Nu
X-Gm-Gg: ASbGnctPfV6K68bQ0TtRh31nOoIbi3LK3m6m65/nFwu42giAXNqsu03J3b8GFeu1WfV
	D4JTurYrJV6veJdKqqi+S3JuY2hUqcNb4ABJ1dHZe7ytoph1PyAZ6d/+wKhLxLllIhXsYCLg70a
	pVjxcPh2REszo9L6xDUZ+eq8j7SFgsOsBfeVXFdh3nFLN3LHnulTgrv2wQLfMgvWpmFjsTLZ+Ti
	rh11WfGyUVALc18GmmbY1EKHBmZpM6qzJgDyFRkcYFHGagTrh0ezhLcZKO4TYN+f0RyurmEtEpY
	G36PobU=
X-Google-Smtp-Source: AGHT+IHtUaoGohXov48EQr3eCyxZUSjkLtG+GuAOq/Et1MoGkzv3sHNJpri3WasUUtxkswetNauhzA==
X-Received: by 2002:a2e:b8c6:0:b0:2fb:54d7:71b5 with SMTP id 38308e7fff4ca-30014e244a3mr2726611fa.22.1733240077848;
        Tue, 03 Dec 2024 07:34:37 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30015436e37sm232241fa.93.2024.12.03.07.34.36
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 07:34:37 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffd6882dcbso44610551fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Dec 2024 07:34:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV21ihbMxTGnmY798n65kvM5oDE06cFVD26TIgSZsae+sJ3p7Gv+Ew5IW8slcqpuHmVZ9j3ozE181sEPQ==@lists.linux.dev
X-Received: by 2002:a2e:be1c:0:b0:2ff:cb09:ccae with SMTP id
 38308e7fff4ca-30014e22085mr2966011fa.17.1733240076014; Tue, 03 Dec 2024
 07:34:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest> <20241202-a100-syscon-v1-2-86c6524f24d7@epochal.quest>
In-Reply-To: <20241202-a100-syscon-v1-2-86c6524f24d7@epochal.quest>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 3 Dec 2024 23:34:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66RAyKrpn7EJMoPUzM6W6J-3ch0xwQnY7uBm6dXgFJ5bg@mail.gmail.com>
Message-ID: <CAGb2v66RAyKrpn7EJMoPUzM6W6J-3ch0xwQnY7uBm6dXgFJ5bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: a100: Add syscon nodes
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Parthiban Nallathambi <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 12:43=E2=80=AFPM Cody Eksal <masterr3c0rd@epochal.qu=
est> wrote:
>
> The Allwinner A100 has a system configuration block, denoted as SYS_CFG
> in the user manual's memory map. It is undocumented in the manual, but
> a glance at the vendor tree shows this block is similar to its
> predecessors in the A64 and H6. The A100 also has 3 SRAM blocks: A1, A2,
> and C. Add all of these to the SoC's device tree.
>
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 31 ++++++++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-a100.dtsi
> index 29ac7716c7a5284ccf8af675db9c7d016785f0ff..31540a7ca1f01c6c2e69e3290=
54aca16ffd112c4 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -101,6 +101,37 @@ soc {
>                 #size-cells =3D <1>;
>                 ranges =3D <0 0 0 0x3fffffff>;
>
> +               syscon: syscon@3000000 {
> +                       compatible =3D "allwinner,sun50i-a100-system-cont=
rol",
> +                                    "allwinner,sun50i-a64-system-control=
";
> +                       reg =3D <0x03000000 0x1000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges;
> +
> +                       sram_a1: sram@20000 {
> +                               compatible =3D "mmio-sram";
> +                               reg =3D <0x00020000 0x4000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <1>;
> +                               ranges =3D <0 0x00020000 0x4000>;
> +                       };

Each child node should have an empty line preceding it, as mentioned
in the dts coding style doc:

    Documentation/devicetree/bindings/dts-coding-style.rst

ChenYu

> +                       sram_c: sram@24000 {
> +                               compatible =3D "mmio-sram";
> +                               reg =3D <0x024000 0x21000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <1>;
> +                               ranges =3D <0 0x024000 0x21000>;
> +                       };
> +                       sram_a2: sram@100000 {
> +                               compatible =3D "mmio-sram";
> +                               reg =3D <0x0100000 0x14000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <1>;
> +                               ranges =3D <0 0x0100000 0x14000>;
> +                       };
> +               };
> +
>                 ccu: clock@3001000 {
>                         compatible =3D "allwinner,sun50i-a100-ccu";
>                         reg =3D <0x03001000 0x1000>;
>
> --
> 2.47.1
>
