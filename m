Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857372EF2B8
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 18:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258843; cv=none; b=PfagGGSRvbJtvUVTSdttTnuWkHuTGbrexAqBjEOs/3YKvycxn5YxfPrxjsSB5sCwsGqxh5vReoeBohpbw7TNDbFqgHWg6w3nlkzz1R0nfWqVml6J8W5ludO/vc0XaM2lz5hlIVME/nXr9yfU9BEcPf/aTy9KETVWsJr0ehzBh3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258843; c=relaxed/simple;
	bh=kyfMSq/ZOk9KhCVjB6jQ16A833TFAdd4LBdq5IIWH9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTiNktpTaZsXuVCqOoV3ZFu553MGb6PTYLZTXywSlfj9Jf6SKKQvM8FvF+apR9mkBUamJQ5Gw8uU/LiUrz05VWIQdn+Jkr/5/v3rCkJGPWRGSHh8Erlyu6wE9pj7XoIZY43udlRNCm7Jo74rHMdMCsta0V/x0NpppVPU9ppf81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C48616F8;
	Fri, 11 Jul 2025 11:33:50 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7F7D3F694;
	Fri, 11 Jul 2025 11:33:58 -0700 (PDT)
Date: Fri, 11 Jul 2025 19:32:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: iuncuim <iuncuim@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.or>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] arm64: dts: allwinner: a523: add Mali GPU node
Message-ID: <20250711193210.6b7f2875@minigeek.lan>
In-Reply-To: <20250711035730.17507-3-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
	<20250711035730.17507-3-iuncuim@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Jul 2025 11:57:28 +0800
iuncuim <iuncuim@gmail.com> wrote:

Hi,

> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>=20
> The Allwinner A523 SoC features the Mali-G57 MC1 GPU, which belongs
> to the Mali Valhall (v9) family. There is a power domain specifically
> for this GPU that needs to be enabled to utilize it.
>=20
> To enable in a specific device, we need to enable the gpu node and specify
> the =E2=80=9Cmali-supply=E2=80=9D regulator additionally in the device tr=
ee.

Checked the resources against the manual:=20

> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index dd6fa22f9..d3528d498 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -108,6 +108,21 @@ soc {
>  		#size-cells =3D <1>;
>  		ranges =3D <0x0 0x0 0x0 0x40000000>;
> =20
> +		gpu: gpu@1800000 {
> +			compatible =3D "allwinner,sun55i-a523-mali",
> +				     "arm,mali-valhall-jm";
> +			reg =3D <0x1800000 0x10000>;
> +			interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "job", "mmu", "gpu";
> +			clocks =3D <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
> +			clock-names =3D "core", "bus";
> +			power-domains =3D <&pck600 PD_GPU>;
> +			resets =3D <&ccu RST_BUS_GPU>;
> +			status =3D "disabled";
> +		};
> +
>  		pio: pinctrl@2000000 {
>  			compatible =3D "allwinner,sun55i-a523-pinctrl";
>  			reg =3D <0x2000000 0x800>;

