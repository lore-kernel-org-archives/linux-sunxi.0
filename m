Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A0A281378;
	Mon, 22 Sep 2025 14:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552305; cv=none; b=UMOfz+kNvIJ44PkTDdislT4qQsZABt1n2W59DOW+n1pAvgbJXi+13rvGbGML1yp/u62aYMFz1oBCNZ4uTsv44UvjYTnKNMWW8oRz973v3trSkzKzr/j2ahgupI0G6eWnI1Wv3qUturnoOIA/YNhUDX2/AuAnP4uJ5WUpb+/EvEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552305; c=relaxed/simple;
	bh=D+LNgfJNYzCpnFJGwhR+lwXuJ0ILIQoGT35vh4i2XBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WSasQNjvWcbPQBvItv28Zkwqhe0reBCz0gi0FovuyQJ/4jSh0i0xABfA4uTtyODUEW/V/56fmrLf4q8bYCpfvWpivx+7Q7USVCzsfX7RO09COR6L4mbiiZsL5UYjvxHyRgRnsR4yd2NIoZyLsNUjlMGNomylCNBgfwGUpdkeie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbZ8P5og; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbZ8P5og"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F36C4CEF0;
	Mon, 22 Sep 2025 14:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758552305;
	bh=D+LNgfJNYzCpnFJGwhR+lwXuJ0ILIQoGT35vh4i2XBQ=;
	h=Date:From:To:Cc:Subject:From;
	b=dbZ8P5ogAQJxFbT4EfBs9j5q1ngbONMN+GPGjDS72pZp8K5Iu7yqjJzx8x50lU1Vr
	 PPcpXXiat/SkwL2/JWZ7dflR4RJQBQrwyVKAkh7pJ7K/UmpBgiKcs65+TwIATHeW9t
	 9MPbNQVtV2sVFRKFdG+9SLw5RPWb7xLiY8Ox8pzArKUr5SRrhkF7WuX6ThVcaGWL3A
	 /fHW211aJfaIA0Ttx8Lk3nowZIF+aQdUcEIZwWHMXF4rJvWDI+vGhXEuFTZSPJ8I+h
	 SO7+HOTB9X9vQsoDM1E5KtVw5bYfUyHi22g9eNVL52DROhD2zC277PW8XWd5gDwpTF
	 odCCKaXxNnU8w==
Received: by wens.tw (Postfix, from userid 1000)
	id B2EED5FC15; Mon, 22 Sep 2025 22:45:02 +0800 (CST)
Date: Mon, 22 Sep 2025 22:45:02 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [GIT PULL] Allwinner Device Tree changes for 6.18 part 2
Message-ID: <aNFg7iuBtyWkCZg6@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Here's a very late pull request, adding support for another board.
This is already included in linux-next, and doesn't show any issues.

The following changes since commit cca07ac2b5f7838b8ff612b53b9f82ac8cb58312:

  arm64: dts: allwinner: sun55i: Complete AXP717A sub-functions (2025-09-15 00:04:32 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.18-2

for you to fetch changes up to 07c7f4f4e9504da240ef68adfd95a1150d3a6fd4:

  arm64: dts: allwinner: h313: Add Amediatech X96Q (2025-09-19 12:37:16 +0800)

----------------------------------------------------------------
Allwinner Device Tree changes for 6.18 - part 2

A new board, the Amediatech X96Q, was added.

----------------------------------------------------------------
J. Neuschäfer (2):
      dt-bindings: arm: sunxi: Add Amediatech X96Q
      arm64: dts: allwinner: h313: Add Amediatech X96Q

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts | 230 +++++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
