Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858801;
	b=iRwxlhkWPNC8qU4FoVcmPaE8WzVXIKT9KIG5RrXqoke98HyTL5s+kjpD2EWwrNTSEhYr
	 Umf6yvT/5YJoduEXpWg9uPOcBLfpPYZSFcp2aWERRIOYgrjmUm24rHGV2KsjxQRfzU5HT
	 z1j4LtbOodnINO5CCMZQ9nmXht5bKmLc4btcTlz314SFOPUdTZ90QXkGcRn7OhZb/1mb9
	 tPtU6QndGe8F47rEgqeajKfQ1nvW+Lru0hxnHxKD/Rc21hepT1LPLshdwFq6P1BAdEf+5
	 c24b3HwlSp6j7z048q5Aa3ZNJFcIEywYynNibGRqsdmg8/ySULn/AV9S6frgfFer7lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858801;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=hoZoPXQcxdC/nOdJi6eB9NK86MbjG3HjeYJVZIRZ1gw=;
	b=h4ZuVB3uGP62nP6xuEQzMaHUIh81+GFIw49LoeSCUxTuGwofw/hk0jvRi6xRP5hvmS9v
	 psT8FFFI6NGdDIP36HMNhgwdKOV1FAT7dbfFhmPdbbTNq70WZ/PZSjAIZmzrsUzix+Ej/
	 S/vQmm0LK33CLigmjWl1/XGmtLEhkClcQN+OKEIGECiWsIvWQHVh47Pxy+zOzPbTcpwV2
	 hiK9vSK0qNLGtMnC7XFk4+CkStQ9KCOk5+FA9ekI6Fe+rHagN25W4aVQKy3Vg54ScIKim
	 lqwRrtj0y+vpeIOm3fsG4pZ+3fQhgSSFgyfWzD6jwCKnLd2qsPOyiGTBGTZ2nnSUPYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="Ji7MA//N";
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F48D606A31F
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Nov 2026 09:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F48D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Ji7MA//N
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b07cc;
	Sat, 28 Nov 2026 17:39:56 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: emilio@elopez.com.ar,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	hansg@kernel.org,
	bbrezillon@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] clk: sunxi: Fix potential use-after-free of APB0 provider data
Date: Sat, 28 Nov 2026 17:39:55 +0800
Message-ID: <20261128-f81b700d6c-u17-3@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa22186904003a1kunmfd893f62451bf0
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaH05CVh1LHhhDT01PS0geGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ji7MA//NgQUoSpE+U7M3iwc95L8PClsL5Jetm5R7OYmAZna+Cn+AOfdSgviKMkUuV+6AiC3nH4JCUUukVjxfnJsUsnG6RlN0rxCxeCoPCoRRk1J9nfA1hxQikXhN7QOw5449oYwek4lo3uB3UBfdYVS2W/5ZKwCnwIEvcjbNONY=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=hoZoPXQcxdC/nOdJi6eB9NK86MbjG3HjeYJVZIRZ1gw=;
	h=date:mime-version:subject:message-id:from;

Unbinding the APB0 gates driver releases its managed onecell data but
leaves the OF provider registered. Later clock lookups can dereference
the released data.

Remove the provider before the managed data is freed.

This issue was found by our static analysis tool under development.

Fixes: c8a76cac19ee ("clk: sunxi: add PRCM (Power/Reset/Clock Management) clks support")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/sunxi/clk-sun6i-apb0-gates.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c b/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
index a10ebd1998fb..9d1fef8c520e 100644
--- a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
+++ b/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
@@ -87,11 +87,17 @@ static int sun6i_a31_apb0_gates_clk_probe(struct platform_device *pdev)
 	return of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
 }
 
+static void sun6i_a31_apb0_gates_clk_remove(struct platform_device *pdev)
+{
+	of_clk_del_provider(pdev->dev.of_node);
+}
+
 static struct platform_driver sun6i_a31_apb0_gates_clk_driver = {
 	.driver = {
 		.name = "sun6i-a31-apb0-gates-clk",
 		.of_match_table = sun6i_a31_apb0_gates_clk_dt_ids,
 	},
 	.probe = sun6i_a31_apb0_gates_clk_probe,
+	.remove = sun6i_a31_apb0_gates_clk_remove,
 };
 builtin_platform_driver(sun6i_a31_apb0_gates_clk_driver);

-- 
2.43.0
