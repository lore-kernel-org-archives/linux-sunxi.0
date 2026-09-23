Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8862549B5C6;
	Wed, 23 Sep 2026 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162941; cv=none; b=gy3kcWFq7+3X9F+FOLAZUHJ026SOSvyOkb7FDlYtCG8WpqyZqXOfh1IlPcjaZKr+9JQs6OyjH5rsCPI91hsxa/t6u5AOheOF2onk/7YynDuQSIo1ZjciqtLVzyQ25ibX3ca3rLS6aGG2v5fY6PKeNA4jxzK9QP4zIt+foJ/k1Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162941; c=relaxed/simple;
	bh=iF/EiklNHxQXaQNDBC+UhKxnw7nq/zdgDpwyYGDGUd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g49fcJwH09n52oIHJJMw+3CgAsmc/X41PQUmwspZdUUca4gp0wtqmWwkApPE2QdBE1CKbdQNMzr2q3yWxblVDL6BA0y8jt0rduVE+itxtAtLF3WY1lW0LtOagKsz2qWRzq7uzohf2QZla2mUPS2pPWm98s83UKWBPCPuzEQpA0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqAzfQ6E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqAzfQ6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3961F000FF;
	Wed, 23 Sep 2026 11:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790162930;
	bh=1RKNQMGh4GFqfv1RaO5Pqh3hFiuSRKutVzS9zAhASZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YqAzfQ6EHAbhJxnXk7YuZyfaEsQt+jhfKEtDyJBCeHJdgo8VYQPZQ+IQiNcH+R3Jx
	 HNag0BbpFQHSBfV46Qp9W1unl68TAHkq/g0xQcgmA5PlGTTN3As7cMk+WYQ0SG9dxz
	 Du7brZkpOv8VKPN7Ey/1rtiub6qiDAp0toO5p8Yy6KSFCcixManq4hVBI2sPAZmc/o
	 3UZ4LD4KxdJWlNI37E9k+iVX+MZd9AC3P8wTqByUetBmFqdKso1YNpBwtmIbtIIVCY
	 72D7SHN/KqhywDhO4FWD6Ggg42VW8j2g9eoEuLpinSAsp9SDTx9dXC6mbN0ZYe4+x9
	 rOakBdl9SXWwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: allwinner: h616: orangepi-zero2w:
 add 24-pin expansion overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: Vladimir <anykey196@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260923112009.1062-1-anykey196@gmail.com>
References: <20260923112009.1062-1-anykey196@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 11:28:49 +0000
Message-Id: <20260923112850.5F3961F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: missing USB 2.0 nodes in 24-pin expansion board overlay
--

commit 1a9550663d27bb916af61d191100635d3dbfb863
Author: Vladimir <anykey196@gmail.com>

arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion overlay

This adds a devicetree overlay for the optional 24-pin expansion board, whi=
ch
provides two buttons on LRADC channel 0 and an IR receiver.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24=
pin.dtso b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.=
dtso
> new file mode 100644
> index 0000000000000..2d7e98e4b66d8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso

[ ... ]

> +&lradc {
> +	vref-supply =3D <&reg_vcc3v3>;
> +	status =3D "okay";
> +	wakeup-source;
> +
> +	button-1000 {
> +		label =3D "KEY_1";
> +		linux,code =3D <KEY_1>;
> +		channel =3D <0>;
> +		voltage =3D <1000000>;
> +	};
> +
> +	button-1600 {
> +		label =3D "KEY_ENTER";
> +		linux,code =3D <KEY_ENTER>;
> +		channel =3D <0>;
> +		voltage =3D <1600000>;
> +	};
> +};
> +
> +&ir {
> +	status =3D "okay";
> +};

[Severity: Medium]
Are the USB 2.0 nodes missing here?

The base board device tree (sun50i-h618-orangepi-zero2w.dts) explicitly lea=
ves
USB 2 and 3 disabled, expecting them to be enabled by an overlay. Without
references to &ehci2, &ehci3, &ohci2, and &ohci3, the physical USB ports on=
 the
24-pin expansion board will remain disabled and non-functional when this
overlay is applied.

Could these nodes be added so the expansion board is fully supported?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923112009.1062=
-1-anykey196@gmail.com?part=3D1
