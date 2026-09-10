Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB5B3ACEE2;
	Thu, 10 Sep 2026 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033232; cv=none; b=VGhyiJnFBY9Hdbw7VOLSLJEk+f2xZ5u9dxx5zR89lIlOO+m/B1qi9SyogBWHCmFeInqmIa8RV+eYXikH8DgUMMBxDsW01RfDJm/9/+pFxv6QRgCQh7YD5Zp3nyvfVxrCo39LKXQ1LATKDeZBl3sIZ4azxp5CCbauz+YnKPqU6I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033232; c=relaxed/simple;
	bh=RvD2ug0Vi6XbAQLkFYkBqo+JQZg8I9DxBAHhk6dvnl8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Odjb0lTBHvmYKug3+TX8Wzc7N1SJEOvC+orUdsSzfeXBXdCzFLqTXp3Aj1lUDvvAZxBiwC7j59gyIrJrV3SXkFqVY/MzUFDEPmgDaLYnfWKQHVfeQr02YNlGYf6azIMKBlAlYR1a3vdAxJcX+MWUPT0eYy4EFLO6asZVrA4GATw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vx48BZ50; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vx48BZ50"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8791F000FF;
	Thu, 10 Sep 2026 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789033230;
	bh=RvD2ug0Vi6XbAQLkFYkBqo+JQZg8I9DxBAHhk6dvnl8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vx48BZ50fnYzqpQYGuZA5HCx/27Jn2H/U9ZtRJyhuYJ4AxisrkAjvXcuc7Ly0hila
	 0tM05IP9lpRxLewrgyfNzcT8GMNI9jIYZVZK5cp8IJzFPs2N2AdeGJWVUttbRADKxb
	 VdScu6RWYoAkeCT7dUOHUXVeucPdP75MgOS0WVPfwX+sJ6Vj1uFbCu2K4/V8qNJd6P
	 VPdPONG/5jYsDeeQU+BPJYPqpt7nxQR0LqWtb/p57wEY+SEP9fa6jqF4TSr7pO8Lvi
	 3rp+fqL9nkfyOIVhCaV/fWwlSH6Gnk1j+7ywmUMAikpBQHvhJocUXbX0U7pHYPlkkr
	 UkeOjZB91K5dA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/5] mfd: axp20x: Add support for AXP318W PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260910-axp318-regulator-v7-4-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
 <20260910-axp318-regulator-v7-4-de720ceb9bac@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:40:29 +0000
Message-Id: <20260910094030.2C8791F000FF@smtp.kernel.org>
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
ulator-v7-0-de720ceb9bac@baylibre.com?part=3D4

