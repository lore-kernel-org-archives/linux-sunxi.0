Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113031;
	b=UmB0vPnblCgCNX4PjOtSZ3ZhlTHLwOiDs3KAHtq+tVXD4loqxhh+DcJDKjJyvjesnxh0
	 ZizpXgfE1+sj8b6NtomUbRPAccALGKLFXP7LDfZG+NElxYafZmFYcFnJh8SCFO6wneDV1
	 Udgn0OyqcCx0gUBd6SLqCDEl4+WeIbbPEK8y5UrDfHd+mhEVUqqW3kKgP29wOtgxjl6Lv
	 Mp8o7jyL4beMIyTirwD5ehotIAcaDHn1Sqqkc9kWU98T2USz31B16mJbst1XzINl9tl7w
	 4dc2ZgonEiI/Pat2w3cg+syRjMBGBxsjUCxguzrQHWMcR0qBzsmVXW9YRoceNXO4W7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113031;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Xg3fF7f+P2P2O66a6WP5C/XN4Y1WPbaDROXPu+3BD8w=;
	b=XSmqZUf6wRlkN6MRTwZ2M+maAK3kYSwBfJQOMQQ6/SCnfyQBSYoscOOhmkq9QxnnALK8
	 kRPLhXH2jFXsWoSCcLLN8KXYE0Lt1KespaR3Se8Ldz06Meywwu2WgOFdWWumpM8Lg4ghe
	 fLE9brRJsujbVaqnBBRQ+688LJ6zsS5cv2+vF6LcBxNSf4LQSStGAnwykWtRFluQ+ucN6
	 0tgFoddaSCLfpRZ11tspyVaris+QoU7h2UybEZUWp+7yKJqzKDuA7d7a49taXAv9cKEBR
	 5acqbMwakQ6Ben/a8XjBNiUcxPqwmNrSsnSirICgT1u2gha+CbQWWV3joQ5Dy9Goyxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ILaeC0K6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F31B606A320;
	Thu, 19 Nov 2026 18:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ILaeC0K6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8A11F000C4;
	Thu, 19 Nov 2026 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795113030;
	bh=Xg3fF7f+P2P2O66a6WP5C/XN4Y1WPbaDROXPu+3BD8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ILaeC0K6WCfwO40tG6Up7mzygTkfImhQlh5tATQVnvUOER/457XxgPkKP4u6UdXJX
	 L9qtXiE7Ep1mXs81IdiLY9t4xsBFMhlusUbaAJxa1pMCjtW36G1UbURDcDmJUOoKcg
	 9HpgfS9zQkeHu+JJ9II55/4KuSeYam/hspOzYXPklH7OMWsXPuZ1cp93I2SWzQsC/h
	 NMmjGILyToUAAQd/u1fSrpPQrDCD1WmPk1UA2hi834dI6mO2juLTVY3iLOOdWYoVVR
	 WgxBVugv4Z9WIBefvYjRDY4CjgAyI2Xu3KIRTfgkPKD8T6TqbZyf9pCAWgs1tWpsAF
	 hjz5dMyjvCe1w==
Message-ID: <sashiko-outbox-223770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: allwinner: add A733 SoC description
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <dbfb7c5ea8b0ade2d48ef8e5cfd0b9e5a9946483.1795034153.git.enzo.adriano.code@gmail.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
 <dbfb7c5ea8b0ade2d48ef8e5cfd0b9e5a9946483.1795034153.git.enzo.adriano.code@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 18:30:30 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: allwinner: pio node lists 10 interrupts instead of
  11 on A733
- [Low] arm64: dts: allwinner: undocumented allwinner,sun60i-a733-uart
  compatible
--

commit b822d1469c44857fd000cc1a89105a359018f41b
Author: Enzo Adriano <enzo.adriano.code@gmail.com>

arm64: dts: allwinner: add A733 SoC description

This commit adds the base Devicetree description for the Allwinner A733
SoC, covering CPUs, GIC, timers, clocks, pin controllers, UART, I2C, and
MMC controllers.

Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986=
b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/=
boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 0000000000000..b0f642f37803a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> @@ -0,0 +1,657 @@

[ ... ]

> +		pio: pinctrl@2000000 {
> +			compatible =3D "allwinner,sun60i-a733-pinctrl";
> +			reg =3D <0x02000000 0x800>;
> +			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH 0>;

[Severity: High]
Does omitting Port A's interrupt (<GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH 0>) at
index 0 shift all main-domain GPIO bank interrupts off by one?

The binding in Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a=
523-pinctrl.yaml
requires 11 interrupts for allwinner,sun60i-a733-pinctrl.  In the driver,
Port A occupies bank 0 with 0 pins, so prepare_function_table() assigns
irqbank 1 through 10 to Ports B through K, and sunxi_irq_base_reg()
indexes the per-bank IRQ registers from Port A at bank 0:

drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c:prepare_function_table() {
    ...
		if (irq_mux) {
			if (bank > last_bank)
				irq_bank++;
			func[lastfunc].muxval =3D irq_mux;
			func[lastfunc].irqbank =3D irq_bank;
    ...
}

With only 10 interrupts starting at Port B (GIC_SPI 69), pctl->irq[0..9]
are registered one bank off from the hardware registers.  When any GPIO
interrupt on Ports B through K fires, sunxi_pinctrl_irq_handler() reads
and clears the preceding bank's status register, leaving the interrupt
asserted.

[ ... ]

> +		uart0: serial@2500000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";

[Severity: Low]
Is "allwinner,sun60i-a733-uart" documented in
Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml?

Neither that schema nor this series defines "allwinner,sun60i-a733-uart",
so dtbs_check will fail on uart0 through uart6 and r_uart0 through
r_uart1.  Other Allwinner arm64 SoCs use "snps,dw-apb-uart" alone unless
the SoC-specific compatible is added to the binding.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795034153.gi=
t.enzo.adriano.code@gmail.com?part=3D2
