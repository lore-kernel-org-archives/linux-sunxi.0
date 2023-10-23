Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6DE3D8F
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqSZxwMo"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c50ec238aeso47169451fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 06:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698068103; x=1698672903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wx0BrSEgwwqDaJo2A/cSmzYDiAma8W23poMJduSA6Ow=;
        b=nqSZxwMomhY5JrQCyg9gV7enDTt92NT3TIMEDtyW7uXZuJySuwdsWl2o4sXLGTXSA1
         YdcXdl56R/Dfo64xKKP3FOfBmedZDUmMdHULwkiIMLmf8HH9+ToMIKbImd7zJvOXn6Lr
         v9Fl5S8mHphdV1oItH0hmog4aoB+hLM83nf+sdV0oUPyVywFY9l49ierA2n7nBjD5Fud
         KGRKtLbCLPDsur0QmFAOhqGL5XyA2eFcAieyt6Xuq3Nm8byCf/ZuMcdPYMgv8GDnaCC6
         uokCKfObKT2tWKH/q0WnWsR170yy3LAbDsufFYAzDHIaZWte06iA+aPInvJsjhBG2FXZ
         bQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698068103; x=1698672903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wx0BrSEgwwqDaJo2A/cSmzYDiAma8W23poMJduSA6Ow=;
        b=ItV5dKX/bCR7hO5E0kiGt2eJ5yQv+aXCGd3AV2QEG0mNJxn9ndZjdwkfWgO+LpaEG3
         bFwfRf5DoA+6xiBWZ+GIOjR0HAC7NpDIKpBMR0lZ574mNsxBWLNRkkSegAr2a1lTl4Lf
         pa15h1LUQ+F6HhBQhps34ZSAgEQFaxSbE21d9IztUalCy+T7ZwgdV4RIcKQESE+5y0rh
         R3cjsh8vrbYHA4iwuqB/rjC3iog5/wQHtGofHL2D43/4J95s/StLdj5jIKYRXQhVXK7N
         POlvq+stvWBuEJrcAqofamiS7T9mUge3H82LQC9xJbCC0iW092HQADlzVidZ6ctqNRdW
         z1DA==
X-Gm-Message-State: AOJu0YxeH//Sl6LLzPLsbmgZKSuW288lAol3zddQr4jW1AJMmpTAh0Ic
	AUd+vAQVFUvqLgCxdgwZVP0=
X-Google-Smtp-Source: AGHT+IF6iFCOYLHVJ673/GenbGT2JYzGsYEv1qorObhiXC5W33ZMltiL1xwut1ShRpGUTtslY+tkdw==
X-Received: by 2002:a2e:9f50:0:b0:2bc:f39b:d1a8 with SMTP id v16-20020a2e9f50000000b002bcf39bd1a8mr5834000ljk.46.1698068103373;
        Mon, 23 Oct 2023 06:35:03 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id m29-20020a05600c3b1d00b003fe61c33df5sm14469380wms.3.2023.10.23.06.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 06:35:02 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org
Subject: [PATCH][next] clk: sunxi-ng: nkm: remove redundant initialization of tmp_parent
Date: Mon, 23 Oct 2023 14:35:02 +0100
Message-Id: <20231023133502.666559-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable tmp_parent is being ininitialized with a value that is never
read, the initialization is redundant and can be removed. Move the
initialization and move the variable to the inner loop scope.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/clk/sunxi-ng/ccu_nkm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index eed64547ad42..853f84398e2b 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -21,17 +21,16 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
 						       unsigned long *parent, unsigned long rate,
 						       struct _ccu_nkm *nkm)
 {
-	unsigned long best_rate = 0, best_parent_rate = *parent, tmp_parent = *parent;
+	unsigned long best_rate = 0, best_parent_rate = *parent;
 	unsigned long best_n = 0, best_k = 0, best_m = 0;
 	unsigned long _n, _k, _m;
 
 	for (_k = nkm->min_k; _k <= nkm->max_k; _k++) {
 		for (_n = nkm->min_n; _n <= nkm->max_n; _n++) {
 			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
-				unsigned long tmp_rate;
+				unsigned long tmp_rate, tmp_parent;
 
 				tmp_parent = clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
-
 				tmp_rate = tmp_parent * _n * _k / _m;
 
 				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
-- 
2.39.2

