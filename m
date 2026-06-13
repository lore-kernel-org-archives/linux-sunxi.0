Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490521B85F8;
	Sat, 13 Jun 2026 17:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781372360; cv=none; b=XXTKgJ8iFKuZNJ7Y9NQSeClld3FiuApFRtGkHv68nodVhEnMX8zcpTPrULELbyzXzxen8q+kiQT/gUyXFShc/72OoCa+/53j0oXXSext5gxcF7aEPiOgmWfXBOpCZZ9M9pfn2GTynx+2CTjYwJMRhRsqPD/1AMg/x/oy6chcPdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781372360; c=relaxed/simple;
	bh=bsemIgA80QN1Net2rL2KliKucnd3bqSpPpy6z3xhHVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ppWqzy9k8dTJ7eUhP5TmvUc5U6kyynrun8kMU1KEs8M1mvv7tQXSWEtd5+sc9y2/fXHQtjdO+ao3XlHvK28EGWsQaRM/T1SV8yEsn93kvvQeUZNxJLOl9s6wLTvU+gOqItLec46FwtO4mq5IHMHH+e0IrYAVTDaJFfCbbUh4tZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogrgEV4+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogrgEV4+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DBD1F000E9;
	Sat, 13 Jun 2026 17:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781372359;
	bh=8EzOUDMBGmw4x/8LM30psbSMzM7LJDnVG/eNTZr3kEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ogrgEV4+X1XWWEeO3pukkUNTR9B77Vn4CuvFRmrEjzKaROns3SYDNnwS71D0cf1tJ
	 HJ2SWobXTWqkQV8TI2lFsrDbUcHXIu3UdA8u5E64PfoY2Bapkeyf7SKRWA1/TV/yzt
	 hI2oihbyb1y1mCAi4F57vxp/KN4nyWW7SdMErGmJ/QZin9CnVKwQPQsWOuUlDNjIib
	 GImzti4SrihhPxtLTKsWHwvwqLHISpuWzWSgQW1VJ+o9z+vSkPpFr7uMUhVJPW4FTN
	 PmPg2OdgsUlMefNNUFBUFkPULB6LeLamEX28N7W9YbJC/LLt8T0hwcN98RmW7vTppK
	 oPyNJ2FEVJlFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/6] ARM: dts: sun8i: v3s: Add support for the ISP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Kocialkowski" <paulk@sys-base.io>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260613152655.212490-7-paulk@sys-base.io>
References: <20260613152655.212490-7-paulk@sys-base.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 17:39:18 +0000
Message-Id: <20260613173918.E4DBD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree nodes `isp` and `csi0` include `interconnects` and =
`interconnect-names` properties that are not documented in their respective=
 YAML binding schemas (`Documentation/devicetree/bindings/media/allwinner,s=
un6i-a31-isp.yaml` and `Documentation/devicetree/bindings/media/allwinner,s=
un6i-a31-csi.yaml`). Because these schemas specify `additionalProperties: f=
alse`, this causes schema validation failures during `make dtbs_check`.
--

commit 299a0d91b22100c87010de21ec5908b8fed75e39
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

ARM: dts: sun8i: v3s: Add support for the ISP
   =20
This commit adds support for the ISP on V3s and related platforms by
introducing a dedicated compatible string and device tree node. It links the
ISP to the CSI bus, module and ram clocks, resets, and adds a port connecti=
on
to CSI0. The interconnects property is also used to inherit the proper DMA
offset.

> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/d=
ts/allwinner/sun8i-v3s.dtsi
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi

[ ... ]

> @@ -755,5 +763,32 @@ csi1: camera@1cb4000 {
>  			resets =3D <&ccu RST_BUS_CSI>;
>  			status =3D "disabled";
>  		};
> +
> +		isp: isp@1cb8000 {
> +			compatible =3D "allwinner,sun8i-v3s-isp";
> +			reg =3D <0x01cb8000 0x1000>;

[ ... ]

> +			resets =3D <&ccu RST_BUS_CSI>;
> +			interconnects =3D <&mbus 5>;
> +			interconnect-names =3D "dma-mem";

[Severity: Low]
Are these interconnect properties documented in the corresponding YAML bind=
ing
schemas (like Documentation/devicetree/bindings/media/allwinner,sun6i-a31-i=
sp.yaml
and similarly for csi0)?

Since device tree schemas typically specify additionalProperties: false,=20
leaving interconnects and interconnect-names undocumented will cause=20
make dtbs_check to report schema validation failures for these nodes.

> +			status =3D "disabled";

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613152655.2124=
90-1-paulk@sys-base.io?part=3D6
