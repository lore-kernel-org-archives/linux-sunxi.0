Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4470
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Jul 2021 04:24:36 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id n11so4694270plc.2
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Jul 2021 21:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jeA8/QJwIuaoq07p3zXt49yP9rXhPX14YEL5plmNTTE=;
        b=eaYqYDla/1UeEKXZx7Ij0DutP7wvZNbi8Dcgg7R8UgEineeDI8N4Zf3pDJsMEhDkIB
         UOkFus56q//aBpx1HsCTcjQYbRhSEqcI+8HB1ANTCqImxS7Y4SPb+lqh4slpRNaHrZER
         v9Am9dGj4FsIwBgX/KbmgnCosMkho+8so+3O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jeA8/QJwIuaoq07p3zXt49yP9rXhPX14YEL5plmNTTE=;
        b=PNLIvxAN5hlezz/9dI4iUkIr5iKxC0e7q9msSPl69YsFI5ZbnH2SyJPVbTelqzhOYP
         YtG11wyEnqXllLGzhgbEDSM8E2jH3HkaCTf7sWsA+Cqh/fLG6liuvAcGF4nKSO0wNrnp
         bO0h5pj79+wRM4IAlN9MOOpcrr3XgrhLGFtlXOzbrNQTUxdGNdAY4EqC/WUrHL5kH7BU
         OrsfOF9PSOCAJG6jJs+Lh9TVZuf+SsG72UHYaj6+x/bcE1gC3yDlamXhrCIBPO6IUwY7
         HB17MOkEU0hR1PJL6SDTAJxGiEV21XE9mO/lnzXUxFbKVUE9Fk9UD7cuK7BLQADAC+hL
         TuTg==
X-Gm-Message-State: AOAM530+n0lvWiJzwHRJ/p6IvtvV2wQSSg8yZ1ItxHt2MkHRR/kFHaaw
	TXJaGfGNmRykfsMkmLwzyGGR1Q==
X-Google-Smtp-Source: ABdhPJw25am4owtb+e9yeoQv4fOzNBq6oWPWnqODQ01UZQDeKtEMv6E8OmnwHqvZEsuqz7v8i5kMLA==
X-Received: by 2002:a17:90a:a6a:: with SMTP id o97mr13944357pjo.179.1626409476196;
        Thu, 15 Jul 2021 21:24:36 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:3685:a3f6:891d:2a86])
        by smtp.gmail.com with UTF8SMTPSA id u24sm8513343pfm.156.2021.07.15.21.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 21:24:35 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	iommu@lists.linux-foundation.org,
	David Stevens <stevensd@chromium.org>
Subject: [PATCH] iommu/sun50i: fix protection flag check
Date: Fri, 16 Jul 2021 13:24:31 +0900
Message-Id: <20210716042431.3195155-1-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Stevens <stevensd@chromium.org>

Fix RW protection check when making a pte, so that it properly checks
that both R and W flags are set, instead of either R or W.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/iommu/sun50i-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 181bb1c3437c..11cf5af30956 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -271,7 +271,7 @@ static u32 sun50i_mk_pte(phys_addr_t page, int prot)
 	enum sun50i_iommu_aci aci;
 	u32 flags = 0;
 
-	if (prot & (IOMMU_READ | IOMMU_WRITE))
+	if ((prot & IOMMU_READ) && (prot & IOMMU_WRITE))
 		aci = SUN50I_IOMMU_ACI_RD_WR;
 	else if (prot & IOMMU_READ)
 		aci = SUN50I_IOMMU_ACI_RD;
-- 
2.32.0.402.g57bb445576-goog

