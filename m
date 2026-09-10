Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72324440642;
	Thu, 10 Sep 2026 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037490; cv=none; b=WZcJkdVo0e52hFlhmHwhhRbo/dpwZO7/QtMXPiiQJzmOh83sIxLkEQRW7d+BLg73aDmlIf0u5p5Hc/KadDy92R5ElJpa6Up/MQ35mGru+Ce8wotQQYQpyfbzgQNdr0s77NSxa/epwVx9gKVG0Z+FREkSyYKrV0mS3CswqE1N+9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037490; c=relaxed/simple;
	bh=FVFdQF9Di+Rgtoe2veGEnKhpq4PMDJ79RIHE0zipkoA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fo56aVo+xDOP0CMhlX3bfyHfwpUA96dz0vUY2mbU+BHDKQlGHyPyIeN52e6ClATa+mIPclbi0oVZP+Oh6cpHpV2+HBCWaFf2XGlGQks9whJNx1wqaG9M7fMyjAt88e7Qv2Z1rZH0QPCHfA5U/IFZZdm5Yzroce79HrDLDD2f2Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYBpBvHr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYBpBvHr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6BD1F000FF;
	Thu, 10 Sep 2026 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789037488;
	bh=FVFdQF9Di+Rgtoe2veGEnKhpq4PMDJ79RIHE0zipkoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LYBpBvHryEKyGpWx1zk3aF3vRMbvZ2vLPYa4+MaQVZzz7WGTpmN48u55C+rwcUGcK
	 uYJ7XMDeDwsF8b4ZUnWnbdq2fyMX+FI/4C2feZ1q+3Ipa/BdOc5fHplXkwCGEee90h
	 /3Y75ZN5rjZFGAPnPrVvwcuAtCmNEpfcEkozfs9Raoi2YGxsZRBQEZwbwzQEhLHzxc
	 ymUqZqdke4zBXJ0RnpB6mV0upidYjBe83JiHJpwCwqHMNA0H5r8S28QKoUXat7c4rp
	 /GR5xLxWMZguwHp/b3P8eQmzgb8kCYn4Fh3uIJ59R/K1xquQS+dRGBY+hcg0+eODDC
	 YBfAl472FtinA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/5] regulator: axp20x: add support for the AXP318W
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-axp318-regulator-v8-5-e906a61a7f3d@baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-5-e906a61a7f3d@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:51:27 +0000
Message-Id: <20260910105127.8E6BD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> From: Andre Przywara <andre.przywara@arm.com>
>=20
> The X-Powers AXP318W is a typical PMIC from X-Powers, featuring nine
> DC/DC converters and 28 LDOs, on the regulator side.
>=20
> Describe the chip's voltage settings and switch registers, how the
> voltages are encoded, and connect this to the MFD device via its
> regulator ID.
> We use just "318" for the internal identifiers, for easier typing and
> less churn. If something else other than the "AXP318W" shows up, that's
> an easy change, externally visible strings carry the additional letter
> already.
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Co-developed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-axp318-reg=
ulator-v8-0-e906a61a7f3d@baylibre.com?part=3D5

