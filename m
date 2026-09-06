Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90584347505;
	Sun,  6 Sep 2026 22:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788734214; cv=none; b=awPAi4KfR0m1Vih4Q5X6ML+XjR8mozBgZy295ah3u5miQe1g2I+UhFDbL87PAFVtDUCoYdvZRJ5LEYArwInJnBOC83R+TAQo1EkR2KNQwNWjyuYpnN3vFd6LZZThnkn7sznHriL13hDmww8Sp5YtNCrx8sjTtzJMD9QCN7bRlew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788734214; c=relaxed/simple;
	bh=FDtfwTYyBvmMVwybiOCwQDJp0XhaxwNN7y+jF1FDgZQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=igHqeZkNOZKfn0bPagyQdmRH+KYuLBosOa0cFYduyirxosYmvsTFK32nlKc/YI+ltoE7ROzcVA/NJRHGSaJJptxs3AH3ffusL5qafEHTKZS9g14l/CVkKAxHMedyCI8MknTRULEdz0Mw049WCIFbwbv1/lPByW9iYlIrJKR+4uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFsuCUJc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFsuCUJc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37CE1F00A3A;
	Sun,  6 Sep 2026 22:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788734213;
	bh=FDtfwTYyBvmMVwybiOCwQDJp0XhaxwNN7y+jF1FDgZQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RFsuCUJcNGtj8pKdKbby2vW8Gn/nM2U4twxOSv/pNQD26+TDOHSBJKZoJXnQYAayl
	 BVa7fDr4Z4+dytUeYUB2uHUC8SfWzpKQrS7e2t2BjGeDZn+Q3ZI3KxSL8oFdqqyWJr
	 IatsobQyZa07kLhLwAqLwj3vu8aQ/Ez8CY97qnbrPfANuFM3dqnVO/+oGdiWt90ecp
	 UAv5YP+GXOtyaAeyVpvNYBb7f5opQA+zyCYiLm8gmucNQgoQhDZPq3gVzPPxFYsS5I
	 4uzfWz9IlDtAYPE4+GqgaLzBGaHtXwA7Zi+eg0LJ+iMhXZt9ni3gAWvxW183Vd95m/
	 +g7agkUEPwKXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: mfd: x-powers: Add AC200
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260906-submit-ac200-mfd-v10-1-f522e8dc2bd4@gmail.com>
References: <20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com>
 <20260906-submit-ac200-mfd-v10-1-f522e8dc2bd4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 22:36:52 +0000
Message-Id: <20260906223652.C37CE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> The AC200 is an I2C-controlled mixed-signal companion IC containing
> audio, video, RTC and Fast Ethernet PHY functions.
>=20
> Describe the parent device and its shared input clock together with the
> audio codec and TV encoder child nodes. Keep their analog supplies on the
> function consumers and describe the TV encoder display graph and optional
> bandgap calibration cell.
>=20
> Add the shared interrupt-controller properties and interrupt numbers used
> by the TV encoder. The Ethernet PHY is represented by a PHY package on its
> MDIO bus, with a phandle back to this device for access to the package
> control registers, so it does not require an MFD child node.
>=20
> Keep the INTB connection and TV encoder interrupt optional, including when
> the TV encoder is enabled. Cable detection status is readable over I2C
> without an interrupt. If a TV encoder interrupt is described, require the
> parent interrupt domain and its upstream connection. Include examples
> with and without INTB connected.
>=20
> The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
> matching the rates encoded by its documented clock selector.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-submit-ac2=
00-mfd-v10-0-f522e8dc2bd4@gmail.com?part=3D1

