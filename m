Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5453AEF55;
	Thu, 10 Sep 2026 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033155; cv=none; b=fgekaXJc9Qld2IJmkIr2Ca+KKT2sY6rb6M/q8WDk3+331nGOvs+4CfalEIS4KnO0lS3oMyrITPPuPFVuB1Jajog8Zfxb5K8nxfKudgbhSX/vOFhUP1s2kbjArpFmBALvFV8zbOgMNPdAZdF3L2NIZ/Bn2MFltvYOP0nZ1edbjDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033155; c=relaxed/simple;
	bh=YaFfsoHLI/6yqyhvJqjhBVuYCKNGlCbbyCcyDrLn1c8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Njb+TAXiaEn2od6ADf2bselwA0skTchtWkcRUrlSegMcpKHz+onMMpJOTSF8IIfGSiYkYU453j/Vc7FgUQuraIG4MheFKpqpjlJ4xIjyC/ib/pLfWuN1yvBfAgrLDhSl9HBObd1QPrXOhjsn2vvPDLCQevF4HxU0p98nzYe6Epo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKaznzXJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKaznzXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF8A1F000FF;
	Thu, 10 Sep 2026 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789033154;
	bh=YaFfsoHLI/6yqyhvJqjhBVuYCKNGlCbbyCcyDrLn1c8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YKaznzXJ60AfaFYYUw0DNsiHXfaRl221HDBmA9O3d7xvR7le3mf/Uzu+rYYtRLJD6
	 KFCKN1/rgOdmUgESH+JXxbfKi6V0hOJXSFtcWKPrJxRg7d+7Jxbqavu7HWc8zgVSxZ
	 YixNjdn8+BR7A1EuoE5OOtM3u2p/xdl3ne/K2hrmlGxkYBmizsJ06DON7pEvhdr2lO
	 4XzhP7S17sq/6QSA/jSY0mQkjKbEg9oeoQhyMiSuO+r5ZWn56aCfhWCRQcYChcFfIZ
	 qRzxahbT0IjLsYmDP+VjmsTb9VE0OKTIZtNeiombpVXPhSpWwKtuBdV7YSFkJhwOzA
	 cWJD8Bm2pFvTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/5] regulator: axp20x: add support for the AXP318W
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260910-axp318-regulator-v7-5-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
 <20260910-axp318-regulator-v7-5-de720ceb9bac@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:39:13 +0000
Message-Id: <20260910093913.8BF8A1F000FF@smtp.kernel.org>
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
ulator-v7-0-de720ceb9bac@baylibre.com?part=3D5

