Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5538540861C
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 17:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741841; cv=none; b=OYuhFlFU14OR3lZtJ2VkS2rVzgriR/FcUuCBpG+tOIDRMrPuZiLeDefM2C9glNe/pfCD7nzyudpDsu6uP51ECa6Afo4LRa6C0euoLLFlk7zoz5HpRlVXpi/urkPrjdfuKYY5UGLgV6Bh7na22VWECCwG8K3+mySzs9OP41RV3UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741841; c=relaxed/simple;
	bh=AKDkWaghcNpmaNxqhAmOaHAKvqFX2oI6UORlFQsEgEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GomTIfS3pgWqqUobf8WBR1TVaIervzfcKNntnCLGSbiF1cUCUZuHsL9nKtwKcb/mUBOX0vX/k/KetLPyTSqtt9mXu9/DJdhu6jssZund2FFHuSzFccg2Zw00QTWJgTPT7x5Z/gMm+NE0pvwb/EjYtU2oSRr8mBmBx7r1qGR3VAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OioZaqVV; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OioZaqVV"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ee6912d86dso66370546d6.1
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 10:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784741837; x=1785346637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKDkWaghcNpmaNxqhAmOaHAKvqFX2oI6UORlFQsEgEA=;
        b=OioZaqVV4jNE5S6I/ynDXFqBh7oOX1v6kp/lF3O5dlNwzvW3ETNz1moy59ornKQDaW
         zw9j4wL2ndqXQ8D8LoOc3PdfqUtp2Ve6ufLFMWXHvB5PKIQ7WPhHgGPE3UQRF3eNXeIv
         aQijg44YFDbtlQ1uT2kprn8xUBNNdhpAjktfwrByqGftD9Rp/oOqzS4xKuKb2oc2+KTy
         RLh7pfcJYD3VoKMocOGeOSUIeLU5M6aiGUqXv+32MNIv1+aO2eUsZwxW7ni0YbKWQE2g
         gWE2en0lbbaefV++W70i2+GFq/v/Oe6CdwXPFIDia58p6AZlz9vda82k86aWSc3W2p5O
         JpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741837; x=1785346637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKDkWaghcNpmaNxqhAmOaHAKvqFX2oI6UORlFQsEgEA=;
        b=PQQtlb3QeVW6YbgRYbwcrFpfxiqh9qxwD5wF9yo5L2NTH4e3tnQT8y4rmqYjLXACvW
         eIjGD9Nx1LCgQJABhXj4Zr/g3D9uOMADGtaDCENQNeuWamkK/1LZB7CX+Ospk+Y63Ihs
         YZrzBb1/Pz5GYWGngz5dU6AyOEKu9wtSPVzRomvz4XqnhixFA5eaon20Nu6hTW3X6RNp
         W2RYMa5p4s0Ttx17dSv4kceTikA3dPWkOBPEY8u5ZEODS6Eph+W2jQUeWehzHYmrp9GO
         rvU2uSj5QQCBj4LTLak36037tEO11tHhta6Y3KI2lclAg1CuP2JPsPnPjldqhmusjUy3
         MP7w==
X-Forwarded-Encrypted: i=1; AHgh+RrEJMy8QSblNHpxX3QQwnvu8nxDDOMllo6jFxgEPf4hgSrM/vpo1XHhXGw4emmsC5TdNEaDm4Qlj+Dc0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcA/u7LJZXB+LBQf0Yed02xbGZm5JPDxz6Tc8HuIa6L5BONzZg
	9LOUshrwFWr0lCDJouZR0wETSyZGjDmHj+wccjtLICVMbLjoxSGMwiDf
X-Gm-Gg: AR+sD1278xddrQ4Hp+RCKDqPY5NxaIJtuE5R1iRt52L0BLiaEs+3CPHHrW/d4BJVQTJ
	kcNEgK8ovJBZ9G/Fun8sp0RLqW1s6mwEleWgr/dBagoquReV+qHn6VBg3o2smS7FG0yurCnDNqt
	BCoffGYQgCpToZ7FlCe5EaRsKE9VUzInwR2d2bQUGAVwwXUEXcpv6J5mAHM3oS2NfCufJJusYQv
	NtZSlEQ9E88rLVK83qbw0l8wrBM3udZvnLik0Nu8JAt3DsQUI6lQiKlNv8zXE2k9VkFIrPBSiWR
	AkWLeX29BDb2aJz4xqtxJhp6Z4qAU5tCB+gb0ABUupell0rlcvqQpXJTzDPZLlwd2nocDyfqY40
	rKSeESsTo/Or8US3IpfCBZ97sWYqzaCBDGYbRWDi1tkz9WYEc8vo0i7lVSA5O/Z7NTTZLDYQ3gb
	/1I6bA2DA1LYPaf0TcfmSygVP74Z819E6HoUSShHsDm/odx/ap6aM+4A==
X-Received: by 2002:a05:6214:e81:b0:8f0:275e:8b3a with SMTP id 6a1803df08f44-907783cdb5fmr251226006d6.48.1784741836919;
        Wed, 22 Jul 2026 10:37:16 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b3e96sm26521476d6.1.2026.07.22.10.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:37:16 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
Date: Wed, 22 Jul 2026 13:37:14 -0400
Message-ID: <20260722173714.2394348-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
References: <20260722005643.1208942-1-enzo.adriano.code@gmail.com> <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre, Chen-Yu,

Correct, this was not tested on hardware; it was build-tested only.

Thanks for the review. Chen-Yu's point is right: these one-divider clocks
should use the single-divider clock class, which already supports
CCU_FEATURE_UPDATE_BIT. I'll drop this generic ccu_mp patch; there will be
no v2.

This analysis was done with AI assistance and each finding was checked
against the cited sources.

Regards,
Enzo
