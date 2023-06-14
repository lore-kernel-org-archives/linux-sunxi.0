Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D17CAD36;
	Wed, 14 Jun 2023 16:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3BFC433C8;
	Wed, 14 Jun 2023 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686760209;
	bh=9llC9DY9BE1LH+xc2pnl/22XEd3kSEENXwtBayoRpmc=;
	h=From:To:Cc:Subject:Date:From;
	b=Fnq/3Nj4MccrkPzv3Rq/CX3+iFa7JOQNucgcVaZ391g94TPoDfPbOxu6HRJquclaF
	 nj/Rn8QMm+L+klMX8LFuwwsCcLyMWfPMyWDCJbDaxe5uUDr8Ftm8dksbP4M+LMRVhs
	 pYNLBDGTt24/m+eKyUAuDVDcQXT+wavNLkvybREsquzx/IHQ7nmZSxnTpB7jkluVPG
	 v5LIE6KhNkXhG6ih0rPOUHFykTdBAEFULWkxdzuuQeJEsxRVtdsr6SOHY+pKxuZdtM
	 s3JEAGXFOJ6MvSlznDY6hb8PeFwPBTuRlonB8JNYzWJ2TiL4TzK4lxVQT6mg72eyGU
	 gn4vGFfOPvLCg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] net: stmmac: fix & improve driver statistics
Date: Thu, 15 Jun 2023 00:18:44 +0800
Message-Id: <20230614161847.4071-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

patch1 and patch2 fix two issues in net driver statistics:
1. network driver statistics are cleared in .ndo_close() and
.ndo_open() cycle
2. some network driver statistics overflow on 32 bit platforms

patch3 use pcpu statistics where necessary to remove frequent
cacheline ping pongs.

Jisheng Zhang (3):
  net: stmmac: don't clear network statistics in .ndo_open()
  net: stmmac: fix overflow of some network statistics
  net: stmmac: use pcpu statistics where necessary

 drivers/net/ethernet/stmicro/stmmac/common.h  |  54 +++--
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  15 +-
 .../ethernet/stmicro/stmmac/dwmac100_dma.c    |   7 +-
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  13 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  |  17 +-
 .../net/ethernet/stmicro/stmmac/dwmac_lib.c   |  10 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |   6 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |   9 +-
 .../net/ethernet/stmicro/stmmac/enh_desc.c    |  20 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  12 +-
 .../net/ethernet/stmicro/stmmac/norm_desc.c   |  15 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 100 ++++++---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 190 +++++++++++++-----
 13 files changed, 304 insertions(+), 164 deletions(-)

-- 
2.40.1

