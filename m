Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4954B261B9E
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jul 2026 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559614; cv=none; b=u19ulpY8q5OrYLXjw2bSfVxp2QHbfjVX6+yudjTLLFxT2GwNOu9OdzgWnTdEXpFXGVj4ixLWpuxuR4LgqnA/dgskQKZDQVChBoywbB7Rq7vI5mv7gznpXYpVnn3AEA65crY8MmctTOUfoWv1IFYX0qxKIR2muGCw1tI2H7tFBjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559614; c=relaxed/simple;
	bh=LZfiYFdhqwkGWCj0/ELn1D+HQoUe4Bfi4tawgNhijGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pA0cwmTMByEugBiw80Q8IcIXvoUGeWwnjYzwIVrFBs+RpcotGyBGQBFQ+IePXb7bo8w6A8Ra6S6ODP4RPesVE1AcI5RGRLvByeQ3CGJd5Fhrgdbxy5rWAyJrTSoMYDJF8VwA2Z9vIZ1uYegVY+bYyKi4iJNIXQAu4gY0/OY5VEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYNftuoY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYNftuoY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105F41F00AC4
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jul 2026 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784559612;
	bh=ycNBxklaVmmxA9p+FUkLQ7zBOctipBkWzL8+cRziObE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=jYNftuoYHLqhjKULKjfWm+F98NTgtaMuARSXROze+kppPuP211YIGPoUqvVGvBN1H
	 AbSP3gzgNZ9l8CH75UmHp2t0LR+jbliLU9ZTysP8dWdWJsjQWUF+SZefpuFRokncMO
	 TeRKdB3hFfRxZXPxtX9fvmd8vYa9e3BAzYna/P4b4Eb7kfkbrmbMK728lZX9r1VmS9
	 AbU/vcar9X2gtc0VIqLA2st5pH8r5q2YxoX2uX5XMSvYhaP+OKtYLzNNRi7hpeSxkQ
	 sFXB3+KEAtDG9aImwMmrqtkIuV5Y8wc/PabssfEYbD/eSxHXYtfcymuWnGdIRdandd
	 /c63Fo1Da1DdQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so51856861fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jul 2026 08:00:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq210MPq3RMz7ReEsacHc8kNZH6jICDVogFcp2JpLe7csbME5+UfSKUQDeld/RrktsFkSALM0Wk3xAThw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFjfzS3t5bTUiVOC0TPAIPdNooxHApHznbbrWFyDFDoOe06tmd
	yFru65Jm+ctCItZgea0yaMMSkEkjbt8QZT6iMfdyRMn+qNihyjf5GVKadF3eaaXBcx3G6TYotEt
	9fy182QZPxDLxzByrCMjJnoZEk9u6Gl8=
X-Received: by 2002:a2e:be85:0:b0:39d:4014:12cb with SMTP id
 38308e7fff4ca-39eb27158ddmr27207081fa.2.1784559610404; Mon, 20 Jul 2026
 08:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260719030927.2417-1-per@palvencia.se>
In-Reply-To: <20260719030927.2417-1-per@palvencia.se>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 20 Jul 2026 22:59:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v64rRipC9VV5QyHC0nR4rAho8q=wX0ngVVxRND3xMOnofA@mail.gmail.com>
X-Gm-Features: AUfX_mygD09zG0aqXA7P3nfYCY5wS_Gay0KUV-iNTQ-76viZAbc2kbcgr8hwOVI
Message-ID: <CAGb2v64rRipC9VV5QyHC0nR4rAho8q=wX0ngVVxRND3xMOnofA@mail.gmail.com>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a523: Add SPDIF to x96qproplus device
To: Per Larsson <per@palvencia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 11:10=E2=80=AFAM Per Larsson <per@palvencia.se> wro=
te:
>
> When spdif support was added for the Allwinner A523 family of SoCs, only
> two of the three possible pins were added to the dtsi, since the third
> would clash with the first ethernet port (emac0)
> However, some devices don't use emac0 and instead use emac1 for the only
> available ethernet port, leaving the pin free to use for spdif.
>
> Add it to the dtsi, and to such a device where this pin is used for spdif
>
> Signed-off-by: Per Larsson <per@palvencia.se>
> ---
> Marking this as RFC for a few reasons
> 1. This is my first submission, hoping everything is properly organized.

This is pretty good. The commit message is also well written. I would
like to see the patch split into two patches though. The first adds the
pinmux (and you can mention in the commit message that a subsequent
patch will reference it). The second patch enables SPDIF on the device
you have.

> 2. My testing setup is not the best: I get sound with this patch, but
>    the pulseaudio daemon needs to be restarted far too often.
>    Hopefully it's just something on this minirootfs. Testing welcome.
> 3. Not sure where to get the hash for a fixes tag or if that's even OK

This is a new addition, not a fix, so no fixes tag is warranted.


Thanks
ChenYu

> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  7 ++++++
>  .../dts/allwinner/sun55i-h728-x96qpro+.dts    | 24 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index ca6a16807049..7370e8ed24ec 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -216,6 +216,13 @@ spdif_out_pb_pin: spdif-pb-pin {
>                                 allwinner,pinmux =3D <2>;
>                         };
>
> +                       /omit-if-no-ref/
> +                       spdif_out_ph_pin: spdif-ph-pin {
> +                               pins =3D "PH7";
> +                               function =3D "spdif";
> +                               allwinner,pinmux =3D <4>;
> +                       };
> +
>                         /omit-if-no-ref/
>                         spdif_out_pi_pin: spdif-pi-pin {
>                                 pins =3D "PI10";
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arc=
h/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> index a96927fbdadd..b172985583f8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> @@ -44,6 +44,24 @@ reg_vcc3v3: vcc3v3 {
>                 vin-supply =3D <&reg_vcc5v>;
>                 regulator-always-on;
>         };
> +
> +       sound-spdif {
> +               compatible =3D "simple-audio-card";
> +               simple-audio-card,name =3D "spdif-out";
> +
> +               simple-audio-card,cpu {
> +                       sound-dai =3D <&spdif>;
> +               };
> +
> +               simple-audio-card,codec {
> +                       sound-dai =3D <&spdif_out>;
> +               };
> +       };
> +
> +       spdif_out: spdif-out {
> +               #sound-dai-cells =3D <0>;
> +               compatible =3D "linux,spdif-dit";
> +       };
>  };
>
>  &ehci0 {
> @@ -275,6 +293,12 @@ &r_pio {
>         vcc-pm-supply =3D <&reg_aldo3>;
>  };
>
> +&spdif {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&spdif_out_ph_pin>;
> +       status =3D "okay";
> +};
> +
>  &uart0 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&uart0_pb_pins>;
> --
> 2.48.1
>
