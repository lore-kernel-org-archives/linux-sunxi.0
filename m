Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB928FFED
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652431; cv=none; b=D4wZK4IxTN1kXG/8b76KNkrxMaa4zZu62owB7275AqVLu7fwGcyHG1aWXy3raskKvRYmI9YATP12tdD6ZfFqfiUmVBcLK7Orm+Sa8WDg6LEjbj32bRfQc03HKocNAD5pvifJ55n7gbd+MNIXYhNlvqVaanhsfdflcWzn9JsjaWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652431; c=relaxed/simple;
	bh=FOhorxvdZmF3UNv1K8W2H1jGJQvtIe7mLPYFtgtvSW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXQyYttNqyzqXZGGDNxHI7MmZ3vlpCiJvW40fCFyacjYro7NwJGX3uoGHiCVLVQRo2nn7xSlH6ltpMoTvD/FghsXQzSY+ca+URTBhCGhSjzP4MyteZ10G1r0Tk2riwpjYYvVhp/sUSf/sPerkXejw9qEIpcos0s1ardJO/FVOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btuMuu7u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btuMuu7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213A8C4CEE7
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 21:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746652431;
	bh=FOhorxvdZmF3UNv1K8W2H1jGJQvtIe7mLPYFtgtvSW0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=btuMuu7uLieKmDGVlybQW7zSorwTv9xmX+kalsU9Xr7S/lzf/Mof3PEelM6L+MDrK
	 VWsZkYPSeotdCrnfUbs9JYo0eQK1hQWnRkWUbimQo1XPKH4v+u6tNDIOZabeBYCaoE
	 qb1SqW3nxnPB4iDRmUDrM16yCo3SCcAfZDCZzitzi6dMbXv0rZY+Ob7MvSR7fxhkPF
	 0e9KTa45FBKB+rBgNes8YlDJIn50BgcY2LH+JsqzZPf7VW0xaG7nJ6WAREX7h6LOIc
	 L5l0H0AHLdbVS4KNj04bnfVb399Hi3TgTqQ5HJFQbBGXbnLNwCMyIV0B+IdpdFvvLO
	 QfU0HgzPQbNqA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f861d16622so530978a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 14:13:51 -0700 (PDT)
X-Gm-Message-State: AOJu0YxYUzJcVwoS1EDuXdwMo7mHqrKfKDVqnnAQaTaDwYwQfsb8/hPA
	EMI51T6MSOMR89Blxfsku4QbuI2Iw03dPCxYaIiA0yswI6lfkD1UAHRtt+s6LU595P7Ydv39F0/
	g0uX2ggGPF55kpzCA24SMAI6ofQ==
X-Google-Smtp-Source: AGHT+IGy/AslGdF1MwNhYOl0MOFlrYH+HeNbtvQP6c32M4CYMagN9EZk7pk8+/lEW3ChlPpDUlN2iBCbhpBAEvvyfTY=
X-Received: by 2002:a05:6402:510b:b0:5ee:497:d4f3 with SMTP id
 4fb4d7f45d1cf-5fbe9fa80ffmr4380732a12.33.1746652429740; Wed, 07 May 2025
 14:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507201943.330111-1-macroalpha82@gmail.com>
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 7 May 2025 16:13:38 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+gtVi1XG7b2g+n-H=fDrkZRqVA0wNSAA5-Ot7EXqG2QA@mail.gmail.com>
X-Gm-Features: ATxdqUGfERVR08MJzfUs6EpZ2bPDiTaMnXmVepdJ-U9hQFvKGPhrVmDCJuHz-wU
Message-ID: <CAL_Jsq+gtVi1XG7b2g+n-H=fDrkZRqVA0wNSAA5-Ot7EXqG2QA@mail.gmail.com>
Subject: Re: [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3 (DE33) support
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ryan@testtoast.com, macromorgan@hotmail.com, 
	p.zabel@pengutronix.de, tzimmermann@suse.de, 
	maarten.lankhorst@linux.intel.com, simona@ffwll.ch, airlied@gmail.com, 
	mripard@kernel.org, samuel@sholland.org, jernej.skrabec@gmail.com, 
	wens@csie.org, conor+dt@kernel.org, krzk+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 3:22=E2=80=AFPM Chris Morgan <macroalpha82@gmail.com=
> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> I've spoken with Ryan and he agreed to let me take over this series to
> get the display engine working on the Allwinner H616. I've taken his
> previous patch series for Display Engine 3.3 and combined it with the
> LCD controller patch series. I've also fixed a few additional bugs and
> made some changes to the device tree bindings.
>
> Changes since V8:
>  - Combined the DE33 [1] series and the LCD [2] series to better track
>    all patches necessary to output to an LCD display for the Allwinner
>    H700.
>  - Added a required LVDS reset as requested here [3].
>  - Added compatible strings with a fallback for
>    allwinner,sun50i-h616-display-engine, allwinner,sun50i-h616-tcon-top,
>    and allwinner,sun50i-h616-sram-c.
>  - Added binding documentation for the LCD controller.
>  - Renamed the de3_sram device tree node to de33_sram.
>  - Corrected the LVDS reset for the LCD controller binding.
>  - Removed the PWM pins from the pincontroller bindings, as PWM is not
>    yet supported.
>  - Reordered the patches so that a binding or a device tree node is not
>    referenced before it is defined.
>
> [1] https://lore.kernel.org/linux-sunxi/20250310092345.31708-1-ryan@testt=
oast.com/
> [2] https://lore.kernel.org/linux-sunxi/20250216092827.15444-1-ryan@testt=
oast.com/
> [3] https://lore.kernel.org/linux-sunxi/38669808.XM6RcZxFsP@jernej-laptop=
/
>
> Chris Morgan (24):
>   dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
>   clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
>   drm: sun4i: de2/de3: add mixer version enum
>   drm: sun4i: de2/de3: refactor mixer initialisation
>   drm: sun4i: de2/de3: add generic blender register reference function
>   drm: sun4i: de2/de3: use generic register reference function for layer
>     configuration
>   dt-bindings: allwinner: add H616 DE33 bus binding
>   dt-bindings: allwinner: add H616 DE33 clock binding
>   dt-bindings: allwinner: add H616 DE33 mixer binding
>   clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add mixer configuration for the H616
>   dt-bindings: allwinner: Add TCON_TOP and TCON_LCD clock/reset defines
>   dt-bindings: display: sun4i: Add compatible strings for H616 DE
>   dt-bindings: display: sun4i: Add compatible strings for H616 TCON TOP
>   dt-bindings: sram: sunxi-sram: Add H616 SRAM C compatible
>   dt-bindings: display: Add R40 and H616 display engine compatibles
>   drm/sun4i: tcon: Add support for R40 LCD
>   arm64: dts: allwinner: h616: add display engine, bus and mixer nodes
>   arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
>   arm64: dts: allwinner: h616: add LCD and LVDS pins
>   arm64: dts: allwinner: rg35xx: Add GPIO backlight control
>   arm64: dts: allwinner: rg35xx: Enable LCD output

What's the base for this series? It didn't apply for me (using b4).

Rob
