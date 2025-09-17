Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7752FCBFF
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Sep 2025 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758129236; cv=none; b=V9xuyrx2C+uZRh6WX8cZfa+wcrqfG5oeR/JK963ll5klHe2SpWWGQdspcvnyZuMTRoN8RmVssNM3V5A87XBoQMqHkHe5sGWO7xaEU7+3eslVy/ctpT6QETr8n1kuf50TRrYVnTH6v+ZCahy90iaXBouyKwUCzkE7soQ3ymA0lUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758129236; c=relaxed/simple;
	bh=vCIzkqHkDllVbjHt4rbcYERc7E1yPCDUfmpZYv9Cang=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ox7VFw/X5/oHkQ7K6WmxtxX9PWnAGfwyCOFi9bKVUp4Ol76zUta9zcvCcFQj5kSg3rJVjJ+KFCkq/1kDWum2ZJuS0jsQ4B0htJzFupTbVVse6oM4al2qWBinUipRHsuyNJHkC0HbsutOBYN+h7i2LlMVpwWaCE/E6mwYbT/TgTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcDIvZVh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcDIvZVh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B164C4CEE7;
	Wed, 17 Sep 2025 17:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758129236;
	bh=vCIzkqHkDllVbjHt4rbcYERc7E1yPCDUfmpZYv9Cang=;
	h=Date:From:To:Cc:Subject:From;
	b=OcDIvZVhmNFkg+cVtPPwIvxgK6MdyvzOQeE4loXQThuZZXkgaWapQ2mVcqqxHmoS8
	 dCW82TNgWPphvQqu1UcIRUlP/RzT7lzfEoAT6G7AtfjHTrMHc6CKkUIGG7fhfZmEjC
	 4S3PeW0qkfhzYpKvIfv9chhf0xPrV+MbRjllPO/oNVsaNsp5IDg2bq9ag2T1Agw99+
	 QAPXHCKUM6rFgVqVjm3drI78JkdahEG4U6NF4bjzNTm0L0mLe2uJBfqWRPZjFgrJQG
	 IgJqHVErB+Nk/0Z98Vc7uQnR5cS6kPdbqirgSgcJn0TQOtCnDpnWQ/2xv+F+P8NbkD
	 akXRTb+uZFehA==
Received: by wens.tw (Postfix, from userid 1000)
	id 606DA5F9F6; Thu, 18 Sep 2025 01:13:53 +0800 (CST)
Date: Thu, 18 Sep 2025 01:13:53 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner fixes changes for 6.17
Message-ID: <aMrsUfkTWx8g3bJ7@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.17

for you to fetch changes up to a5d7a8ab4b21747173a2f8f0ebf71d72692793c3:

  riscv: dts: allwinner: rename devterm i2c-gpio node to comply with binding (2025-09-10 20:56:43 +0800)

----------------------------------------------------------------
Allwinner fixes for 6.17

Two device tree style cleanups from the device tree maintainers.

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: allwinner: rename devterm i2c-gpio node to comply with binding

Krzysztof Kozlowski (1):
      ARM: dts: allwinner: Minor whitespace cleanup

 arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts  | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi          | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi                | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts | 2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
