Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E325017C3
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Oct 2023 07:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1696231701;
	bh=kX93wG8sDvK/NYNskFqLEmdWnX99G5sekJ2NkAtEEsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mBqnh9/7hFXq2bxaAkoIrf9piyz5MJMkqrgJ3C4/L2BNeE+D95PbSMNH8dxjy3R80
	 ARTXkEYpPih04zbgigBhfntGehlwKpAtPL86b7YimM/AkpvvHgHRsQ0m4MQ0i5KfZ8
	 nI8gjI+eoJEH/amKfmgOB4HBqnTkiWRUr66zeTFs=
Received: from localhost ([124.78.196.55])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 7CBA4A46; Mon, 02 Oct 2023 14:31:11 +0800
X-QQ-mid: xmsmtpt1696228271topi6npl5
Message-ID: <tencent_25938315DAA0CF57818CE1D5CFCCC4B02406@qq.com>
X-QQ-XMAILINFO: OY0S8v5Ciex7OzVci6wQgTcll1R17sLVOkSa/oS4MllxcNQnLA9qrynZPm41Ce
	 4U5e1tX7oL803Eg3UrVo65g/alL12hAVQYsfhfjnBKjw5sgI5/fZwiiJ+/L7ETlMzl4zhfHvLWlf
	 /tYsmjBO0o1S4OuPAF/Yadm87s6ljOUsSKYixfvnUJ8mj6Q2XwiVstnaz9sAYogpDcHPtlwmtpWJ
	 zZOTGx6Cc67qKe0Uy4/tfyvcf2QJW5P/jDqCtAzw+1/bCa6JS8GHmsA+hRYd7HTJoHdB+ta+I3Nv
	 Ds7VTGg8YAMZu4eKsvw4lGX/HFM8sV5El54QhICD2v1bT7JL/Ieq/y1LH/Iwn5EnkOmKASfy4yEH
	 At7N6lE+UgsuTMUa1k6YHgN95xnf/3makLJcvXJzW9N08Pjqeb+kjpCSHuGPFPqHPBRNQbl6yJJu
	 hqr1mlWI6N23vE6FCRpqwqKfi2ZBUQ2vHoFjOK8H55K15jjTjPSsenqKoNa3+Wf/GsfdPDKWzO7A
	 iWf7WTvubXAHojuEkYfrKqrxLzho+v1sHtSX+hluU5ODRmK7oNY/s74bqL4TBjgvvEZ3R6vKXnNa
	 7P+bNe7tjMfsWcfJjkp8hsA5V4f98YHGlyZoV3gUbaZ2zOnFIHFuWPXD1pG/ILIVBb2s3hqJmn+p
	 vK6RYqWs/JajWSCK/1cSsyM9zqDcWiLAHwgyMtsEUuuWzSLXlahlpw3x0lysbTIaPsBKEYFYfEpC
	 34kFGzTtXPmGnPOF24NrAN7FSq8f3AQhNcWAC91PkdO1Em+lzj4Hx5gUo8q1G21Frfs0m1P5bOnj
	 XliLkjRxzJyN+Bo95dVPgcTZUSMovoZsrU+qkeWuzcPG74b/CA//G8ppwQKDt3ZKB3YcqyIXN6Wg
	 wG2ewY8rKV8ATEb8LJt20KiiR1ZsSCIga0c8RUf7JLG5puwLgc9aJMsMW2dWT8VxrAcUrTMZboX2
	 qt3TwiQ2boZXyF9vR652Mmjykvqx7SKLtbIf1eCHsUSmK+0Ou/NMkhHv8W80P6yqiwgH4Qm6loJ0
	 e8pxYPbA==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Woody Zhang <woodylab@foxmail.com>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Woody Zhang <woodylab@foxmail.com>
Subject: [PATCH 1/2] spi: sun6i: Fix memory leak on device removal
Date: Mon,  2 Oct 2023 14:29:58 +0800
X-OQ-MSGID: <20231002062957.1741396-2-woodylab@foxmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002062957.1741396-1-woodylab@foxmail.com>
References: <20231002062957.1741396-1-woodylab@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call spi_master_put to free the spi_master structure on device removal
and driver detachment.

Signed-off-by: Woody Zhang <woodylab@foxmail.com>
---
 drivers/spi/spi-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index fddc63309773..33cec49d5538 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -774,6 +774,7 @@ static void sun6i_spi_remove(struct platform_device *pdev)
 		dma_release_channel(master->dma_tx);
 	if (master->dma_rx)
 		dma_release_channel(master->dma_rx);
+	spi_master_put(master);
 }
 
 static const struct sun6i_spi_cfg sun6i_a31_spi_cfg = {
-- 
2.39.2

