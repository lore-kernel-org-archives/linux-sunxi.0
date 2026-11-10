Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794290234;
	b=40ZTRlVgHy1XEHbRdUa3j8deCLRxKHSZaS0YlN3vPCGtxmeClsqWoCUgn+f9q2JpigYF
	 GPcLSkResfZR7H+ng0D8iPYweH61Jo4k7lCUog7HFya6vkbfshISJGc6rkONYzx/LinJP
	 lUNjzLiSqqX6rQjEGPqa89CmFZ2KSca5/irA+da+kGXa9pKP8qzdbcU4ZMXZWsYx8W7VB
	 LB65Tafixs4JhayIlMd61EMpLygbXgvq4AQ2siu/bczXkT49XvsggF53vKgelxwKJLmie
	 xFSB6GkkoPddC5nD/SsAduDleKmWjl1shfiBapKwh0ksuDtO8iJBOArTPx15s5I9I0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794290234;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=laBwzBmPEr/UQH5HBsppamR1QuUoc2VFWIqykmeqG8k=;
	b=q78Bz6VPMSQG5T+M+ZPNDD1fg+Zw0DRfsYNFcr9pHzsWcBosCOoGIaGL9iImZmQTCXdP
	 iK+6BjMlQ1utijbgp1ArSZB52yI4R9K549D2UOCWSqkBGnTVLymjT70IbV7hF6BmqrNUv
	 CUV92ol1BFRm6WBiJwbt8crkcypqprew+0jN5CDkXOSi/p9ad0cA3O6g4mjshNFRfRudj
	 Dv3Uiy391xsLs621C6IVEHID9R/pJ00JxSoDzdCDBffeDHYuCQqsE5SEXkuUOlXRbimIr
	 VCY9FEcYW7GG1DU39Tev8YXx2QrU63YasNqIwo7GokJJYci95Y/eZT7E5WfTpwZxhZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkEJ7jCl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B29606A31C;
	Tue, 10 Nov 2026 05:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkEJ7jCl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ABBA1F0089F;
	Tue, 10 Nov 2026 05:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794290233;
	bh=laBwzBmPEr/UQH5HBsppamR1QuUoc2VFWIqykmeqG8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZkEJ7jCl/H+zwZKOlFMtXpmzXp/O/qncWiCxcXudVtUFO6J0dHXbikhndygAIWKM8
	 m4X+4FmArNd6a9kYaisb7ZHex78VyPUeikck8ixb4CdTOVnv85F3eP6oR5B0XBSTHf
	 nLmVBy1mTtJzWMWOTCQkUp1co4LeRAvDvX1WPHPdVTaTm+9Kfy0TkIYDRkPE83YKPc
	 eDyR+54iPmT5Qg+CFwwcFdVYKbTtasbjtEwz23RiQdUgQwgGEZA+xfAnTCprgWiy4Y
	 KOW+mpsCPh53TXwPvixfTp2N5Q6noO8bxTANsmAvASeaBp2qFJA/icMO+kQbAHtbsU
	 OOMPNGZgSWVrw==
Message-ID: <sashiko-outbox-206359@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] arm64: dts: allwinner: h616: Add GPU OPP table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-h616-zero2-dt-v1-3-05506d760f21@gmail.com>
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
 <20261110-h616-zero2-dt-v1-3-05506d760f21@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 05:57:12 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: allwinner: h616: GPU OPP triplets set min voltage
  below target
--

commit 77493b95bc2bf6851fa12081534ceeb124aa8295
Author: Arun Iyengar <aiyengar1990@gmail.com>

arm64: dts: allwinner: h616: Add GPU OPP table

This commit adds a shared GPU operating points table for the Allwinner
H616/H618 Mali-G31 GPU covering 306 MHz to 600 MHz.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi b/arc=
h/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi
> new file mode 100644
> index 0000000000000..511174eee271b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2026 Arun Iyengar <aiyengar1990@gmail.com>
> +
> +/ {
> +	gpu_opp_table: opp-table-gpu {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-306000000 {
> +			opp-hz =3D /bits/ 64 <306000000>;
> +			opp-microvolt =3D <810000 810000 990000>;
> +		};
> +
> +		opp-336000000 {
> +			opp-hz =3D /bits/ 64 <336000000>;
> +			opp-microvolt =3D <810000 810000 990000>;
> +		};
> +
> +		opp-360000000 {
> +			opp-hz =3D /bits/ 64 <360000000>;
> +			opp-microvolt =3D <820000 810000 990000>;
> +		};
> +
> +		opp-384000000 {
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-microvolt =3D <830000 810000 990000>;
> +		};
> +
> +		opp-420000000 {
> +			opp-hz =3D /bits/ 64 <420000000>;
> +			opp-microvolt =3D <850000 810000 990000>;
> +		};
> +
> +		opp-456000000 {
> +			opp-hz =3D /bits/ 64 <456000000>;
> +			opp-microvolt =3D <870000 810000 990000>;
> +		};
> +
> +		opp-504000000 {
> +			opp-hz =3D /bits/ 64 <504000000>;
> +			opp-microvolt =3D <890000 810000 990000>;
> +		};
> +
> +		opp-540000000 {
> +			opp-hz =3D /bits/ 64 <540000000>;
> +			opp-microvolt =3D <910000 810000 990000>;
> +		};
> +
> +		opp-576000000 {
> +			opp-hz =3D /bits/ 64 <576000000>;
> +			opp-microvolt =3D <930000 810000 990000>;
> +		};
> +
> +		opp-600000000 {
> +			opp-hz =3D /bits/ 64 <600000000>;
> +			opp-microvolt =3D <950000 810000 990000>;
> +		};

[Severity: Medium]
Should the minimum voltage in opp-microvolt match the target voltage on
opp-360000000 through opp-600000000, as in sun50i-h6-gpu-opp.dtsi?

opp_parse_supplies() parses a 3-cell opp-microvolt as <target min max>.
_opp_supported_by_regulators() checks regulator_is_supported_voltage()
against [u_volt_min, u_volt_max], and regulator_set_voltage_triplet()
falls back to [min_uV, max_uV] when [target_uV, max_uV] fails.

Keeping min at 810000 uV lets boards whose GPU supply maximum is below
950 mV retain higher-frequency OPPs and run them up to 600 MHz while
undervolted below their target voltage.  Setting <target target 990000>
still lets boards with a higher regulator-min-microvolt use lower OPPs,
since [target, 990000] overlaps the regulator range and
regulator_check_voltage() clamps min_uV up to the supply's minimum.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-h616-zero2=
-dt-v1-0-05506d760f21@gmail.com?part=3D3
