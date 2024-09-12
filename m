Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DC018C915;
	Thu, 12 Sep 2024 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726130060; cv=none; b=BuJdwOuBX0PAAg/p7+QkNaIjVHzUMcwL/WgE8PrLOEa/s5RbMrRjy/fSYoepjWz9czj/LyVv/NwTv76Ib+UbE3cGDPPQYZBZThvRiEZDlfPO8x0f3Mn2STwz+LXFhuRYiuAdKifMDx9bK53NBMSZ6YFgYThDrfCYjiglAmbnLlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726130060; c=relaxed/simple;
	bh=Ku41fc1T+GKwYLO8P2D3ZeionndBbQ5FxSRlsy4rGD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUJlUdYx3LaesqnIqjWer7uFLR7J3knXymxatGtcswoyrH8GkcCPiw0UzmGEbkQ9n72vMrAZwW1lM1kmLq2a72eS3v3BdyAnN5pCq9tRC/Ieu2b9x3WGtzsCysyrUM4Ffu+yinUNlyYrc1PqFCInWo5x+no7FCyJ8V6n9ifThSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7ZcoHqh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7ZcoHqh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A61C4CECC;
	Thu, 12 Sep 2024 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726130059;
	bh=Ku41fc1T+GKwYLO8P2D3ZeionndBbQ5FxSRlsy4rGD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D7ZcoHqho9j5hqC0Q3UimcEfd3sAaAc4wzARdnEb5Lql2UoBs7m92oRPsJ2qzrSCI
	 QDf2j9gJ97OCRy078WKIWdErF1+8QM+6CRvCm9gXMIXlZpmmIIf3+x8GZziOplrO5K
	 oyigFXrT/A92qDcaDhi6WiniT+2btFGQ1A+lqQDhEH9PeKGYsiyyOu5SKb56Xln8as
	 wVBaXBMaK7qENR7gHdJvc81u8njtAqzd7lR01A7zCH2PBjrSSQYq4mlT96dDdjtZkI
	 HjaaKV3qGjnSByNOjSXfI+9WgtE6dbCoPrVAOyZHhKRAkdv+2rjMT2aDmqM1nPf5vi
	 GauUUHeDcMiLQ==
Received: by wens.tw (Postfix, from userid 1000)
	id EA07A5FC08; Thu, 12 Sep 2024 16:34:15 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?UTF-8?q?Kry=C5=A1tof=20=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] NanoPi NEO Plus2: Fix regulators and assign them
Date: Thu, 12 Sep 2024 16:34:07 +0800
Message-Id: <172613000178.1953155.16179648921609454400.b4-ty@csie.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905-nanopi-neo-plus2-regfix-v3-0-1895dff59598@gmail.com>
References: <20240905-nanopi-neo-plus2-regfix-v3-0-1895dff59598@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

On Thu, 05 Sep 2024 19:37:09 +0200, Kryštof Černý wrote:
> Just minor changes based on feedback.
> 
> 

Applied to sunxi/dt-for-6.12 in sunxi/linux.git, thanks!

[1/2] arm64: dts: allwinner: H5: NanoPi Neo Plus2: Fix regulators
      https://git.kernel.org/sunxi/linux/c/37ed8e75c660
[2/2] arm64: dts: allwinner: H5: NanoPi NEO Plus2: Use regulators for pio
      https://git.kernel.org/sunxi/linux/c/605f56405a67

I also changed the "H5" in the subject to lowercase, matching most other
commits.


Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>
