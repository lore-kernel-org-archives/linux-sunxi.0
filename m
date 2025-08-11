Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD79913AD1C
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 10:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909792; cv=none; b=ZlA12i1nnL9eHHCfydjEX1ZKbD8IMJYksSrVelsW2AUWjJw9W1gk9Zf7Bmay7yi8A6+KBik6ndGYZ0q/RxIXTu1aYAc+xOtfWBVACPY5u2Uc/04uwq5l5X2Lja7WgJg5kV0CUouIt8iaKhkLt59wvQR9QP9VlaWmDBE3M2Ic6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909792; c=relaxed/simple;
	bh=PIea/i4Y2q/6salydRYDw/qDzf1o1hZNE4V2kDbPHLM=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=uMF0fiQuf1lWE8KvdEWn0hrzYqYPYcSvazxyDtrcgca9MpTL/x7Xn2a4JlTqVE1aYKP6mo7p2s4VJEe5opiE2BQBrbV4Mr89BYRbOYBPq8qexDG81bjbTYcq0qJbpyPeEUEq3K+hI6g/fA/gdrGwX8Vuwzfg867PlqlsnWHUUWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SwZ68FYa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SwZ68FYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cXP3JhYEHDsI5xw9s9ngejjJCnQI06FB4xWiEKgLmT8=;
	b=SwZ68FYaYJVuatpEdEyfRD7K4sF/MHegrpXtISlSQO2MEayGidQRdwzhYDvVDzrrVXmzre
	SKtWrQ23FhxdQzCQUCwWT8Fc1H3yQwFGjtYlpShsBmaIwJaIgq296Izs8tcYIvWY2Fa/OY
	1CYv6AiEqnOe7WZCVlKzuJMT/iFN65U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-Nr4AA2iyMeyJ8JY02_pgDg-1; Mon, 11 Aug 2025 06:56:25 -0400
X-MC-Unique: Nr4AA2iyMeyJ8JY02_pgDg-1
X-Mimecast-MFC-AGG-ID: Nr4AA2iyMeyJ8JY02_pgDg_1754909785
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e69c14e992so834280985a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 03:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909785; x=1755514585;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXP3JhYEHDsI5xw9s9ngejjJCnQI06FB4xWiEKgLmT8=;
        b=smsjxAnl3XF+zL4GbOYflgvX84iqt8UGpnW4T3eg/qc7uY6BwsKYLHr/aK6pFgbYsA
         jzUUqRjfLCHAxRr1rH1AthfkCmFs8Sth1WmJPtPuhoNBClcU/ujCUphEGFpwKCsaaeaI
         /q3lU6fnEJ9gsTM/YUshMYdCroO404fjw4c3omMREYENpj+WgODA9DEZIktqMYRmZyHA
         0RRASV23XONLpVr5AqkPKVV6jIn1Npd5Zb2vRDQnnbOu5pqqN/NGSoiefoT5apXeTbNO
         KDTkjMirKDKmJ2yq2WGG0xaOPxdCrkkX03lNWP7NcCZvwRVARDfuC26v862pId8Nalu5
         VGDw==
X-Forwarded-Encrypted: i=1; AJvYcCUDluWG4cdpLCvymTxVqG2gpDTRPWVNcAV5eXkRYZ0kM/4CLGZRbXrCG2siXi5huk6jVE+R9GjAz5h6rg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuUuF7Rcep8m+UhfWKYtzGvzgf7QQqrQiO8tVsRpZq5m97Zeb4
	wryx5gRX9VNwI9g5abYOjcMz+J8bYP5R5H9VjHtfJrPx5zV0pBrJrAYYQpnL0sUfEw4zuL5gT+T
	iIbtk+qE6Wez8Tc3vzGtaEFlFbLJWQOMCZ5ld4tPjAVVMQzCMxh21OHwpJwm6biZD
