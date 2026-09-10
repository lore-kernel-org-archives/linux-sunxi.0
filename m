Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA531C861D;
	Thu, 10 Sep 2026 00:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789000378; cv=none; b=s/lRNmoxhTnOnrAxtvk3ZaO1vSyb589NvMIRIph22+O3bfxzrvmpvPXAnQOCiQgtsQJjtcgJLtmNbq3Ed8YB63zvEQiBNNA/sI29vqCTd2FvCtY0QZoAiBSEbb7oxEgrK/eVpwLvNEW35xpztiY8f5588VP6A6L57gfOdI/Eono=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789000378; c=relaxed/simple;
	bh=8cWv/vOTjLPbfseM45igA6i1DzOUG7FZcdu9UR3qHo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s1NOb1YySFSlve6TvLBH/B2e9BA11TKnT3wbzjj3jR+JOr1FXV0lnw4WpZ9FmgB9WsCb9nYzTge9vrmydlzsvW0koD7N7quUsjSIVBtinlJ2RetDn6AqiQ/QjUmdA5rcg700aIUJ3cVevI3Qqa4PtyDCJ6l7rvck3hLPrffxIJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEz4hSrV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEz4hSrV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03E11F000FF;
	Thu, 10 Sep 2026 00:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789000377;
	bh=8cWv/vOTjLPbfseM45igA6i1DzOUG7FZcdu9UR3qHo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mEz4hSrV6/O4pH/kYC1Ob00kznFhGWVvB79so9eA5e/8JQeKBgHeXq7VKqo1TO0PW
	 p/z5ozyyOHtgLr0aNzLs7YnY7bGWs3Du0ML5d6iLLQly5E+9KNHt0QTnwbj14JJ4Nl
	 8ixEvA34zv6xJz5idv2lqts20wLk5PKh4nFc0Y62jIvVTY4+KWZ17FWJkgiZBP7Gxm
	 ZK04z/LaZOt0A+C5mQW4imqtrbQuB7O0TcR4Fkzwiy0ddW/Rn6Ox41zegN21FGg5Rv
	 RXtnkw5TwgUuxXRfa6E9i3lK8iZEfxKmFcgpc6K8ksqslv87PSeGzNAlkRkzXECtXa
	 Jax+69SrDPlOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/2] mfd: ac200: Add X-Powers AC200 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260909-submit-ac200-mfd-v12-2-a44d6bc30a4f@gmail.com>
References: <20260909-submit-ac200-mfd-v12-0-a44d6bc30a4f@gmail.com>
 <20260909-submit-ac200-mfd-v12-2-a44d6bc30a4f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 00:32:56 +0000
Message-Id: <20260910003256.C03E11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> The X-Powers AC200 is a mixed-signal companion IC with a paged register
> map accessed over I2C.
>=20
> Enable and rate-lock the shared input clock, retain the vendor resume
> path's 40 ms wait before creating the regmap and accessing registers, and
> deassert the common reset. No minimum delay is documented. Set only the
> deassert bit instead of forcing a reset cycle, avoiding a chip-wide reset
> of unrelated function registers. Leave the common reset deasserted during
> driver removal and system shutdown; function drivers own their block
> resets. Supplier unbind still tears down linked consumers and releases
> the provider's clock references.
>=20
> Cache only the common page selector. Individual functions can reset
> independently and invalidate their other registers, so leave all
> functional registers volatile.
> [ ... ]
>=20
> Co-developed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-submit-ac2=
00-mfd-v12-0-a44d6bc30a4f@gmail.com?part=3D2

