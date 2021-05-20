Received: from tux.runtux.com (tux.runtux.com [176.9.82.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B084470
	for <linux-sunxi@lists.linux.dev>; Thu, 20 May 2021 10:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by tux.runtux.com (Postfix) with ESMTP id 90D2F6F0C7;
	Thu, 20 May 2021 12:06:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at tux.runtux.com
Received: from tux.runtux.com ([127.0.0.1])
	by localhost (tux2.runtux.com [127.0.0.1]) (amavisd-new, port 10026)
	with LMTP id SlQcJyNvDttS; Thu, 20 May 2021 12:06:57 +0200 (CEST)
Received: from bee.priv.zoo (62-99-217-90.static.upcbusiness.at [62.99.217.90])
	(Authenticated sender: postmaster@runtux.com)
	by tux.runtux.com (Postfix) with ESMTPSA id 099B66EFFE;
	Thu, 20 May 2021 12:06:57 +0200 (CEST)
Received: by bee.priv.zoo (Postfix, from userid 1002)
	id 8D429471; Thu, 20 May 2021 12:06:56 +0200 (CEST)
Date: Thu, 20 May 2021 12:06:56 +0200
From: Ralf Schlatterbeck <rsc@runtux.com>
To: Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mirko Vogt <mirko-dev|linux@nanl.de>
Subject: [PATCH 1/1] spi-sun6i: Fix chipselect/clock bug
Message-ID: <20210520100656.rgkdexdvrddt3upy@runtux.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ray: beware
User-Agent: NeoMutt/20180716

The current sun6i SPI implementation initializes the transfer too early,
resulting in SCK going high before the transfer. When using an additional
(gpio) chipselect with sun6i, the chipselect is asserted at a time when
clock is high, making the SPI transfer fail.

This is due to SUN6I_GBL_CTL_BUS_ENABLE being written into
SUN6I_GBL_CTL_REG at an early stage. Moving that to the transfer
function, hence, right before the transfer starts, mitigates that
problem.

Signed-off-by: Ralf Schlatterbeck <rsc@runtux.com>
Signed-off-by: Mirko Vogt <mirko-dev|linux@nanl.de>
---
For oscilloscope screenshots with/without the patch, see my blog post
https://blog.runtux.com/posts/2019/04/18/
or the discussion in the armbian forum at
https://forum.armbian.com/topic/4330-spi-gpio-chip-select-support/
(my logo there is a penguin).

 drivers/spi/spi-sun6i.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index cc8401980125..2db075c87f51 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -379,6 +379,10 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 	}
 
 	sun6i_spi_write(sspi, SUN6I_CLK_CTL_REG, reg);
+	/* Finally enable the bus - doing so before might raise SCK to HIGH */
+	sun6i_spi_write(sspi, SUN6I_GBL_CTL_REG,
+			sun6i_spi_read(sspi, SUN6I_GBL_CTL_REG)
+			| SUN6I_GBL_CTL_BUS_ENABLE);
 
 	/* Setup the transfer now... */
 	if (sspi->tx_buf)
@@ -504,7 +508,7 @@ static int sun6i_spi_runtime_resume(struct device *dev)
 	}
 
 	sun6i_spi_write(sspi, SUN6I_GBL_CTL_REG,
-			SUN6I_GBL_CTL_BUS_ENABLE | SUN6I_GBL_CTL_MASTER | SUN6I_GBL_CTL_TP);
+			SUN6I_GBL_CTL_MASTER | SUN6I_GBL_CTL_TP);
 
 	return 0;
 
-- 
2.20.1
