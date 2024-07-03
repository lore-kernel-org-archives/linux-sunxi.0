Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63645174ED7
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000244; cv=none; b=KpNXQZRSftK0uWXelVI3fv5d/IJkaPFdW1v38rK0jE6C/9/1MW/FQkuePxzv5AHT5UFsZC4VjF6vUtmYaTP21LYNwJj4ZFWOTkq3bRMwL1D96QAbGvVvf6rOk87TQYtXiZG/mAXoCBkuQpRx0eMYElCyfaqn6f2ASNv/OC+Ne1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000244; c=relaxed/simple;
	bh=0Ld8vX9WBeucJVIFv2KTKTHdTYHtYqJmnFDn01dCNek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E0d2qA7PQWyZAiW8LuFMWpE+1OiQVjMjdcKkBmwpGc+gSZynICVFOAu6mNMGcOtC/I6TpBsQvBkeiHGq3eEgCuNYzy1z50WTirdSZpMJYRE+Hg7DT1tjUoytG0dDOjVIYi0mG/KPNiSRtGATR8vPRz9jR4T/qsqW4N0OsYGVbDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvoaDa46; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvoaDa46"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a72477a60fbso625352066b.2
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000242; x=1720605042; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/FFHHxRXCiHESWSSzIR+30DbRf3GOBGMceZW/6eQho=;
        b=RvoaDa460cCQAyVgz7Q9Epn1zhDJo+EUdBcejfRvYi7GW2AV4954QMJJNtYcOvbVcM
         +TyCwrynI2Zq1uem9FgjVHNS7/3LaCEVBBlHNkKgitpalFo3c+Ji2rtFCGAw+0f/ZP8O
         z51LNul9Hn1LZjq+qyLjGpZ96i3ykleYSkNlffP7oRbWpwwnoqEIkKMpxPZhPBjTL9XO
         krF8ivNV3obkneXv73EwWzdl2tT5MkWMktDyfCRU0TywvKdURfFoHe8154Oa7dJnnEEu
         Fc9MeCXZtmE0+yAlNSzlbSqsf3KM4SdYnjdP8FC6h0t2KZQAnZeTw7Lbi5YA4K4G3jW0
         lgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000242; x=1720605042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/FFHHxRXCiHESWSSzIR+30DbRf3GOBGMceZW/6eQho=;
        b=juQm6b2u960n5qyie4YhZp1M0NcrkunmRb/lGNA2Zp2m1PmTDqN6JSpVbsplkKuqlA
         n2J8AfR+ipEuYGvkRHFz+xG+FI0qofHeQfERHlsfGP0+ZuIQ8k4uiGUo+7U9FSFKmHuX
         r2Zb0i/EaE+XWAqINT25JnyJzGbnn9X1Hhuy8WfY4/bFfqmDaRmAIVmis2Am13chdrKf
         CDBx61PXcaUfaDTzXrFsnzEMM1MAn5pIhJ/XGJQApgSDGcTyKsbjtyFmE97ublMTLi9O
         Ivj91KaBYd5ubEoAIUTt9GvAGC8TnX31SPPT0+TwX3iM9wsLnXQU2AILnYWo5g+5t9sA
         x74Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrvp2GbfS43tn/k6aldZl7zdB8m/UBDtfa2/mjBpeRjT64ox5xSx+mx/nU98xZBo+5Acb2ZzFByzWWEffRutKnf1X5AX0uvV5wl5s=
X-Gm-Message-State: AOJu0YylR2LXw46hKXB9P3LEm0M0i0A+DiQHLL1H2+BPPAhxEAC95qsa
	+XzvW2cdUMT7t2gUVDUwJAaDpPQ5MAVj4Fv8GeL/Hgr4gfJUHito
X-Google-Smtp-Source: AGHT+IFvEQQ1or7Te92RZ7ee6rZM9e+5Mnmbmp6JAtgn1kSIV+we403CXkNT3daH3fdDLTkrC72WiA==
X-Received: by 2002:a17:906:f847:b0:a75:1096:bbb4 with SMTP id a640c23a62f3a-a75144b9bb8mr700286266b.69.1720000241798;
        Wed, 03 Jul 2024 02:50:41 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:40 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:23 +0200
Subject: [PATCH 10/10] clk: xilinx: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-10-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=760;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=0Ld8vX9WBeucJVIFv2KTKTHdTYHtYqJmnFDn01dCNek=;
 b=qbAZlsyWzomXPwtnqnjjR10PqlzCLG5uVxcNmtMDRmfWhY+nLBfhZqS5clqsqtfVrERC45aqH
 MoIjvu7D0tkCoOqeHOgE9Tak9NQ52dqqmYQ7r9zdNOTlkalNvb0TusC
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`vcu_settings_regmap_config` is not modified and can be declared as
const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/xilinx/xlnx_vcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index 60a3ed7c7263..d983fab12756 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -68,7 +68,7 @@ struct xvcu_device {
 	struct clk_hw_onecell_data *clk_data;
 };
 
-static struct regmap_config vcu_settings_regmap_config = {
+static const struct regmap_config vcu_settings_regmap_config = {
 	.name = "regmap",
 	.reg_bits = 32,
 	.val_bits = 32,

-- 
2.40.1

