Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BB142F6FD;
	Tue, 11 Aug 2026 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786490336; cv=none; b=mqesWbF4yMQxECOiQOfD3If6vq/fpqwRXW0jlwi/wTuAKWgwp3Qhae/u5qZ/vTXIvQbKP6zabdyiYE7xVRu4iBcKRo6TCR7HwImXuf/uGNcKeXtVYOA57WASZv3phoA/5GuCu3xADkQ45hnJbdkslDYPz1XcmpXfgr9HxE8Xb2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786490336; c=relaxed/simple;
	bh=0JFhcfzFTq20RX/XK30Kg65d/us3iwJvrIPJsTRCZG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uqItjNH5Bgz4QyhNLVXpWOB0dlYFnfQmIhNxtaToi9tS2+b9o/1ROzvvFWk2bhmVwhU/lwPUAB/+zwYN/06aeDa2z6OWigLC8Uhezzv04v0Am/+MNGDfX9vXWL9H+txQDz4aYxJyjpFlK3YAXlHBzlhfOphgxm66q7LiiwwhHHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzcCUdsg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzcCUdsg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838081F000E9;
	Tue, 11 Aug 2026 23:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786490334;
	bh=0JFhcfzFTq20RX/XK30Kg65d/us3iwJvrIPJsTRCZG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MzcCUdsgDUkIJ1Gw2+xSHTe2cZin5i6lufChWbEQjBmQMUneHEwmqxiZ3u8KyBoI/
	 THmyMEhf/4jlxHXxKmJ8zQKIpYa+i4kpZ7Tk/zeksio6ncCiNNrrzLtFKOlT+m5Y4X
	 hY/YLstj7Yiw4VpQ0oMNA/00YVQI6oBnXq5njC2wEcuUr7tXhNboqdib0uIaFizZzq
	 vx8yn21Ul9tACksIZ1EspA5yTJ8mxTsp8QRahs8ItvOIbNWnrIjls3Aw56md5aU/oB
	 vb8IaB4zq8uE7oXDQ7xvEY7p0xQQNrblqhc1Uy5/ZGJ0UKtEEl1fgEAlN7Uzh7dCIQ
	 T/6mWn1TqCz4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] mfd: ac200: Add X-Powers AC200 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260811-submit-ac200-mfd-v7-2-8b06f552a4d7@gmail.com>
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
 <20260811-submit-ac200-mfd-v7-2-8b06f552a4d7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 23:18:54 +0000
Message-Id: <20260811231854.838081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> The X-Powers AC200 is a mixed-signal companion IC with a paged register
> map accessed over I2C.
>=20
> Enable the shared input clock and prevent its rate from changing. Match
> the vendor driver's 40 ms wait before the first register access,
> initialize the paged regmap, report the chip and package revision, and
> apply common reset.
>=20
> The Ethernet PHY link endpoint is independently enumerated on its MDIO
> bus rather than created as an MFD platform child. Keep the regmap attached
> to the AC200 I2C device so a separately enumerated function can resolve
> that device, establish its required lifetime relationship and retrieve
> the regmap from the provider.
>=20
> Cache only the common page selector. Individual functions can reset
> independently and invalidate their other registers without regmap's
> knowledge, so leave all functional registers volatile.
>=20
> Reset the chip during managed teardown and system shutdown.
>=20
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811-submit-ac2=
00-mfd-v7-0-8b06f552a4d7@gmail.com?part=3D2

