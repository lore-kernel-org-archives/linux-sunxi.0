Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A049A3204
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 20:19:41 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id x18so20927448wrc.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 13:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gHQq/HbsAlHHV5dqqwIj84YLck22Yu9PAMCyZC7DDlg=;
        b=LhY6QwHdTM8sO/y2wOJB+t3eHiBsNzak+h83Hp4m1J1hvq8ai83m8COBHL6j7pk4++
         lUxqqs0i53dp7mv9Lwl9FGd6WdMFi+W2ao0Arx56y6kr8ZwBcqYVwkFvIZ1JM3zrVPx9
         NXgwPejXSwFqFXpyvn38xsn0QiDAYpQkc8+O/3q8Sf+Vg4LOzjQyppokaset9TCI9WXy
         99PTZiBAsrye6OPHbuW28pUBewwxLmxHAfdnIMUUWNiZOJPHoBD+9zdtMpPBy1wpge9D
         clJEPuF8TPSHJePDPmKXWasUEVE8i5rTDXSXSJeNTy3HG+tz3IgDe8BeZOaEf58D6AWm
         5BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gHQq/HbsAlHHV5dqqwIj84YLck22Yu9PAMCyZC7DDlg=;
        b=qBuZ1P+zcwKEacqTSUdy5FIB91UCfin6t0MBv7gD8K54B6W4jL8ubqrSAZaUpcl/8E
         C+Cmbkk/cSTgxMDISa4wca7Fn/9ha3eNay5AKSVzRcw9wdbjkIKr6WpS4Hty0ToyEQAy
         jIa0HpO+AZ39G8w+aRg48Apfi90A8awk7hf7TUQbvGpGxuQjOKFkr2Ig/SvDanzS+Ooa
         SENdN4kRcPsvUhDK6cxm9+rgqJ1hQTmBbMG8lIUIfiAmC70pPTmtcn4Omr070sF3UKit
         SGNvIsLvOy6aY5DpvP4sBKfcNU+HVordw6It+E4LzBmBuNWdqUP6yRj4tDEmmEPsA7Xm
         pJPQ==
X-Gm-Message-State: AOAM5326/AAz3P8JHvtlz8EezYa8Dilx8wnMIz5Kl5QuPuy4favjVDg8
	EZzfwvJenP94gvH4IlLkFufYgg==
X-Google-Smtp-Source: ABdhPJyE44hLvQer5Bbx+kYLVwMvd9SshPAUhOsXy+EXdn+wzgYlCJsdPJrr9y/rc/y9ZXR2/xn2ow==
X-Received: by 2002:adf:d1c9:0:b0:203:c4f8:dd17 with SMTP id b9-20020adfd1c9000000b00203c4f8dd17mr10464782wrd.633.1651522779746;
        Mon, 02 May 2022 13:19:39 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l2-20020adfb102000000b0020c547f75easm7238183wra.101.2022.05.02.13.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:19:39 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 00/19] crypto: allwinner: lots of fixes
Date: Mon,  2 May 2022 20:19:10 +0000
Message-Id: <20220502201929.843194-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello

This series is all fixes which I found on allwinner crypto drivers.

Regards

Change since v1:
- fixed endianess of hash_pad() paramaters

Corentin Labbe (19):
  crypto: sun8i-ce: Fix minor style issue
  crypto: sun8i-ce: do not allocate memory when handling requests
  crypto: sun4i-ss: do not allocate backup IV on requests
  crypto: sun8i-ss: rework handling of IV
  crypto: sun8i-ss: handle zero sized sg
  crypto: sun8i-ss: remove redundant test
  crypto: sun8i-ss: test error before assigning
  crypto: sun8i-ss: use sg_nents_for_len
  crypto: sun8i-ss: do not allocate memory when handling hash requests
  crypto: sun8i-ss: do not zeroize all pad
  crypto: sun8i-ss: handle requests if last block is not modulo 64
  crypto: sun8i-ss: rework debugging
  crypto: sun8i-ss: Add function for handling hash padding
  crypto: sun8i-ss: add hmac(sha1)
  crypto: sun8i-ss: do not fallback if cryptlen is less than sg length
  crypto: sun8i-ce: Add function for handling hash padding
  crypto: sun8i-ce: use sg_nents_for_len
  crypto: sun8i-ce: rework debugging
  crypto: sun8i-ce: do not fallback if cryptlen is less than sg length

 .../allwinner/sun4i-ss/sun4i-ss-cipher.c      |  22 +-
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h  |   1 +
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 102 +++--
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  54 ++-
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 130 ++++--
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  19 +-
 .../allwinner/sun8i-ss/sun8i-ss-cipher.c      | 180 +++++---
 .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |  92 ++++-
 .../crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 385 +++++++++++++++---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h  |  33 +-
 10 files changed, 767 insertions(+), 251 deletions(-)

-- 
2.35.1

