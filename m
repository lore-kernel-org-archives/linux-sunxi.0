Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9F93D4118;
	Sun, 17 May 2026 23:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061807; cv=none; b=CsBFI3pNdQ4yjZ0qwsyigLPtS4VQIfN4LWfUa2Uce27WkHP7msjTyX/RiCDH6tjmGA130N4nJr+hw/g1/cP0LzIUmn/ZFC3Ve2+1fvlch3RgmUU2qMtOvuYlP+aWkqnmhNhkSjV1l9QVHtnNe1NRwswZDu+Wk6l4h7iFab4t+ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061807; c=relaxed/simple;
	bh=xhQrY4PuyesfqBKXyFRxpZUr0BD4LXWRygaapoHWwyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f4fNJc1vko0UPCcMu0IRfr4VCdZM4hPPcKSOA3yZfhWGtL4sEBCwnbAwlY3YCbKdYqDaLNpHXZqupDslIMJzsTdI6F8mCcfWzV3TMK3lv2SAGP41B0tMw+utoy8btoyXNxdzu4L9m+stXc7LFVtwHehdqsUzYm1ujcaEKihDVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIw2+4Sn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIw2+4Sn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92840C2BCB0;
	Sun, 17 May 2026 23:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779061806;
	bh=xhQrY4PuyesfqBKXyFRxpZUr0BD4LXWRygaapoHWwyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BIw2+4Snp+3QPOd+uAmouojEZq2hya6vyG6ZhTjrDV8WxeatZEdPV1l3kGCV8gi6S
	 axGVYOiBx389h8KyJPRyD8xdIovE0BZgv2vPgDnv/zSSWbJIgmyShGO5Hqtc5iTLtX
	 Ng7sxPRWyIdsV2C9iv11RJvss5H+H9m8H3nN0XhrZwRhwiaxpjB14zS9CTxclO6mOO
	 fKgePLhajcnsC2m0Ch6aVGv46W6UJp2G3+x8QO6DYRvUgEo56CpW3P2KkIwzJ8BBDN
	 5zxbhQBIL8rlL/yv135h55rAi4L0sWCr1fwaglp0GZEH4z7Xi8uLHzcRgz5W9UQRSD
	 C1WLwEqKMG5cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: arm: sunxi: Add Baijie HelperBoard
 A133 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Sverdlin" <alexander.sverdlin@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260517234134.2737320-3-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-3-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 23:50:06 +0000
Message-Id: <20260517235006.92840C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing standalone compatible entry for the Core board.
--

commit 76fcabeafe7a55386e6089c83f652ab14cf4b7ec
Author: Alexander Sverdlin <alexander.sverdlin@gmail.com>

dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible

Baijie HelperBoard A133 is a development board around their A133 Core
board. Introduce a compatible for both the Core and the development
boards.

> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index 9e4627f97d7e3..845b5a93686e7 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -96,6 +96,12 @@ properties:
[ ... ]
> +      - description: Baijie Helper A133
> +        items:
> +          - const: baijie,helper-a133
> +          - const: baijie,helper-a133-core
> +          - const: allwinner,sun50i-a100
> +

The commit message states the intent to "Introduce a compatible for both the
Core and the development boards."

Since this items list requires exactly three elements, it correctly validat=
es
the development board, but it appears a device tree written solely for the
standalone Core board would be rejected.

If the Core board were used with a different custom carrier board in the
future, would it need its own standalone compatible entry?

For example:

      - description: Baijie Helper A133 Core
        items:
          - const: baijie,helper-a133-core
          - const: allwinner,sun50i-a100

Does omitting a standalone entry for the Core board limit flexibility for f=
uture
designs based on it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517234134.2737=
320-1-alexander.sverdlin@gmail.com?part=3D2
