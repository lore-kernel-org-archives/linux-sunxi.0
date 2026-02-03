Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ACA13AA2D
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Feb 2026 01:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770082165; cv=none; b=WmOeoVA8fxI9TpnANNSL/aXpHMBbGLylLNYB35X2vkiWEgA9pxEVzDlkxBdwSMBECnOUOyiQ+LqOaU9OZ18VMZMDk2fds98GqnXZ7DjKromrft/+ZPaSQYJrtr+4EQ1tdHxGwyZRaPNbRc53BIdPpe3Cdiw5SLlHtJgGbTkuS5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770082165; c=relaxed/simple;
	bh=5f0pmKSbuYq4+R2uv8aRJUa2DN+xVdYiUgKFgEGnexE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=huIHstu0kC5IkOKHCJS93KgKCwQpXQ5drohQ/vOcffvKDaT6z/GrCdFsXManlsS6a6to7YlC7tEY5JbaR19D3pY174gNWi/aYCddD1TW1jvm5MzQq0z3H2W4vxiKs2JxKSUpUD1A7mN9spzgww0iSETFOzBEGJsnL1d4PwN0GUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlieWMUo; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlieWMUo"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40423dbe98bso2274933fac.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Feb 2026 17:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770082163; x=1770686963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MU9WtLF/ByLYtXf/cYEty1QiYJUO6ah1iez++VXQykc=;
        b=WlieWMUovRVK7p4Ue64e0n8fzFpRD2EsDVEOEuXeTpGDxM0l7/AMSQ621Y/9O97X5c
         tvfupko0gLBWBQoVfNpq8+H30CFWu7qjhPb37/FAAUQxRK3b6oR3DOiy3RlXRzHfWlCX
         o/IYwtyibF+OOmUKLNqgtJlD92yGvb8BlG3NgJgElpycftu8bD8/rUGaOS2XHS2A0JJ6
         ufSFjLQuTDWnJmdojvb28tC1rnKDsJN9EPRSzdUPskm8mp7YzkKL5fggkd3WQ69pjgv0
         DwoJQ6iy293TrRrKdIWBSoS2JnJcLUtHskm87MRNMEbB8Tgyr2xqr7pkyszK1Uvd6NcY
         4YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770082163; x=1770686963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MU9WtLF/ByLYtXf/cYEty1QiYJUO6ah1iez++VXQykc=;
        b=rNKnmgKCKdWQ7Fndvo4oCUWrejdKmU1VFyKV2M078VSFU6MRby0GnXCbdOOP3adUbO
         2wZbX2gQMzZhV0L6PISGrLMPEi+Ndg+IKkP18E1d7cnw2Z4jAAOa0eyzVslYC0Wrbl1l
         QYojVikilRaCWFD7CcEwmmGJirSZBIwomMzCF8kfsAt+J3Cvhc9NGPNNz4DAPZdN+wse
         /fPYF+3a1B36TbbbfTB/3OZgpGDRV413W0yhGSyjuqmTG5cS5i+QtUTR4Obf37NpLWFO
         jdNPskEWQ6MQMSEU5966q7bIO3SfpOFD32YOMsIH7Vcq3o4Ff6Od9QEQEhBjKOQNIVBf
         xodg==
X-Gm-Message-State: AOJu0YwbU+uHHkJZvcZxCtL1Ow/MmnjqZeBGsk9ltG1Wni0Tcd9Kq0Lo
	oNSx8iS4CKRzOtb5Ft66/BHirfUOs5bRAuuNuTFzBMJX75uIKxdsWyJ8
X-Gm-Gg: AZuq6aJuz2VLGKCdJbqtnCjcCgJSm2XkvSj/pfyqsQwELcKWQU29+owaZoGu6yI2/zf
	tkaLPbOnXJq1191jJqTrVC3iloPtuKphArev07y60CWY2hC4CVbv7FcWIP1ZA0PrIxH6/6XrHjD
	vozIudM79wQ4JuaR+/B3authQSFvuZOWIkiyFVhV3dcc49I+svind7nctQf0VNsoPoJE8cHEEsL
	NgcH4kckjBotoZickF3iD/OjvZgHaFSRVRBEfELplt0YRIWeuU1bUwSFbQhwn0RwlGszdyDyIeO
	wL9oc2arkJBTrni5CsBG34DvEq3Ielw99oORYCltAm/0zrLZjWyRO62GUtWvDZcBHovq5FNbzcm
	AMpKEJADyt4wEej9Ezgm2JWezeX8X2xgCHp9bYx6ZDprCNBW60ANsy3KF7RgKPwD1rkomuyFwtH
	fMj8Ymf8Cm4C4k1FXO0xiK3BX3Ibeb5d1MF4Y4GhBeG/p3Fxb17cSRjJHS47xOR5HRxoM0hdyuF
	TbEKPDyihro3jpMIBaYZH7tV+CzWqQdlCLN4RecFbIgZz8Eb8M7dA==
X-Received: by 2002:a05:6871:ac0f:b0:3fa:47e:4de4 with SMTP id 586e51a60fabf-409a6baeaf3mr6074422fac.24.1770082163197;
        Mon, 02 Feb 2026 17:29:23 -0800 (PST)
Received: from james-x399.localdomain (97-118-146-242.hlrn.qwest.net. [97.118.146.242])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-409571ae8f5sm12188539fac.9.2026.02.02.17.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 17:29:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: u-boot@lists.denx.de
Cc: linux-sunxi@lists.linux.dev,
	James Hilliard <james.hilliard1@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH 1/1] tools: imagetool: Disable TOC0 anti-rollback protection
Date: Mon,  2 Feb 2026 18:28:18 -0700
Message-ID: <20260203012819.3406450-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner devices which support TOC0 have anti-rollback protection
efuses that are sometimes blown to prevent downgrading firmware.

Since we don't currently support configuring an anti-rollback version
lets just set the max version in the TOC0 certificate so that the
sbrom will never reject our image due to the anti-rollback protections
having been used by BSP based firmware.

Note that while there are 32 efuse bits the SBROM will reject any
antirollback version above 31, as such setting 31 should ensure
maxiumum hardware compatibility.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 tools/sunxi_toc0.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/sunxi_toc0.c b/tools/sunxi_toc0.c
index 76693647a09..35bd43680d4 100644
--- a/tools/sunxi_toc0.c
+++ b/tools/sunxi_toc0.c
@@ -127,6 +127,11 @@ struct __packed toc0_cert_item {
 				struct __packed toc0_extension {
 					toc0_small_int tag_digest;
 					uint8_t digest[32];
+					toc0_small_seq tag_nvc_seq;
+					struct __packed toc0_nvc_seq {
+						int oid;
+						int nvc;
+					} nvc_seq;
 				} extension;
 			} explicit3;
 		} mainSequence;
@@ -174,6 +179,11 @@ static const struct toc0_cert_item cert_item_template = {
 				{
 					TOC0_SMALL_INT(sizeof_field(struct toc0_extension, digest)),
 					{},
+					TOC0_SMALL_SEQ(sizeof(struct toc0_nvc_seq)),
+					{
+						1,
+						31,
+					},
 				},
 			},
 		},
-- 
2.43.0

