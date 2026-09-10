Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558FA35202C;
	Thu, 10 Sep 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033241; cv=none; b=ba1LvnuBhj4H4rDf78YHDRp0fvtPeVDHvVC7GjFeNho4k+BPCKyM8ARFY++oBviCxGJ58FQTxTFJhyk48BbO//orwUZ1tDDXAUogjO1YKFW64EHqVRb7M+oXJZZ5zZfngHK/iW5tJyBykA2OYm7BQdhbJkoID0yn/KkbTuz+krQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033241; c=relaxed/simple;
	bh=LR/vQ0CDduJgW1fBLWeOzTEltBus4xw83JGNL+OnNfQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s6+i7ZH4pnidsPTer08ZXLOT6puoP0um+KH1bQpa3fGcIAJ0MpfUqodsKnUIhbqCJuCrpqhnDEH0/z2YeCHofuMLKeRg+LTMyePkUscQySdbQHtdI83wpnUNGXcRf0Z4L6ggeBeLkpCA+iB73ZlrSDWG1WxM3vG614QXWV6x+lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6Sx++Qr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6Sx++Qr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6C71F00898;
	Thu, 10 Sep 2026 09:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789033237;
	bh=LR/vQ0CDduJgW1fBLWeOzTEltBus4xw83JGNL+OnNfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F6Sx++QrsyPB78aiwkmCljpoaJqlXsyUm7qxBrj4o5dXWgNls4ctOUyswQVaAPV6u
	 ZCVBrFg0WvRB1OLwfndUlKvtYBD7KiWPL459suqQ+JJBwU3hU2GmIc9M4e9Q5HSz/q
	 q7VXpkb+73MR6vqMHgA5S1EkF+GHcxLDoly6ogSPSpxWnGN+oXvxBfKdJC6Shomkxe
	 +7wwN3oDkRaQM09YEAvdbs3mUFN/cX5fhQtXVpFw5vX8QjFKlKPb+hztc8mRzdEkPB
	 Y1YkVAPaT7U0ntBGbOfFFV5voICNENPHaFP/ekNqorVqxFZ+wxpsqNPXSvUkIyZ/70
	 EC+q2vRP0V8xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/5] mfd: axp20x-i2c: Fix i2c instantiation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260910-axp318-regulator-v7-2-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
 <20260910-axp318-regulator-v7-2-de720ceb9bac@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:40:36 +0000
Message-Id: <20260910094037.3F6C71F00898@smtp.kernel.org>
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
ulator-v7-0-de720ceb9bac@baylibre.com?part=3D2

