Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548B52DC331;
	Mon,  7 Sep 2026 21:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788815354; cv=none; b=aYSsEm9brzFc7azIIe3dum542oL1g3Hi/OXvKr2hPG6UwlmzYJ5Oug5wGK3dcr5T11u0sMk4icXpT/sZFWM5nWMweyfdCLC1wcDzzhbmxaBv+o7gQPVdiYm15mfeJXilCv/QflqCICOg6vnPVDTWjtL/ArDl4KhiPOLpMLOiTIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788815354; c=relaxed/simple;
	bh=ACi67VxlmEDUnRPQg2uIBnVeLH0QM4aL1SiIczGlLu8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D1+aE/Yk8+EaE3BY7Yqzt2ujm6o96XsaKWfIIRB97wE7B0hrWbNPHAoJ9Zv+EAoafi3GRRDxF2o11Gm7h+oFld6TEgzsU8nE9UtRhyPRUzPPa0h0KhupIenBUQDfq//DYiIPbG643VUro9yrpg0ERACn/MtwVLZC0pXqImGg4EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLfb+Nog; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLfb+Nog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2E11F00A3A;
	Mon,  7 Sep 2026 21:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788815353;
	bh=ACi67VxlmEDUnRPQg2uIBnVeLH0QM4aL1SiIczGlLu8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YLfb+NogHhwrKHxHLBAWPUGhJMn6hO6++1WgpY/RWYIDDiYKuy4WOf8SEj+dA83mc
	 XHruDDiWRTbW3vQZR4WYTsSiNV5+uriPy0vH0Y6IK8lwqlUiS0ZO1U099ORhHDopIX
	 ycFJbhpJCjqMwmwujnQgGAhFYLVoSUUAvZNUBev5HcNLYtiLnSyXzJoBgk28fP9k4+
	 CE3kTtZo7bZBfSxKIIoSNFsr4i2qI1OgBZ8t1DBOBo5Eu/5FdASgGqMJ4e2lurgSVN
	 MWriSyPzHszHehYsvCmt5QMNelONxOFqd0BoXgeMEf08yP89WSjqRC5idQTYTvwHdt
	 HGn5FNudOgvIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] mfd: ac200: Add X-Powers AC200 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260907-submit-ac200-mfd-v11-2-58dd9dc7f69a@gmail.com>
References: <20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com>
 <20260907-submit-ac200-mfd-v11-2-58dd9dc7f69a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 21:09:12 +0000
Message-Id: <20260907210912.8C2E11F00A3A@smtp.kernel.org>
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
> ancillary package-control access.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-submit-ac2=
00-mfd-v11-0-58dd9dc7f69a@gmail.com?part=3D2

