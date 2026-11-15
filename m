Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755380;
	b=FuKXgm9xN1IlxHgiiIKn6GnY2mt2w+MB+7xJ/vOce7rpTxPK0WgAk02sAVEUr7LUnaqB
	 EcOfaesoDQCJlljV1c3uV1VKuf3RVzNumZ3YD+WXUwkce/P7Q1EwAuVk/iMoUS9HyXrbz
	 uTUjh9S7kxNdRgQQs2H0FKr2OQoyw/EyET+0nhz/eRM9++d3TMC5L4k/8JAiPo0shQlVi
	 Skt8y0OVmlEeFzNqYFiLfxJHbJECjQPLk62RnI1pdu3BTzqCBud0LzQfCzjufnsLCfR87
	 823SyRi6GxgLQvMZOTcH2/qUGn8WG+FPCzorxnaXM+/wfsrGAXpW883zjiRr7zhePHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755380;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Cq6yUQzukHtwhYuWtD3CdG/vzfG7TEB1pVADzBcWgFs=;
	b=C8A2uVVnwymF3SvCB2h089q+9MZtJI1v0fWCzZDkTbJ5e/IZDvXHsEwiXGXmRCjh/CBu
	 cLlV4FqBNheMj9RIznvttxFccHNG9BDDCVV2Rl04j9joGP1HTlPD3Ee3cIQHT3KlB5EU6
	 fHqI7GQqAHDLNu2FtNMsNkfUNCNWuCFspRVi3y0GfvAXucODNTfefDIgVnCEYIrB/cqWF
	 uH8u+WOq4j29snSoWXMDa++gDbT6kVdfhpJ5KYS32avmuPtjqbPH+Lvx9xmtdEGzm3gCy
	 kpCSRolSZSgg6dxCN0D+4lOlccZJTy/uTd0pNjL5sjfc1wGVGuBlzsxdAPJftpX/ZWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cANDfa3J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423CE606A323
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cANDfa3J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98F11F000C9
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755379;
	bh=Cq6yUQzukHtwhYuWtD3CdG/vzfG7TEB1pVADzBcWgFs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cANDfa3JG/1VLOyWOyMbLnYziGnzSsHDw0+p48eFEhwqjIqqzBMypnlKn2KIJbBGy
	 Hq4EETBr2jUy034admevuoevndcXik9C6uGtap6cIMzgHvPoML9laee3OpAmf4sBiB
	 V6Hi3F0/36Jj6przMu8+XPjSpjPzA85GybC1zU02FANO/I/3EaUryQjljgHh/wI44D
	 5RYySKRVJXo2SRloVa8du07x2AxdwjTDUjUTJXlLIsql7MWUyVb1o93lvq6ZjrRX/R
	 dB0ZlpwIe039A6elGxys/Fb3U05iYiO1bsBl4w+OQaWaOFfVK9uQspK5cbriu9IOZv
	 IE74MzMSJVX0w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae25c846edso22210931fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 07:09:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFpywjRGS5SaETN+4b1XA86f+mcsDAJJOhT5GfKqHN6l6wyOtth9Ga0x+nfIAaH68UhQWunRpkp8nQuuw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9o/gTqYEOOCoDMXc7LEFZtW1aCk9l2M+F5iQQt/p+LldmtEz6i
	8k1n56t9j2DeJd2Km6rO9hcDjrbVfET8oh9xK0lWjbCd6saU4fxJ4V5iCxeJeRH8tBquG+Te3C+
	rI7pj+XIArJuj+GZLpxKAOuSLGE+Lj58=
X-Received: by 2002:a05:651c:1986:b0:3ae:25c8:dc78 with SMTP id
 38308e7fff4ca-3ae2b69178cmr25726671fa.22.1794755378199; Sun, 15 Nov 2026
 07:09:38 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115132215.289236-1-jernej.skrabec@gmail.com> <20261115132215.289236-4-jernej.skrabec@gmail.com>
In-Reply-To: <20261115132215.289236-4-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 23:09:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
X-Gm-Features: AclHuK8SfNxnDatVmiI32N0fkX-YaXg08NGH8ia-Bx19MDfSYUZXv-OL_jNzao8
Message-ID: <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU
 frequency scaling
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 9:22=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
> so the CPU never scales its frequency. Add both, like on Orange Pi 3.
> OPPs above the regulator constraints stay unused.

My review agent noted that some of the other boards raised the constraints
when CPU DVFS was enabled. Do you think it's reasonable to do the same
for the OrangePi? Or do you want to be more conservative?

Note that I already applied this series.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch=
/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index 40c5c42b347e..a2a2e4cb0256 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -5,6 +5,7 @@
>  /dts-v1/;
>
>  #include "sun50i-h6.dtsi"
> +#include "sun50i-h6-cpu-opp.dtsi"
>  #include "sun50i-h6-gpu-opp.dtsi"
>
>  #include <dt-bindings/gpio/gpio.h>
> @@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
>         };
>  };
>
> +&cpu0 {
> +       cpu-supply =3D <&reg_dcdca>;
> +};
> +
>  &de {
>         status =3D "okay";
>  };
> --
> 2.43.0
>
