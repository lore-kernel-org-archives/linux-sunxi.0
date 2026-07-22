Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643CE2367DF;
	Wed, 22 Jul 2026 22:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784759804; cv=none; b=UPRxMiO7QassTz98G65IzWnnA58jgDXpL6IEY2aNEhGc0/6kuO8aRKJpnn1JZbRiOJgcXWveNiXD29mHYMBubhQutiotgy2RC5jZdHelbMHSPtg4mC734cGFK/ybRN7dQ/XT74klFC7VsayWK2Et6nudE46vXpGi/WYt242Cdbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784759804; c=relaxed/simple;
	bh=HFn9cZFwFXGfcT+gDREagdMwpRh82chodW0FJ6PWaHw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PT+2uTSKFewuwAulICP9t9h905N0EIIjKBWs7IdiQKymGdCcaYK/lEyor0leUa/91QCZ7/VPJzA7yZVZDL5G7uiD94HO1rJbUl26opFGg+CERQiB3PKZzAwPJYmx1D16SCDQ8o77CC/CqFPAIXBTK1GNP/9WWMXuh8bjmMWjlhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J90jE7ON; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J90jE7ON"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E951F000E9;
	Wed, 22 Jul 2026 22:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784759803;
	bh=0581rKYFV9xS3yIbjW4LJwKq8xJCLOGmOrOtO1YDUfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J90jE7ONj+r8WnPXLfmlqwHHwVZTety7taHaBDuzv5dkWCdYMZ+Ae8X6iHNSrS6c6
	 C/sK8CePiKjqMEv9DFU4eQEj6CiKC2+ZVT+Eq5MbgIHrqeJBkbVkqqCLgmb8/Kwhui
	 GG02cMWdYDRVUsdqmlvnibuzjPYGlhhPHsxzh9HhYNi1bXtgW4WOvTx3YzY3zYLkcP
	 tpUa9Xnw+P8PXpdIbtEyZZI3bhJtbB5QtXfyOMWpc7K+9R9Rqp+n2HF/lbnspOgSSe
	 UD5jyERvj9FyEDn7CMLLEhM06opp56/pV+pmWU3Y/BFFWLwtnV/gf0kkJ9cUH7rDn2
	 ALjqn3P7WL5aA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: a523: enable IR on the Avaota A1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722222627.14138-1-andre.przywara@arm.com>
References: <20260722222627.14138-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 22:36:42 +0000
Message-Id: <20260722223642.B2E951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device tree compilation fails due to an unresolved reference to the=
 `&ir` node label.
--

--- Patch [1]: [PATCH] arm64: dts: allwinner: a523: enable IR on the Avaota=
 A1 ---
commit 357c50b8a0f2e8f0f484a1872fb40899f5baa624
Author: Andre Przywara <andre.przywara@arm.com>

arm64: dts: allwinner: a523: enable IR on the Avaota A1

This commit adds the IR receiver pin description to the PIO DT node
and enables the CIR receiver in the main power domain for the Avaota A1
board.

> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts

[ ... ]

> @@ -100,6 +100,12 @@ &gpu {
>  	status =3D "okay";
>  };
> =20
> +&ir {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ir_rx_pin>;
> +	status =3D "okay";
> +};
> +

[Severity: Low]
Does this node extension cause a build failure when compiling the device tr=
ee?

It looks like the &ir label is not defined in the base sun55i-a523.dtsi file
or any of its dependencies, which would cause dtc to fail with an unresolved
reference error.=20

The commit message notes that this patch goes on top of another IR receiver
series. Should that base dependency be merged first to ensure the build
remains unbroken?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722222627.1413=
8-1-andre.przywara@arm.com?part=3D1
