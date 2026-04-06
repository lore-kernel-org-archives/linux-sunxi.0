Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E530E0ED
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Apr 2026 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775487110; cv=none; b=StG9EtXCvcGljT33Bt0cFbz5okpIsNmnJJuhSUaYBT0oHmlZyMcN47cPC2c8HCJCofjZ0plbqTFXxCWfX9emencT7KIhxrJsF5k9IwShtilehNSYPvRFzKgtqCrSAmySVvnFqRd6ETQiCvadlEWvxz2ZobyUqoKGG3l0EwgHzww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775487110; c=relaxed/simple;
	bh=rwPbP1+bFk4jFXuGeRlNdKBo7Zv7Zhhj2QVlBA9xpOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WVnEQoq356HK1Jod8IJXM0DQzTE43Wz5Pizc++waWAEaHHIuNKFUAAKpJ6RSGCnN4ecNGumobd6z60+ShW4SDfdKoO3xcjKSiqjALYCVwwjsBEEYizO5CPBeDF9NINGydSMGcfS9cI0I4CZIhba9p2S5bvmOq7uhxs9tUg54fE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcX0ZLjo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcX0ZLjo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE317C4CEF7;
	Mon,  6 Apr 2026 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775487110;
	bh=rwPbP1+bFk4jFXuGeRlNdKBo7Zv7Zhhj2QVlBA9xpOU=;
	h=Date:From:To:Cc:Subject:From;
	b=hcX0ZLjoUqvZGX4zWItRYNaHBJw/PC9a750oubI6W/pSAJJ3JEUIyATkSMF6YXcSE
	 nIejwAm38lKqcHUJqrznQIrvIIbINNVkXm4s1l6FugwYqku/Pqg0NMoPTu1u3GVbWN
	 mxnIQxv6qhTiG3gNr67oEx/j1yeI8Wv9kZ61KS+kWu68h8EdrKGvIaIPeaCLHl4SMC
	 94crm/1rhu3TxOmLfd/OVsZ08Bx5JWH/dQoyzVT579H4/irJA0tWb8tQ7ozFigmClh
	 iXyxv7LhaU7/YRg1Rp2KSS/8Db4VCs9WdTZ8twQgBuwU4yC/YlJOPr756ZJhPxRZtN
	 aVnM9wK76qv5g==
Date: Mon, 6 Apr 2026 22:51:45 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Device Tree Changes for 7.1 - Part 2
Message-ID: <adPIgTlQxnVpYgH4@home.wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b912e48bee355b6b1faf86efc4a23191324ffecb:

  arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support (2026-03-14 15:27:04 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.1-2

for you to fetch changes up to c755e39836ec492b0bc210fd96c2b720b5b4a690:

  arm64: dts: allwinner: enable h616 timer support (2026-03-29 21:20:49 +0800)

----------------------------------------------------------------
Allwinner Device Tree Changes for 7.1 - Part 2

UART DMA channels added for A64 and H6. Standard resolution MMIO timer added
for H616. This timer can be used as a broadcast timer for wakeup from idle
states.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      arm64: dts: allwinner: sun50i-a64: add UART DMA channels
      arm64: dts: allwinner: sun50i-h6: add UART DMA channels

Michal Piekos (1):
      arm64: dts: allwinner: enable h616 timer support

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi  | 10 ++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi   |  8 ++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi |  9 +++++++++
 3 files changed, 27 insertions(+)
