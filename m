Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678BE3ADBB4;
	Thu, 10 Sep 2026 10:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037571; cv=none; b=KHky+26sl40XGK1yJrMcGDayHmo6NgqhpPHAxYnZgoAOxFRm4im3bdkAhznv/TH9Zp+NFIi2+FJmQqIEaqOSEmTp+L5ArKB2xNFYLiKwWRqo808UpscXcsMySBCfgxRcPzncQ4N+3Fntqd9nXMyHgHQT/SKiVw1J4zXKDV5Sn6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037571; c=relaxed/simple;
	bh=mir5HMoZh5ISrwo75wb3DrpX937wiqqdVslEqn0Su1s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rwcft4abHMGdbceFmORZdt31jzlNuXKDLNl+fOZQ+1oOcDYyjofoRJ23/cAti8jxqaqv+/UeoJw6Uo6bztJ6ww+r9LI5xis0aeczLhfpwoWJGzJZlgqFKARqrtlTAdJSnYhd0AMjLWYMNP9R6MKgcmfzB91Fs2415T00qlqlKFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAI2nY3S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAI2nY3S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58AD1F000FF;
	Thu, 10 Sep 2026 10:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789037570;
	bh=mir5HMoZh5ISrwo75wb3DrpX937wiqqdVslEqn0Su1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OAI2nY3SK8AfcSFjvpYENGQt2nq7QYIiOlhlPbbHJunUweEVo843A3ATp3pNfAj19
	 Pctu2lxx5RzdtDACyyNvGMNcDWbhR/+MPe4UqVFcLFJw4LQBFBof36HTGyG4xvtRB5
	 Ve5LaDPrO/zS7Ilv+e8Uou/np+pUgYejRdAlPulhzsVlvSzeeNGqAv2dioHVTEkkyR
	 IyuhMZj1IYXduk5etpxj97FeHoK/cGwDbZ4y56v3U+HtGflRMpsUordqSXerrBAe44
	 2K9w19tNn4owKwzC/CqkYyiPFhaS3t4dM3FgUg+/d4lWQKFoNuzNEzIbYrNgytDO9g
	 /YvMZF6plqtVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/5] mfd: axp20x: Add support for AXP318W PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260910-axp318-regulator-v8-4-e906a61a7f3d@baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-4-e906a61a7f3d@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:52:49 +0000
Message-Id: <20260910105249.A58AD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> From: Andre Przywara <andre.przywara@arm.com>
>=20
> The AXP318W is a PMIC chip produced by X-Powers, it can be connected to
> an I2C bus.
>=20
> It has a large number of regulators: 9(!) DCDC buck converters, and 28
> LDOs, also some ADCs, interrupts, and a power key.
>=20
> Describe the regmap and the MFD bits, along with the registers exposed
> via I2C only. This covers the regulators and interrupts for now.
> Advertise the device using the new compatible string.
>=20
> We use just "318" for the internal identifiers, for easier typing and
> less churn, but use "318W" for anything externally visible. If something
> else other than the "AXP318W" shows up, that's an easy change then.
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Co-developed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-axp318-reg=
ulator-v8-0-e906a61a7f3d@baylibre.com?part=3D4

