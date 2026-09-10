Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDCA46C859;
	Thu, 10 Sep 2026 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037647; cv=none; b=aSBgxIKkEnX7JryfNohTpAN6a9OusohhMgMXMEkmT2FG5PzqzwuDEhPzWOkA4d4ELOuG8SXS5plCliyMfKvcL8FzUfevwJ5v+jZpiUw4Bsb0eID0u87ugK8e4j5W5NFW/icgSwUJilhmXnAirZkEg6pFUF2NUt/ahGAtsiY8OwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037647; c=relaxed/simple;
	bh=2yACE57UcDmpbCxkhsT0GtW77ZPihGOn9a2h5ogVBOA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P3Wn2yI18vTAkp9LMrvmakkjXmqvjTkVYZBAmP7wcfm3cw9TiNKCl8rre/+eglGXqoRtLbPfD8QNC97sBOMWleYtDnA7wwsjEvMbUkJSwpYKBSWbptLSVewx9Mbvy+AOPQNTqasn5SZcR0YlXSr+O5zcFp62JrqCk0IbceIOVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEc+lmJ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEc+lmJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13C51F000FF;
	Thu, 10 Sep 2026 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789037636;
	bh=2yACE57UcDmpbCxkhsT0GtW77ZPihGOn9a2h5ogVBOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bEc+lmJ+RRujA5pw787pngP3DtJt50dHeEKqiS8C4XqZ5QRp4Rq6cbYQ7/5ElHDAg
	 AWqsEEh4thawlf2vTZagHe0t68imp1d6GmO5iJZrn0LWXjyAnE98PJkQNgFr8g5dbk
	 r2jWSqhgavucpBfhC1T0AmlqugHs3lT5a2+55QYVx3A7KxNK1IGQWJvrxQRRklTU+y
	 3znWi42tt1SDvm270lOXqio13DoVtiCzydGofL77BmewKck+56SlfepGXwilyhzJrd
	 fhCVw5Xtxm70JR6PbgNtSm5UqVzYRxtctpE6fruV7+U5ET6gEaT5Q3p2B9ow6E0cM/
	 vR35bWsZXPY2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/5] dt-bindings: mfd: x-powers,axp152: Document
 AXP318W
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-axp318-regulator-v8-3-e906a61a7f3d@baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-3-e906a61a7f3d@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:53:55 +0000
Message-Id: <20260910105355.A13C51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> From: Andre Przywara <andre.przywara@arm.com>
>=20
> The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
> Among a large number of both DCDC and LDO regulators it features the usual
> ADC/IRQ/power key parts.
> Like other recent PMICs, it lacks the DC/DC converter PWM frequency contr=
ol
> register, that rate is fixed here (1.5MHz on DCDC1, 3 MHz on the others).
>=20
> Add the new compatible string, and add that to the list of PMICs without
> the PWM frequency property.
> Also add more input supply properties, for the split DCDC and ALDO
> supplies.
> The PMIC features *two* switched outputs, hanging of DCDC1, and the
> manual calls them swout1 and swout2, so follow suit here and add those
> names to the pattern for matching the node names.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-axp318-reg=
ulator-v8-0-e906a61a7f3d@baylibre.com?part=3D3

