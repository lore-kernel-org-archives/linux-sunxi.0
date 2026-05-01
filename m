Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F198F4219F8
	for <linux-sunxi@lists.linux.dev>; Fri,  1 May 2026 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777667444; cv=none; b=bjOmlAMeX1ifLGwpRtV31F+iZtZ+GcgX0L8WVKuo1FqsYhJKJLGOyH6aP3W/+DRpjeSunwc6vXy19PbQb1f9kP4wn4rcqQaHEgBIfR6/1AYYPZ4au3GCMahLLQyi/Ws4+S8XkIml+8QFViqX4uYBWghE9Ihd4rO02akqn93FeP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777667444; c=relaxed/simple;
	bh=v5qF9oUjFKKNNHiaZ/cDzrCvSYhthuRxEl4ePROAuGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=etSHOdF3E7KTaR2+5Jx3aUBylv65ptgR0m7kQ5QSegZIfcvcxQN31RGOhF+PAe2Wgv1jf3eMA/jLeDE/yGP5Qo2hFBIZnG+3SxjiqTl6hZXEjBkQkRh0syeuMg26Wzj5FATNMNFD4WVnJYheyOns+FWtW1UwWZ2+UPqxm6sFvAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaBLHf/c; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaBLHf/c"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-824c9da9928so1077906b3a.3
        for <linux-sunxi@lists.linux.dev>; Fri, 01 May 2026 13:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777667442; x=1778272242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVBnu6Q/tQcYvEy05j8zTeFYSonQvouDAQt7Xng1rGU=;
        b=WaBLHf/cJJkof68MWxAqhmn4X5WG6MmjxT4JTchnkMMWX/foBzuqklLP3jcmZru6+3
         +DWyQrPvSRuhQl4bEboTsn4on/DkVF/G8/j7SQ6ugXLa0ThHwbvrm32B8Xg4YkQbfnCh
         Jve47hHb0u001oGZNkGjGjoxOS84pd2qjWBByKn317iBeIMCzibWIwTLiu6kGw4u+rWq
         Og5jhOuhdF4WnSasG3u6pPMlipnUjxs7iWj889S8Mect8T+B7a5fXieHz20ox7mwUHZG
         cLx01+f60E8mlU3v3QDQfdA29voQxATn/8LynK0xP6NDqExHqX3/9QVS/liv0O3FQ9tG
         SDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777667442; x=1778272242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qVBnu6Q/tQcYvEy05j8zTeFYSonQvouDAQt7Xng1rGU=;
        b=KXNZFEvUHrY6eIJ4RRZQR4wlTqSsYCYAOJS88Tjti04KdzWUOhjuXsjAwlm2GoekdP
         tKCyT1+dTnlfe2x6B1dGbBGviBhANtnYiVpiJTSvoDdCe/Iulc05JMBGoxE0s2fzAB4t
         lZa4b6M2MtHZ2qmSeVTbmUxH66L8dfITj6HCNAdzCcHLOaztnhDSW+4jFQAVQa2pExGd
         8QH8epQWEFwIGlPYGNxTygPLlXn7vb8CXdXrOM4EHfCx2q5UzhhbzH7Kmqb/qBoxb8gc
         Te3kjlCa1mvSB4i1BfB5H5LK0NfFf+WKjR4hLouR3ttf9ksDv6FVPK2SJzVq2FCX/hCh
         SaCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+lzf/ryaXhMgX+a5/G/27I2j/IXFr/tCNgf0OUbkX73HS+Btx72Seg9CpwtntkRVMZGXx1YhJJQqN/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzN2FCmR+ftjl/TAYIbGLJqBspmMSCXe0PtYmLyQg4HmO3lIqNq
	+d6Q0cLjtwlTlWDPAubvRsw8sEAbsfCYmx8L4bVnYrHObEUtDkVi0UEq
X-Gm-Gg: AeBDietCMxgssI86R/F/X7dxJ9/eSMRE6KyfZheLP3kJBy2kf+2SEgNJQJB7p9ZzSNA
	7OkcBznYmOFisFsxOYxvMg/xJUPZJ+6ybjMFY1k/K9OxjJsSeZOE0ZH5kLqvNbhc34aFYpcSgPr
	XvFALnjw203Isb20JwGgbXBrzNZdHQHmA+En6Dq5JoYL7aDDcRLmSZ3ndgKHSiiJwE05LnyFqQH
	KAtcpKU+djvp7kcfziqSA4dgifXV7rQCrDAfM+FunAKQNxQR1CD88hsg8VBYrYIKS4VpZbsAPyT
	gmHjV2ehfyXq/UEemmC8hE1ZF0LTs0h1xI7lCZX5rmLaAofIGurX0fUaBnKzjDhsgKYM/iDUxo+
	z3AEpkySn4dw+0+V/LzUpVutR+dvPMqdCNulxQ9qhVkZEBg+Ff5cuNfSOttLiLST3vDCxOFebbS
	OL9/THYwZCY28M13OpUVHtWUBrJswNJwJ2YCCKEvxTj+fIFrXeB6I5MxSuo0uMtZXF3D9FuRoc
X-Received: by 2002:a05:6a00:330b:b0:827:4343:4c1 with SMTP id d2e1a72fcca58-8352d20b2a9mr661002b3a.29.1777667442262;
        Fri, 01 May 2026 13:30:42 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b84aedsm3230595b3a.57.2026.05.01.13.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 13:30:41 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Felix Gu <ustc.gu@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: [PATCH v2] i2c: sun6i-p2wi: fix of_node reference leak in probe
Date: Sat,  2 May 2026 02:00:02 +0530
Message-Id: <20260501203002.3382428-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com>
References: <20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_get_next_available_child() returns a device_node pointer with an
incremented reference count.  The reference taken in p2wi_probe() for
the optional child node was dropped on neither the early return when
the "reg" property is missing/invalid nor on the success path, so a
reference is leaked once on every successful probe and twice on every
failed one.

Use the scoped __free(device_node) cleanup helper at the point of
acquisition so the reference is dropped automatically on every exit
path.

Suggested-by: Felix Gu <ustc.gu@gmail.com>
Link: https://lore.kernel.org/linux-i2c/20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com/
Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")

Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
---
Changes since v1 (Felix Gu, https://lore.kernel.org/linux-i2c/20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com/):
  - Reword the commit message to make explicit that the leak is of an
    of_node *reference*, not of an allocation.
  - checkpatch --strict --codespell: clean.
  - Build-tested: x86_64 allmodconfig (CONFIG_I2C_SUN6I_P2WI=m via
    COMPILE_TEST) and arm sunxi_defconfig.  No new warnings.
  - Runtime test: not performed; no Allwinner A31 hardware available.

 drivers/i2c/busses/i2c-sun6i-p2wi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..652b37b57159 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -184,7 +184,6 @@ static int p2wi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *childnp;
 	unsigned long parent_clk_freq;
 	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 	struct p2wi *p2wi;
@@ -223,7 +222,8 @@ static int p2wi_probe(struct platform_device *pdev)
 	 * In this case the target_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
-	childnp = of_get_next_available_child(np, NULL);
+	struct device_node *childnp __free(device_node) =
+		of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
 		if (ret) {
-- 
2.25.1