X-Gm-Gg: ASbGncuFSh54iwbRDjHpqBwUh0TkNLXj/RqzOObGQTkW45EH831MgfcGOicZd5E5MO1
	fPB2ZTuBCG4pFgCQ3hayY0MiHLFJHJcFDL5Z6Yj7LJx41W5FgG9K1ahsvU/NA4yTfJ2/2c4fFFp
	F/yj8WqDd5EWT0Y1QVmvNa8JSnvf3+bQCPQ1AdyTmP04FcC/B006d/nHzw47ACpi/UQb73duNto
	Ov6nUyTX/TEt7r/uUyXFKtj1wGiqypk1ME345URAn8pPQvhCI9msGshKu5zBFFkn03/zhInOfnA
	dj+QxouitrV3kxS5iq4D19/HoAYl7/pBcW1lcNTsYkYhy7gPXwWrcz+TK1uRxpdBoNOnV2WiEqF
	lEFw=
X-Received: by 2002:a05:620a:19a7:b0:7e6:8580:67f9 with SMTP id af79cd13be357-7e82c7268b7mr1766287885a.39.1754909785095;
        Mon, 11 Aug 2025 03:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR8+CCi/SOVhR+SKRFj6lKvJMHxUZZffNiDttlUcNIvFehaFMGmyLzcvBT31Mi5D8YTjxp6w==
X-Received: by 2002:a05:620a:19a7:b0:7e6:8580:67f9 with SMTP id af79cd13be357-7e82c7268b7mr1766283185a.39.1754909784503;
        Mon, 11 Aug 2025 03:56:24 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Date: Mon, 11 Aug 2025 06:56:04 -0400
Message-Id: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEXMmWgC/x2M0QpAQBAAf0X7bOucJH5FHs7dYsPRHlK6f3d5n
 KaZFwIJU4A2e0Ho5sC7T6DzDOxs/ETILjFopStVFwqdbGjXBWW/vEMxJ+GQVNNYZUtTQwoPoZG
 ff9r1MX5z1hFLZAAAAA==
X-Change-ID: 20250710-drm-clk-round-rate-b25099c0c3a7
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=5717;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=PIea/i4Y2q/6salydRYDw/qDzf1o1hZNE4V2kDbPHLM=;
 b=Fjs6oyZBop8brn89Wis9Wmv9d/YiKRi2CsQG8Y9p4VeZHPd25iPf4ZojTiOdduqVItv0hvHzz
 qP6WUnq2F02AwCFtKnsda9khMDCy+eoFbTEarTYyadGpvit3bjTpK8f
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NghFNOaHO0nGYz7ZozHVk0DbVXHuV_JfboCpELtfTMM_1754909785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the drm subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Changes since v1:
- Drop space after the cast (Maxime)
- Added various Acked-by and Reviewed-by tags

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (9):
      drm/imx/ipuv3/imx-tve: convert from round_rate() to determine_rate()
      drm/mcde/mcde_clk_div: convert from round_rate() to determine_rate()
      drm/msm/disp/mdp4/mdp4_lvds_pll: convert from round_rate() to determine_rate()
      drm/msm/hdmi_pll_8960: convert from round_rate() to determine_rate()
      drm/pl111: convert from round_rate() to determine_rate()
      drm/stm/dw_mipi_dsi-stm: convert from round_rate() to determine_rate()
      drm/stm/lvds: convert from round_rate() to determine_rate()
      drm/sun4i/sun4i_hdmi_ddc_clk: convert from round_rate() to determine_rate()
      drm/sun4i/sun4i_tcon_dclk: convert from round_rate() to determine_rate()

 drivers/gpu/drm/imx/ipuv3/imx-tve.c           | 17 ++++++++++-------
 drivers/gpu/drm/mcde/mcde_clk_div.c           | 13 ++++++++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c      | 12 +++++++-----
 drivers/gpu/drm/pl111/pl111_display.c         | 13 ++++++++-----
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         | 14 ++++++++------
 drivers/gpu/drm/stm/lvds.c                    | 12 +++++++-----
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c    | 12 +++++++-----
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c       | 18 ++++++++++--------
 9 files changed, 73 insertions(+), 51 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250710-drm-clk-round-rate-b25099c0c3a7

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

