Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A352D411A10;
	Mon, 14 Sep 2026 21:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420781; cv=none; b=fN4qmbAu8cI8P8ZKTH/RRHxL2OCSsM6bjjkFa/kq1VVKDGtmy1zfwYGngmcG6tCqXZHe6ZvfP/jyGRv6UjnRSjgdlBd6KH8F8nRd+SjAtC/hM9Q9aKGsUDlc0raqtYoFjzws+ekZdf6XQXY7ORlF/PnWPbNAzzXUCswSd+1u0Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420781; c=relaxed/simple;
	bh=pfgkq6Vk30heg/yk84FWkw06TgJhepcOIt73IbngY1g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FcPSAh7i104mURO58g1pfxNFramPhTTYJFThlYKNzjyAHHNMw76WbpKFGwUnprtBLhrwREhKik9qhkN3BIAM9mKIMo+lGgIO63Iki6MhZrsj64HZ50x0ahRUoLiaVkecYU55wW4YLgKBI9ogxo3Ea9uIe2IgWZ16rqDtTeGIpXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jq0P+Hce; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jq0P+Hce"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256A11F000FF;
	Mon, 14 Sep 2026 21:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420780;
	bh=XdzOfZmnQIdeLDp/hOIIbnvV+RukEE4cD2KkuQvI2iQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jq0P+HceVa0gpT4e01RaCq7pXyae0fUwgqARXelTM931nh8gY8hOYC9lIVZVyCaMs
	 SsOD5mVlpSXTF8mI8gNeucrQRNQVpIQkMFQKW4bpYVikoWETgtrTOIKvDTiPLjODJd
	 YL4YA53gL5XM7Fx5Oc5RF132JrnPGjUCkGGCBS6S6oNrdur1hL32KvVByuJT6jpPhe
	 X6DdYZFBeTlE4+dhnw/apHdGOGiBHtg/iLIY6XnsifCQoTac3G1eWAfH/FKo2iZsDV
	 BuFCpxSHTdVLVdsjskfvpQkInKLP9iwTUdrfBgqzOjjyHzT1TKuqCcx5/LMP8nr7PW
	 odh+Nukdn/aKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260914210115.28151-3-andre.przywara@arm.com>
References: <20260914210115.28151-1-andre.przywara@arm.com>
 <20260914210115.28151-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 21:19:39 +0000
Message-Id: <20260914211940.256A11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing SoC fallback compatible string 'allwinner,sun50i-a100' for=
 the Teclast P80 tablet breaks CPU frequency scaling.
--

commit 582b866f1ad9000afddf47eb7e4c9d37a95dfbc8
Author: Andre Przywara <andre.przywara@arm.com>

dt-bindings: arm: sunxi: Add two Teclast tablets

This commit adds devicetree bindings for the Teclast P80 and P85T tablets.
The Teclast P80 is based on the Allwinner A133 SoC, and the P85T uses the
Allwinner A523 SoC.

> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index f04db28c630ac..28437c47ac01b 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -933,6 +933,16 @@ properties:

[ ... ]

> +      - description: Teclast P80 Tablet
> +        items:
> +          - const: teclast,p80
> +          - const: allwinner,sun50i-a133

[Severity: High]
Does this strict two-item compatible array omit the necessary fallback stri=
ng?

The sun50i-cpufreq-nvmem driver in drivers/cpufreq/sun50i-cpufreq-nvmem.c
requires allwinner,sun50i-a100 to exist in the root node's compatible array
to bind via of_machine_device_match(sun50i_cpufreq_match_list).

Without this fallback string included in the bindings (and subsequently the
board's Device Tree), cpufreq-dt will not be instantiated. This will cause
CPU frequency scaling to silently fail on the Teclast P80 tablet, leaving
the system stuck at the bootloader-configured frequency.

> +
> +      - description: Teclast P85T Tablet
> +        items:
> +          - const: teclast,p85t
> +          - const: allwinner,sun55i-a523
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914210115.2815=
1-1-andre.przywara@arm.com?part=3D2
