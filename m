Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803BD3B8105
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 03:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047211; cv=none; b=V0Ivi0Ce7ZQn0whnbB5R4Y/m7TDdtRNa3OvnF4/H3vXiiD5cq4kDey07VN+y2aDsIyoDOYnQ6bQ/XUC9mUqJRZWwgvhEZ8MUJN58hGHSKh6gBpeHv4YvfRNQWHMRilYqh6jpjGUPHoXyVeeP0ese3ppFugnvFiQSgMtkGTKjRs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047211; c=relaxed/simple;
	bh=eAoZWdyBQ0gvYpfyVz0P1IC+IR+fZJNTzfQ1SyhSuw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u55NBlWMDBH3euOmcr+GeYSSQT+YyIOqrRqgDR1RBPJISsI2kcF8K/yAR3gvqywbIj1jm1lAoNcj5zFj7O80Nmlu4mI2f+Nw+rwW93RwCVBtHZe2qo7NzUdmo/SkPPY8R/Cj1Fe08AHq1CBJuq4UuAuyi9rFMKnWDy7N6qNHV9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaL39POo; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaL39POo"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2dd68a16955so5910925ad.0
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047210; x=1790652010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJoHTp8J0uzmIlfrfln9mMPGZu9ifn6RaYx8B2B0mpM=;
        b=TaL39POol+DFj1HdS8GshitOdg61r3CN4JfgqSzLP2h8oVgDbCj9CexNXPXJBTYR09
         MZjT7CL3jVm6MIYaFT8chzIEZjaiccdK9iCmwF5Bw6Tc+i/Yn7mn04h/Kt9CqfOwYjJC
         Eui8Uil20nEW0LIthdiX2QXx2iGNB0pRiA6USZjDtUuwJeDQi215PNgtUwWIEpr74+UF
         40VHKqoIZhxdHKfHwaxL29U/tDfOcUhDdkSG0wXIp3QCh8Sg7V6o+ghQifKTipwRuLDD
         ORzT1dT4z+oq1YNr/xfqu/jeKeN0AWmtMeQ9yd24e4B9o+iK3iluQ2OLtDS2W8PnsTlB
         CDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047210; x=1790652010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJoHTp8J0uzmIlfrfln9mMPGZu9ifn6RaYx8B2B0mpM=;
        b=lSyZ6VIQ/6DVeZfiRz7Gu2v5NCxM/QtB/cU7e39kPXkWQ1Bey6u8qsKQyrPqWpo4fo
         RgV8VDtrdO51UAXzfixIS/g0Fn6lKMnZx12rlNORE4sz3sshrGkzlBYI0fMgX1zcHvKd
         E9InLpSBQml4soPe/XlIsrJQv61QX/YKCr3sgtxgL199uu0KCm/2LJkGUcD3bxabHs7Z
         UlTp62RgkKwrkuXgH3aga7oLQmT/Bs4bZMPbkoBTGvC9bMHwTvoQJjO1G4FVjtYGiyHu
         /GGgGSnldHUQkVPrbyX6xvEBeUnIfyBBkD/wucXteUPzC8KD5VbbF+tLfFDcDiEtAMEi
         VTZw==
X-Gm-Message-State: AFuF++lPiXdaDPOnTvwAU3rAPY2KK0Ir37fD5wiO6gkf59DG/+RNOOLR
	JLrsBboqpOTLHa3aQtRJU5fKJfpVv7sA/eB/Bs2T+x73+5TOw29ons7/
X-Gm-Gg: AYBFou1upMwTca9HZ5zL8pcCDZL0nOGpyYuKDrRcFK17NdW1gKlacq5Bnao5G2DRQN9
	79HPijWpEpO+BWH6WiRVuK/DSZIQLT+YEgLXtq4algyH37REBUjku302ptAw77haYAf+NGgasZX
	bPfFkc6cyOkYZen9pEzNVZfiadfagGD5CTvLEGj5sAj5xzrKLrI6k3LwmyliOe1vjF2fbdZY91x
	jzUdyTOmjXb/lTiei9hLW6h1uQ6gi2NA7FvL0+h0lKTgxUu+It0zdroxaVUM8ngV1VFAm0hpebP
	dJy16tMxrpX+Sy3Z1c7DvFHt/AFybXC9g+3N8OhppAER114eyKJKi/x5HQPU9CWP/33fbR4WcUh
	NYuDY858XQc0jyNzmrX688ahOtbH4EpjAce9JeBc5IVl/2mrPlfc1NJ84q7Hxhs4DtL/e09jWOV
	wAjW1acl06c9WRp+QrMneKKrR6J0NTT++EIfoEdptD0W5RepuxvmuyTX/1VYS2kKWAM/9SDWyRv
	ytsupcPubVZKsX+XmZ5+ygmZyyOdh+5Gwh5vUU2JbBWYak4gKndCwWACHht1hN21U/9f6jmhgl8
	KKiS/Opfc40PyXvhFDCZp96i
X-Received: by 2002:a17:903:4b2f:b0:2df:34c0:7303 with SMTP id d9443c01a7336-2df59ad92afmr12464055ad.40.1790047209771;
        Mon, 21 Sep 2026 20:20:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5cf83512sm1940355ad.5.2026.09.21.20.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:20:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] crypto: Use pm_runtime_resume_and_get()
Date: Tue, 22 Sep 2026 10:19:51 +0700
Message-ID: <20260922031954.320895-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series replaces open-coded pm_runtime_get_sync() and
pm_runtime_put_noidle() error handling with
pm_runtime_resume_and_get() in several crypto drivers.

No functional change intended.

Best regards,
Phuc

bui duc phuc (3):
  crypto: sun8i-ss - Use pm_runtime_resume_and_get()
  crypto: ccree - Use pm_runtime_resume_and_get()
  crypto: sl3516 - Use pm_runtime_resume_and_get()

 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 3 +--
 drivers/crypto/ccree/cc_pm.c                      | 8 +-------
 drivers/crypto/gemini/sl3516-ce-cipher.c          | 3 +--
 drivers/crypto/gemini/sl3516-ce-rng.c             | 6 ++----
 4 files changed, 5 insertions(+), 15 deletions(-)

-- 
2.43.0

