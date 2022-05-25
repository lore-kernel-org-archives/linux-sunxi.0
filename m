Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3F17C
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 19:08:06 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id p22so37449718lfo.10
        for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KU9+qwhHB1Ar5tyxTZPIqMZrcyxNkwuy0eiQFgt4/6o=;
        b=bAluZQ2GRhXKyS4fhjaoe9noG35MJw0O7C1jBNwDmVpe7bwhwvhHAtH9e108qV3tXp
         YoH4v/NOwfj7GpdBpOhqQmYlHY2le4VIAT2P1A/+iRelQRvtb5Z0LpVty4SNAoW5mDam
         9IS9MBHN2jiy6Dlyh6jPNrscTMUk/H0S+xbQnAfLwV908dm4VFJJBnbkgLhDEW1tYc3Q
         dohxBDXqj7xXlrlVg1a+e/aQVX9wZcE7IBcJbOdF7GycEbj55TNy1srlwtauEzQ/GWqO
         rDycNreKCKmj98UUwnS6IjdT5HBf/kIEeSlqboVWsWMDQWdKimhAdL31wi8CtKmCVSz0
         9dyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KU9+qwhHB1Ar5tyxTZPIqMZrcyxNkwuy0eiQFgt4/6o=;
        b=bz1i+8sLmD+Cf7yaV8X9SYkn1OZnUH3pcZZ5kUHfBvn69mC7m/obe7BavZfFzetARX
         Yisxlmcxc3HCRq4GFRZlX8g8xGqBCpC9X79F3k2Cv5XZ+/NsGzcUnDeTQYR76pQW3XC/
         bDBBm/FCg68yvW6eY3o4yL5NE5YY0L3C0d1tU41RAJkoRF2TqY5G3tq0oIWbMKaooHl/
         t3O43iEXawQbwrYmeEgxEklVBPt7xaPkwqn1EBAmIzXS68RCrMaZ4EgkQYf3GFzeEOhw
         iWFDjltqVR1XC6HZBy2lS3iYthwA5i5p1XgTgyJr0NHqqAEx9x+u249cFLCpcCTns7GJ
         6pOQ==
X-Gm-Message-State: AOAM533enei0CkBAAkRk6FILf56Bp3wFBHebV41O2YcILVljiv+oV65B
	M6YFiEXMz8c4VbFGJzKB8Sg=
X-Google-Smtp-Source: ABdhPJw6EjIkKOzP9HxhzTYGrvznFY1KvX5eYDo6K7ZL7L2sldypEM757VkkM+G3pOcsSphhpx9nVw==
X-Received: by 2002:a05:6512:b07:b0:473:c26a:7095 with SMTP id w7-20020a0565120b0700b00473c26a7095mr24299905lfu.603.1653505683994;
        Wed, 25 May 2022 12:08:03 -0700 (PDT)
Received: from localhost.localdomain (ppp78-37-196-203.pppoe.avangarddsl.ru. [78.37.196.203])
        by smtp.gmail.com with ESMTPSA id t26-20020ac243ba000000b0047255d211a0sm3248144lfl.207.2022.05.25.12.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 12:08:03 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: linus.walleij@linaro.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-gpio@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev,
	Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
Date: Wed, 25 May 2022 22:04:25 +0300
Message-Id: <20220525190423.410609-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Allwinner SoCs have 2 pinctrls (PIO and R_PIO).
Previous implementation used absolute pin numbering and it was incorrect
for R_PIO pinctrl.
It's necessary to take into account the base pin number.

Fixes: 90be64e27621 ("pinctrl: sunxi: implement pin_config_set")
Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index d9327d7d56ee..dd928402af99 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -544,6 +544,8 @@ static int sunxi_pconf_set(struct pinctrl_dev *pctldev, unsigned pin,
 	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	int i;
 
+	pin -= pctl->desc->pin_base;
+
 	for (i = 0; i < num_configs; i++) {
 		enum pin_config_param param;
 		unsigned long flags;
-- 
2.25.1

