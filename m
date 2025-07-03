Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D82D46C3
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 23:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584986; cv=none; b=bk4p/KWrFHbpOHBFD5DIBGMr5HbjfN9Um2OrJujJI7GZpSLsKnE5mfI91dWhb8mh8IR+OUgJB/a/DdrBCDpTt6Am3sjgLS+AeWYfJEHRM/e18JZd4WMFFLriVdyijkqEVQ9hJZD0nh89lD7fExEHdu8gixoFwX7X6Vx0bnoAU8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584986; c=relaxed/simple;
	bh=ZubPxnRGAAyn5xIgslZ+93JU0NMJn/KqRavgAH8p3gg=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=Sf/FkuN2Kklwn/bj/3f034tjdfEY/Qdo+ATMdsf4tmn1DQIJaYkiZU8KZPsS6fT+RyFIAgxu4x4oJ7FYWeBYJtO79OH5/BGLoWiqykwH1WLeoMDaP1VLx1hZd+6AT4jQlvcMz7iQM3wfGOpUdH41aiePqgN/xVvKPKbpDWnWNhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XazuXfpN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XazuXfpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Q6wqAkPgpNZPhvYMhgg8DTrDL7IGLoO4HjSh2P42no=;
	b=XazuXfpNX5FLzxlBnVYkpAdE4cCRKOfM79kpRFpMHzatr/4GFwxXzjz/6HGosIrXGw3UmN
	RzA0q7lEP8WnCWlp/t76p5XWYUqI7C5AxAWE7f83s8VTEkkhYFbCysrPbZOtC4UuzCFT3m
	aI1glmfl+8X9t5Eeo51qYgZaq9pUjYM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-HfpszqjxMsmcdzVTPU4B5w-1; Thu, 03 Jul 2025 19:23:00 -0400
X-MC-Unique: HfpszqjxMsmcdzVTPU4B5w-1
X-Mimecast-MFC-AGG-ID: HfpszqjxMsmcdzVTPU4B5w_1751584980
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so94896085a.2
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 16:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584980; x=1752189780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Q6wqAkPgpNZPhvYMhgg8DTrDL7IGLoO4HjSh2P42no=;
        b=nMuPtcUkv7YILricRxNy1hzzY17SeFRmuHyLJ3tmrgSFotOw7dYlLc5/eMmUZZIlPC
         JyT25Wblu4eZtPj8rbf/IuzL8aULUsZtPGoOrCd9Qr2XVyxo+yhMOZ5C9goSoj60umPR
         P2WBep5TvV72Iw2WqNBFhyKbzyEeJctsdMq4T1tSHUNGIDW/cwxKR8fwli+UxFFuFgrK
         D+2MCBdbb5/Q6j/M39rmN/kAAtbdCo2f5xWMJsXb2GIFu+uo7BZOng0HYpxPV9Vf3isE
         9wfl65TB9TO+p2NjLbdLpHH64gyD/MpidbKkOqHi9kSBeiwqjhBXsCDphSP1OcGJYR9z
         QZog==
X-Forwarded-Encrypted: i=1; AJvYcCU0v48JaNLvN33MKXrTNszB7p8pq1WeSOrIgQA2QPOIPqf/TJrgu96UB8rAZYf6/3yMa1/hy2IWfaFnog==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWgF/wwyDsonFy2k8SS/6wexxPyJVXVwkXl++n/0K8Ak+IG9dC
	5f1Wo3bQcXmJ98mWjTrgINNao2a2qXS+Lj0AUqGEdFfAwfokbCRiArkSJYfiN7cVvUQCtTKAEBn
	+IS6BdjHeEbpaDH8M5sfrQ06Mxz48Rx8/V1+n6p5y2h22h0lvm+zvnFbOC0+q3iyO
X-Gm-Gg: ASbGncswls2C4gGoX1ADDiVYXcCaS3rXobXmhQfa3l3j6hUmkeLvBrfCOinnl5VY5WE
	CnLhoGfBSuXqYf0nkZuBx++y1bBfxFFQBYyGlisCBQhJq6EYVJ2G/tzKDPCn9P40s+9xgbEd3+M
	2ERngqaD4vGBsExdHtpFQEPXP8JObMTjRkhIPY8nHQsuJ942pr7ep5QwLphjqFN/YzpcwoQ4kjm
	PIgLQCZAEYtgBYdfOLUV7iJBOfxhwvpMEoB3wtJqsvmjZ6V1ZFj0Mp24iMxqvXK/gXB3eqF/20j
	K8R8pKHFkLGhOF6nxNk1J/63ujlVeiPWJe+/u/aqdXGYvpqCoYl6FGuPSF6z4Q==
