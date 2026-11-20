Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188252;
	b=csRQj2WqmKDkagE7pg0iPtnW3DUzVcsee5htYmYvRj7URKaJX7SmhbnJTThINN3H3vlv
	 5JxXeg6lVXIUfHCnjfwaoEY333FHdvYID01vCwoFASsPyjS5tuZMuKM01k4XKsc+7hNkf
	 jgBWiH2rMTj+NIhSEEamqpd+sHYXtfHGCF3HIcNnIKWLAZWyZTjjbSny5HlURTSbc0dBv
	 f8qTqJoY5vEKMKEziP5dybSJGRc/A1eQPkJ2tThTumbKxXe3swF7AfS36vaghD70m8uME
	 vjvgL/9EB06RDRGxT2jSPzBSKm0VyxIutg0k1rM5XcnShNJU+tFp2vdwYDTvbh/cfyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188252;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mm+qHNraHAaYmCtZVnhp9nAQRT/K0rmVdDUtGtzHsiA=;
	b=0TASZ5g5a2a8qN8hkTyp20/Wi+VU2O2CAGgmhJhxEa7GrsLXI0s0KfjYBtGz35OdE9/s
	 cBHag2KvvI8MmeGPSdWg2+l2T+76oOZjKF3ZOUXBYgJ0VOwWzbxJOTCLIx9BJCCmlkPlv
	 rAyAhzg7QERGfcWxgQJ8tTi0n6AuoT9h8nufICAlvq6G6G4KuWs5KhPyjeWZ2ZvFg/m+Q
	 XhiKVkdZEFGoEU1AchfJlLDOYLHnscVp50mJWwkM5Elp9f/HrVm0ntMZy8tMld/3ewAvR
	 Dh8Hej8rUCMRyh2AoOO0UyMIFVJkB3LS8RCFoAhXtVpWgZCdExO/TXAg/rk0Np4QHvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxZ5pY6h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186CC606A320
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxZ5pY6h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B051F000C6
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 15:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188251;
	bh=mm+qHNraHAaYmCtZVnhp9nAQRT/K0rmVdDUtGtzHsiA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=dxZ5pY6hpvvkugXfXEAfNhOGp8uNhqCP+hzd3pa6YdiWXx2uk/+rtfuTJLBdk6cs+
	 qS1tr490X6WIEnmwcsfRt733uAq29wTnKlsisPj0RY/GSLNWL6r8Fb6JAbNpFVSzdL
	 dedzCJpv9yEv6A52shcqzq97G0JWkgRZg231ydYXOenvX1Ap+S2Zo0CSpD0HKT+jSE
	 YXTSq0BKySABVNKPNZNb0Q41ZHY7yjygeGfwGQMaC6RkjcYgTwVbQGQq83+KojNaC0
	 Cqa6V70ZwsDW45g0oaJBA++Q7E1xzHWiu9VtUXzhLC397/JbS7rDDx1N1GZ+lYacQU
	 OsE4YJtLubXLQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3acd239776cso8143001fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 07:24:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGR1YR43QNGE2NNXBGd5wLkiYTUXaTvfm3x9AQv2O5HvazITOdMFOSW88w63ipHJBGePz3kWm81AmEWOA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8wjL1LHWpGl3zOb/BnHHV5rQHUN9Fgglped2azXsfBzfLQU17t
	RwPjtrUFaIcekV8PDNpkqmxxMmB5GouNwmYQ5mZX4hat2pdEgC27sPWVljt9lfwT4bVpc61/hJ8
	f0ES2i7WuNHfnFNb+MofBxzOnSmUnm3o=
X-Received: by 2002:a2e:ac01:0:b0:3ac:f350:cd66 with SMTP id
 38308e7fff4ca-3ae7fa81427mr10056821fa.20.1795188250182; Fri, 20 Nov 2026
 07:24:10 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:23:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v66=Wy1TEy5KrQt+TmYPowryx19tUN14QTREn9z0dOaJgw@mail.gmail.com>
X-Gm-Features: Aa3M54p7k_v0KG9p7QbnfhbCu32b9QTmLjHC5sxgzpf1CLcce99IzZXup6e1Tq0
Message-ID: <CAGb2v66=Wy1TEy5KrQt+TmYPowryx19tUN14QTREn9z0dOaJgw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 LPO clock for AP6212
To: ipfarher@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:40=E2=80=AFPM Ivan Pfarher via B4 Relay
<devnull+ipfarher.gmail.com@kernel.org> wrote:
>
> From: Ivan Pfarher <ipfarher@gmail.com>
>
> The AP6212 WiFi/BT module needs a 32.768 kHz low power oscillator (LPO)
> clock, which on this board comes from the RTC clock output (osc32k-out).
> Nothing in the device tree references that clock, so it is disabled as
> unused during late boot.
>
> WiFi keeps working without it, but the Bluetooth core does not: with the
> LPO gated, the BCM43430A1 ROM answers HCI_Reset and nothing else (no
> Read Local Version, no firmware download), so the controller can never
> be brought up. Turning the clock output on by hand (RTC LOSC_OUT_GATING)
> makes the controller answer normally.
>
> Reference the clock from the WiFi power sequence, as other boards using
> the same module do (e.g. sun8i-h2-plus-bananapi-m2-zero.dts).
>
> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: osc32k-out stays enabled and the Bluetooth controller
> answers HCI commands. Build-tested only against current mainline.

It stays enabled only if the mmc stuff is working. So besides the changes
in this patch (which technically only covers the WiFi side), you should
add a proper bluetooth node under uart1 with all the resource references.

> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Fixes: cf8e19e1ec15 ("arm64: dts: orange-pi-zero-plus2: enable AP6212a Wi=
Fi/BT combo")
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index 3eb986c35..34d6c1468 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -5,6 +5,7 @@
>
>  #include "sun50i-h5.dtsi"
>
> +#include <dt-bindings/clock/sun6i-rtc.h>
>  #include <dt-bindings/gpio/gpio.h>
>
>  / {
> @@ -54,6 +55,8 @@
>
>         wifi_pwrseq: pwrseq {
>                 compatible =3D "mmc-pwrseq-simple";
> +               clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> +               clock-names =3D "ext_clock";
>                 reset-gpios =3D <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
>                 post-power-on-delay-ms =3D <200>;
>         };
>
> --
> 2.43.0
>
>
