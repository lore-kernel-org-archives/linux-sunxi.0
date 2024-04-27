Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC50243172
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Apr 2024 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714224611; cv=none; b=S4CWRf8D4zkzCfgtbJ68bbM3gldoFFUAZAjTGxWjSPa5XlyLlGQbhkLbuL4lH0C8QVyuIvHbliuqQUemKjkEN72nTpbsa+AalP3TNDzP2mRNhEFGU56qYQYIsLyRtsThaJ1em1k7WKDZQFsva7D58ujwGQKhl5x/V36FIPqqv38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714224611; c=relaxed/simple;
	bh=PwVUHK0Tmf9/OYbk10AR6hcNks7Knp+NBSiDWZIMfWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AN03A5B2/Ehpjc/iA9dxo8dFVPP1J2J4hN73HVc+Q2A0vpn9ZN/MZB1JY48Hxf19euGLmXTjc/3Zg2os45nDtKmbZvRGM/2DQ654Wtb7wk4iDrMaaM5i8FMcQGgAP5STOyZz/HsEIobjew3M1kBRwstkaR/pj9GCcVqr6BSrO9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+NMkJFv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+NMkJFv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0071C113CE;
	Sat, 27 Apr 2024 13:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714224610;
	bh=PwVUHK0Tmf9/OYbk10AR6hcNks7Knp+NBSiDWZIMfWw=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=D+NMkJFv500YKFF4cekn1+vvQ05UOr8EE045WBk2H5UQ1mmGyFLcSCtCIGVlH5Uch
	 LFq612j5KuKxEx/skF/2R/QIAIYYzNk33juay1Ly8H/npSu/rOIYd6vooIsZlwssIc
	 WsMEYMI8GVMzCp9n57gF3LD+BDrkoyre8xJnZKWGOt+7rXcloBmBaT4BcWLmSM/otD
	 yzuJ7CGch3yE5k+WmmtLOVnuAt1h64jKmD5lwEXPUbuz1pRwEAZtavosl8Q3tXtOoQ
	 gSdhT2bDdfQEVm12N96KLdx/tgM/gXNY60yxrJhFU0XKC87GQAh4Fkp4PQ1Ocp9XtB
	 pVeI8q2BKe2KQ==
Date: Sat, 27 Apr 2024 15:30:06 +0200
From: Jernej Skrabec <jernej@kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 6.10, part 2
Message-ID: <20240427133006.GA146501@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Here are some last minute DT changes. They apply on top of
sunxi-dt-for-6.10-1.

Best regards,
Jernej

The following changes since commit fd46e5e136a83f61c1746d5a08686c0c4f4c0706:

  arm64: dts: allwinner: h616: Add NMI device node (2024-04-26 17:50:16 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.10-2

for you to fetch changes up to 0d185df6c9ff841be2460d2f4610de22f326d5dc:

  arm64: dts: allwinner: h700: Add RG35XX-H DTS (2024-04-27 15:21:00 +0200)

----------------------------------------------------------------
- new boards: RG35XX 2024, RG35XX-Plus, RG35XX-H

----------------------------------------------------------------
Ryan Walklin (4):
      dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming device variants
      arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
      arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
      arm64: dts: allwinner: h700: Add RG35XX-H DTS

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  15 +
 arch/arm64/boot/dts/allwinner/Makefile             |   3 +
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 327 +++++++++++++++++++++
 .../allwinner/sun50i-h700-anbernic-rg35xx-h.dts    |  36 +++
 .../allwinner/sun50i-h700-anbernic-rg35xx-plus.dts |  53 ++++
 5 files changed, 434 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
