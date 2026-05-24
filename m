Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417CB18B0F;
	Sun, 24 May 2026 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779654366; cv=none; b=RZq9/GJXSSLUOahQe1MQpZDv7TANzvSNKt2+ScFyk+BH5vRZ9sJnSXZ9fWuLUczSpQbI3OiUYjz7JkJbXBs5m+uIq6fRg4euUGzv7b+lyQaHNs5pSJtMjeCOmIStQ/udTKg/fPXNjwPPkActBT84GsGGiU0jIowT0YcKor8YO6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779654366; c=relaxed/simple;
	bh=gLZJmWH0rfyAbLdmrU5RYKc4BWO1Rh1KNpMAZD2rx/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e5sig7MnDNaKhPjFjA6keHw/elqNwTPXJzLGH2wQQFN43n2tXRFvP/gNOPpxYEfcTE3CIPrYoOtUZHNVIdQO4hJtsBwIpF9CL5ucNdp6dD1/BdOjeO5xMZO03dYGz1sUvwvt+5rJXgiyNTDrt2lOEZf2FhYTeyFbVJw9J4HFAM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvRG70LL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvRG70LL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15631F000E9;
	Sun, 24 May 2026 20:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779654364;
	bh=kDZQdx0V4ORVSnvj5YQgBwCeMJlhihGjLYyEJL2le2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lvRG70LLvT2JwbEMukCh4CI+t33SRUlZmpS7Ky+ttZxPDo+1IzCcMoigOb4fgJmXE
	 kQ9tEQu5g2jDjFZ73ALNDePZa1A/OiMBXp/PGLgjXK12qyhOIdKy78CYgESGWCy5vO
	 6zIGKsFyXSKCUz76MaTvem0XBU0VHmcXdhTDyP3PfRPYfkXbFvq5LsE/bnK8Wu86LM
	 yHiBBNnLTiPazFaGH0yLXF/COKD3OkqQAzQ1V3j6vExNLnvPiURngZgLsAmy+L6aUN
	 t1QJk9s3lkeM2DwNw4S0Bk3wbFdQw2gJGoos/UBk2BzALymCITlAZrfExXpydTGqe+
	 KE2w1p8sFdLUQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>
Cc: Yong Deng <yong.deng@magewell.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
Subject: Re: (subset) [PATCH v9 0/9] Allwinner A31/A83T MIPI CSI-2 and A31
 ISP / Platform Support
Message-Id: <177965436154.163755.7683015392753567325.b4-ty@kernel.org>
Date: Mon, 25 May 2026 04:26:01 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 18 May 2026 17:33:29 +0200, Paul Kocialkowski wrote:
> This series adds platform support for the V3s/V3/S3 MIPI CSI-2 and ISP units
> as well the as A83T MIPI CSI-2 unit in the respective device-trees.
> Overlays for the BananaPi M3 cameras are also provided as actual users of the
> camera pipeline on A83T.
> 
> The corresponding drivers and dt bindings were merged a long time ago but this
> series was never actually picked up. It seems more than ready to be merged!
> 
> [...]

Applied to sunxi/dt-for-7.2 in sunxi, thanks!

[1/9] dt-bindings: media: sun6i-a31-csi: Add optional interconnect properties
      https://git.kernel.org/sunxi/linux/c/4543300b2d55
[2/9] dt-bindings: media: sun6i-a31-isp: Add optional interconnect properties
      https://git.kernel.org/sunxi/linux/c/bdf22efc6cb2
[4/9] ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
      https://git.kernel.org/sunxi/linux/c/3c6867908ecb
[7/9] ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
      https://git.kernel.org/sunxi/linux/c/4fc5086a3d99

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

