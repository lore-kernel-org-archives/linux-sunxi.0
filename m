Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530161391
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Sep 2023 01:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AA6C43391;
	Thu, 14 Sep 2023 01:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694656513;
	bh=mPNHzB+IFiOFsROhg18ge8hhu4lILId2aXwKB3Qc/g4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nxNVcvBWLpkDSppp9D9uPAYmLwVd25H04A6q4/UPKWYSK59YC435/U9W2A/+Yi4ER
	 6+je09OIRpFXs2Qd23u9Fr9buX5n1r4xzkk59Tguy6oKGWsSfwKbh1rIS0UfppoGlI
	 z6NEuDpYl/vePkd6JAnhI0qnF/rSsocifirMv01ow8wCPv3EvnOagFqFD0oV6f+4i1
	 fLXRd9QOkfzIRx3+8YALtLOGFDxhcVoHKV0I1EihBIX9bY24PefR01Viovg4rlMe5e
	 e6ZVyn7v1jSQA77Qa3sLoYf14a75qua5yltyhTysH9+F7ZmIm0MYSPmxQkvhtnuSAV
	 LlHa2VxTRSM3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tobias Schramm <t.schramm@manjaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 6.5 6/7] spi: sun6i: reduce DMA RX transfer width to single byte
Date: Wed, 13 Sep 2023 21:54:50 -0400
Message-Id: <20230914015459.51740-6-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230914015459.51740-1-sashal@kernel.org>
References: <20230914015459.51740-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.3
Content-Transfer-Encoding: 8bit

From: Tobias Schramm <t.schramm@manjaro.org>

[ Upstream commit 171f8a49f212e87a8b04087568e1b3d132e36a18 ]

Through empirical testing it has been determined that sometimes RX SPI
transfers with DMA enabled return corrupted data. This is down to single
or even multiple bytes lost during DMA transfer from SPI peripheral to
memory. It seems the RX FIFO within the SPI peripheral can become
confused when performing bus read accesses wider than a single byte to it
during an active SPI transfer.

This patch reduces the width of individual DMA read accesses to the
RX FIFO to a single byte to mitigate that issue.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
Link: https://lore.kernel.org/r/20230827152558.5368-2-t.schramm@manjaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-sun6i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 30d541612253e..8fcb2696ec099 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -207,7 +207,7 @@ static int sun6i_spi_prepare_dma(struct sun6i_spi *sspi,
 		struct dma_slave_config rxconf = {
 			.direction = DMA_DEV_TO_MEM,
 			.src_addr = sspi->dma_addr_rx,
-			.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES,
+			.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE,
 			.src_maxburst = 8,
 		};
 
-- 
2.40.1

