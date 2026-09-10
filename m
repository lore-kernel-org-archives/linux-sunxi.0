Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4724418DB35;
	Thu, 10 Sep 2026 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037545; cv=none; b=rFzRq+nkZ3zxhHEWajdM5VkGaFqaJRpt7UXr/S3Jcj3zZL9vPBJCYuA/oRiVvpNrciLb3RAWkCjMrG6PGMKaT2ZK9vNYgClemNZ3GScireYXYb8s06QqVmNAkpeKk4nXrIfElce/KBEfVUprJ+5oMXpO+GBYDr+NFRsTc43nz7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037545; c=relaxed/simple;
	bh=atUSk9e+zR0+UVj6T6FEO7pPuRqgpDRW5fM64PpkWrY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZYNZUIYPsYL3m9TvMxfOmN45xGavRLXUOKnU/Eo35mSteMAwIMEJbSGMz5c/nc9EqUpvpMZ7iCNy4u8766c/Odxvw8MXdhZmhjH+JfCibYmwHTMdbAjez0J0jNF1KAGBcB+OYllGrCBc3RRoo6PxUwXaN+lSaHXp0try7/s+a/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwQtYwGH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwQtYwGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950F81F000FF;
	Thu, 10 Sep 2026 10:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789037544;
	bh=atUSk9e+zR0+UVj6T6FEO7pPuRqgpDRW5fM64PpkWrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MwQtYwGH5uHyEGULjgLFPLXwgXaRZCG6YKNSFTCvfeHRAcuB7M3KKGiDEqUQrf4Uo
	 /xgq3AH3IrZMqrI/0/Vj4Lgjj9jKpQqfW/xt4gk6o4SG+E7re91hh1RO5IueN+Ky2d
	 x9Bq/1Aov1szE7BCnKzb3iizWo2F3RYnAqHWp0YoffBVY/Q40UcgZ5+X/9JGddN4ij
	 xefuGN/CZhAFdUFmC56bKw/dMQEZiv48mhweLmgEgMSlzj6nCW3vLtMSnH7K2e4oOW
	 xdeSWmdbYCMADnQxn/p0MyqQkAu4Em8D07EdpSYD418PAlXDEUDU6dwvplL+VnO7sp
	 7kpjoU827k5qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/5] mfd: axp20x-i2c: Fix i2c instantiation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:52:23 +0000
Message-Id: <20260910105223.950F81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> Apparently this device never really supported i2c instantiation via
> sysfs, because the driver does not even look at the i2c device data,
> which are not set. It would only probe if the device matched through DT.
>=20
> Fix that for correctness, even-though it is probably useless.
> Add the missing AXP323 while at it.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel=
.org
> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loa=
ding")
> Acked-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-axp318-reg=
ulator-v8-0-e906a61a7f3d@baylibre.com?part=3D2

