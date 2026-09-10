Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364C145FFAD;
	Thu, 10 Sep 2026 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037379; cv=none; b=MCJcDP2EQGGpNR1RJKBuQFnBtdtUQL09tpI0q4UDSeqdpHGNF70rM4QiqMVQpNdMI7RIV6TMlR7z6Dxqe77ZE/RsrC7gSOp0syehsvrPLWdIMwmLyj32oE7+CoWQnJFewSvPzjdpcD1a8nO82TOjyiZJFA8SCYXyVkKSDEGO9Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037379; c=relaxed/simple;
	bh=awYSPn9JddielGm09gBj22jAkXBv0oqeCwPZITWyxWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=spU1ik24js+GS17kujy+W2w0HTMDrwnysFK9aMbK+nYOQYQgM04DZcMAfJ5/O6y1oLnw4WmxwJcDaJQvDuAyWyZmnnKpUp/GZL0TTuaS9rfi3mZMtsOMYF4EFfzjdpgFTlbjzgUXBGF46YIO6P4eX1fUX8PiT5DyIghYu6WxBXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5EuqU3U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5EuqU3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8551F000FF;
	Thu, 10 Sep 2026 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789037376;
	bh=awYSPn9JddielGm09gBj22jAkXBv0oqeCwPZITWyxWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b5EuqU3U3LAPQp3VW6K4Dimzi75nnLXkFCBizWQkdj8QW3sMU4JH1F0WB0+3/Z4F1
	 hiQQHs/zWGPI1jOV/o+lX39S6L9IMaFnaGYQrA1cZrNeUhXk3Szr/eaGWBVvHUJNpU
	 1x6Jni/5uCGJlWkoo/Oy45omQqgMPYftZpkF90BQHn8V+8E2P+KCYbATHWZVuG8Dk2
	 gpud+vVoftXKPR4VhhbiNSAU+CF7nmVJ2PqquAjRgeCgquBI+lMs9LwrAQxT50X9Ia
	 dE4YsJg6+E2CEujKMBDJKF7IgJkUhaz3mOPznRbUcOa7koh29yPBi1CbwMLW6G5aCu
	 bSxRZAe4Fcxvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/5] mfd: axp20x: Constify axp313 and axp717 cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260910-axp318-regulator-v8-1-e906a61a7f3d@baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-1-e906a61a7f3d@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:49:35 +0000
Message-Id: <20260910104936.7E8551F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> mfd_cells array should generally be const and there does not seem to be
> anything against it for the axp313 and axp717.
>=20
> Constify the mfd_cells array for the axp313 and axp717 to be consistent
> with the other supported chips
>=20
> Acked-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-axp318-reg=
ulator-v8-0-e906a61a7f3d@baylibre.com?part=3D1

