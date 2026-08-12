Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423A4370AF5;
	Wed, 12 Aug 2026 23:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577337; cv=none; b=CPXlcox55LtugpYwBEB9ArLgE6bY3XG+xdCH8fB1AGhS0LTGKrllaZqnZjqKJ8brT14pjyVn5/TAcDhc5Q0bFu9s2+PjsimuX9F+PlEDMlB8M4Qdu7PrG5XeDbK6GCF4J8IJSQLwAZicuyMBY6V1qvsmIpTCfZv5m+BDugSEL+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577337; c=relaxed/simple;
	bh=mVUWjV4WC4YOtzBaDbEYYkg/Rvg+MOdbljUmKaNTzmY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t7z9b42X3VEAcZLhRHrQhsk+kJmdb1QypjYac+P4M/sDzF81Bln9NaGaGvdQLENOW3x/Y0meoFHzEQ1rSWNcC6hMSRN4U3lB4fAh2ht5Jj8Klby6/8beRxrpaoy134j4rhecmDdOdBzIDRBf8BimvoumKsiJ9d5Bi+yU8fAV6cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wms0yvki; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wms0yvki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711ED1F000E9;
	Wed, 12 Aug 2026 23:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786577335;
	bh=kAj+uPW3Fq32jwWTxrVHLU+X6avahzrf/7Sh5bYwBtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wms0yvkignEejUf24nKvJkLFoWMf3OFGFU/2RN93RNlML+3Ii/vswlhP13vWnTx6H
	 3mnsaXvKzT+YbC7DqLkcABmwB8MryIcaI5nP2UX4fVVeDUhjgKrwRWX+SJzIss+1TY
	 hCo42Kg0q4uv1Z4ReTZNKVl+lIPM8wCLn8ekdfEfivEAI4cKc4uyQy/9cQfS2Ta8h7
	 X2WyvmxtMwEPG0d2oOTEPONPtFjNuX7r7NYjAWVyib8bdWu+vmCQTCnoitwnm514bB
	 Nc+JwwkIlJRTOuTH9MvamLkW1nfjLApruJAqg1CB3hUf6sTbFsLvgMqgAR7A26zcwc
	 QkUpS9uVGkJVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 2/2] net: phy: add X-Powers AC200/AC300 EPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: conor+dt@kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260811-submit-acx00-of-dynamic-v1-v7-2-03f5b91775d5@gmail.com>
References: <20260811-submit-acx00-of-dynamic-v1-v7-0-03f5b91775d5@gmail.com>
 <20260811-submit-acx00-of-dynamic-v1-v7-2-03f5b91775d5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 23:28:54 +0000
Message-Id: <20260812232855.711ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Using device_trylock() with a fallback to -EPROBE_DEFER creates =
a fragile retry loop that can lead to permanent probe failures.
--

--- Patch [2]: [PATCH net-next v7 2/2] net: phy: add X-Powers AC200/AC300 E=
PHY driver ---
commit 51ec613693f83307bdc7a40a8e3f884bbf572129
Author: James Hilliard <james.hilliard1@gmail.com>
Subject: net: phy: add X-Powers AC200/AC300 EPHY driver

This commit adds a new Ethernet PHY driver for the X-Powers AC200 and AC300
companion ICs. It configures shared MDIO registers along with
package-specific I2C or MDIO control registers.

> diff --git a/drivers/net/phy/xpowers/ac200.c b/drivers/net/phy/xpowers/ac=
200.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/phy/xpowers/ac200.c
[ ... ]
> +struct acx00_ephy_control *
> +ac200_ephy_ctl_create(struct phy_device *phydev,
> +		      struct device_node *package_node,
> +		      bool has_calibration, u8 calibration)
> +{
[ ... ]
> +	if (!device_link_add(dev, &client->dev,
> +			     DL_FLAG_AUTOREMOVE_CONSUMER)) {
> +		ret =3D dev_err_probe(dev, -EINVAL,
> +				    "failed to link AC200 device\n");
> +		goto out_put_client;
> +	}
> +
> +	if (!device_trylock(&client->dev)) {
> +		ret =3D dev_err_probe(dev, -EPROBE_DEFER,
> +				    "AC200 driver is not ready\n");
> +		goto out_put_client;
> +	}

[Severity: Medium]
Could this trylock and deferral pattern lead to permanent probe failures?

If the AC200 device is already fully bound, but its device lock is temporar=
ily
held by another thread (such as a concurrent sysfs attribute read or a PM=20
suspend/resume operation) when the PHY driver probes, device_trylock() will
fail.

This causes the PHY driver to return -EPROBE_DEFER. However, because the
supplier AC200 device is already bound, it will not trigger a new bind even=
t.
If no other devices bind in the system to kick the deferred probe workqueue,
the PHY could remain permanently unbound.

Is there a way to avoid this fragile retry loop, perhaps by using standard
locking instead of treating transient lock contention as a missing
dependency?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811-submit-acx=
00-of-dynamic-v1-v7-0-03f5b91775d5@gmail.com?part=3D2
