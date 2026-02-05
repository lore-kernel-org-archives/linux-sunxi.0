Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C31A3EBF06
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Feb 2026 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770280965; cv=none; b=bLWYN35Kgb5vUjsxdauT+S2ELeBeX2LOv36g7rXzjSTx1jAvQ20Ex0Qv9742GBYxqCOF8PM7ahfI8gJvs0T1Dcc8btZgXL52Jir8YQ6TAeVtJfkvvMI7R0FivhPeJko+IZGVFzkaIHzMRDsaBnmBarNKbu63BP0XjXDu04jF5LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770280965; c=relaxed/simple;
	bh=bYnRselaAM8hwK53Vv6WQ+5JVj26DZi51Q07N+Hh5z8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j4TR1eNS2mZGSLsgN/6d4XzqSFJWZfXbRAKr3wD5LoHg6Ks7SD/Y/8xcOlAAD0vP4raC6E3J0vhKgTMW34ZhzHRKRTmMDfm6cTI032h6oISRKw/S2SSH5KDaeF+TwOl7lJgRcNNM4ZMi8ynlfLIYMxFyQQxjRePrbv+gFuHZdf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABXZ879V4Rp4R+7Bw--.41404S2;
	Thu, 05 Feb 2026 16:42:37 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	p.zabel@pengutronix.de,
	mripard@kernel.org,
	mans@mansr.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] clocksource/drivers/sun5i: Handle error returns from devm_reset_control_get_optional_exclusive()
Date: Thu,  5 Feb 2026 16:40:37 +0800
Message-Id: <20260205084037.3661261-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXZ879V4Rp4R+7Bw--.41404S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw15Cw1kXr1kZry5AF4Dtwb_yoWkCFg_GF
	4Ivry7XrWrKrZxKF1qyw43AFW29as5Zr18WanYgaySka4UGrWUA34q9rZ8ZF18Ar4DKF9x
	CFW3GrW3uw1akjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbDPEDUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

The devm_reset_control_get_optional_exclusive() function may return an
ERR_PTR in case of genuine reset control acquisition errors, not just
NULL which indicates the legitimate absence of an optional reset.

Add an IS_ERR() check after the call in sun5i_timer_probe(). On error,
return the error code to ensure proper failure handling rather than
proceeding with invalid pointers.

Fixes: 7e5bac610d2f ("clocksource/drivers/sun5i: Convert to platform device driver")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/clocksource/timer-sun5i.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index f827d3f98f60..d7e012992170 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -286,6 +286,9 @@ static int sun5i_timer_probe(struct platform_device *pdev)
 	}
 
 	rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc),
+				     "failed to get reset\n");
 	if (rstc)
 		reset_control_deassert(rstc);
 
-- 
2.25.1

