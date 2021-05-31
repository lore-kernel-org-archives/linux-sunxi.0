Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6BD70
	for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 04:46:18 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id b17so12025754ede.0
        for <linux-sunxi@lists.linux.dev>; Sun, 30 May 2021 21:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=prusa3d-cz.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sz+n+z6h/C9i8J/WRfdsHfGpM50TGPrsItNGlwXy1L0=;
        b=LmP92wi5WKi+0qVT40ulpznUIqIDGJ4m9797edYzDaLvKu+6u4GcG4OMf1ICTG1geL
         Vxjf9R2J8uzxgN4NsXTsDJpc4LnytncaQgYVcibxU9N0V2y1DDZFVrrq/hFs/LaZBVCN
         bZWc3cI1VbuZZbpxE40WlgTz1+jSO9IvWSoA4aMRY+sH3N37x327l/NJa2f6WMFh2518
         5owiw+PchTO5T0rxfWI1LptyTzWWOGkIACTjg4kqHQyMWmorxyIwc4udFfPNsQOT+Cyp
         ZE0tYVQXBnHuKHrG7gDRkt93MUW7c8U/GeWwAys3thG5FEoeJ5TdgrWUXQDX8hZ5bUIH
         EHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sz+n+z6h/C9i8J/WRfdsHfGpM50TGPrsItNGlwXy1L0=;
        b=fmuAARKUdIcDGa5KvChPuQ8IOn1qrpLKsvL7Gai6IvTeurKodw4mUKvtcRT/DnNsuw
         DhRt8UFZcW2UXQAS9Q371FppAtY95PYAI5hOqEU4lbCm5/dn32HDoHmV1K8sXiP/TBp5
         ZL4vAaOgJOggSlO+yiqxEME2MSGdF8Evv5/c2epiDmlDuJ8fWrdtw53QnCYt3J2YW+lc
         LwNvbh0rPdxgs4IqkOt9JJeklyogPa1x/bBSAEy+s98RB96/o5OQa4UxnflI2OWLmTWK
         E4qCVHTT3sfqc2IIcICJikY3RASVR+nbJ6BKuSYW2wS39hd+4sOS8k+Fs2gC0X8nxUmN
         eKOg==
X-Gm-Message-State: AOAM533OgrKRrH0CMTlks5uGnt3/FvaBBi7lBZ3RJICFgNTI5Gi9Qez9
	DL1gsiC/z9CYwGqrtnTNAcqRBA==
X-Google-Smtp-Source: ABdhPJzgvk3vLxLu+lNopZjiX2qNGlPgmTIubkdp4O/wIzkbFIDKHP+EWojv/tcrirKPk9eUHUELTg==
X-Received: by 2002:aa7:c349:: with SMTP id j9mr15402010edr.48.1622436377511;
        Sun, 30 May 2021 21:46:17 -0700 (PDT)
Received: from zen.local (ip-89-103-215-157.net.upcbroadband.cz. [89.103.215.157])
        by smtp.gmail.com with ESMTPSA id h9sm6238376edt.18.2021.05.30.21.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 21:46:16 -0700 (PDT)
From: Roman Beranek <roman.beranek@prusa3d.cz>
X-Google-Original-From: Roman Beranek <roman.beranek@prusa3d.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Emil Lenngren <emil.lenngren@gmail.com>,
	Pascal Roeleven <dev@pascalroeleven.nl>,
	Lee Jones <lee.jones@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-sunxi@googlegroups.com
Subject: [PATCH 0/6] pwm: sun4i: only wait 2 cycles prior to disabling
Date: Mon, 31 May 2021 06:46:02 +0200
Message-Id: <20210531044608.1006024-1-roman.beranek@prusa3d.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As Emil Lenngren has previously shown [1], actually only 1-2 cycles of
the prescaler-divided clock are necessary to pass before the PWM turns
off, not a full period.

To avoid having the PWM re-enabled from another thread while asleep,
ctrl_lock spinlock was converted to a mutex so that it can be released
only after the clock gate has finally been turned on.

[1] https://linux-sunxi.org/PWM_Controller_Register_Guide

Roman Beranek (6):
  pwm: sun4i: enable clk prior to getting its rate
  pwm: sun4i: disable EN bit prior to the delay
  pwm: sun4i: replace spinlock with a mutex
  pwm: sun4i: simplify calculation of the delay time
  pwm: sun4i: shorten the delay to 2 cycles
  pwm: sun4i: don't delay if the PWM is already off

 drivers/pwm/pwm-sun4i.c | 56 +++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 30 deletions(-)

-- 
2.31.1

