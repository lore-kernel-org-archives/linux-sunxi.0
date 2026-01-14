Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA172848A0
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jan 2026 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399649; cv=none; b=H44iMJ8j+Z+bV5387zAQxtT2cOJpcZH9Z9Xh5gToKhBV1t/CXAUF9T0vOJJpoU8wyf2FUwAePwSTq4LBsZ+I7QN5gXt/bmnlC2dQNjJu0oC8t0UfECfXIlYg0a8Vi7x/yeZvpyq0DVToZotS2j5rVuVfEL9F9W371k6rL+FtDk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399649; c=relaxed/simple;
	bh=9kXxSsD9GPZ8ilXPJKnyKVYaA4WA4dkOMaJ60ml6/Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYiEKyi44lrc+QYVcF0JLYA+89+i2vHyEDgV6AKFxKRn6M7wU/4FAXA6hk5dEcVuihb5yDgeO2iHnTIugv9VRMwyOPOru+DqTiRmI7Tl5Cos4DKwIo9LObrI9M18cEgikIzmdgti+07OntTSWILijqoFOxfkOzEtzMyKwgdA2wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8ramvss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8ramvss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE36C2BCB1
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jan 2026 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399649;
	bh=9kXxSsD9GPZ8ilXPJKnyKVYaA4WA4dkOMaJ60ml6/Uk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Q8ramvssNJ4BQjBaXEh8TD6iXyrk1R+mTA/1T8UjA2D+a1yvCL2th6EOUIpX+2/Rz
	 9G1aRaIVLAuQshr+/vxDSQrDn19x26iRS3xHmDyD5tPpsFjuJbaQ9PwJk9OKm6hn/K
	 ScSRYEl3Aq/Qw7WP4fpy4BgNdo6bToVD5ZSeZicplUtL0QmejHw6GI8R5lh2RVAnqV
	 QOmGxY29XsHZehYaPr80OxM9R++Zi93xohtgKMkMLO5zIRaI4PegyDxsPVuJknFZCI
	 p5X4beyVZ8ZrYCqiR0NqIrTLp+MqvsR82SWfVg7LoBkH8Fj5e/k+t7xD627v3pROfi
	 nWxd21k+XUKCA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b79f700a1so869465e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Jan 2026 06:07:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXF8UlXeYHx0VYs2QFOLFee7IMGAt30D9+/Kmo23KTU0cncQ9bWGOp4nfVYAyREgkQdcpKGnLM0L9f71Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb5Pf+EoPICajbqrg2EB+HjA4MmjPncerArovm5iMcBp94aNa/
	5M/NJHQMBe0oQZdBFAhjMuutpdeHxePFinadNVie3y19v5umAsSwg1e7GITPZ8FTIuV5BL8jl8H
	xEm6Ut/Sdsj1oWRPkZLRQLAf9zE02+e4=
X-Received: by 2002:a05:6512:39cf:b0:59b:7804:f149 with SMTP id
 2adb3069b0e04-59b9941fe05mr2533661e87.17.1768399647739; Wed, 14 Jan 2026
 06:07:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 14 Jan 2026 22:07:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v66gpmreQiDMDJ8NE1QJ-e+iBUVicw9sv=RgiwuONfUFAA@mail.gmail.com>
X-Gm-Features: AZwV_QgyMFwMvO53ZaT5aNqrfV7muoxJxa1mFM3R5z3QBXkoO24uW2v55PGRm7Y
Message-ID: <CAGb2v66gpmreQiDMDJ8NE1QJ-e+iBUVicw9sv=RgiwuONfUFAA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: sun7i: a20: fix MMC index enumeration
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 6:50=E2=80=AFPM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Currently, the OLinuXino-A20-Micro experiences non-deterministic MMC
> enumeration during boot. When both an SDIO WiFi module (MMC1) and
> an SD card (MMC0) are present, the kernel may swap their indices.
>
> Explicitly define mmc* aliases to ensure consistent device naming
> and prevent mapping conflicts.

Years ago we (sunxi maintainers) decided against this.

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 4 ++++

And aliases are per board, so this definitely doesn't belong here.


ChenYu

>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/d=
ts/allwinner/sun7i-a20.dtsi
> index 5f44f09c5545..a958400bcd7c 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
> @@ -55,6 +55,10 @@ / {
>         #size-cells =3D <1>;
>
>         aliases {
> +               mmc0 =3D &mmc0;
> +               mmc1 =3D &mmc1;
> +               mmc2 =3D &mmc2;
> +               mmc3 =3D &mmc3;
>                 ethernet0 =3D &gmac;
>         };
>
> --
> 2.47.3
>
>
