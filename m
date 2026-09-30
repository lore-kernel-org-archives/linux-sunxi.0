Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086A24D9575;
	Wed, 30 Sep 2026 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783862; cv=none; b=mw7IrE8Cb5Pkar8lwoF4x4R7jEfM54t4OT5aG1VeIVtjXBg8RyYOaByaOy1q0eXTNLxM9KE1wB9I8/r45/XlXbPw06embsqY97M/BwI4LqWhDr35oI9kUA6S8IJj4VPjxtI8sZZ9fzqm5WCRG0W28fvFd9SvHeyuIzY6QzMdJCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783862; c=relaxed/simple;
	bh=ryBCBT1Pig33pEVZr5hCSGt/KHtTJZDhysoDxjxxmYA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xe8HOQu7Ar2eY37k/8I6JZio7KUO2ot/OVCE4+H6hdUlFGrsyRTr3/b8OozCdyChEoY8BtOG6DdlLajvXq69y2UOM3Fht5L1j1VnNuv+G22wJcyBhpS8OdwMS6mSxuYfC0NKs2598Ayb1rTr7Vvjm7IGv6UVO53uX65ETIwoljQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSqTmzoT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSqTmzoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6122A1F000FF;
	Wed, 30 Sep 2026 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790783856;
	bh=Zn6GnXkWsNiqpeJ5jUso79+4vAaCBXVZnrWkdzZLcpk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSqTmzoTfcTHTLRBsEP1csAeImy76hEou4kmV265VidhHInqZQoy7zQKIGap+gaC9
	 xyy7tQyXNVZ1oVZ/Sf6wI+G/WZjDLdN6PtqKS8mqWPdgSuSGOvYUdv0B8KmeukH9x4
	 J1h7zuOsXctXENL5+3GG0yYA3sl+1mYS8Wvsslrl16ro5OXeCSpdbVvuJ/CuHtuZ4L
	 SrEzRKFqtbRtAv/i/98f3L4oU4xzSBrQsOclcD1byM3Y/QY7BXoVRgYn65imPg0Mox
	 Xm7uA2ROz5x+qlsPv7qfFn+eNivRvBfunzXlv/XbgdL3CPEWT73s3r6eqRGClkBO9R
	 9VSKl/PZuRgBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1s-t113: Add the CSIC node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nguyen Minh Tien" <tien.nguyenminh@embeddedlinux.blog>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260930154835.402684-4-tien.nguyenminh@embeddedlinux.blog>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930154835.402684-4-tien.nguyenminh@embeddedlinux.blog>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:57:35 +0000
Message-Id: <20260930155736.6122A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: missing mandatory 'port' child node in csi@5800000
--

commit 748644695d3510624f461ae96dba4a0eda614827
Author: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>

riscv: dts: allwinner: d1s-t113: Add the CSIC node

Add the CSIC node to the dtsi shared by the D1, D1s and T113, with the
pin groups of its parallel input. MCLK has its own group, for the sensor
node.

> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 13b1e57166040..dd4c873457e22 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi

[ ... ]

> @@ -997,6 +1011,23 @@ tcon_tv0_out_tcon_top_hdmi: endpoint {
>  			};
>  		};
> =20
> +		csi: csi@5800000 {
> +			compatible =3D "allwinner,sun20i-d1-csi";
> +			reg =3D <0x5800000 0x400000>;
> +			interrupts =3D <SOC_PERIPHERAL_IRQ(95) IRQ_TYPE_LEVEL_HIGH>,
> +				     <SOC_PERIPHERAL_IRQ(96) IRQ_TYPE_LEVEL_HIGH>,
> +				     <SOC_PERIPHERAL_IRQ(100) IRQ_TYPE_LEVEL_HIGH>,
> +				     <SOC_PERIPHERAL_IRQ(106) IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_CSI_TOP>,
> +				 <&ccu CLK_MBUS_CSI>;
> +			clock-names =3D "bus", "mod", "ram";
> +			resets =3D <&ccu RST_BUS_CSI>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&csi0_8bit_pins>;
> +			status =3D "disabled";
> +		};

[Severity: Low]
Will this missing child node cause make dtbs_check validation to fail?

The allwinner,sun20i-d1-csi device tree binding explicitly mandates the port
property, but the csi node is defined here without the mandatory port child
node.

> +
>  		ppu: power-controller@7001000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930154835.4026=
84-1-tien.nguyenminh@embeddedlinux.blog?part=3D3
