Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F33511199;
	Thu,  3 Sep 2026 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466502; cv=none; b=l3RHtMwLrLeg0hOP77StOxqX03/EnDvYjXofn5KQNGe3ydyPpJpt1RTmRhgK/9KijsmwIF8jJDhtF0K0uIAF5E7IR4+obpLIAGY4N+kc9K8o2toTlkzKAkPnF8S26KVOfjjr6pZ/zkUm/hoEkICfTF6k5xhcZ3t6mm199esh2yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466502; c=relaxed/simple;
	bh=JD6s2kHwkwPhzFqZKuFvzzIItgnu6ajQQr+79Lir1RA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MH/vQIzp2LnIjJEtFbcTYoOsEy3jJCkAKSfdUGikcYbfZ2ilPofd/utKvx5tjD+MBKu0Rfzjpujb4gDpfFP3L5oxsaig5kNHXXXcJ16EZG2MZB5Qdom4cXotCRDRoIHumrFwTBoKzbw0c/KVl/jLuPBJr4p4x1snW/a7xeUZMgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeTDl10c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeTDl10c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FE21F000E9;
	Thu,  3 Sep 2026 20:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788466486;
	bh=JD6s2kHwkwPhzFqZKuFvzzIItgnu6ajQQr+79Lir1RA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YeTDl10ce8PPb5dTUUFgO09pHOLQViDXiY7VklvzbMAUhnf7Y5jp4sXsUMZsJAHII
	 KirTU9WqOr64Lo/L6hI137iUxqEtirAnnA9d86Rd5ioK243by8I/+ZPP1bKIgEcwv9
	 DdE9r4i3QtQT1oN7xg6iuQcBQsP3w4FDT46SKfb8j4klP+RRiLUKMWfjy1GqiDTBCk
	 9XbcmQPMbCSvGLprj9lYOZYsfp74uLFl7KR1u7/FgwfIdY1wxKfZ0MBYZu11cLVKA1
	 gYn0tP3SOlJ32VEqKlWAM/P2f5oDxCXviJ4j59R9EaF6OKODhMzfR/5zoJGUbeA7E1
	 8RQkVx+UnHNBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/4] dt-bindings: mfd: x-powers: Describe AC200
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260903-submit-ac200-mfd-v9-3-6b7ed278989c@gmail.com>
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
 <20260903-submit-ac200-mfd-v9-3-6b7ed278989c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:14:44 +0000
Message-Id: <20260903201445.39FE21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Describe the AC200 audio codec and TV encoder as child nodes of the
> shared I2C register provider. Keep their analog supplies on the function
> consumers and describe the TV encoder display graph and optional bandgap
> calibration cell.
>=20
> Add the shared interrupt-controller properties and interrupt numbers need=
ed
> by the TV encoder. The Ethernet PHY remains represented on its primary MD=
IO
> bus and is therefore not an MFD child.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-submit-ac2=
00-mfd-v9-0-6b7ed278989c@gmail.com?part=3D3

