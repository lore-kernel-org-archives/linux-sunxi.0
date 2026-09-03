Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9028437C91A;
	Thu,  3 Sep 2026 20:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466681; cv=none; b=ZZ/eWzTwxtAfLA7B550eVKq/fBCwU0e+43SDTvYCP6N3A9J3S97AOIRXIs/ayN4o4ySw4GVj9kLzl8Fy7HnQgehObCcV1s6Rfpkc6vW8MXw+YY54tuZPLRdbWVAl0h+kGyx9dCC4e9NoPnVcKhxzrKnn9nstqYy33IALsFnBlqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466681; c=relaxed/simple;
	bh=RmfdlByOAOww+IPLGSFsmIWLeRD2xvJFYoysePsqLt0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=abzA3RAWNMT/YhDmB8ADb3EJTPZUb50dit1L8yRCjcpi3P7TXyT/NbhLKTkHVhVX3o62FuQbBc2ixbKtJqZH5l0JlUImuPpYdrd1eGP02Ez1GKi8wcEHlvtKxUUymUEiR1biJoSX9iDA5s5wOGpvEgYxn5HxACpysU7pBpDuMl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNX7o8s+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNX7o8s+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5831F000E9;
	Thu,  3 Sep 2026 20:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788466663;
	bh=RmfdlByOAOww+IPLGSFsmIWLeRD2xvJFYoysePsqLt0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YNX7o8s+RkplpICKv1SgXVwIDNC6U2MF/MEn3rYddyvPZR/Pr58ZICHrGOwNJRzfe
	 66ioVCRMU4B0gHzd6uS55vZP8fh0zqZuRme/ZZuyjrY7grirz9xsIhVmnLzW2Xe5RL
	 Km8v8v53u4jMtOnTEQgM4shi90uKDbigIs+O7SQ5KZx2myXLgkxFKJ3uvTiRxbNKc4
	 lVQtLLyTO500siqMV+yABajARLyF1H4vk+CAXpHxvX0/rrk4N/zy/otIYfOWhy7WNF
	 a9RnZplEOG828gktXX8YdTuF+mcRGG0RAQ+ShqISJxNtF+HutXLsKkV2d5zmsyWd2E
	 amCwyJEk0zgTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: x-powers: Add AC200
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260903-submit-ac200-mfd-v9-1-6b7ed278989c@gmail.com>
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
 <20260903-submit-ac200-mfd-v9-1-6b7ed278989c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:17:42 +0000
Message-Id: <20260903201743.2B5831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> The AC200 is an I2C-controlled mixed-signal companion IC containing
> audio, video, RTC and Fast Ethernet PHY functions.
>=20
> Describe the parent device and its shared input clock. The Ethernet PHY
> is represented by a PHY package on its MDIO bus, with a phandle back to
> this device for access to the package control registers, so it does not
> require an MFD child node. Function-specific supplies belong to their
> consumer bindings rather than the shared parent.
>=20
> The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
> matching the rates encoded by its documented clock selector.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-submit-ac2=
00-mfd-v9-0-6b7ed278989c@gmail.com?part=3D1