X-Received: by 2002:a05:620a:2b8c:b0:7c3:c9f4:522 with SMTP id af79cd13be357-7d5ddae44aamr46063885a.14.1751584979984;
        Thu, 03 Jul 2025 16:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR/q2miTvF6gvmsI+7e+iNrCdk0wyNBmWfZUXnHvqUMWXThHnR6m2VVtbns1V7BCNpZ6c+dw==
X-Received: by 2002:a05:620a:2b8c:b0:7c3:c9f4:522 with SMTP id af79cd13be357-7d5ddae44aamr46061285a.14.1751584979556;
        Thu, 03 Jul 2025 16:22:59 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:22:58 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/10] clk: convert drivers from deprecated round_rate() to
 determine_rate()
Date: Thu, 03 Jul 2025 19:22:24 -0400
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALAQZ2gC/x3MTQqDMBBA4auEWXcgjW36cxVxkU6mOrQkYVKlI
 N7d4PJbvLdCZRWu8DQrKC9SJaeG88kATSGNjBKbwVl3tTfbIX0/SJlIMGouqHlOETX8GL2j++P
 l4oU8QeuL8lv+x7sftm0HyJxRZmsAAAA=
X-Change-ID: 20250703-clk-cocci-drop-round-rate-62c89b2d4c6c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=6416;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ZubPxnRGAAyn5xIgslZ+93JU0NMJn/KqRavgAH8p3gg=;
 b=mVjR/1H4Pz8wUXIcqPHs6qoh9Y8tkWR2r6b9NT4k8OscHyiN1L5QE90supKbCmLvSF0f9XJLM
 mlpzbNU+eChA7PKTZOxbNDDQ0IfYgj8n+RZ6NCz8QDVxmVCRk4UvRYI
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c7jypHDMNXzu3zsKR9B1gdYsRPp38yd3M2kZQWfm1Ac_1751584980
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() ops, so let's go ahead and convert some of the
outstanding bcm, qcom, and sunxi drivers that have a round_rate()
implementation over to determine_rate() using the Coccinelle semantic
patch posted below.

This Coccinelle semantic patch is able to automatically convert ~95% of
the clk drivers, and I can clean up the remaining ones by hand. I'll
initially post some small changes to get feedback about the approach,
and I can post some larger series by submaintainer once we get
agreement that the approach looks good.

I boot tested this on a Raspberry Pi 4 using Fedora 42, and validated
that the mmc driver still works since it uses the bcm2835 clk driver.
The other drivers were only compile tested.

There are some other cleanups improvements that can be done to some of
these drivers, however given the volume of changes, I'm only focusing
on the migration of the existing code, and making changes in a
deterministic way.

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
Brian Masney (10):
      clk: bcm: bcm2835: convert from round_rate() to determine_rate()
      clk: qcom: gcc-ipq4019: convert from round_rate() to determine_rate()
      clk: qcom: rpm: convert from round_rate() to determine_rate()
      clk: qcom: rpmh: convert from round_rate() to determine_rate()
      clk: qcom: smd-rpm: convert from round_rate() to determine_rate()
      clk: qcom: spmi-pmic-div: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_gate: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nk: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nkmp: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nm: convert from round_rate() to determine_rate()

 drivers/clk/bcm/clk-bcm2835.c        | 17 +++++++++-----
 drivers/clk/qcom/clk-rpm.c           | 10 ++++-----
 drivers/clk/qcom/clk-rpmh.c          |  8 +++----
 drivers/clk/qcom/clk-smd-rpm.c       |  8 +++----
 drivers/clk/qcom/clk-spmi-pmic-div.c | 12 +++++-----
 drivers/clk/qcom/gcc-ipq4019.c       | 14 +++++++-----
 drivers/clk/sunxi-ng/ccu_gate.c      | 14 +++++++-----
 drivers/clk/sunxi-ng/ccu_nk.c        | 14 ++++++------
 drivers/clk/sunxi-ng/ccu_nkmp.c      | 23 ++++++++++---------
 drivers/clk/sunxi-ng/ccu_nm.c        | 43 ++++++++++++++++++------------------
 10 files changed, 88 insertions(+), 75 deletions(-)
---
base-commit: 17bbde2e1716e2ee4b997d476b48ae85c5a47671
change-id: 20250703-clk-cocci-drop-round-rate-62c89b2d4c6c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

